import { useEffect, useState } from 'react'
import { Activity, BarChart3, LoaderCircle, TrendingUp } from 'lucide-react'
import { CartesianGrid, Line, LineChart, ResponsiveContainer, Tooltip, XAxis, YAxis } from 'recharts'
import { supabase } from './lib/supabase'
import ProgressEntryManager from './ProgressEntryManager'

type SportPoint = { recorded_on: string; weight_kg: number | null; completed: boolean }
type NutritionPoint = { recorded_on: string; meals_planned: number; meals_completed: number }
type LanguagePoint = { test_month: string; score: number; language: string }

export default function ProgressDashboard({ userId }: { userId: string }) {
  const [sport, setSport] = useState<SportPoint[]>([])
  const [nutrition, setNutrition] = useState<NutritionPoint[]>([])
  const [languages, setLanguages] = useState<LanguagePoint[]>([])
  const [loading, setLoading] = useState(true)
  const [refreshVersion, setRefreshVersion] = useState(0)

  useEffect(() => {
    async function loadProgress() {
      const [sportResult, nutritionResult, languageResult] = await Promise.all([
        supabase.from('sport_progress').select('recorded_on, weight_kg, completed').eq('user_id', userId).order('recorded_on'),
        supabase.from('nutrition_progress').select('recorded_on, meals_planned, meals_completed').eq('user_id', userId).order('recorded_on'),
        supabase.from('language_placement_tests').select('test_month, score, language').eq('user_id', userId).order('test_month'),
      ])
      setSport((sportResult.data ?? []) as SportPoint[])
      setNutrition((nutritionResult.data ?? []) as NutritionPoint[])
      setLanguages((languageResult.data ?? []) as LanguagePoint[])
      setLoading(false)
    }
    void loadProgress()
  }, [userId, refreshVersion])

  const sportChart = sport.map((point) => ({ date: point.recorded_on.slice(5), charge: point.weight_kg ?? 0 }))
  const nutritionChart = nutrition.map((point) => ({ date: point.recorded_on.slice(5), repas: point.meals_planned ? Math.round(point.meals_completed / point.meals_planned * 100) : 0 }))
  const languageChart = languages.map((point) => ({ date: point.test_month.slice(0, 7), score: point.score, language: point.language }))
  const completedSessions = sport.filter((point) => point.completed).length
  const nutritionAverage = nutrition.length ? Math.round(nutrition.reduce((total, point) => total + (point.meals_planned ? point.meals_completed / point.meals_planned * 100 : 0), 0) / nutrition.length) : 0
  return <section className="progress-dashboard"><div className="section-intro"><p className="eyebrow">Votre évolution</p><h2>Les progrès prennent forme.</h2><p className="muted">Un aperçu de vos séances, de votre régularité alimentaire et de vos scores de langues.</p></div>{loading && <p className="loading-state"><LoaderCircle size={17} className="spin" /> Chargement de vos données...</p>}<div className="progress-summary"><div><Activity size={18} /><span>Séances terminées</span><strong>{completedSessions}</strong></div><div><BarChart3 size={18} /><span>Impact nutrition</span><strong>{nutritionAverage}%</strong></div><div><TrendingUp size={18} /><span>Tests de langues</span><strong>{languages.length}</strong></div></div><div className="chart-grid"><ProgressChart title="Performances sportives" subtitle="Charge suivie dans le temps" data={sportChart} dataKey="charge" color="#1f4d43" unit=" kg" empty="Ajoutez vos séances pour voir votre évolution." /><ProgressChart title="Impact nutritionnel" subtitle="Repas réalisés / planifiés" data={nutritionChart} dataKey="repas" color="#d18d55" unit="%" empty="Votre suivi nutritionnel apparaîtra ici." /><ProgressChart title="Scores de langues" subtitle="Tests de positionnement" data={languageChart} dataKey="score" color="#527ba0" unit="/100" empty="Vos tests de positionnement apparaîtront ici." /></div><ProgressEntryManager userId={userId} onChanged={() => setRefreshVersion((current) => current + 1)} /></section>
}

function ProgressChart({ title, subtitle, data, dataKey, color, unit, empty }: { title: string; subtitle: string; data: { date: string; [key: string]: string | number }[]; dataKey: string; color: string; unit: string; empty: string }) { return <article className="chart-card"><div className="chart-title"><div><p className="card-kicker">{title}</p><span>{subtitle}</span></div></div>{data.length ? <ResponsiveContainer width="100%" height={190}><LineChart data={data} margin={{ top: 12, right: 10, left: -20, bottom: 0 }}><CartesianGrid stroke="#e3e4dc" strokeDasharray="3 3" vertical={false} /><XAxis dataKey="date" tick={{ fontSize: 11 }} tickLine={false} axisLine={false} /><YAxis tick={{ fontSize: 10 }} tickLine={false} axisLine={false} /><Tooltip formatter={(value) => [`${value}${unit}`, title]} /><Line type="monotone" dataKey={dataKey} stroke={color} strokeWidth={3} dot={{ r: 3, fill: color }} activeDot={{ r: 5 }} /></LineChart></ResponsiveContainer> : <div className="chart-empty"><TrendingUp size={20} /><span>{empty}</span></div>}</article> }
