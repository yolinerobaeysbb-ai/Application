import { useEffect, useState } from 'react'
import { BookOpen, ChevronDown, FileText, Languages, Table2, Volume2 } from 'lucide-react'
import { supabase } from './lib/supabase'

const languages = ['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaï']
type SectionType = 'alphabet' | 'vocabulary' | 'rule' | 'declension' | 'conjugation'
type SectionResource = { type: string; title: string; url: string }
type Section = { id: string; language: string; section_type: SectionType; title: string; content: string; data: Record<string, unknown> & { web_resources?: SectionResource[]; local_documents?: SectionResource[] }; position: number }
type Props = { selectedLanguage?: string }
const labels: Record<SectionType, string> = { alphabet: 'Alphabet', vocabulary: 'Vocabulaire', rule: 'Règles', declension: 'Déclinaisons', conjugation: 'Conjugaisons' }

export default function LanguageRecap({ selectedLanguage }: Props) {
  const [language, setLanguage] = useState(selectedLanguage ?? languages[0])
  const [sections, setSections] = useState<Section[]>([])
  const [activeType, setActiveType] = useState<SectionType>('vocabulary')
  useEffect(() => { if (selectedLanguage) setLanguage(selectedLanguage) }, [selectedLanguage])
  useEffect(() => { supabase.from('language_recap_sections').select('*').eq('language', language).order('position').then(({ data }) => setSections((data ?? []) as Section[])) }, [language])
  const visible = sections.filter((section) => section.section_type === activeType)
  return <section className="recap-page"><div className="section-intro"><p className="eyebrow">Bibliothèque linguistique</p><h2>Récapitulatif par langue.</h2><p className="muted">Vocabulaire, alphabet, règles et tableaux utiles pour réviser les 16 semaines.</p></div><div className="recap-toolbar"><label><Languages size={16} /><span>Langue</span><select value={language} onChange={(event) => setLanguage(event.target.value)}>{languages.map((item) => <option key={item}>{item}</option>)}</select><ChevronDown size={15} /></label><nav className="recap-tabs">{(Object.keys(labels) as SectionType[]).map((type) => <button className={activeType === type ? 'active' : ''} key={type} onClick={() => setActiveType(type)}>{labels[type]}</button>)}</nav></div><div className="recap-grid">{visible.length ? visible.map((section) => <article className="recap-card" key={section.id}><div className="recap-card-heading"><span className="recap-icon"><Table2 size={18} /></span><div><p className="card-kicker">{labels[section.section_type]}</p><h3>{section.title}</h3></div></div><p className="recap-content">{section.content}</p>{section.section_type === 'vocabulary' && <button className="lesson-action" onClick={() => window.speechSynthesis.speak(new SpeechSynthesisUtterance(section.content))}><Volume2 size={15} /> Écouter le récapitulatif</button>}{section.section_type === 'alphabet' && <div className="recap-note"><BookOpen size={15} /> Utilisez le manuel complet dans Supports pour la progression détaillée.</div>}{typeof section.data.source_document === 'string' && <button className="lesson-action" onClick={() => window.open(section.data.source_document as string, '_blank', 'noopener,noreferrer')}><FileText size={15} /> Ouvrir le manuel complet</button>}{section.data.local_documents?.map((document) => <a className="resource-link" href={document.url} target="_blank" rel="noreferrer" key={`${section.id}-${document.url}`}><FileText size={14} /> {document.title}</a>)}{section.data.web_resources?.length ? <div className="recap-web-resources"><p className="card-kicker">Ressources web</p>{section.data.web_resources.map((resource) => <a className="resource-link" href={resource.url} target="_blank" rel="noreferrer" key={`${section.id}-${resource.url}`}><FileText size={14} /> {resource.title}</a>)}</div> : null}</article>) : <div className="empty-state"><FileText size={20} /><p>Ce récapitulatif sera enrichi depuis le manuel de {language}.</p></div>}</div></section>
}
