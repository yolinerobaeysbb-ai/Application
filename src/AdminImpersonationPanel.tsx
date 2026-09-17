import { useEffect, useState } from 'react'
import { ExternalLink, LoaderCircle, UserRound } from 'lucide-react'
import { supabase } from './lib/supabase'

type Profile = { id: string; email: string }

export default function AdminImpersonationPanel() {
  const [profiles, setProfiles] = useState<Profile[]>([])
  const [selectedUserId, setSelectedUserId] = useState('')
  const [loading, setLoading] = useState(true)
  const [starting, setStarting] = useState(false)
  const [message, setMessage] = useState('')

  useEffect(() => {
    supabase.from('profiles').select('id, email').order('email').then(({ data, error }) => {
      if (error) setMessage('Impossible de charger les utilisateurs.')
      setProfiles((data ?? []) as Profile[])
      setLoading(false)
    })
  }, [])

  async function startImpersonation() {
    if (!selectedUserId) return
    setStarting(true)
    setMessage('')
    const sessionKey = `keltia-impersonation-${crypto.randomUUID()}`
    const { data, error } = await supabase.functions.invoke('admin-start-impersonation', { body: { userId: selectedUserId } })
    if (error || !data?.token_hash) {
      setMessage(error?.message ?? 'Impossible de démarrer la simulation.')
      setStarting(false)
      return
    }
    const target = `${window.location.origin}/?impersonation=1&token_hash=${encodeURIComponent(data.token_hash)}&session_key=${encodeURIComponent(sessionKey)}`
    window.open(target, '_blank', 'noopener,noreferrer')
    setMessage('La vue simulée a été ouverte dans un nouvel onglet.')
    setStarting(false)
  }

  return <section className="library-admin"><div className="library-admin-heading"><div><p className="card-kicker">Administration · accès contrôlé</p><h3>Simuler un utilisateur</h3><p className="muted">La simulation ouvre une session isolée dans un nouvel onglet. La session administrateur reste inchangée.</p></div><UserRound size={22} /></div><label>Utilisateur<select value={selectedUserId} onChange={(event) => setSelectedUserId(event.target.value)} disabled={loading || starting}><option value="">Sélectionner un utilisateur</option>{profiles.map((profile) => <option value={profile.id} key={profile.id}>{profile.email}</option>)}</select></label><button className="primary-button" type="button" onClick={() => void startImpersonation()} disabled={!selectedUserId || starting}>{starting ? <><LoaderCircle size={15} className="spin" /> Ouverture...</> : <><ExternalLink size={15} /> Ouvrir la vue utilisateur</>}</button>{message && <p className="form-feedback" role="status">{message}</p>}</section>
}
