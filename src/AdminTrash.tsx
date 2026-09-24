import { useEffect, useState } from 'react'
import { RotateCcw, Trash2 } from 'lucide-react'
import { supabase } from './lib/supabase'

type TrashRow = { id: string; table_name: string; record_id: string; payload: Record<string, unknown>; deleted_at: string }
const tableLabels: Record<string, string> = { weekly_schedule_items: 'Activité planifiée', content_type_options: 'Option de catalogue', language_courses: 'Cours de langue', meal_recipes: 'Recette' }

export default function AdminTrash() {
  const [items, setItems] = useState<TrashRow[]>([])
  const [message, setMessage] = useState('')

  async function load() { const { data } = await supabase.from('trash_items').select('id, table_name, record_id, payload, deleted_at').order('deleted_at', { ascending: false }); setItems((data ?? []) as TrashRow[]) }
  useEffect(() => { void load() }, [])

  async function restore(item: TrashRow) {
    setMessage('')
    const insertResult = await supabase.from(item.table_name).insert(item.payload)
    if (insertResult.error) { setMessage(insertResult.error.message); return }
    await supabase.from('trash_items').delete().eq('id', item.id)
    await load()
  }

  async function purge(id: string) { await supabase.from('trash_items').delete().eq('id', id); await load() }

  return <section className="library-admin"><div className="library-admin-heading"><div><p className="card-kicker">Administration</p><h3>Corbeille</h3><p className="muted">Restaurez ou supprimez définitivement les éléments effacés.</p></div></div>
    {message && <p className="form-error">{message}</p>}
    <div className="library-admin-list">{items.length ? items.map((item) => <div className="library-admin-row" key={item.id}><div><strong>{(item.payload.title as string) ?? (item.payload.label as string) ?? (item.payload.name as string) ?? item.record_id}</strong><small>{tableLabels[item.table_name] ?? item.table_name} · supprimé le {new Date(item.deleted_at).toLocaleDateString('fr-FR')}</small></div><button className="inline-action" type="button" onClick={() => void restore(item)}><RotateCcw size={14} /> Restaurer</button><button className="inline-action danger" type="button" onClick={() => void purge(item.id)}><Trash2 size={14} /> Supprimer définitivement</button></div>) : <p className="muted">La corbeille est vide.</p>}</div>
  </section>
}
