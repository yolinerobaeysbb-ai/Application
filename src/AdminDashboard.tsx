import AdminImpersonationPanel from './AdminImpersonationPanel'
import AdminLibraryManager from './AdminLibraryManager'
import AdminScheduleManager from './AdminScheduleManager'
import AdminSportManager from './AdminSportManager'
import AdminCourseContentManager from './AdminCourseContentManager'
import AdminUiSettingsManager from './AdminUiSettingsManager'

export default function AdminDashboard({ week, setWeek, currentUserId, onSaved }: { week: number; setWeek: (week: number) => void; currentUserId: string; onSaved: (value: Record<string, string>) => void }) {
  return <section className="content-grid"><div className="section-intro"><p className="eyebrow">Espace administrateur</p><h2>Contrôle et simulation</h2><p className="muted">Les onglets standards restent une vue membre. Les outils de gestion sont regroupés ici.</p></div><AdminImpersonationPanel /><label className="planning-week-select"><span>Semaine à gérer</span><select value={week} onChange={(event) => setWeek(Number(event.target.value))}>{Array.from({ length: 16 }, (_, index) => <option value={index + 1} key={index + 1}>Semaine {index + 1}</option>)}</select></label><AdminScheduleManager week={week} currentUserId={currentUserId} /><AdminSportManager /><AdminLibraryManager /><AdminCourseContentManager /><AdminUiSettingsManager onSaved={onSaved} /></section>
}
