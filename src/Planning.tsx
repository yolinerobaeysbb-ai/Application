import { useEffect, useState } from 'react'
import { BookOpen, Check, Dumbbell, Leaf, LoaderCircle, Pin, ShoppingBasket, Trash2, Utensils } from 'lucide-react'
import { supabase } from './lib/supabase'
import { trashDelete } from './lib/trash'
// 1. Ajoutez "Calendar" aux imports lucide-react :
import { BookOpen, Calendar, Check, Dumbbell, Leaf, LoaderCircle, Pin, ShoppingBasket, Trash2, Utensils } from 'lucide-react'

// 2. Ajoutez l'importation de l'utilitaire de date :
import { programWeekForDate } from './lib/schedule'
import MathField from './MathField' // (Si pas déjà fait)

// 3. Modifiez le type Category pour ajouter 'all' :
type Category = 'language' | 'sport' | 'food' | 'fixed' | 'all'



const fallbackLanguages = ['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaïlandais']
const days = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche']
type Category = 'language' | 'sport' | 'food' | 'fixed' | 'all'
type Recurrence = 'once' | 'daily' | 'weekly' | 'biweekly'
type Item = { id: string; user_id: string | null; category: Category; language: string | null; title: string; description: string; duration_minutes: number | null; day_of_week: number; meal_type: string | null; preparation_required: boolean; recipe_id: string | null; recurrence: Recurrence; start_time: string | null; end_time: string | null }
type ShoppingItem = { id: string; name: string; quantity: number | null; unit: string | null; category: string | null; checked: boolean }
type Props = { week: number; setWeek: (week: number) => void; isAdmin: boolean; userId: string; onOpenActivity: (activity: Item) => void }
const recurrenceLabels: Record<Recurrence, string> = { once: 'Une seule fois', daily: 'Tous les jours', weekly: 'Chaque semaine', biweekly: 'Une semaine sur deux' }
function formatDuration(minutes: number | null) { if (!minutes) return ''; const hours = Math.floor(minutes / 60); const remainder = minutes % 60; return hours ? `${hours}h${remainder ? remainder.toString().padStart(2, '0') : ''}` : `${minutes} min` }

