import { useEffect, useMemo, useState } from 'react'
import { BookOpen, Calendar, Check, Copy, Dumbbell, Leaf, LoaderCircle, Pin, ShoppingBasket, Sparkles, Trash2, Utensils } from 'lucide-react'
import { supabase } from './lib/supabase'
import { trashDelete } from './lib/trash'
import { findFreeSlots, formatMinutes, programWeekForDate, toLocalDateInput, weekDayToDate, type Occurrence } from './lib/schedule'

const fallbackLanguages = ['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaïlandais']
const days = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche']
type Category = 'language' | 'sport' | 'food' | 'fixed'
type PlanningCategory = Category | 'all'
type Recurrence = 'once' | 'daily' | 'weekly' | 'biweekly'
type Item = { id: string; user_id: string | null; category: Category; language: string | null; title: string; description: string; duration_minutes: number | null; day_of_week: number; meal_type: string | null; preparation_required: boolean; recipe_id: string | null; recurrence: Recurrence; start_time: string | null; end_time: string | null }
type ShoppingItem = { id: string; name: string; quantity: number | null; unit: string | null; category: string | null; checked: boolean }
type Props = { week: number; setWeek: (week: number) => void; isAdmin: boolean; userId: string; onOpenActivity: (activity: Item) => void }
const recurrenceLabels: Record<Recurrence, string> = { once: 'Une seule fois', daily: 'Tous les jours', weekly: 'Chaque semaine', biweekly: 'Une semaine sur deux' }
function formatDuration(minutes: number | null) { if (!minutes) return ''; const hours = Math.floor(minutes / 60); const remainder = minutes % 60; return hours ? `${hours}h${remainder ? remainder.toString().padStart(2, '0') : ''}` : `${minutes} min` }

