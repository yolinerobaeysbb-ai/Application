import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = { 'Access-Control-Allow-Origin': '*', 'Access-Control-Allow-Headers': 'content-type' }

type Row = { id: string; category: string; title: string; description: string; day_of_week: number; week_number: number; start_time: string | null; end_time: string | null; duration_minutes: number | null; recurrence: string }

function weekDayToDate(start: Date, week: number, day: number): Date {
  const date = new Date(start)
  date.setDate(date.getDate() + (week - 1) * 7 + (day - 1))
  return date
}

function expand(row: Row, start: Date, totalWeeks = 16): Date[] {
  const dates: Date[] = []
  if (row.recurrence === 'once') dates.push(weekDayToDate(start, row.week_number, row.day_of_week))
  else if (row.recurrence === 'weekly') for (let week = row.week_number; week <= totalWeeks; week += 1) dates.push(weekDayToDate(start, week, row.day_of_week))
  else if (row.recurrence === 'biweekly') for (let week = row.week_number; week <= totalWeeks; week += 2) dates.push(weekDayToDate(start, week, row.day_of_week))
  else if (row.recurrence === 'daily') for (let week = row.week_number; week <= totalWeeks; week += 1) for (let day = 1; day <= 7; day += 1) dates.push(weekDayToDate(start, week, day))
  return dates
}

Deno.serve(async (request) => {
  if (request.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders })
  const url = new URL(request.url)
  const token = url.searchParams.get('token')
  if (!token) return new Response('Missing token', { status: 400, headers: corsHeaders })

  const supabaseUrl = Deno.env.get('SUPABASE_URL')!
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  const client = createClient(supabaseUrl, serviceRoleKey)

  const { data: tokenRow } = await client.from('calendar_feed_tokens').select('user_id').eq('token', token).maybeSingle()
  if (!tokenRow) return new Response('Invalid token', { status: 404, headers: corsHeaders })

  const { data: settingRow } = await client.from('app_settings').select('setting_value').eq('setting_key', 'program_start_date').maybeSingle()
  const start = settingRow?.setting_value ? new Date(settingRow.setting_value) : new Date()

  const { data: rows } = await client.from('weekly_schedule_items').select('id, category, title, description, day_of_week, week_number, start_time, end_time, duration_minutes, recurrence').or(`user_id.is.null,user_id.eq.${tokenRow.user_id}`)

  const events = ((rows ?? []) as Row[]).flatMap((row) => expand(row, start).map((date) => {
    const [startHours, startMinutes] = (row.start_time ?? '09:00').split(':').map(Number)
    const startDateTime = new Date(date)
    startDateTime.setHours(startHours, startMinutes, 0, 0)
    const endDateTime = new Date(startDateTime)
    if (row.end_time) { const [endHours, endMinutes] = row.end_time.split(':').map(Number); endDateTime.setHours(endHours, endMinutes, 0, 0) }
    else endDateTime.setMinutes(endDateTime.getMinutes() + (row.duration_minutes ?? 60))
    const toStamp = (value: Date) => value.toISOString().replace(/[-:]/g, '').split('.')[0] + 'Z'
    return { startStamp: toStamp(startDateTime), endStamp: toStamp(endDateTime), row }
  }))

  const lines = ['BEGIN:VCALENDAR', 'VERSION:2.0', 'PRODID:-//Keltia//Planning//FR', 'CALSCALE:GREGORIAN']
  for (const event of events) {
    lines.push('BEGIN:VEVENT', `UID:${event.row.id}-${event.startStamp}@keltia`, `DTSTART:${event.startStamp}`, `DTEND:${event.endStamp}`, `SUMMARY:${event.row.title.replace(/\n/g, ' ')}`, `DESCRIPTION:${(event.row.description ?? '').replace(/\n/g, ' ')}`, 'END:VEVENT')
  }
  lines.push('END:VCALENDAR')

  return new Response(lines.join('\r\n'), { headers: { ...corsHeaders, 'Content-Type': 'text/calendar; charset=utf-8' } })
})