export default function Planning({ week, setWeek, isAdmin, userId, onOpenActivity }: Props) {
  const [planningType, setPlanningType] = useState<Category>('language')
  const [items, setItems] = useState<Item[]>([])
  const [shopping, setShopping] = useState<ShoppingItem[]>([])
  const [pantry, setPantry] = useState<string[]>([])
  const [pantryInput, setPantryInput] = useState('')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [languages, setLanguages] = useState(fallbackLanguages)
  const [currentWeekReal, setCurrentWeekReal] = useState<number | null>(null)
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
  // AJOUT : Calculer la semaine réelle actuelle
    void (async () => {
      const profile = await supabase.from('profiles').select('calendar_start_date').eq('id', userId).maybeSingle()
      const settings = await supabase.from('app_settings').select('setting_value').eq('setting_key', 'program_start_date').maybeSingle()
      const start = profile.data?.calendar_start_date ?? settings.data?.setting_value
      if (start) {
        setCurrentWeekReal(programWeekForDate(new Date(start)))
      }
    })()

  // (Le code existant pour content_type_options reste ici...)
    void supabase.from('content_type_options').select('label').eq('kind', 'language').order('label').then(({ data }) => { ... })
  }, [userId]) // <-- Ajoutez userId dans les dépendances

  async function toggleShopping(name: string, checked: boolean) {
    setShopping((current) => current.map((entry) => entry.name === name ? { ...entry, checked } : entry))
    await supabase.from('member_shopping_checks').upsert({ user_id: userId, week_number: week, item_name: name, checked })
  }
  async function togglePantry(name: string) { await supabase.from('member_pantry').upsert({ user_id: userId, ingredient_name: name, available: true }, { onConflict: 'user_id,ingredient_name' }); await loadPlanning() }
  async function addPantryItem(event: React.FormEvent) { event.preventDefault(); const name = pantryInput.trim(); if (!name) return; await togglePantry(name); setPantryInput('') }
  async function removePantryItem(name: string) { await supabase.from('member_pantry').update({ available: false }).eq('user_id', userId).eq('ingredient_name', name); await loadPlanning() }
  async function addContent(event: React.FormEvent) { event.preventDefault(); const { error: insertError } = await supabase.from('weekly_schedule_items').insert({ user_id: userId, category: form.category, language: form.category === 'language' ? form.language : null, week_number: week, day_of_week: Number(form.day), title: form.title.trim(), description: form.description.trim(), duration_minutes: form.duration ? Number(form.duration) : null, recurrence: form.recurrence, start_time: form.start_time || null, end_time: form.end_time || null }); if (insertError) { setError('Impossible d’ajouter cette activité.'); return }; setForm({ ...form, title: '', description: '', duration: '' }); await loadPlanning() }
  async function removeContent(id: string) { const item = items.find((entry) => entry.id === id); if (!item) return; await trashDelete('weekly_schedule_items', item); setItems((current) => current.filter((entry) => entry.id !== id)) }
  const visibleItems = items.filter((item) => item.category === planningType)
  // Remplacez l'ancienne ligne par celle-ci :
  const visibleItems = items.filter((item) => planningType === 'all' ? item.category !== 'food' : item.category === planningType)
  const todayIndex = ((new Date().getDay() + 6) % 7) + 1
  const todayItems = items.filter((item) => item.day_of_week === todayIndex)
  return <section className="content-grid"><div className="today-strip"><div><p className="card-kicker">Aujourd’hui</p><strong>{days[todayIndex - 1]} · semaine {week.toString().padStart(2, '0')}</strong><p>{todayItems.length ? todayItems.map((item) => item.title).join(' · ') : 'Rien de planifié pour aujourd’hui — vous pouvez ajouter une activité ci-dessous.'}</p></div><button className="outline-button" type="button" onClick={() => { if (todayItems[0]) setPlanningType(todayItems[0].category) }}>Voir le jour</button></div><div className="planning-heading"><div className="section-intro"><p className="eyebrow">Votre planning</p><h2>Semaine {week.toString().padStart(2, '0')} / 16</h2>{currentWeekReal !== null && (
  <p className="current-week-indicator" style={{ display: 'inline-flex', alignItems: 'center', gap: '6px', margin: '4px 0 0 0', color: '#527ba0', fontWeight: 600, fontSize: '0.9rem' }}>
    <Calendar size={15} /> Vous êtes actuellement en <strong>Semaine {currentWeekReal}</strong> d'après votre calendrier.
  </p>
)}
<p className="muted">Une vue dédiée par domaine, avec ses contenus complets.</p></div><label className="planning-week-select"><span>Semaine active</span><select value={week} onChange={(event) => setWeek(Number(event.target.value))}>{Array.from({ length: 16 }, (_, index) => <option key={index + 1} value={index + 1}>Semaine {index + 1}</option>)}</select></label></div><form className="admin-editor" onSubmit={addContent}><p className="card-kicker">{isAdmin ? 'Administration · ajouter au calendrier' : 'Mon planning personnel'}</p><div className="editor-fields"><select value={form.category} onChange={(event) => setForm({ ...form, category: event.target.value as Category })}><option value="language">Langue</option><option value="sport">Sport</option><option value="food">Nourriture</option><option value="fixed">Activité fixe</option></select><select value={form.day} onChange={(event) => setForm({ ...form, day: event.target.value })}>{days.map((day, index) => <option value={index + 1} key={day}>{day}</option>)}</select>{form.category === 'language' && <select value={form.language} onChange={(event) => setForm({ ...form, language: event.target.value })}>{languages.map((language) => <option key={language}>{language}</option>)}</select>}<select value={form.recurrence} onChange={(event) => setForm({ ...form, recurrence: event.target.value as Recurrence })}>{(Object.keys(recurrenceLabels) as Recurrence[]).map((key) => <option value={key} key={key}>{recurrenceLabels[key]}</option>)}</select><input type="time" value={form.start_time} onChange={(event) => setForm({ ...form, start_time: event.target.value })} aria-label="Heure de début" /><input type="time" value={form.end_time} onChange={(event) => setForm({ ...form, end_time: event.target.value })} aria-label="Heure de fin" /><input value={form.title} onChange={(event) => setForm({ ...form, title: event.target.value })} placeholder="Activité" required /><input value={form.description} onChange={(event) => setForm({ ...form, description: event.target.value })} placeholder="Détails" /><input type="number" min="1" value={form.duration} onChange={(event) => setForm({ ...form, duration: event.target.value })} placeholder="Durée (min)" /></div><button className="primary-button">{isAdmin ? `Ajouter à la semaine ${week}` : 'Ajouter à mon planning'}</button></form>
<div className="planning-tabs" role="tablist"><button className={planningType === 'language' ? 'active' : ''} onClick={() => setPlanningType('language')}><BookOpen size={16} /> Cours</button><button className={planningType === 'sport' ? 'active' : ''} onClick={() => setPlanningType('sport')}><Dumbbell size={16} /> Sport</button><button className={planningType === 'food' ? 'active' : ''} onClick={() => setPlanningType('food')}><Utensils size={16} /> Nourriture</button><button className={planningType === 'fixed' ? 'active' : ''} onClick={() => setPlanningType('fixed')}><Pin size={16} /> Activités fixes</button></div>{loading && <p className="loading-state"><LoaderCircle size={17} className="spin" /> Chargement du planning...</p>}{error && <p className="form-error" role="alert">{error}</p>}<button className={planningType === 'all' ? 'active' : ''} onClick={() => setPlanningType('all')}>
  <Calendar size={16} /> Planning complet
