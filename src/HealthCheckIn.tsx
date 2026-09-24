import { useEffect, useState } from 'react'
import { BatteryLow, ClipboardList, HeartPulse, Send } from 'lucide-react'
import { supabase } from './lib/supabase'

type Energy = 'energetic' | 'normal' | 'tired' | 'exhausted'
type Stress = 'low' | 'medium' | 'high'
type Diet = 'poor' | 'average' | 'good'
type CheckIn = { id: string; energy_level: Energy; sleep_hours: number | null; stress_level: Stress | null; diet_quality: Diet | null; available_minutes: number | null; notes: string; created_at: string }
const energyLabels: Record<Energy, string> = { energetic: 'En pleine forme', normal: 'Normal', tired: 'Fatigué(e)', exhausted: 'Épuisé(e)' }

function buildSuggestions(input: { energy: Energy; minutes: number; sleepHours: number | null; stress: Stress | null; diet: Diet | null }): string[] {
  const tips: string[] = []
  if (input.energy === 'exhausted') tips.push('Remplacez la séance principale par une séance de mobilité ou d\u2019étirements de 15 à 20 minutes.')
  else if (input.energy === 'tired') tips.push('Réduisez l\u2019intensité de 30 % et raccourcissez le bloc principal de la séance du jour.')
  if (input.minutes > 0 && input.minutes < 30) tips.push(`Avec ${input.minutes} minutes disponibles, privilégiez un format court : échauffement + un seul exercice clé.`)
  if (input.sleepHours !== null && input.sleepHours < 6) tips.push('Votre sommeil est court cette nuit : décalez la séance de sport en fin de journée et avancez le coucher.')
  if (input.stress === 'high') tips.push('Niveau de stress élevé : intégrez 5 minutes de respiration avant votre prochaine activité.')
  if (input.diet === 'poor') tips.push('Alimentation à améliorer : préparez un repas simple et équilibré depuis Plan & Plate → Nourriture.')
  if (!tips.length) tips.push('Tout semble aligné : gardez le programme prévu pour aujourd\u2019hui.')
  return tips
}

export default function HealthCheckIn({ userId }: { userId: string }) {
  const [energy, setEnergy] = useState<Energy>('normal')
  const [minutes, setMinutes] = useState('45')
  const [quickTips, setQuickTips] = useState<string[]>([])
  const [showForm, setShowForm] = useState(false)
  const [sleepHours, setSleepHours] = useState('7')
  const [stress, setStress] = useState<Stress>('medium')
  const [diet, setDiet] = useState<Diet>('average')
  const [notes, setNotes] = useState('')
  const [history, setHistory] = useState<CheckIn[]>([])
  const [message, setMessage] = useState('')

  async function loadHistory() { const { data } = await supabase.from('health_checkins').select('id, energy_level, sleep_hours, stress_level, diet_quality, available_minutes, notes, created_at').eq('user_id', userId).order('created_at', { ascending: false }).limit(5); setHistory((data ?? []) as CheckIn[]) }
  useEffect(() => { void loadHistory() }, [userId])

  function quickCheck() { setQuickTips(buildSuggestions({ energy, minutes: Number(minutes) || 0, sleepHours: null, stress: null, diet: null })) }

  async function submitQuestionnaire(event: React.FormEvent) {
    event.preventDefault()
    const payload = { user_id: userId, energy_level: energy, sleep_hours: sleepHours ? Number(sleepHours) : null, stress_level: stress, diet_quality: diet, available_minutes: minutes ? Number(minutes) : null, notes: notes.trim() }
    const { error } = await supabase.from('health_checkins').insert(payload)
    if (error) { setMessage(error.message); return }
    setMessage('Merci, votre bilan a été enregistré.')
    setNotes('')
    await loadHistory()
  }

  return <>
    <div className="library-admin health-quick-card"><div className="library-admin-heading"><div><p className="card-kicker"><BatteryLow size={14} /> Adapter ma séance</p><h3>Comment vous sentez-vous ?</h3></div></div><div className="health-quick-row"><label>État<select value={energy} onChange={(event) => setEnergy(event.target.value as Energy)}>{(Object.keys(energyLabels) as Energy[]).map((key) => <option value={key} key={key}>{energyLabels[key]}</option>)}</select></label><label>Temps disponible (min)<input type="number" min={0} value={minutes} onChange={(event) => setMinutes(event.target.value)} /></label><button className="primary-button" type="button" onClick={quickCheck}>Obtenir une suggestion</button></div>{quickTips.length > 0 && <ul className="health-tips">{quickTips.map((tip) => <li key={tip}>{tip}</li>)}</ul>}</div>

    <div className="library-admin"><div className="library-admin-heading"><div><p className="card-kicker"><HeartPulse size={14} /> Suivi complet</p><h3>Questionnaire de santé</h3><p className="muted">Sommeil, stress et alimentation pour affiner vos routines.</p></div><button className="secondary-button" type="button" onClick={() => setShowForm((current) => !current)}><ClipboardList size={15} /> {showForm ? 'Fermer' : 'Répondre au questionnaire'}</button></div>
      {showForm && <form className="library-admin-form" onSubmit={(event) => void submitQuestionnaire(event)}>
        <div className="library-form-grid">
          <label>Heures de sommeil<input type="number" min={0} max={14} value={sleepHours} onChange={(event) => setSleepHours(event.target.value)} /></label>
          <label>Niveau de stress<select value={stress} onChange={(event) => setStress(event.target.value as Stress)}><option value="low">Faible</option><option value="medium">Moyen</option><option value="high">Élevé</option></select></label>
          <label>Qualité de l'alimentation<select value={diet} onChange={(event) => setDiet(event.target.value as Diet)}><option value="poor">À améliorer</option><option value="average">Correcte</option><option value="good">Bonne</option></select></label>
        </div>
        <label>Notes complémentaires<textarea rows={3} value={notes} onChange={(event) => setNotes(event.target.value)} placeholder="Douleurs, humeur, contexte particulier..." /></label>
        <button className="primary-button" type="submit"><Send size={15} /> Enregistrer mon bilan</button>
        {message && <p className="form-feedback">{message}</p>}
      </form>}
      {history.length > 0 && <div className="library-admin-list">{history.map((entry) => <div className="library-admin-row" key={entry.id}><div><strong>{energyLabels[entry.energy_level]}</strong><small>{new Date(entry.created_at).toLocaleDateString('fr-FR')} · {buildSuggestions({ energy: entry.energy_level, minutes: entry.available_minutes ?? 0, sleepHours: entry.sleep_hours, stress: entry.stress_level, diet: entry.diet_quality })[0]}</small></div></div>)}</div>}
    </div>
  </>
}
