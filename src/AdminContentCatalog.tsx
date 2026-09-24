import { useEffect, useState } from 'react'
import { ArrowLeft, BookOpen, Dumbbell, Pin, Plus, Sun, Sunrise, Sunset, Moon, Trash2, X } from 'lucide-react'
import { supabase } from './lib/supabase'
import { trashDelete } from './lib/trash'
import AdminLibraryManager from './AdminLibraryManager'
import AdminSportManager from './AdminSportManager'
import AdminScheduleManager from './AdminScheduleManager'

type Kind = 'language' | 'sport' | 'food' | 'fixed'
type Option = { id: string; kind: 'language' | 'sport'; label: string }
type MealSlot = 'breakfast' | 'lunch' | 'snack' | 'dinner'
const mealSlots: { key: MealSlot; label: string; icon: React.ReactNode }[] = [
  { key: 'breakfast', label: 'Matin', icon: <Sunrise size={20} /> },
  { key: 'lunch', label: 'Midi', icon: <Sun size={20} /> },
  { key: 'snack', label: '16h', icon: <Sunset size={20} /> },
  { key: 'dinner', label: 'Soir', icon: <Moon size={20} /> },
]

export default function AdminContentCatalog({ week, setWeek, currentUserId }: { week: number; setWeek: (week: number) => void; currentUserId: string }) {
  const [section, setSection] = useState<Kind | null>(null)
  const [options, setOptions] = useState<Option[]>([])
  const [selected, setSelected] = useState<string | null>(null)
  const [addOpen, setAddOpen] = useState(false)
  const [newLabel, setNewLabel] = useState('')
  const [message, setMessage] = useState('')
  const [fixedAddRequestId, setFixedAddRequestId] = useState(0)

  async function loadOptions() { const { data } = await supabase.from('content_type_options').select('id, kind, label').order('label'); setOptions((data ?? []) as Option[]) }
  useEffect(() => { void loadOptions() }, [])

  const languages = options.filter((option) => option.kind === 'language')
  const sports = options.filter((option) => option.kind === 'sport')

  async function addOption() {
    if (!section || section === 'food' || section === 'fixed' || !newLabel.trim()) return
    const { error } = await supabase.from('content_type_options').insert({ kind: section, label: newLabel.trim() })
    if (error) { setMessage(error.message); return }
    setNewLabel(''); setAddOpen(false)
    await loadOptions()
  }

  async function removeOption(option: Option) {
    const { error } = await trashDelete('content_type_options', option)
    if (error) { setMessage(error); return }
    await loadOptions()
  }

  if (section === 'fixed') {
    return <section className="admin-section">
      <button className="secondary-button" type="button" onClick={() => setSection(null)}><ArrowLeft size={15} /> Retour</button>
      <div className="admin-a1-grid">
        <label className="planning-week-select"><span>Semaine</span><select value={week} onChange={(event) => setWeek(Number(event.target.value))}>{Array.from({ length: 16 }, (_, index) => <option value={index + 1} key={index + 1}>Semaine {index + 1}</option>)}</select></label>
        <button className="admin-rect admin-rect-action" type="button" onClick={() => setFixedAddRequestId((current) => current + 1)}><Plus size={18} /><span>Ajouter une activité fixe</span></button>
      </div>
      <AdminScheduleManager week={week} currentUserId={currentUserId} categoryFilter="fixed" addRequestId={fixedAddRequestId} />
    </section>
  }

  if (section && selected) {
    return <section className="admin-section">
      <button className="secondary-button" type="button" onClick={() => setSelected(null)}><ArrowLeft size={15} /> Retour</button>
      {section === 'language' && <AdminLibraryManager languageFilter={selected} lockMode="course" />}
      {section === 'sport' && <AdminSportManager programFilter={selected} />}
      {section === 'food' && <AdminLibraryManager mealTypeFilter={selected as MealSlot} lockMode="recipe" />}
    </section>
  }

  if (section) {
    const items = section === 'language' ? languages : section === 'sport' ? sports : []
    return <section className="admin-section">
      <div className="library-admin-heading"><div><button className="secondary-button" type="button" onClick={() => setSection(null)}><ArrowLeft size={15} /> Retour</button></div>{section !== 'food' && <button className="primary-button" type="button" onClick={() => setAddOpen(true)}><Plus size={15} /> Ajouter une option</button>}</div>
      <div className="admin-icon-grid">
        {section === 'food' ? mealSlots.map((slot) => <button className="admin-rect" type="button" key={slot.key} onClick={() => setSelected(slot.key)}>{slot.icon}<span>{slot.label}</span></button>)
          : items.map((option) => <div className="admin-rect-wrap" key={option.id}><button className="admin-rect" type="button" onClick={() => setSelected(option.label)}>{section === 'language' ? <BookOpen size={20} /> : <Dumbbell size={20} />}<span>{option.label}</span></button><button className="admin-rect-delete" type="button" title="Supprimer cette option" onClick={() => void removeOption(option)}><Trash2 size={13} /></button></div>)}
      </div>
      {message && <p className="form-error">{message}</p>}
      {addOpen && <div className="admin-dialog-overlay"><div className="admin-dialog"><div className="library-admin-heading"><h3>Nouvelle option</h3><button className="secondary-button" type="button" onClick={() => setAddOpen(false)}><X size={15} /></button></div><label>Nom<input value={newLabel} onChange={(event) => setNewLabel(event.target.value)} placeholder="Ex. : Portugais" /></label><button className="primary-button" type="button" onClick={() => void addOption()}>Ajouter</button></div></div>}
    </section>
  }

  return <section className="admin-section">
    <div className="admin-icon-grid">
      <button className="admin-rect" type="button" onClick={() => setSection('language')}><BookOpen size={22} /><span>Langues</span></button>
      <button className="admin-rect" type="button" onClick={() => setSection('sport')}><Dumbbell size={22} /><span>Sport</span></button>
      <button className="admin-rect" type="button" onClick={() => setSection('food')}><Sun size={22} /><span>Nourriture</span></button>
      <button className="admin-rect" type="button" onClick={() => setSection('fixed')}><Pin size={22} /><span>Activités fixes</span></button>
    </div>
  </section>
}

