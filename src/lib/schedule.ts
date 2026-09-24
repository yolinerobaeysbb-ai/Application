export type Recurrence = 'once' | 'daily' | 'weekly' | 'biweekly'
export type ScheduleRow = {
  id: string
  category: 'language' | 'sport' | 'food' | 'fixed'
  title: string
  description: string
  day_of_week: number
  week_number: number
  start_time: string | null
  end_time: string | null
  duration_minutes: number | null
  recurrence: Recurrence
}
export type Occurrence = ScheduleRow & { date: Date }

/** Maps a program week/day pair to a concrete calendar date. */
export function weekDayToDate(programStart: Date, weekNumber: number, dayOfWeek: number): Date {
  const date = new Date(programStart)
  date.setDate(date.getDate() + (weekNumber - 1) * 7 + (dayOfWeek - 1))
  date.setHours(0, 0, 0, 0)
  return date
}

/** Expands a schedule row into all its concrete calendar occurrences up to totalWeeks. */
export function expandOccurrences(item: ScheduleRow, programStart: Date, totalWeeks = 16): Occurrence[] {
  const occurrences: Occurrence[] = []
  if (item.recurrence === 'once') {
    occurrences.push({ ...item, date: weekDayToDate(programStart, item.week_number, item.day_of_week) })
  } else if (item.recurrence === 'weekly') {
    for (let week = item.week_number; week <= totalWeeks; week += 1) occurrences.push({ ...item, date: weekDayToDate(programStart, week, item.day_of_week) })
  } else if (item.recurrence === 'biweekly') {
    for (let week = item.week_number; week <= totalWeeks; week += 2) occurrences.push({ ...item, date: weekDayToDate(programStart, week, item.day_of_week) })
  } else if (item.recurrence === 'daily') {
    for (let week = item.week_number; week <= totalWeeks; week += 1) for (let day = 1; day <= 7; day += 1) occurrences.push({ ...item, date: weekDayToDate(programStart, week, day) })
  }
  return occurrences
}

export function sameDay(a: Date, b: Date): boolean {
  return a.getFullYear() === b.getFullYear() && a.getMonth() === b.getMonth() && a.getDate() === b.getDate()
}

export function timeToMinutes(time: string | null): number | null {
  if (!time) return null
  const [hours, minutes] = time.split(':').map(Number)
  return hours * 60 + minutes
}

/** Finds free windows within a daily availability window given the occurrences already booked. */
export function findFreeSlots(occurrences: Occurrence[], date: Date, windowStart = 7 * 60, windowEnd = 22 * 60): { start: number; end: number }[] {
  const busy = occurrences
    .filter((occurrence) => sameDay(occurrence.date, date) && occurrence.start_time)
    .map((occurrence) => {
      const start = timeToMinutes(occurrence.start_time) ?? windowStart
      const end = occurrence.end_time ? (timeToMinutes(occurrence.end_time) ?? start) : start + (occurrence.duration_minutes ?? 60)
      return { start, end }
    })
    .sort((a, b) => a.start - b.start)
  const free: { start: number; end: number }[] = []
  let cursor = windowStart
  for (const slot of busy) {
    if (slot.start > cursor) free.push({ start: cursor, end: Math.min(slot.start, windowEnd) })
    cursor = Math.max(cursor, slot.end)
  }
  if (cursor < windowEnd) free.push({ start: cursor, end: windowEnd })
  return free.filter((slot) => slot.end - slot.start >= 15)
}

export function formatMinutes(minutes: number): string {
  const hours = Math.floor(minutes / 60).toString().padStart(2, '0')
  const remainder = (minutes % 60).toString().padStart(2, '0')
  return `${hours}:${remainder}`
}
