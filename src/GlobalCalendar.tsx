import { useEffect, useMemo, useState } from 'react'
import { CalendarDays, ChevronLeft, ChevronRight, Copy, Sparkles } from 'lucide-react'
import { supabase } from './lib/supabase'
import { expandOccurrences, findFreeSlots, formatMinutes, sameDay, type Occurrence, type ScheduleRow } from './lib/schedule'

type View = 'day' | 'week' | 'month' | 'year'
const categoryLabels: Record<ScheduleRow['category'], string> = { language: 'Langue', sport: 'Sport', food: 'Nourriture', fixed: 'Activité fixe' }
const monthNames = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre']
const dayNames = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']
const DAY_START = 7 * 60
const DAY_END = 22 * 60

function startOfWeek(date: Date): Date {
  const clone = new Date(date)
  const offset = (clone.getDay() + 6) % 7
  clone.setDate(clone.getDate() - offset)
  clone.setHours(0, 0, 0, 0)
  return clone
}

function toDateInputValue(date: Date): string {
  return date.toISOString().slice(0, 10)
}

export default function GlobalCalendar({ userId }: { userId: string }) {
  const [view, setView] = useState<View>('week')
  const [cursor, setCursor] = useState(new Date())
  const [occurrences, setOccurrences] = useState<Occurrence[]>([])
  const [feedUrl, setFeedUrl] = useState('')
  const [copied, setCopied] = useState(false)
  const [startDate, setStartDate] = useState('')
  const [startMessage, setStartMessage] = useState('')
  const [minDuration, setMinDuration] = useState(15)

  async function loadSchedule(start: Date) {
    const schedule = await supabase.from('weekly_schedule_items').select('id, category, title, description, day_of_week, week_number, start_time, end_time, duration_minutes, recurrence').neq('category', 'food').order('week_number').order('day_of_week')
    const rows = (schedule.data ?? []) as ScheduleRow[]
    setOccurrences(rows.flatMap((row) => expandOccurrences(row, start)))
  }

  useEffect(() => {
    async function load() {
      const profile = await supabase.from('profiles').select('calendar_start_date').eq('id', userId).maybeSingle()
      const settings = await supabase.from('app_settings').select('setting_value').eq('setting_key', 'program_start_date').maybeSingle()
      const resolved = profile.data?.calendar_start_date ?? settings.data?.setting_value
      const start = resolved ? new Date(resolved) : new Date()
      setStartDate(toDateInputValue(start))
      await loadSchedule(start)
      await supabase.from('calendar_feed_tokens').upsert({ user_id: userId }, { onConflict: 'user_id', ignoreDuplicates: true })
      const tokenRow = await supabase.from('calendar_feed_tokens').select('token').eq('user_id', userId).maybeSingle()
      if (tokenRow.data?.token) setFeedUrl(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/calendar-feed?token=${tokenRow.data.token}`)
    }
    void load()
  }, [userId])

  async function saveStartDate() {
    setStartMessage('')
    const { error } = await supabase.from('profiles').update({ calendar_start_date: startDate }).eq('id', userId)
    if (error) { setStartMessage(error.message); return }
    setStartMessage('Date de début enregistrée.')
    await loadSchedule(new Date(startDate))
  }

  const dayItems = useMemo(() => occurrences.filter((occurrence) => sameDay(occurrence.date, cursor)).sort((a, b) => (a.start_time ?? '').localeCompare(b.start_time ?? '')), [occurrences, cursor])
  const freeSlots = useMemo(() => findFreeSlots(occurrences, cursor, DAY_START, DAY_END).filter((slot) => slot.end - slot.start >= minDuration), [occurrences, cursor, minDuration])
  const busySegments = useMemo(() => dayItems.filter((item) => item.start_time).map((item) => { const start = item.start_time ? Number(item.start_time.slice(0, 2)) * 60 + Number(item.start_time.slice(3, 5)) : DAY_START; const end = item.end_time ? Number(item.end_time.slice(0, 2)) * 60 + Number(item.end_time.slice(3, 5)) : start + (item.duration_minutes ?? 60); return { start, end } }), [dayItems])
  const weekStart = startOfWeek(cursor)
  const weekDays = Array.from({ length: 7 }, (_, index) => { const date = new Date(weekStart); date.setDate(date.getDate() + index); return date })
  const monthStart = new Date(cursor.getFullYear(), cursor.getMonth(), 1)
  const monthGridStart = startOfWeek(monthStart)
  const monthCells = Array.from({ length: 42 }, (_, index) => { const date = new Date(monthGridStart); date.setDate(date.getDate() + index); return date })

  function step(amount: number) {
    const next = new Date(cursor)
    if (view === 'day') next.setDate(next.getDate() + amount)
    else if (view === 'week') next.setDate(next.getDate() + amount * 7)
    else if (view === 'month') next.setMonth(next.getMonth() + amount)
    else next.setFullYear(next.getFullYear() + amount)
    setCursor(next)
  }

  function copyFeed() { void navigator.clipboard.writeText(feedUrl); setCopied(true); setTimeout(() => setCopied(false), 2000) }

  return <section className="content-grid">
    <div className="section-intro"><p className="eyebrow">Vue combinée</p><h2>Planning global</h2><p className="muted">Sport, langues et activités fixes réunis dans un seul calendrier.</p></div>
    <div className="library-admin"><p className="card-kicker">Point de départ</p><h3>Date de début de votre programme</h3><p className="muted">Choisissez le jour correspondant à la semaine 1, jour 1 de votre planning.</p><div className="calendar-start-row"><label>Date de début<input type="date" value={startDate} onChange={(event) => setStartDate(event.target.value)} /></label><button className="primary-button" type="button" onClick={() => void saveStartDate()}>Enregistrer</button>{startMessage && <p className="form-feedback">{startMessage}</p>}</div></div>
    <div className="calendar-toolbar">
      <div className="calendar-view-switch">{(['day', 'week', 'month', 'year'] as View[]).map((option) => <button key={option} className={view === option ? 'active' : ''} type="button" onClick={() => setView(option)}>{option === 'day' ? 'Jour' : option === 'week' ? 'Semaine' : option === 'month' ? 'Mois' : 'Année'}</button>)}</div>
      <div className="calendar-nav"><button type="button" onClick={() => step(-1)}><ChevronLeft size={16} /></button><strong>{view === 'year' ? cursor.getFullYear() : view === 'month' ? `${monthNames[cursor.getMonth()]} ${cursor.getFullYear()}` : cursor.toLocaleDateString('fr-FR', { day: '2-digit', month: 'long', year: 'numeric' })}</strong><button type="button" onClick={() => step(1)}><ChevronRight size={16} /></button></div>
    </div>

    <div className="library-admin free-slot-bar"><p className="card-kicker"><Sparkles size={14} /> Assistant de créneaux libres</p><label className="calendar-start-row"><span>Durée minimale<select value={minDuration} onChange={(event) => setMinDuration(Number(event.target.value))}><option value={15}>15 min</option><option value={30}>30 min</option><option value={60}>1 h</option><option value={120}>2 h</option></select></span></label><div className="free-slot-timeline">{busySegments.map((segment, index) => <span className="busy" key={`busy-${index}`} style={{ left: `${(segment.start - DAY_START) / (DAY_END - DAY_START) * 100}%`, width: `${(segment.end - segment.start) / (DAY_END - DAY_START) * 100}%` }} />)}{freeSlots.map((slot) => <span key={`free-${slot.start}`} style={{ left: `${(slot.start - DAY_START) / (DAY_END - DAY_START) * 100}%`, width: `${(slot.end - slot.start) / (DAY_END - DAY_START) * 100}%` }} />)}</div>{freeSlots.length ? <div className="free-slot-chips">{freeSlots.map((slot) => <span className="free-slot-chip" key={slot.start}>{formatMinutes(slot.start)} – {formatMinutes(slot.end)} · {slot.end - slot.start} min</span>)}</div> : <p className="muted">Aucun créneau libre d'au moins {minDuration} min ce jour, en combinant sport, langues et activités fixes.</p>}</div>

    {view === 'day' && <div className="day-card calendar-day-list">{dayItems.length ? dayItems.map((item) => <article className="day-activity" key={`${item.id}-${item.date.toISOString()}`}><strong>{item.title}</strong><small>{categoryLabels[item.category]}{item.start_time ? ` · ${item.start_time.slice(0, 5)}` : ''}</small><p>{item.description}</p></article>) : <p className="day-empty">Aucune activité ce jour.</p>}</div>}

    {view === 'week' && <div className="daily-planning">{weekDays.map((date) => <article className="day-card" key={date.toISOString()}><div className="day-heading"><span>{dayNames[(date.getDay() + 6) % 7]}</span><h3>{date.getDate()}</h3></div>{occurrences.filter((occurrence) => sameDay(occurrence.date, date)).map((item) => <button className="day-activity" type="button" key={`${item.id}-${date.toISOString()}`} onClick={() => setCursor(date)}><strong>{item.title}</strong><small>{categoryLabels[item.category]}{item.start_time ? ` · ${item.start_time.slice(0, 5)}` : ''}</small></button>)}</article>)}</div>}

    {view === 'month' && <div className="calendar-month-grid">{monthCells.map((date) => { const count = occurrences.filter((occurrence) => sameDay(occurrence.date, date)).length; return <button type="button" key={date.toISOString()} className={`calendar-month-cell ${date.getMonth() !== cursor.getMonth() ? 'muted-cell' : ''} ${sameDay(date, cursor) ? 'active' : ''}`} onClick={() => { setCursor(date); setView('day') }}><span>{date.getDate()}</span>{count > 0 && <em>{count}</em>}</button> })}</div>}

    {view === 'year' && <div className="calendar-year-grid">{monthNames.map((name, index) => { const count = occurrences.filter((occurrence) => occurrence.date.getFullYear() === cursor.getFullYear() && occurrence.date.getMonth() === index).length; return <button type="button" className="admin-rect" key={name} onClick={() => { setCursor(new Date(cursor.getFullYear(), index, 1)); setView('month') }}><CalendarDays size={18} /><span>{name}</span><small>{count} activité{count > 1 ? 's' : ''}</small></button> })}</div>}

    <div className="library-admin"><div className="library-admin-heading"><div><p className="card-kicker">Synchronisation</p><h3>Intégrer à Google Calendar</h3><p className="muted">Copiez ce lien, puis dans Google Calendar : Autres agendas → Depuis une URL.</p></div></div><div className="calendar-feed-row"><input readOnly value={feedUrl} onFocus={(event) => event.currentTarget.select()} /><button className="secondary-button" type="button" onClick={copyFeed}><Copy size={14} /> {copied ? 'Copié !' : 'Copier'}</button></div></div>
  </section>
}
