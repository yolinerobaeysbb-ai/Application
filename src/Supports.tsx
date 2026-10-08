import { useEffect, useState } from 'react'
import { Check, Download, FileSpreadsheet, FileText, MessageSquarePlus, Pencil, Trash2, X } from 'lucide-react'
import * as XLSX from 'xlsx'
import { supabase } from './lib/supabase'

type Category = 'language' | 'sport' | 'food'
const SUPPORT_PREFIX = '[Support]'
type SupportSuggestion = { id: string; message: string; status: string; created_at: string; profiles?: { email: string }[] | null }
type DocumentItem = { id: string; title: string; category: Category; language: string | null; file_path: string; file_name: string; mime_type: string; file_size: number | null }
const languages = ['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaïlandais']
const bundledDocuments: DocumentItem[] = [
  ...languages.map((language) => ({ id: `bundled-${language}`, title: `Cours de ${language}`, category: 'language' as Category, language, file_path: `/documents/${language === 'Néerlandais' ? 'Neerlandais' : language}.pdf`, file_name: `${language}.pdf`, mime_type: 'application/pdf', file_size: null })),
  { id: 'bundled-alphabet', title: 'Alphabet multilingue', category: 'language' as Category, language: null, file_path: '/documents/Alphabet.odt', file_name: 'Alphabet.odt', mime_type: 'application/vnd.oasis.opendocument.text', file_size: null },
  { id: 'bundled-conjugaison', title: 'Conjugaison multilingue', category: 'language' as Category, language: null, file_path: '/documents/Conjugaison.odt', file_name: 'Conjugaison.odt', mime_type: 'application/vnd.oasis.opendocument.text', file_size: null },
  { id: 'bundled-food', title: 'Planning repas et recettes', category: 'food', language: null, file_path: '/documents/planning_repas%20(1).pdf', file_name: 'planning_repas (1).pdf', mime_type: 'application/pdf', file_size: null },
  ...[['Mobilité 1', 'Phoenix - Mulsculation - Mobilité 1.xlsx'], ['Adaptation I', 'Phoenix - Musculation - Adapatation I.xlsx'], ['Adaptation II', 'Phoenix - Musculation - Adaptation II.xlsx'], ['Force', 'Phoenix - Musculation - Force.xlsx'], ['Hypertrophie', 'Phoenix - Musculation - Hypertrophie.xlsx'], ['Maintien I', 'Phoenix - Musculation - Maintien I.xlsx'], ['Maintien II', 'Phoenix - Musculation - Maintien II.xlsx'], ['Maintien III', 'Phoenix - Musculation - Maintien III.xlsx'], ['Maintien IV', 'Phoenix - Musculation - Maintien IV.xlsx'], ['Puissance', 'Phoenix - Musculation - Puissance.xlsx']].map(([program, fileName]) => ({ id: `bundled-${program}`, title: `Musculation · ${program}`, category: 'sport' as Category, language: null, file_path: `/documents/${encodeURIComponent(fileName)}`, file_name: `${program}.xlsx`, mime_type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', file_size: null })),
]

type Sheet = { name: string; rows: (string | number | boolean | null)[][] }
export default function Supports({ isAdmin, userId }: { isAdmin: boolean; userId: string }) {
  const [documents, setDocuments] = useState<DocumentItem[]>(bundledDocuments)
  const [selected, setSelected] = useState<DocumentItem | null>(null)
  const [sheets, setSheets] = useState<Sheet[]>([])
  const [activeSheet, setActiveSheet] = useState(0)
  const [uploading, setUploading] = useState(false)
  const [message, setMessage] = useState('')
  useEffect(() => { supabase.from('documents').select('*').order('category').order('title').then(({ data }) => setDocuments([...bundledDocuments, ...((data ?? []) as DocumentItem[])])) }, [])
  async function openDocument(document: DocumentItem) {
    if (!document.file_name.toLowerCase().match(/\.xlsx?$/)) { if (document.file_path.startsWith('/documents/')) window.open(document.file_path, '_blank', 'noopener,noreferrer'); else { const { data } = await supabase.storage.from('phoenix-documents').createSignedUrl(document.file_path, 300); if (data?.signedUrl) window.open(data.signedUrl, '_blank', 'noopener,noreferrer') }; return }
    const url = document.file_path.startsWith('/documents/') ? document.file_path : (await supabase.storage.from('phoenix-documents').createSignedUrl(document.file_path, 300)).data?.signedUrl
    if (!url) return
    const response = await fetch(url); const workbook = XLSX.read(await response.arrayBuffer(), { type: 'array' })
    setSheets(workbook.SheetNames.map((name) => ({ name, rows: XLSX.utils.sheet_to_json(workbook.Sheets[name], { header: 1, defval: '' }) as Sheet['rows'] })))
    setActiveSheet(0); setSelected(document)
  }
  async function uploadDocuments(event: React.ChangeEvent<HTMLInputElement>) {
    const files = Array.from(event.target.files ?? [])
    if (!files.length) return
    setUploading(true); setMessage('')
    for (const file of files) {
      const path = `language/${crypto.randomUUID()}-${file.name}`
      const storage = await supabase.storage.from('phoenix-documents').upload(path, file, { upsert: false })
      if (storage.error) { setMessage(`Erreur pour ${file.name}.`); continue }
      const { error } = await supabase.from('documents').insert({ title: file.name.replace(/\.[^.]+$/, ''), category: 'language', language: null, file_path: path, file_name: file.name, mime_type: file.type || 'application/octet-stream', file_size: file.size })
      if (error) { await supabase.storage.from('phoenix-documents').remove([path]); setMessage(`Erreur d’enregistrement pour ${file.name}.`) }
    }
    const { data } = await supabase.from('documents').select('*').order('category').order('title')
    setDocuments([...bundledDocuments, ...((data ?? []) as DocumentItem[])])
    setUploading(false); event.target.value = ''
  }
  async function removeDocument(document: DocumentItem) { if (document.file_path.startsWith('/documents/')) return; await supabase.storage.from('phoenix-documents').remove([document.file_path]); await supabase.from('documents').delete().eq('id', document.id); setDocuments((current) => current.filter((item) => item.id !== document.id)) }
  const [view, setView] = useState<'documents' | 'suggestions'>('documents')
  const [suggestTarget, setSuggestTarget] = useState<string | null>(null)
  const [suggestText, setSuggestText] = useState('')
  const [suggestFeedback, setSuggestFeedback] = useState('')
  const [editing, setEditing] = useState<{ id: string; title: string; category: Category; language: string } | null>(null)
  const [received, setReceived] = useState<SupportSuggestion[]>([])
  async function loadReceived() {
    const { data } = await supabase.from('suggestions').select('id, message, status, created_at, profiles(email)').like('message', `${SUPPORT_PREFIX}%`).neq('status', 'deleted').order('created_at', { ascending: false })
    setReceived((data ?? []) as unknown as SupportSuggestion[])
  }
  useEffect(() => { if (isAdmin) void loadReceived() }, [isAdmin])
  async function sendSuggestion(event: React.FormEvent, document: DocumentItem) {
    event.preventDefault()
    const text = suggestText.trim()
    if (text.length < 3) return
    const { error } = await supabase.from('suggestions').insert({ user_id: userId, category: 'autre', message: `${SUPPORT_PREFIX} ${document.title} : ${text}`.slice(0, 2000) })
    setSuggestFeedback(error ? 'Impossible d’envoyer la suggestion.' : 'Suggestion envoyée. Merci !')
    if (!error) { setSuggestText(''); setSuggestTarget(null) }
  }
  async function saveEdit(event: React.FormEvent) {
    event.preventDefault()
    if (!editing || !editing.title.trim()) return
    const patch = { title: editing.title.trim(), category: editing.category, language: editing.category === 'language' ? editing.language.trim() || null : null }
    const { error } = await supabase.from('documents').update(patch).eq('id', editing.id)
    if (error) { setMessage('Impossible de modifier le document.'); return }
    setDocuments((current) => current.map((item) => item.id === editing.id ? { ...item, ...patch } : item))
    setEditing(null)
  }
  async function setSuggestionStatus(id: string, status: 'treated' | 'deleted') {
    const { error } = await supabase.from('suggestions').update({ status }).eq('id', id)
    if (!error) await loadReceived()
  }
  const isRemote = (document: DocumentItem) => !document.file_path.startsWith('/documents/')
  const documentsView = <>
    <div className="document-list">{documents.map((document) => <div className="document-row" key={document.id} style={{ flexWrap: 'wrap' }}>{document.file_name.endsWith('.xlsx') ? <FileSpreadsheet size={20} /> : <FileText size={20} />}<div><strong>{document.title}</strong><span>{document.category === 'language' ? document.language : document.category === 'sport' ? 'Sport / musculation' : 'Nutrition'} · {document.file_name}</span></div><button className="outline-button" onClick={() => void openDocument(document)}>{document.file_name.match(/\.xlsx?$/) ? 'Lire le fichier' : 'Ouvrir'}</button>
      {!isAdmin && <button className="outline-button" onClick={() => { setSuggestTarget(suggestTarget === document.id ? null : document.id); setSuggestFeedback('') }}><MessageSquarePlus size={14} /> Suggérer une modification</button>}
      {isAdmin && isRemote(document) && <button className="outline-button" onClick={() => setEditing({ id: document.id, title: document.title, category: document.category, language: document.language ?? '' })}><Pencil size={14} /> Modifier</button>}
      {isAdmin && isRemote(document) && <button className="delete-button" onClick={() => void removeDocument(document)} aria-label={`Supprimer ${document.title}`}><X size={14} /></button>}
      {suggestTarget === document.id && <form onSubmit={(event) => void sendSuggestion(event, document)} style={{ flexBasis: '100%', display: 'grid', gap: 8 }}><textarea value={suggestText} onChange={(event) => setSuggestText(event.target.value)} rows={3} maxLength={1800} minLength={3} required placeholder="Décrivez la modification souhaitée..." /><button className="primary-button" type="submit">Envoyer la suggestion</button></form>}
      {editing?.id === document.id && <form onSubmit={(event) => void saveEdit(event)} style={{ flexBasis: '100%', display: 'grid', gap: 8 }}><label>Titre<input value={editing.title} onChange={(event) => setEditing({ ...editing, title: event.target.value })} required /></label><label>Catégorie<select value={editing.category} onChange={(event) => setEditing({ ...editing, category: event.target.value as Category })}><option value="language">Langue</option><option value="sport">Sport</option><option value="food">Nutrition</option></select></label>{editing.category === 'language' && <label>Langue<input value={editing.language} onChange={(event) => setEditing({ ...editing, language: event.target.value })} /></label>}<div><button className="primary-button" type="submit">Enregistrer</button> <button className="secondary-button" type="button" onClick={() => setEditing(null)}>Annuler</button></div></form>}
    </div>)}</div>
    {suggestFeedback && <p className="form-feedback" role="status">{suggestFeedback}</p>}
    {isAdmin && <label className="upload-panel"><span className="card-kicker">Administration · publier des supports</span><input type="file" multiple accept=".pdf,.xlsx,.xls,.odt" onChange={(event) => void uploadDocuments(event)} disabled={uploading} /><span className="muted">{uploading ? 'Téléversement en cours...' : 'Ajouter un document le rend disponible à tous.'}</span>{message && <span className="form-error">{message}</span>}</label>}
  </>
  const suggestionsView = <div className="suggestions-list"><p className="card-kicker">Suggestions de modification reçues</p>{received.length ? received.map((item) => <article className="suggestion-entry" key={item.id}><strong>{item.profiles?.[0]?.email ?? 'Membre'}</strong><span>{new Date(item.created_at).toLocaleDateString('fr-FR')} · {item.status === 'pending' ? 'En attente' : 'Traitée'}</span><p>{item.message.replace(SUPPORT_PREFIX, '').trim()}</p><div>{item.status === 'pending' && <button className="outline-button" type="button" onClick={() => void setSuggestionStatus(item.id, 'treated')}><Check size={14} /> Marquer traitée</button>}<button className="delete-button" type="button" onClick={() => void setSuggestionStatus(item.id, 'deleted')} aria-label="Supprimer la suggestion"><Trash2 size={14} /></button></div></article>) : <p className="muted">Aucune suggestion.</p>}</div>
  return <section className="content-grid"><div className="section-intro"><p className="eyebrow">Supports</p><h2>Fichiers et documents.</h2><p className="muted">PDF, ODT et programmes Excel consultables directement dans Keltia.</p></div>{isAdmin && <nav className="excel-tabs"><button className={view === 'documents' ? 'active' : ''} onClick={() => setView('documents')}>Documents</button><button className={view === 'suggestions' ? 'active' : ''} onClick={() => { setView('suggestions'); void loadReceived() }}>Suggestions reçues{received.filter((item) => item.status === 'pending').length ? ` (${received.filter((item) => item.status === 'pending').length})` : ''}</button></nav>}{view === 'suggestions' && isAdmin ? suggestionsView : documentsView}{selected && <ExcelViewer document={selected} sheets={sheets} activeSheet={activeSheet} setActiveSheet={setActiveSheet} onClose={() => setSelected(null)} />}</section>
}
function ExcelViewer({ document, sheets, activeSheet, setActiveSheet, onClose }: { document: DocumentItem; sheets: Sheet[]; activeSheet: number; setActiveSheet: (value: number) => void; onClose: () => void }) { const sheet = sheets[activeSheet]; return <div className="excel-viewer"><div className="excel-heading"><div><p className="card-kicker">Lecture du classeur</p><h3>{document.title}</h3></div><div><button className="outline-button" onClick={() => window.open(document.file_path, '_blank', 'noopener,noreferrer')}><Download size={15} /> Télécharger</button><button className="delete-button" onClick={onClose} aria-label="Fermer le lecteur"><X size={18} /></button></div></div><div className="excel-tabs">{sheets.map((item, index) => <button className={activeSheet === index ? 'active' : ''} key={item.name} onClick={() => setActiveSheet(index)}>{item.name}</button>)}</div><div className="excel-table-wrap">{sheet && <table className="excel-table"><tbody>{sheet.rows.map((row, rowIndex) => <tr key={rowIndex}>{row.map((cell, cellIndex) => <td key={cellIndex}>{String(cell ?? '')}</td>)}</tr>)}</tbody></table>}</div></div> }
