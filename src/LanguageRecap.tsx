import { useEffect, useState } from 'react'
import { BookOpen, ChevronDown, FileText, Languages, PencilLine, Table2, Trash2, Volume2 } from 'lucide-react'
import { supabase } from './lib/supabase'

const ADMIN_EMAIL = 'yoline.robaeysbb@gmail.com'
const languages = ['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaï']
type SectionType = 'alphabet' | 'vocabulary' | 'rule' | 'declension' | 'conjugation'
type SectionResource = { type: string; title: string; url: string }
type RecapTable = { headers: string[]; rows: string[][] }
type Section = { id: string; language: string; section_type: SectionType; title: string; content: string; data: Record<string, unknown> & { web_resources?: SectionResource[]; local_documents?: SectionResource[]; table?: RecapTable }; position: number }
type Props = { selectedLanguage?: string }
type SectionForm = { section_type: SectionType; title: string; content: string; position: number; tableJson: string }
const labels: Record<SectionType, string> = { alphabet: 'Alphabet', vocabulary: 'Vocabulaire', rule: 'Règles', declension: 'Déclinaisons', conjugation: 'Conjugaisons' }

const emptyForm = (position: number): SectionForm => ({ section_type: 'vocabulary', title: '', content: '', position, tableJson: '' })

export default function LanguageRecap({ selectedLanguage }: Props) {
  const [language, setLanguage] = useState(selectedLanguage ?? languages[0])
  const [sections, setSections] = useState<Section[]>([])
  const [activeType, setActiveType] = useState<SectionType>('vocabulary')
  const [isAdmin, setIsAdmin] = useState(false)
  const [editingId, setEditingId] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const [message, setMessage] = useState('')
  const [showAdminPanel, setShowAdminPanel] = useState(false)
  const [form, setForm] = useState<SectionForm>(emptyForm(1))

  const loadSections = async (nextLanguage: string) => {
    const { data } = await supabase.from('language_recap_sections').select('*').eq('language', nextLanguage).order('position')
    const nextSections = (data ?? []) as Section[]
    setSections(nextSections)
    const nextPosition = Math.max(1, nextSections.length + 1)
    if (!editingId) setForm((current) => ({ ...current, position: nextPosition }))
  }

  useEffect(() => { if (selectedLanguage) setLanguage(selectedLanguage) }, [selectedLanguage])

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => {
      setIsAdmin(data.user?.email?.toLowerCase() === ADMIN_EMAIL)
    })
  }, [])

  useEffect(() => { void loadSections(language) }, [language])

  const visible = sections.filter((section) => section.section_type === activeType)

  const resetForm = (nextLanguage: string = language) => {
    setEditingId(null)
    setMessage('')
    setShowAdminPanel(false)
    setForm({ ...emptyForm(Math.max(1, sections.length + 1)), section_type: 'vocabulary', title: '', content: '' })
    setActiveType('vocabulary')
    void loadSections(nextLanguage)
  }

  const startEditing = (section: Section) => {
    setEditingId(section.id)
    setMessage('')
    setShowAdminPanel(true)
    setActiveType(section.section_type)
    setForm({
      section_type: section.section_type,
      title: section.title,
      content: section.content,
      position: section.position,
      tableJson: section.data?.table ? JSON.stringify(section.data.table, null, 2) : '',
    })
  }

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault()
    if (!form.title.trim() || !form.content.trim()) {
      setMessage('Le titre et le contenu sont obligatoires.')
      return
    }

    let data: Record<string, unknown> = {}
    if (form.tableJson.trim()) {
      try {
        const parsed = JSON.parse(form.tableJson) as RecapTable
        if (!parsed || !Array.isArray(parsed.headers) || !Array.isArray(parsed.rows)) {
          throw new Error('Format invalide')
        }
        data = { table: parsed }
      } catch {
        setMessage('Le tableau JSON est invalide. Vérifie le format avant d’enregistrer.')
        return
      }
    }

    setSaving(true)
    setMessage('')

    const payload = {
      language,
      section_type: form.section_type,
      title: form.title.trim(),
      content: form.content.trim(),
      data,
      position: Number(form.position) || 1,
    }

    const { error } = editingId
      ? await supabase.from('language_recap_sections').update(payload).eq('id', editingId)
      : await supabase.from('language_recap_sections').insert(payload)

    setSaving(false)
    if (error) {
      setMessage(`Impossible d’enregistrer le récapitulatif. ${error.message}`)
      return
    }

    setMessage(editingId ? 'Le récapitulatif a bien été mis à jour.' : 'Le nouveau récapitulatif a bien été ajouté.')
    setEditingId(null)
    setShowAdminPanel(false)
    setForm({ ...emptyForm(Math.max(1, sections.length + 1)) })
    setActiveType(form.section_type)
    await loadSections(language)
  }

  const handleDelete = async (id: string) => {
    const { error } = await supabase.from('language_recap_sections').delete().eq('id', id)
    if (!error) {
      const nextSections = sections.filter((section) => section.id !== id)
      setSections(nextSections)
      if (editingId === id) {
        setEditingId(null)
        setForm({ ...emptyForm(Math.max(1, nextSections.length + 1)) })
      }
      setMessage('Le récapitulatif a été supprimé.')
    }
  }

  return <section className="recap-page"><div className="section-intro"><p className="eyebrow">Bibliothèque linguistique</p><h2>Récapitulatif par langue.</h2><p className="muted">Vocabulaire, alphabet, règles et tableaux utiles pour réviser les 16 semaines.</p></div><div className="recap-toolbar"><label><Languages size={16} /><span>Langue</span><select value={language} onChange={(event) => setLanguage(event.target.value)}>{languages.map((item) => <option key={item}>{item}</option>)}</select><ChevronDown size={15} /></label><nav className="recap-tabs">{(Object.keys(labels) as SectionType[]).map((type) => <button className={activeType === type ? 'active' : ''} key={type} onClick={() => setActiveType(type)}>{labels[type]}</button>)}</nav></div><div className="recap-grid">{visible.length ? visible.map((section) => <article className="recap-card" key={section.id}><div className="recap-card-heading"><span className="recap-icon"><Table2 size={18} /></span><div><p className="card-kicker">{labels[section.section_type]}</p><h3>{section.title}</h3></div></div><p className="recap-content">{section.content}</p>{section.data?.table && <div className="recap-table-wrapper"><table className="recap-table"><thead><tr>{section.data.table.headers.map((header) => <th key={`${section.id}-header-${header}`}>{header}</th>)}</tr></thead><tbody>{section.data.table.rows.map((row, index) => <tr key={`${section.id}-row-${index}`}>{row.map((cell, cellIndex) => <td key={`${section.id}-cell-${index}-${cellIndex}`}>{cell}</td>)}</tr>)}</tbody></table></div>}{section.section_type === 'vocabulary' && <button className="lesson-action" onClick={() => window.speechSynthesis.speak(new SpeechSynthesisUtterance(section.content))}><Volume2 size={15} /> Écouter le récapitulatif</button>}{section.section_type === 'alphabet' && <div className="recap-note"><BookOpen size={15} /> Utilisez le manuel complet dans Supports pour la progression détaillée.</div>}{typeof section.data.source_document === 'string' && <button className="lesson-action" onClick={() => window.open(section.data.source_document as string, '_blank', 'noopener,noreferrer')}><FileText size={15} /> Ouvrir le manuel complet</button>}{section.data.local_documents?.map((document) => <a className="resource-link" href={document.url} target="_blank" rel="noreferrer" key={`${section.id}-${document.url}`}><FileText size={14} /> {document.title}</a>)}{section.data.web_resources?.length ? <div className="recap-web-resources"><p className="card-kicker">Ressources web</p>{section.data.web_resources.map((resource) => <a className="resource-link" href={resource.url} target="_blank" rel="noreferrer" key={`${section.id}-${resource.url}`}><FileText size={14} /> {resource.title}</a>)}</div> : null}{isAdmin && <div className="recap-admin-inline-actions"><button type="button" className="inline-action" onClick={() => startEditing(section)}><PencilLine size={14} /> Modifier</button><button type="button" className="inline-action danger" onClick={() => void handleDelete(section.id)}><Trash2 size={14} /> Supprimer</button></div>}</article>) : <div className="empty-state"><FileText size={20} /><p>Ce récapitulatif sera enrichi depuis le manuel de {language}.</p></div>}</div>{isAdmin && <div className="recap-admin-shell"><button type="button" className="recap-admin-toggle" onClick={() => setShowAdminPanel((current) => !current)}>{showAdminPanel ? 'Masquer l’éditeur' : 'Modifier le recap'}</button>{showAdminPanel && <div className="recap-admin-panel"><div className="recap-admin-header"><div><p className="card-kicker">Administration</p><h3>{editingId ? 'Modifier le récapitulatif' : 'Ajouter un récapitulatif'}</h3></div></div><form className="recap-admin-form" onSubmit={(event) => void handleSubmit(event)}><div className="recap-admin-grid"><label>Type<select value={form.section_type} onChange={(event) => setForm((current) => ({ ...current, section_type: event.target.value as SectionType }))}>{(Object.keys(labels) as SectionType[]).map((type) => <option value={type} key={type}>{labels[type]}</option>)}</select></label><label>Position<input type="number" min="1" value={form.position} onChange={(event) => setForm((current) => ({ ...current, position: Number(event.target.value) || 1 }))} /></label></div><label>Titre<input value={form.title} onChange={(event) => setForm((current) => ({ ...current, title: event.target.value }))} placeholder="Ex. : Vocabulaire week 1" required /></label><label>Contenu<textarea rows={6} value={form.content} onChange={(event) => setForm((current) => ({ ...current, content: event.target.value }))} placeholder="Rédige ton contenu ici..." required /></label><label>Tableau JSON (optionnel)<textarea rows={6} value={form.tableJson} onChange={(event) => setForm((current) => ({ ...current, tableJson: event.target.value }))} placeholder={'{"headers": ["Cas", "Masculin", "Féminin"], "rows": [["Nominatif", "der", "die"], ["Accusatif", "den", "die"]] }'} /></label><div className="recap-admin-actions"><button className="primary-button" type="submit" disabled={saving}>{saving ? 'Enregistrement...' : editingId ? 'Mettre à jour' : 'Ajouter'}</button><button className="secondary-button" type="button" onClick={() => resetForm()}>{editingId ? 'Annuler' : 'Réinitialiser'}</button></div>{message && <p className="form-feedback">{message}</p>}</form></div>}</div>}</section>
}
