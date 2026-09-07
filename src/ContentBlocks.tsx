import { useEffect, useState } from 'react'
import { ExternalLink, PencilLine, Trash2 } from 'lucide-react'
import { CartesianGrid, Line, LineChart, ResponsiveContainer, Tooltip, XAxis, YAxis } from 'recharts'
import { supabase } from './lib/supabase'

type Surface = 'courses' | 'progress' | 'resources'
type BlockType = 'text' | 'link' | 'chart'
type ContentBlock = { id: string; surface: Surface; title: string; body: string; block_type: BlockType; config: Record<string, unknown>; position: number; width: number; visible: boolean }
type ChartSeries = { title: string; subtitle: string; data: { date: string; [key: string]: string | number }[]; dataKey: string; color: string; unit: string; empty: string }
type Props = { surface: Surface; isAdmin: boolean; chartSeries?: ChartSeries[] }
type Form = { title: string; body: string; block_type: BlockType; config: string; position: number; width: number; visible: boolean }
const emptyForm: Form = { title: '', body: '', block_type: 'text', config: '', position: 1, width: 1, visible: true }

export default function ContentBlocks({ surface, isAdmin, chartSeries = [] }: Props) {
  const [blocks, setBlocks] = useState<ContentBlock[]>([])
  const [form, setForm] = useState<Form>(emptyForm)
  const [editingId, setEditingId] = useState<string | null>(null)
  const [open, setOpen] = useState(false)
  const [message, setMessage] = useState('')

  async function loadBlocks() {
    const { data } = await supabase.from('content_blocks').select('*').eq('surface', surface).order('position')
    setBlocks((data ?? []) as ContentBlock[])
  }
  useEffect(() => { void loadBlocks() }, [surface])
  function startEditing(block: ContentBlock) { setEditingId(block.id); setOpen(true); setMessage(''); setForm({ title: block.title, body: block.body, block_type: block.block_type, config: JSON.stringify(block.config, null, 2), position: block.position, width: block.width, visible: block.visible }) }
  function reset() { setEditingId(null); setForm(emptyForm); setMessage('') }
  async function submit(event: React.FormEvent) {
    event.preventDefault()
    let config: Record<string, unknown> = {}
    if (form.config.trim()) { try { const parsed = JSON.parse(form.config); if (!parsed || typeof parsed !== 'object' || Array.isArray(parsed)) throw new Error(); config = parsed as Record<string, unknown> } catch { setMessage('La configuration JSON est invalide.'); return } }
    const payload = { surface, title: form.title.trim(), body: form.body.trim(), block_type: form.block_type, config, position: Number(form.position) || 1, width: Math.min(3, Math.max(1, Number(form.width) || 1)), visible: form.visible }
    const result = editingId ? await supabase.from('content_blocks').update(payload).eq('id', editingId) : await supabase.from('content_blocks').insert(payload)
    if (result.error) { setMessage(`Impossible d’enregistrer le bloc. ${result.error.message}`); return }
    reset(); setOpen(false); await loadBlocks()
  }
  async function remove(id: string) { const { error } = await supabase.from('content_blocks').delete().eq('id', id); if (!error) setBlocks((current) => current.filter((block) => block.id !== id)) }
  const visibleBlocks = blocks.filter((block) => block.visible)
  return <section className={`content-blocks content-blocks-${surface}`}><div className="content-block-grid">{visibleBlocks.map((block) => <article className="content-block" style={{ gridColumn: `span ${Math.min(3, Math.max(1, block.width))}` }} key={block.id}><p className="card-kicker">{block.block_type === 'chart' ? 'Graphique' : block.block_type === 'link' ? 'Ressource' : 'À retenir'}</p><h3>{block.title}</h3>{block.body && <p>{block.body}</p>}{block.block_type === 'link' && typeof block.config.url === 'string' && <a className="resource-link" href={block.config.url} target="_blank" rel="noreferrer"><ExternalLink size={14} /> {typeof block.config.label === 'string' ? block.config.label : 'Ouvrir la ressource'}</a>}{block.block_type === 'chart' && typeof block.config.series === 'string' && <ContentBlockChart series={chartSeries.find((series) => series.title === block.config.series)} />}{isAdmin && <div className="content-block-actions"><button className="inline-action" type="button" onClick={() => startEditing(block)}><PencilLine size={14} /> Modifier</button><button className="inline-action danger" type="button" onClick={() => void remove(block.id)}><Trash2 size={14} /> Supprimer</button></div>}</article>)}</div>{isAdmin && <div className="content-block-admin"><button type="button" className="recap-admin-toggle" onClick={() => setOpen((current) => !current)}>{open ? 'Masquer les blocs' : 'Modifier les blocs'}</button>{open && <form className="content-block-form" onSubmit={(event) => void submit(event)}><label>Titre<input value={form.title} onChange={(event) => setForm((current) => ({ ...current, title: event.target.value }))} required /></label><label>Texte<textarea rows={3} value={form.body} onChange={(event) => setForm((current) => ({ ...current, body: event.target.value }))} /></label><div className="content-block-form-grid"><label>Type<select value={form.block_type} onChange={(event) => setForm((current) => ({ ...current, block_type: event.target.value as BlockType }))}><option value="text">Texte</option><option value="link">Lien</option>{surface === 'progress' && <option value="chart">Graphique</option>}</select></label><label>Largeur<input type="number" min={1} max={3} value={form.width} onChange={(event) => setForm((current) => ({ ...current, width: Number(event.target.value) || 1 }))} /></label><label>Position<input type="number" min={1} value={form.position} onChange={(event) => setForm((current) => ({ ...current, position: Number(event.target.value) || 1 }))} /></label></div>{form.block_type === 'link' && <label>Configuration JSON<textarea rows={4} value={form.config} onChange={(event) => setForm((current) => ({ ...current, config: event.target.value }))} placeholder='{"url":"/documents/manuel.pdf","label":"Ouvrir le manuel"}' /></label>}{form.block_type === 'chart' && <label>Configuration JSON<textarea rows={4} value={form.config} onChange={(event) => setForm((current) => ({ ...current, config: event.target.value }))} placeholder='{"series":"Performances sportives"}' /></label>}<label className="content-block-checkbox"><input type="checkbox" checked={form.visible} onChange={(event) => setForm((current) => ({ ...current, visible: event.target.checked }))} /> Visible pour les membres</label>{message && <p className="form-feedback">{message}</p>}<div className="recap-actions"><button type="submit" className="primary-button">{editingId ? 'Mettre à jour' : 'Ajouter'}</button><button type="button" className="secondary-button" onClick={() => { reset(); setOpen(false) }}>{editingId ? 'Annuler' : 'Fermer'}</button></div></form>}</div>}</section>
}

function ContentBlockChart({ series }: { series?: ChartSeries }) { if (!series) return <p className="muted">La série graphique n’est pas disponible.</p>; return <div className="content-block-chart"><div className="chart-title"><div><p className="card-kicker">{series.title}</p><span>{series.subtitle}</span></div></div>{series.data.length ? <ResponsiveContainer width="100%" height={190}><LineChart data={series.data} margin={{ top: 12, right: 10, left: -20, bottom: 0 }}><CartesianGrid stroke="#e3e4dc" strokeDasharray="3 3" vertical={false} /><XAxis dataKey="date" tick={{ fontSize: 11 }} tickLine={false} axisLine={false} /><YAxis tick={{ fontSize: 10 }} tickLine={false} axisLine={false} /><Tooltip formatter={(value) => [`${value}${series.unit}`, series.title]} /><Line type="monotone" dataKey={series.dataKey} stroke={series.color} strokeWidth={3} dot={{ r: 3, fill: series.color }} activeDot={{ r: 5 }} /></LineChart></ResponsiveContainer> : <div className="chart-empty">{series.empty}</div>}</div> }