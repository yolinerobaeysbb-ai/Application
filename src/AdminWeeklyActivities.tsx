import { useState } from 'react'
import { BookOpen, Dumbbell, Pin, Plus, Utensils } from 'lucide-react'
import AdminScheduleManager from './AdminScheduleManager'

type Category = 'language' | 'sport' | 'food' | 'fixed'

export default function AdminWeeklyActivities({ week, setWeek, currentUserId }: { week: number; setWeek: (week: number) => void; currentUserId: string }) {
  const [category, setCategory] = useState<Category>('sport')
  const [addRequestId, setAddRequestId] = useState(0)
  return <section className="admin-section">
    <div className="admin-a1-grid">
      <label className="planning-week-select"><span>Semaine</span><select value={week} onChange={(event) => setWeek(Number(event.target.value))}>{Array.from({ length: 16 }, (_, index) => <option value={index + 1} key={index + 1}>Semaine {index + 1}</option>)}</select></label>
      <button className="admin-rect admin-rect-action" type="button" onClick={() => setAddRequestId((current) => current + 1)}><Plus size={18} /><span>Ajouter du contenu</span></button>
      <button className={`admin-rect ${category === 'language' ? 'active' : ''}`} type="button" onClick={() => setCategory('language')}><BookOpen size={20} /><span>Langues</span></button>
      <button className={`admin-rect ${category === 'sport' ? 'active' : ''}`} type="button" onClick={() => setCategory('sport')}><Dumbbell size={20} /><span>Sport</span></button>
      <button className={`admin-rect ${category === 'food' ? 'active' : ''}`} type="button" onClick={() => setCategory('food')}><Utensils size={20} /><span>Nourriture</span></button>
      <button className={`admin-rect ${category === 'fixed' ? 'active' : ''}`} type="button" onClick={() => setCategory('fixed')}><Pin size={20} /><span>Activités fixes</span></button>
    </div>
    <AdminScheduleManager week={week} currentUserId={currentUserId} categoryFilter={category} addRequestId={addRequestId} />
  </section>
}