</button>
<div className="daily-planning">{days.map((day, index) => <article className="day-card" key={day}><div className="day-heading"><span>0{index + 1}</span><h3>{day}</h3></div>{visibleItems.filter((item) => item.day_of_week === index + 1).length ? visibleItems.filter((item) => item.day_of_week === index + 1).map((item) => <button className="day-activity" type="button" key={item.id} onClick={() => onOpenActivity(item)}><strong>{item.title}</strong><small>
  {planningType === 'all' ? `[${item.category === 'language' ? 'Cours' : item.category === 'sport' ? 'Sport' : 'Fixe'}] ` : ''}
  {item.category === 'language' ? 'Cours' : item.category === 'sport' ? 'Programme' : item.category === 'fixed' ? 'Activité fixe' : item.meal_type ?? 'Repas'}
  {/* reste de votre code horaire... */}
</small>
{item.preparation_required && <span className="cooking-badge"><Leaf size={11} /> Batch cooking</span>}{item.description && <p>{item.description}</p>}{(isAdmin || item.user_id === userId) && <span className="delete-button" role="button" tabIndex={0} onClick={(event) => { event.stopPropagation(); void removeContent(item.id) }} aria-label={`Supprimer ${item.title}`}><Trash2 size={13} /></span>}</button>) : <p className="day-empty">Aucune activité planifiée</p>}</article>)}</div>{planningType === 'food' && <article className="shopping-card"><div className="shopping-heading"><div><p className="card-kicker">Nutrition</p><h3>Courses calculées</h3><p className="muted">Les ingrédients sont calculés depuis les recettes de la semaine, hors produits déjà disponibles.</p></div><ShoppingBasket size={23} /></div>{shopping.length ? <div className="shopping-list">{shopping.map((item) => <label className={`shopping-item ${item.checked ? 'checked' : ''}`} key={item.id}><input type="checkbox" checked={item.checked} onChange={() => void toggleShopping(item.name, !item.checked)} /><span className="shopping-check"><Check size={13} /></span><span>{item.name}<small>{item.quantity ? `${item.quantity} ${item.unit ?? ''}` : item.category}</small></span><button className="pantry-action" type="button" onClick={(event) => { event.preventDefault(); event.stopPropagation(); void togglePantry(item.name) }}>J’ai déjà</button></label>)}</div> : <p className="muted">Aucun achat manquant pour cette semaine.</p>}<div className="pantry-section"><p className="card-kicker">Mon inventaire</p>{pantry.length ? <div className="pantry-list">{pantry.map((item) => <button className="pantry-chip" type="button" key={item} onClick={() => void removePantryItem(item)}>{item} ×</button>)}</div> : <p className="muted">Aucun ingrédient déclaré disponible.</p>}<form className="pantry-form" onSubmit={addPantryItem}><input value={pantryInput} onChange={(event) => setPantryInput(event.target.value)} placeholder="J’ai déjà..." /><button className="outline-button">Ajouter</button></form></div></article>}</section>
}
