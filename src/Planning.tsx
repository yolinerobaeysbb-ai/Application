import { useEffect, useState } from 'react'
import { BookOpen, Dumbbell, LoaderCircle, Trash2, Utensils } from 'lucide-react'
import { supabase } from './lib/supabase'

const languages = ['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaïlandais']
type Category = 'language' | 'sport' | 'food'
type Item = { id: string; category: Category; language: string | null; title: string; description: string; duration_minutes: number | null }
const categories: { key: Category; label: string; className: string; icon: typeof BookOpen }[] = [
  { key: 'language', label: 'Langues', className: 'language-card', icon: BookOpen },
  { key: 'sport', label: 'Sport / muscu', className: 'sport-card', icon: Dumbbell },
  { key: 'food', label: 'Nourriture', className: 'food-card', icon: Utensils },
]

type Props = { week: number; isAdmin: boolean }

export default function Planning({ week, isAdmin }: Props) {
  const [items, setItems] = useState<Item[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [form, setForm] = useState({ category: 'language' as Category, language: languages[0], title: '', description: '', duration: '' })

  async function loadItems() {
    setLoading(true)
    setError('')
    const { data, error: queryError } = await supabase.from('content_items').select('id, category, language, title, description, duration_minutes').eq('week', week).order('category').order('title')
    if (queryError) setError('Impossible de charger le planning de cette semaine.')
    setItems((data ?? []) as Item[])
    setLoading(false)
  }

  useEffect(() => { void loadItems() }, [week])

  async function addContent(event: React.FormEvent) {
    event.preventDefault()
    setError('')
    const { error: insertError } = await supabase.from('content_items').insert({ category: form.category, language: form.category === 'language' ? form.language : null, week, title: form.title.trim(), description: form.description.trim(), duration_minutes: form.duration ? Number(form.duration) : null })
    if (insertError) { setError('Impossible d’ajouter ce contenu.'); return }
    setForm({ ...form, title: '', description: '', duration: '' })
    await loadItems()
  }

  async function removeContent(id: string) {
    const { error: deleteError } = await supabase.from('content_items').delete().eq('id', id)
    if (deleteError) { setError('Impossible de supprimer ce contenu.'); return }
    setItems((current) => current.filter((item) => item.id !== id))
  }

  return <section className="content-grid">
    <div className="section-intro"><p className="eyebrow">Semaine {week.toString().padStart(2, '0')} / 16</p><h2>Le plan du jour, sans bruit.</h2><p className="muted">Trois repères pour avancer cette semaine : apprendre, bouger et bien manger.</p></div>
    {loading && <p className="loading-state"><LoaderCircle size={17} className="spin" /> Chargement du planning...</p>}
    {error && <p className="form-error" role="alert">{error}</p>}
    <div className="feature-grid">{categories.map(({ key, label, className, icon: Icon }) => <article className={`feature-card ${className}`} key={key}><div className="card-icon"><Icon /></div><div><p className="card-kicker">{label}</p>{items.filter((item) => item.category === key).length ? items.filter((item) => item.category === key).map((item) => <div className="content-entry" key={item.id}><h3>{item.title}</h3><p>{item.description || 'Contenu à découvrir.'}{item.duration_minutes ? ` · ${item.duration_minutes} min` : ''}</p>{item.language && <span className="content-language">{item.language}</span>}{isAdmin && <button className="delete-button" type="button" onClick={() => void removeContent(item.id)} aria-label={`Supprimer ${item.title}`}><Trash2 size={14} /></button>}</div>) : <p>Aucun contenu prévu.</p>}</div></article>)}</div>
    {isAdmin && <form className="admin-editor" onSubmit={addContent}><p className="card-kicker">Administration · semaine {week}</p><div className="editor-fields"><select value={form.category} onChange={(event) => setForm({ ...form, category: event.target.value as Category })}><option value="language">Langue</option><option value="sport">Sport</option><option value="food">Nourriture</option></select>{form.category === 'language' && <select value={form.language} onChange={(event) => setForm({ ...form, language: event.target.value })}>{languages.map((language) => <option key={language}>{language}</option>)}</select>}<input value={form.title} onChange={(event) => setForm({ ...form, title: event.target.value })} placeholder="Titre" required /><input value={form.description} onChange={(event) => setForm({ ...form, description: event.target.value })} placeholder="Résumé" /><input type="number" min="1" value={form.duration} onChange={(event) => setForm({ ...form, duration: event.target.value })} placeholder="Durée (min)" /></div><button className="primary-button">Ajouter à la semaine {week}</button></form>}
  </section>
}
