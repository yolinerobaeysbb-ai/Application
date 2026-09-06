import { useEffect, useState } from 'react'
import { Check, LoaderCircle, MessageSquarePlus, Trash2 } from 'lucide-react'
import { supabase } from './lib/supabase'

type Status = 'pending' | 'treated' | 'deleted'
type Suggestion = { id: string; category: string; message: string; status: Status; created_at: string; profiles?: { email: string }[] | null }
const categoryLabels: Record<string, string> = { fonctionnalite: 'Fonctionnalité', langue: 'Nouvelle langue', sport: 'Nouveau sport', nourriture: 'Nourriture', autre: 'Autre' }

export default function Suggestions({ isAdmin, userId }: { isAdmin: boolean; userId: string }) {
  const [category, setCategory] = useState('fonctionnalite')
  const [message, setMessage] = useState('')
  const [feedback, setFeedback] = useState('')
  const [suggestions, setSuggestions] = useState<Suggestion[]>([])
  const [loading, setLoading] = useState(false)

  async function loadSuggestions() {
    const query = supabase.from('suggestions').select('id, category, message, status, created_at, profiles(email)').order('created_at', { ascending: false })
    const { data, error } = isAdmin ? await query : await query.eq('user_id', userId)
    if (!error) setSuggestions((data ?? []) as Suggestion[])
  }

  useEffect(() => { void loadSuggestions() }, [isAdmin, userId])

  async function submit(event: React.FormEvent) {
    event.preventDefault()
    setLoading(true)
    setFeedback('')
    const { error } = await supabase.from('suggestions').insert({ user_id: userId, category, message: message.trim() })
    if (error) setFeedback('Impossible d’envoyer la suggestion.')
    else { setMessage(''); setFeedback('Suggestion envoyée. Merci pour ton idée.'); await loadSuggestions() }
    setLoading(false)
  }

  async function updateStatus(id: string, status: 'treated' | 'deleted') {
    const { error } = await supabase.from('suggestions').update({ status }).eq('id', id)
    if (error) { setFeedback('Impossible de modifier cette suggestion.'); return }
    await loadSuggestions()
  }

  return <section className="content-grid"><div className="section-intro"><p className="eyebrow">Boîte à idées</p><h2>Fais évoluer ton espace.</h2><p className="muted">Une idée de langue, de sport ou de fonctionnalité ? Elle arrive directement chez l’administrateur.</p></div><form className="suggestion-form" onSubmit={submit}><label>Catégorie<select value={category} onChange={(event) => setCategory(event.target.value)}><option value="fonctionnalite">Fonctionnalité</option><option value="langue">Nouvelle langue</option><option value="sport">Nouveau sport</option><option value="nourriture">Nourriture</option><option value="autre">Autre</option></select></label><label>Ta suggestion<textarea value={message} onChange={(event) => setMessage(event.target.value)} placeholder="Décris ton idée en quelques lignes..." rows={5} minLength={3} maxLength={2000} required /></label><div className="suggestion-submit"><button className="primary-button" disabled={loading}>{loading ? <><LoaderCircle size={16} className="spin" /> Envoi...</> : 'Envoyer la suggestion'}</button>{feedback && <p className="form-feedback" role="status">{feedback}</p>}</div></form><div className="suggestions-list"><p className="card-kicker">{isAdmin ? 'Suggestions reçues' : 'Mes suggestions'}</p>{suggestions.length ? suggestions.map((suggestion) => <article className="suggestion-entry" key={suggestion.id}><strong>{categoryLabels[suggestion.category] ?? suggestion.category}</strong><span>{isAdmin && suggestion.profiles?.[0]?.email ? `${suggestion.profiles[0].email} · ` : ''}{new Date(suggestion.created_at).toLocaleDateString('fr-FR')} · {suggestion.status === 'pending' ? 'En attente' : suggestion.status === 'treated' ? 'Traitée' : 'Supprimée'}</span><p>{suggestion.message}</p>{isAdmin && suggestion.status === 'pending' && <div><button className="outline-button" type="button" onClick={() => void updateStatus(suggestion.id, 'treated')}><Check size={14} /> Traiter</button><button className="delete-button" type="button" onClick={() => void updateStatus(suggestion.id, 'deleted')} aria-label="Supprimer la suggestion"><Trash2 size={14} /></button></div>}</article>) : <p className="muted">Aucune suggestion pour le moment.</p>}</div>{isAdmin && <div className="admin-panel"><MessageSquarePlus size={20} /><div><h3>Merci de faire vivre le parcours.</h3><p className="muted">Les suggestions restent visibles ici pour garder une trace des décisions prises.</p></div></div>}</section>
}