export default function Planning({ week, setWeek, isAdmin, userId, onOpenActivity }: Props) {
  const [planningType, setPlanningType] = useState<PlanningCategory>('all')
  const [items, setItems] = useState<Item[]>([])
  const [shopping, setShopping] = useState<ShoppingItem[]>([])
  const [pantry, setPantry] = useState<string[]>([])
  const [pantryInput, setPantryInput] = useState('')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [languages, setLanguages] = useState(fallbackLanguages)
  const [currentWeekReal, setCurrentWeekReal] = useState<number | null>(null)
  const [calendarStartDate, setCalendarStartDate] = useState('')
  const [startDateMessage, setStartDateMessage] = useState('')
  const [feedUrl, setFeedUrl] = useState('')
  const [feedMessage, setFeedMessage] = useState('')
  const [copied, setCopied] = useState(false)
  const [freeDay, setFreeDay] = useState(((new Date().getDay() + 6) % 7) + 1)
  const [minDuration, setMinDuration] = useState(30)
  const [form, setForm] = useState({ category: 'language' as Category, language: fallbackLanguages[0], title: '', description: '', duration: '', day: '1', recurrence: 'weekly' as Recurrence, start_time: '', end_time: '' })

  async function loadPlanning() {
    setLoading(true); setError('')
    const schedule = await supabase.from('weekly_schedule_items').select('id, user_id, category, language, title, description, duration_minutes, day_of_week, meal_type, preparation_required, recipe_id, recurrence, start_time, end_time').eq('week_number', week).order('day_of_week')
    if (schedule.error) { setError('Impossible de charger le planning.'); setItems([]) } else setItems((schedule.data ?? []) as Item[])
    const pantryResult = await supabase.from('member_pantry').select('ingredient_name, available').eq('user_id', userId).eq('available', true)
    const available = (pantryResult.data ?? []).map((item: { ingredient_name: string }) => item.ingredient_name)
    setPantry(available)
    const recipeIds = ((schedule.data ?? []) as Item[]).filter((item) => item.category === 'food' && item.recipe_id).map((item) => item.recipe_id as string)
    if (recipeIds.length) {
      const ingredients = await supabase.from('recipe_ingredients').select('name, quantity, unit, recipe_id').in('recipe_id', recipeIds)
      const checks = await supabase.from('member_shopping_checks').select('item_name, checked').eq('user_id', userId).eq('week_number', week)
      const checkedNames = new Set((checks.data ?? []).filter((row: { checked: boolean }) => row.checked).map((row: { item_name: string }) => row.item_name))
      const grouped = new Map<string, ShoppingItem>()
      for (const ingredient of (ingredients.data ?? []) as { name: string; quantity: number | null; unit: string | null }[]) { if (!available.includes(ingredient.name)) grouped.set(ingredient.name, { id: `ingredient-${ingredient.name}`, name: ingredient.name, quantity: ingredient.quantity, unit: ingredient.unit, category: 'Recettes de la semaine', checked: checkedNames.has(ingredient.name) }) }
      setShopping(Array.from(grouped.values()))
    } else setShopping([])
    setLoading(false)
  }
  useEffect(() => { void loadPlanning() }, [week, userId])
  useEffect(() => {
    void (async () => {
      const profile = await supabase.from('profiles').select('calendar_start_date').eq('id', userId).maybeSingle()
      const settings = await supabase.from('app_settings').select('setting_value').eq('setting_key', 'program_start_date').maybeSingle()
      const start = profile.data?.calendar_start_date ?? settings.data?.setting_value
      if (start) {
        setCurrentWeekReal(programWeekForDate(new Date(start), new Date()))
        setCalendarStartDate(start)
        setWeek(programWeekForDate(new Date(start), new Date()))
      } else {
        setCurrentWeekReal(null)
        setCalendarStartDate(toLocalDateInput(new Date()))
      }
      if (profile.error || settings.error) setStartDateMessage('Impossible de charger les paramètres de date du programme.')

      const tokenResult = await supabase.from('calendar_feed_tokens').upsert({ user_id: userId }, { onConflict: 'user_id', ignoreDuplicates: true })
      if (tokenResult.error) { setFeedMessage(`Impossible de préparer la synchronisation : ${tokenResult.error.message}`); return }
      const tokenRow = await supabase.from('calendar_feed_tokens').select('token').eq('user_id', userId).maybeSingle()
      if (tokenRow.error) { setFeedMessage(`Impossible de charger le lien Google Calendar : ${tokenRow.error.message}`); return }
      if (tokenRow.data?.token && import.meta.env.VITE_SUPABASE_URL) {
        setFeedUrl(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/calendar-feed?token=${tokenRow.data.token}`)
      } else {
        setFeedMessage('Le lien Google Calendar n’est pas disponible. Vérifiez la configuration Supabase.')
      }
    })()
    void supabase.from('content_type_options').select('label').eq('kind', 'language').order('label').then(({ data }) => {
      const labels = (data ?? []).map((row: { label: string }) => row.label)
      if (labels.length) setLanguages(labels)
    })
  }, [userId, setWeek])

  async function saveCalendarStartDate() {
    setStartDateMessage('')
    if (!calendarStartDate) { setStartDateMessage('Choisissez une date de début.'); return }
    const { error: saveError } = await supabase.from('profiles').update({ calendar_start_date: calendarStartDate }).eq('id', userId)
    if (saveError) { setStartDateMessage(`Impossible d’enregistrer la date : ${saveError.message}`); return }
    const currentWeek = programWeekForDate(new Date(`${calendarStartDate}T00:00:00`))
    setCurrentWeekReal(currentWeek)
    setWeek(currentWeek)
    setStartDateMessage('Date de début enregistrée.')
  }

  async function copyCalendarFeed() {
    if (!feedUrl) return
    try {
      await navigator.clipboard.writeText(feedUrl)
      setCopied(true)
      setFeedMessage('')
      window.setTimeout(() => setCopied(false), 2000)
    } catch {
      setFeedMessage('Impossible de copier le lien. Sélectionnez-le puis copiez-le manuellement.')
    }
  }

  async function toggleShopping(name: string, checked: boolean) {
    setShopping((current) => current.map((entry) => entry.name === name ? { ...entry, checked } : entry))
    await supabase.from('member_shopping_checks').upsert({ user_id: userId, week_number: week, item_name: name, checked })
  }
  async function togglePantry(name: string) { await supabase.from('member_pantry').upsert({ user_id: userId, ingredient_name: name, available: true }, { onConflict: 'user_id,ingredient_name' }); await loadPlanning() }
  async function addPantryItem(event: React.FormEvent) { event.preventDefault(); const name = pantryInput.trim(); if (!name) return; await togglePantry(name); setPantryInput('') }
  async function removePantryItem(name: string) { await supabase.from('member_pantry').update({ available: false }).eq('user_id', userId).eq('ingredient_name', name); await loadPlanning() }
  async function addContent(event: React.FormEvent) { event.preventDefault(); const { error: insertError } = await supabase.from('weekly_schedule_items').insert({ user_id: userId, category: form.category, language: form.category === 'language' ? form.language : null, week_number: week, day_of_week: Number(form.day), title: form.title.trim(), description: form.description.trim(), duration_minutes: form.duration ? Number(form.duration) : null, recurrence: form.recurrence, start_time: form.start_time || null, end_time: form.end_time || null }); if (insertError) { setError('Impossible d’ajouter cette activité.'); return }; setForm({ ...form, title: '', description: '', duration: '' }); await loadPlanning() }
  async function removeContent(id: string) { const item = items.find((entry) => entry.id === id); if (!item) return; await trashDelete('weekly_schedule_items', item); setItems((current) => current.filter((entry) => entry.id !== id)) }
  const visibleItems = items.filter((item) => planningType === 'all' || item.category === planningType)
  const todayIndex = ((new Date().getDay() + 6) % 7) + 1
  const todayItems = items.filter((item) => item.day_of_week === todayIndex)
  const programStart = useMemo(() => calendarStartDate ? new Date(`${calendarStartDate}T00:00:00`) : new Date(), [calendarStartDate])
  const freeSlotOccurrences: Occurrence[] = useMemo(() => items.map((item) => ({
    id: item.id,
    category: item.category,
    title: item.title,
    description: item.description,
    day_of_week: item.day_of_week,
    week_number: week,
    start_time: item.start_time,
    end_time: item.end_time,
    duration_minutes: item.duration_minutes,
    recurrence: item.recurrence,
    date: weekDayToDate(programStart, week, item.day_of_week),
  } satisfies Occurrence)), [items, programStart, week])
  const freeDate = useMemo(() => weekDayToDate(programStart, week, freeDay), [programStart, week, freeDay])
  const freeSlots = useMemo(
    () => findFreeSlots(freeSlotOccurrences, freeDate, 7 * 60, 22 * 60).filter((slot) => slot.end - slot.start >= minDuration),
    [freeSlotOccurrences, freeDate, minDuration],
  )
  const busySegments = items
    .filter((item) => item.day_of_week === freeDay && item.start_time)
    .map((item) => {
      const start = Number(item.start_time!.slice(0, 2)) * 60 + Number(item.start_time!.slice(3, 5))
      const end = item.end_time
        ? Number(item.end_time.slice(0, 2)) * 60 + Number(item.end_time.slice(3, 5))
        : start + (item.duration_minutes ?? 60)
      return { start: Math.max(start, 7 * 60), end: Math.min(end, 22 * 60) }
    })
    .filter((segment) => segment.end > segment.start)
  return <section className="content-grid">
    <div className="today-strip">
      <div><p className="card-kicker">Aujourd’hui</p><strong>{days[todayIndex - 1]} · semaine {week.toString().padStart(2, '0')}</strong><p>{todayItems.length ? todayItems.map((item) => item.title).join(' · ') : 'Rien de planifié pour aujourd’hui — vous pouvez ajouter une activité ci-dessous.'}</p></div>
      <button className="outline-button" type="button" onClick={() => { if (todayItems[0]) setPlanningType(todayItems[0].category) }}>Voir le jour</button>
    </div>
    <div className="planning-heading">
      <div className="section-intro">
        <p className="eyebrow">Votre planning</p>
        <h2>Semaine {week.toString().padStart(2, '0')} / 16</h2>
        {currentWeekReal !== null && <p className="current-week-indicator"><Calendar size={15} /> Vous êtes actuellement en <strong>Semaine {currentWeekReal}</strong> d’après votre calendrier.</p>}
        <p className="muted">Une vue dédiée par domaine, avec ses contenus complets.</p>
      </div>
      <label className="planning-week-select"><span>Semaine active</span><select value={week} onChange={(event) => setWeek(Number(event.target.value))}>{Array.from({ length: 16 }, (_, index) => <option key={index + 1} value={index + 1}>Semaine {index + 1}</option>)}</select></label>
    </div>
    <div className="library-admin calendar-dashboard-settings">
      <div>
        <p className="card-kicker">Début du programme</p>
        <p className="muted">Choisissez le jour correspondant à la semaine 1, jour 1 de votre planning.</p>
        <div className="calendar-start-row">
          <label>Date de début<input type="date" value={calendarStartDate} onChange={(event) => setCalendarStartDate(event.target.value)} required /></label>
          <button className="primary-button" type="button" onClick={() => void saveCalendarStartDate()}>Enregistrer</button>
        </div>
        {startDateMessage && <p className="form-feedback" role="status">{startDateMessage}</p>}
      </div>
      <div className="calendar-dashboard-sync">
        <p className="card-kicker">Synchronisation</p>
        <h3>Intégrer à Google Calendar</h3>
        <p className="muted">Copiez ce lien, puis dans Google Calendar : Autres agendas → Depuis une URL.</p>
        <div className="calendar-feed-row">
          <input readOnly value={feedUrl} onFocus={(event) => event.currentTarget.select()} aria-label="Lien de synchronisation Google Calendar" />
          <button className="secondary-button" type="button" onClick={() => void copyCalendarFeed()} disabled={!feedUrl}><Copy size={14} /> {copied ? 'Copié !' : 'Copier'}</button>
        </div>
        {feedMessage && <p className="form-error" role="alert">{feedMessage}</p>}
      </div>
    </div>
    <div className="library-admin free-slot-bar">
      <p className="card-kicker"><Sparkles size={14} /> Assistant de créneaux libres · semaine {week}</p>
      <div className="calendar-start-row">
        <label>Jour<select value={freeDay} onChange={(event) => setFreeDay(Number(event.target.value))}>{days.map((day, index) => <option value={index + 1} key={day}>{day}</option>)}</select></label>
        <label>Durée minimale<select value={minDuration} onChange={(event) => setMinDuration(Number(event.target.value))}><option value={15}>15 min</option><option value={30}>30 min</option><option value={60}>1 h</option><option value={120}>2 h</option></select></label>
      </div>
      <div className="free-slot-timeline">
        {busySegments.map((segment, index) => <span className="busy" key={`busy-${index}`} style={{ left: `${(segment.start - 7 * 60) / (15 * 60) * 100}%`, width: `${(segment.end - segment.start) / (15 * 60) * 100}%` }} />)}
        {freeSlots.map((slot) => <span key={`free-${slot.start}`} style={{ left: `${(slot.start - 7 * 60) / (15 * 60) * 100}%`, width: `${(slot.end - slot.start) / (15 * 60) * 100}%` }} />)}
      </div>
      {freeSlots.length ? <div className="free-slot-chips">{freeSlots.map((slot) => <span className="free-slot-chip" key={slot.start}>{formatMinutes(slot.start)} – {formatMinutes(slot.end)} · {slot.end - slot.start} min</span>)}</div> : <p className="muted">Aucun créneau libre d’au moins {minDuration} min ce jour.</p>}
    </div>
    <form className="admin-editor" onSubmit={addContent}>
      <p className="card-kicker">{isAdmin ? 'Administration · ajouter au calendrier' : 'Mon planning personnel'}</p>
      <div className="editor-fields">
        <select value={form.category} onChange={(event) => setForm({ ...form, category: event.target.value as Category })}><option value="language">Langue</option><option value="sport">Sport</option><option value="food">Nourriture</option><option value="fixed">Activité fixe</option></select>
        <select value={form.day} onChange={(event) => setForm({ ...form, day: event.target.value })}>{days.map((day, index) => <option value={index + 1} key={day}>{day}</option>)}</select>
        {form.category === 'language' && <select value={form.language} onChange={(event) => setForm({ ...form, language: event.target.value })}>{languages.map((language) => <option key={language}>{language}</option>)}</select>}
        <select value={form.recurrence} onChange={(event) => setForm({ ...form, recurrence: event.target.value as Recurrence })}>{(Object.keys(recurrenceLabels) as Recurrence[]).map((key) => <option value={key} key={key}>{recurrenceLabels[key]}</option>)}</select>
        <input type="time" value={form.start_time} onChange={(event) => setForm({ ...form, start_time: event.target.value })} aria-label="Heure de début" />
        <input type="time" value={form.end_time} onChange={(event) => setForm({ ...form, end_time: event.target.value })} aria-label="Heure de fin" />
        <input value={form.title} onChange={(event) => setForm({ ...form, title: event.target.value })} placeholder="Activité" required />
        <input value={form.description} onChange={(event) => setForm({ ...form, description: event.target.value })} placeholder="Détails" />
        <input type="number" min="1" value={form.duration} onChange={(event) => setForm({ ...form, duration: event.target.value })} placeholder="Durée (min)" />
      </div>
      <button className="primary-button">{isAdmin ? `Ajouter à la semaine ${week}` : 'Ajouter à mon planning'}</button>
    </form>
    <div className="planning-tabs" role="tablist">
      <button type="button" className={planningType === 'language' ? 'active' : ''} onClick={() => setPlanningType('language')}><BookOpen size={16} /> Cours</button>
      <button type="button" className={planningType === 'sport' ? 'active' : ''} onClick={() => setPlanningType('sport')}><Dumbbell size={16} /> Sport</button>
      <button type="button" className={planningType === 'food' ? 'active' : ''} onClick={() => setPlanningType('food')}><Utensils size={16} /> Nourriture</button>
      <button type="button" className={planningType === 'fixed' ? 'active' : ''} onClick={() => setPlanningType('fixed')}><Pin size={16} /> Activités fixes</button>
      <button type="button" className={planningType === 'all' ? 'active' : ''} onClick={() => setPlanningType('all')}><Calendar size={16} /> Planning complet</button>
    </div>
    {loading && <p className="loading-state"><LoaderCircle size={17} className="spin" /> Chargement du planning...</p>}
    {error && <p className="form-error" role="alert">{error}</p>}
    <div className="daily-planning">
      {days.map((day, index) => {
        const dayItems = visibleItems.filter((item) => item.day_of_week === index + 1)
        return <article className="day-card" key={day}>
          <div className="day-heading"><span>0{index + 1}</span><h3>{day}</h3></div>
          {dayItems.length ? dayItems.map((item) => <button className="day-activity" type="button" key={item.id} onClick={() => onOpenActivity(item)}>
            <strong>{item.title}</strong>
            <small>{planningType === 'all' ? `[${item.category === 'language' ? 'Cours' : item.category === 'sport' ? 'Sport' : item.category === 'fixed' ? 'Fixe' : 'Repas'}] ` : ''}{item.category === 'language' ? 'Cours' : item.category === 'sport' ? 'Programme' : item.category === 'fixed' ? 'Activité fixe' : item.meal_type ?? 'Repas'}{item.start_time ? ` · ${item.start_time.slice(0, 5)}` : ''}{item.duration_minutes ? ` · ${formatDuration(item.duration_minutes)}` : ''}</small>
            {item.preparation_required && <span className="cooking-badge"><Leaf size={11} /> Batch cooking</span>}
            {item.description && <p>{item.description}</p>}
            {(isAdmin || item.user_id === userId) && <span className="delete-button" role="button" tabIndex={0} onClick={(event) => { event.stopPropagation(); void removeContent(item.id) }} aria-label={`Supprimer ${item.title}`}><Trash2 size={13} /></span>}
          </button>) : <p className="day-empty">Aucune activité planifiée</p>}
        </article>
      })}
    </div>
    {planningType === 'food' && <article className="shopping-card">
      <div className="shopping-heading"><div><p className="card-kicker">Nutrition</p><h3>Courses calculées</h3><p className="muted">Les ingrédients sont calculés depuis les recettes de la semaine, hors produits déjà disponibles.</p></div><ShoppingBasket size={23} /></div>
      {shopping.length ? <div className="shopping-list">{shopping.map((item) => <label className={`shopping-item ${item.checked ? 'checked' : ''}`} key={item.id}>
        <input type="checkbox" checked={item.checked} onChange={() => void toggleShopping(item.name, !item.checked)} /><span className="shopping-check"><Check size={13} /></span>
        <span>{item.name}<small>{item.quantity ? `${item.quantity} ${item.unit ?? ''}` : item.category}</small></span>
        <button className="pantry-action" type="button" onClick={(event) => { event.preventDefault(); event.stopPropagation(); void togglePantry(item.name) }}>J’ai déjà</button>
      </label>)}</div> : <p className="muted">Aucun achat manquant pour cette semaine.</p>}
      <div className="pantry-section"><p className="card-kicker">Mon inventaire</p>{pantry.length ? <div className="pantry-list">{pantry.map((item) => <button className="pantry-chip" type="button" key={item} onClick={() => void removePantryItem(item)}>{item} ×</button>)}</div> : <p className="muted">Aucun ingrédient déclaré disponible.</p>}<form className="pantry-form" onSubmit={addPantryItem}><input value={pantryInput} onChange={(event) => setPantryInput(event.target.value)} placeholder="J’ai déjà..." /><button className="outline-button">Ajouter</button></form></div>
    </article>}
  </section>
}
