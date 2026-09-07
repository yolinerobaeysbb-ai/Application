import { useEffect, useState } from 'react'
import { PencilLine, Plus, Trash2 } from 'lucide-react'
import { supabase } from './lib/supabase'

type Mode = 'sport' | 'nutrition' | 'language'
type Entry = { id: string; mode: Mode; date: string; label: string; value: string; extra: string; completed: boolean }
type Form = { date: string; label: string; value: string; extra: string; completed: boolean }
const today = new Date().toISOString().slice(0, 10)
const emptyForm: Form = { date: today, label: '', value: '', extra: '', completed: false }

export default function ProgressEntryManager({ userId, onChanged }: { userId: string; onChanged: () => void }) {
  const [mode, setMode] = useState<Mode>('sport')
  const [entries, setEntries] = useState<Entry[]>([])
  const [form, setForm] = useState<Form>(emptyForm)
  const [editingId, setEditingId] = useState<string | null>(null)
  const [open, setOpen] = useState(false)
  const [message, setMessage] = useState('')
  async function load() {
    const [sport, nutrition, language] = await Promise.all([
      supabase.from('sport_progress').select('id, recorded_on, exercise_name, weight_kg, completed').eq('user_id', userId).order('recorded_on', { ascending: false }),
      supabase.from('nutrition_progress').select('id, recorded_on, meals_planned, meals_completed, preparation_completed').eq('user_id', userId).order('recorded_on', { ascending: false }),
      supabase.from('language_placement_tests').select('id, test_month, language, score, level').eq('user_id', userId).order('test_month', { ascending: false }),
    ])
    const all: Entry[] = [
      ...((sport.data ?? []) as { id: string; recorded_on: string; exercise_name: string; weight_kg: number | null; completed: boolean }[]).map((item) => ({ id: item.id, mode: 'sport' as const, date: item.recorded_on, label: item.exercise_name, value: item.weight_kg?.toString() ?? '', extra: '', completed: item.completed })),
      ...((nutrition.data ?? []) as { id: string; recorded_on: string; meals_planned: number; meals_completed: number; preparation_completed: boolean }[]).map((item) => ({ id: item.id, mode: 'nutrition' as const, date: item.recorded_on, label: `${item.meals_completed}/${item.meals_planned} repas`, value: item.meals_planned.toString(), extra: item.meals_completed.toString(), completed: item.preparation_completed })),
      ...((language.data ?? []) as { id: string; test_month: string; language: string; score: number; level: string | null }[]).map((item) => ({ id: item.id, mode: 'language' as const, date: item.test_month, label: item.language, value: item.score.toString(), extra: item.level ?? '', completed: true })),
    ]
    setEntries(all.filter((entry) => entry.mode === mode))
  }
  useEffect(() => { void load() }, [userId, mode])
  function reset() { setEditingId(null); setForm({ ...emptyForm, date: mode === 'language' ? today.slice(0, 7) : today }); setMessage('') }
  function edit(entry: Entry) { setEditingId(entry.id); setOpen(true); setForm({ date: entry.date, label: entry.label, value: entry.mode === 'nutrition' ? entry.extra : entry.value, extra: entry.mode === 'nutrition' ? entry.value : entry.extra, completed: entry.completed }); setMessage('') }
  async function save(event: React.FormEvent) {
    event.preventDefault()
    let result
    if (mode === 'sport') { const payload = { user_id: userId, recorded_on: form.date, exercise_name: form.label.trim(), weight_kg: form.value ? Number(form.value) : null, completed: form.completed }; result = editingId ? await supabase.from('sport_progress').update(payload).eq('id', editingId) : await supabase.from('sport_progress').insert(payload) }
    else if (mode === 'nutrition') { const payload = { user_id: userId, recorded_on: form.date, meals_planned: Number(form.extra) || 0, meals_completed: Number(form.value) || 0, preparation_completed: form.completed }; result = editingId ? await supabase.from('nutrition_progress').update(payload).eq('id', editingId) : await supabase.from('nutrition_progress').insert(payload) }
    else { const payload = { user_id: userId, test_month: form.date, language: form.label.trim(), score: Number(form.value), level: form.extra.trim() || null }; result = editingId ? await supabase.from('language_placement_tests').update(payload).eq('id', editingId) : await supabase.from('language_placement_tests').insert(payload) }
    if (result.error) { setMessage(result.error.message); return }
    reset(); setOpen(false); await load(); onChanged()
  }
  async function remove(id: string) { const table = mode === 'sport' ? 'sport_progress' : mode === 'nutrition' ? 'nutrition_progress' : 'language_placement_tests'; const { error } = await supabase.from(table).delete().eq('id', id); if (error) setMessage(error.message); else { await load(); onChanged() } }
  const title = mode === 'sport' ? 'relevés sportifs' : mode === 'nutrition' ? 'suivis nutritionnels' : 'tests de langues'
  return <section className="library-admin progress-entry-admin"><div className="library-admin-heading"><div><p className="card-kicker">Suivi personnel</p><h3>Gérer mes {title}</h3><p className="muted">Ces données alimentent automatiquement les courbes ci-dessus.</p></div><button className="primary-button" type="button" onClick={() => { reset(); setOpen(true) }}><Plus size={15} /> Ajouter</button></div><div className="library-admin-tabs"><button className={mode === 'sport' ? 'active' : ''} onClick={() => setMode('sport')}>Sport</button><button className={mode === 'nutrition' ? 'active' : ''} onClick={() => setMode('nutrition')}>Nutrition</button><button className={mode === 'language' ? 'active' : ''} onClick={() => setMode('language')}>Langues</button></div>{open && <form className="library-admin-form" onSubmit={(event) => void save(event)}><label>Date<input type={mode === 'language' ? 'month' : 'date'} value={form.date} onChange={(event) => setForm((current) => ({ ...current, date: event.target.value }))} required /></label>{mode === 'sport' && <><label>Exercice<input value={form.label} onChange={(event) => setForm((current) => ({ ...current, label: event.target.value }))} required /></label><label>Charge (kg)<input type="number" min={0} step="0.1" value={form.value} onChange={(event) => setForm((current) => ({ ...current, value: event.target.value }))} /></label><label className="content-block-checkbox"><input type="checkbox" checked={form.completed} onChange={(event) => setForm((current) => ({ ...current, completed: event.target.checked }))} /> Séance terminée</label></>}{mode === 'nutrition' && <div className="library-form-grid"><label>Repas réalisés<input type="number" min={0} value={form.value} onChange={(event) => setForm((current) => ({ ...current, value: event.target.value }))} /></label><label>Repas planifiés<input type="number" min={0} value={form.extra} onChange={(event) => setForm((current) => ({ ...current, extra: event.target.value }))} /></label><label className="content-block-checkbox"><input type="checkbox" checked={form.completed} onChange={(event) => setForm((current) => ({ ...current, completed: event.target.checked }))} /> Préparation terminée</label></div>}{mode === 'language' && <><label>Langue<input value={form.label} onChange={(event) => setForm((current) => ({ ...current, label: event.target.value }))} required /></label><label>Score / 100<input type="number" min={0} max={100} value={form.value} onChange={(event) => setForm((current) => ({ ...current, value: event.target.value }))} required /></label><label>Niveau<input value={form.extra} onChange={(event) => setForm((current) => ({ ...current, extra: event.target.value }))} /></label></>}{message && <p className="form-error">{message}</p>}<div className="recap-actions"><button className="primary-button" type="submit">{editingId ? 'Mettre à jour' : 'Enregistrer'}</button><button className="secondary-button" type="button" onClick={() => { reset(); setOpen(false) }}>Annuler</button></div></form>}<div className="library-admin-list">{entries.map((entry) => <div className="library-admin-row" key={entry.id}><div><strong>{entry.label}</strong><small>{entry.date} · {mode === 'sport' ? `${entry.value || '—'} kg` : mode === 'nutrition' ? entry.label : `${entry.value}/100`}</small></div><button className="inline-action" type="button" onClick={() => edit(entry)}><PencilLine size={14} /> Modifier</button><button className="inline-action danger" type="button" onClick={() => void remove(entry.id)}><Trash2 size={14} /> Supprimer</button></div>)}</div></section>
}
