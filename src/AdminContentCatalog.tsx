import { useEffect, useState } from 'react'
import { BookOpen, Dumbbell, Plus, Sunrise, Sun, Sunset, Moon, ArrowLeft, X } from 'lucide-react'
import { supabase } from './lib/supabase'
import AdminLibraryManager from './AdminLibraryManager'
import AdminSportManager from './AdminSportManager'

type Kind = 'language' | 'sport' | 'food'
type Option = { id: string; kind: Kind; label: string }
type MealSlot = 'breakfast' | 'lunch' | 'snack' | 'dinner'
const baseLanguages = ['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaïlandais']
const baseSports = ['Musculation', 'Mobilité', 'Cirque', 'Escalade']
const mealSlots: { key: MealSlot; label: string; icon: React.ReactNode }[] = [
  { key: 'breakfast', label: 'Matin', icon: <Sunrise size={20} /> },
  { key: 'lunch', label: 'Midi', icon: <Sun size={20} /> },
  { key: 'snack', label: '16h', icon: <Sunset size={20} /> },
  { key: 'dinner', label: 'Soir', icon: <Moon size={20} /> },
]

export default function AdminContentCatalog() {
  const [section, setSection] = useState<Kind | null>(null)
  const [options, setOptions] = useState<Option[]>([])
  const [selected, setSelected] = useState<string | null>(null)
  const [addOpen, setAddOpen] = useState(false)
  const [newLabel, setNewLabel] = useState('')
  const [message, setMessage] = useState('')

  useEffect(() => { supabase.from('content_type_options').select('id, kind, label').order('label').then(({ data }) => setOptions((data ?? []) as Option[])) }, [])

  const languages = [...baseLanguages, ...options.filter((option) => option.kind === 'language').map((option) => option.label)]
  const sports = [...baseSports, ...options.filter((option) => option.kind === 'sport').map((option) => option.label)]

  async function addOption() {
    if (!section || !newLabel.trim()) return
    const { error } = await supabase.from('content_type_options').insert({ kind: section, label: newLabel.trim() })
    if (error) { setMessage(error.message); return }
    setNewLabel(''); setAddOpen(false)
    const { data } = await supabase.from('content_type_options').select('id, kind, label').order('label')
    setOptions((data ?? []) as Option[])
  }

  if (section && selected) {
    return <section className="admin-section">
      <button className="secondary-button" type="button" onClick={() => setSelected(null)}><ArrowLeft size={15} /> Retour</button>
      {section === 'language' && <AdminLibraryManager languageFilter={selected} />}
      {section === 'sport' && <AdminSportManager programFilter={selected} />}
      {section === 'food' && <AdminLibraryManager mealTypeFilter={selected as MealSlot} />}
    </section>
  }

  if (section) {
    const items = section === 'language' ? languages : section === 'sport' ? sports : []
    return <section className="admin-section">
      <div className="library-admin-heading"><div><button className="secondary-button" type="button" onClick={() => setSection(null)}><ArrowLeft size={15} /> Retour</button></div>{section !== 'food' && <button className="primary-button" type="button" onClick={() => setAddOpen(true)}><Plus size={15} /> Ajouter une option</button>}</div>
      <div className="admin-icon-grid">
        {section === 'food' ? mealSlots.map((slot) => <button className="admin-rect" type="button" key={slot.key} onClick={() => setSelected(slot.key)}>{slot.icon}<span>{slot.label}</span></button>)
          : items.map((label) => <button className="admin-rect" type="button" key={label} onClick={() => setSelected(label)}>{section === 'language' ? <BookOpen size={20} /> : <Dumbbell size={20} />}<span>{label}</span></button>)}
      </div>
      {addOpen && <div className="admin-dialog-overlay"><div className="admin-dialog"><div className="library-admin-heading"><h3>Nouvelle option</h3><button className="secondary-button" type="button" onClick={() => setAddOpen(false)}><X size={15} /></button></div><label>Nom<input value={newLabel} onChange={(event) => setNewLabel(event.target.value)} placeholder="Ex. : Portugais" /></label><button className="primary-button" type="button" onClick={() => void addOption()}>Ajouter</button>{message && <p className="form-error">{message}</p>}</div></div>}
    </section>
  }

  return <section className="admin-section">
    <div className="admin-icon-grid">
      <button className="admin-rect" type="button" onClick={() => setSection('language')}><BookOpen size={22} /><span>Langues</span></button>
      <button className="admin-rect" type="button" onClick={() => setSection('sport')}><Dumbbell size={22} /><span>Sport</span></button>
      <button className="admin-rect" type="button" onClick={() => setSection('food')}><Sun size={22} /><span>Nourriture</span></button>
    </div>
  </section>
}
