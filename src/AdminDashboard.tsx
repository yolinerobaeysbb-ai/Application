import { useEffect, useState } from 'react'
import { ArrowLeft, Check, FileText, LayoutGrid, MessageSquare, Settings2, Trash2, UserRound } from 'lucide-react'
import { supabase } from './lib/supabase'
import AdminImpersonationPanel from './AdminImpersonationPanel'
import AdminWeeklyActivities from './AdminWeeklyActivities'
import AdminContentCatalog from './AdminContentCatalog'
import AdminUiSettingsManager from './AdminUiSettingsManager'
import AdminCourseContentManager from './AdminCourseContentManager'

type Section = 'a0' | 'a1' | 'a2' | 'a3' | 'a4' | null
type Suggestion = { id: string; category: string; message: string; status: 'pending' | 'treated' | 'deleted'; created_at: string; profiles?: { email: string }[] | null }
const categoryLabels: Record<string, string> = { fonctionnalite: 'Fonctionnalité', langue: 'Nouvelle langue', sport: 'Nouveau sport', nourriture: 'Nourriture', autre: 'Autre' }

export default function AdminDashboard({ week, setWeek, currentUserId, onSaved }: { week: number; setWeek: (week: number) => void; currentUserId: string; onSaved: (value: Record<string, string>) => void }) {
  const [section, setSection] = useState<Section>(null)
  const [suggestions, setSuggestions] = useState<Suggestion[]>([])

  async function loadSuggestions() { const { data } = await supabase.from('suggestions').select('id, category, message, status, created_at, profiles(email)').order('created_at', { ascending: false }); setSuggestions((data ?? []) as Suggestion[]) }
  useEffect(() => { void loadSuggestions() }, [])
  async function updateStatus(id: string, status: 'treated' | 'deleted') { await supabase.from('suggestions').update({ status }).eq('id', id); await loadSuggestions() }

  if (section) {
    const titles: Record<Exclude<Section, null>, string> = { a0: 'Simuler un utilisateur', a1: 'Gérer les activités de la semaine', a2: 'Gérer le contenu', a3: 'Modifier les textes de l’application', a4: 'Exercices, ressources et supports enrichis' }
    return <section className="content-grid"><button className="secondary-button" type="button" onClick={() => setSection(null)}><ArrowLeft size={15} /> Retour à l’administration</button><div className="section-intro"><p className="eyebrow">Administration</p><h2>{titles[section]}</h2></div>
      {section === 'a0' && <AdminImpersonationPanel />}
      {section === 'a1' && <AdminWeeklyActivities week={week} setWeek={setWeek} currentUserId={currentUserId} />}
      {section === 'a2' && <AdminContentCatalog />}
      {section === 'a3' && <AdminUiSettingsManager onSaved={onSaved} />}
      {section === 'a4' && <AdminCourseContentManager />}
    </section>
  }

  return <section className="content-grid">
    <div className="section-intro"><p className="eyebrow">Espace administrateur</p><h2>Contrôle et simulation</h2><p className="muted">Les onglets standards restent une vue membre. Choisissez un domaine à gérer.</p></div>
    <div className="admin-card-grid">
      <button className="admin-card" type="button" onClick={() => setSection('a0')}><UserRound size={24} /><strong>Simuler un utilisateur</strong><span>Ouvrir la vue d’un membre dans un onglet isolé</span></button>
      <button className="admin-card" type="button" onClick={() => setSection('a1')}><LayoutGrid size={24} /><strong>Activités de la semaine</strong><span>Planning des cours, sport et repas</span></button>
      <button className="admin-card" type="button" onClick={() => setSection('a2')}><FileText size={24} /><strong>Gérer le contenu</strong><span>Cours, programmes et recettes</span></button>
      <button className="admin-card" type="button" onClick={() => setSection('a3')}><Settings2 size={24} /><strong>Textes de l’application</strong><span>Accueil, connexion et messages</span></button>
      <button className="admin-card" type="button" onClick={() => setSection('a4')}><MessageSquare size={24} /><strong>Exercices & ressources</strong><span>Contenu enrichi des cours</span></button>
    </div>
    <div className="library-admin"><div className="library-admin-heading"><div><p className="card-kicker">Retour des membres</p><h3>Suggestions</h3></div></div><div className="suggestions-list">{suggestions.length ? suggestions.map((suggestion) => <article className="suggestion-entry" key={suggestion.id}><strong>{categoryLabels[suggestion.category] ?? suggestion.category}</strong><span>{suggestion.profiles?.[0]?.email ? `${suggestion.profiles[0].email} · ` : ''}{new Date(suggestion.created_at).toLocaleDateString('fr-FR')} · {suggestion.status === 'pending' ? 'En attente' : suggestion.status === 'treated' ? 'Traitée' : 'Supprimée'}</span><p>{suggestion.message}</p>{suggestion.status === 'pending' && <div><button className="outline-button" type="button" onClick={() => void updateStatus(suggestion.id, 'treated')}><Check size={14} /> Traiter</button><button className="delete-button" type="button" onClick={() => void updateStatus(suggestion.id, 'deleted')}><Trash2 size={14} /></button></div>}</article>) : <p className="muted">Aucune suggestion pour le moment.</p>}</div></div>
  </section>
}

