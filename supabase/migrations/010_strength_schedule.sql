-- Keltia: strength schedule for the current 16-week cycle.
-- Each program is valid for four weeks.
-- The next two programs (Maintien I and Maintien II) are reserved for weeks 17-24.

insert into public.weekly_schedule_items (
  week_number,
  day_of_week,
  category,
  title,
  description,
  duration_minutes
)
select
  schedule.week_number,
  schedule.day_of_week,
  'sport',
  schedule.program || ' · ' || schedule.session_name,
  schedule.description,
  schedule.duration_minutes
from (
  select
    weeks.week_number,
    sessions.day_of_week,
    case
      when weeks.week_number between 1 and 4 then 'Hypertrophie'
      when weeks.week_number between 5 and 8 then 'Force'
      when weeks.week_number between 9 and 12 then 'Puissance'
      else 'Mobilité 1'
    end as program,
    sessions.session_name,
    sessions.duration_minutes,
    'Séance ' || sessions.session_name || ' du programme ' || case
      when weeks.week_number between 1 and 4 then 'Hypertrophie'
      when weeks.week_number between 5 and 8 then 'Force'
      when weeks.week_number between 9 and 12 then 'Puissance'
      else 'Mobilité 1'
    end || ' · semaine ' || weeks.week_number::text as description
  from generate_series(1, 16) as weeks(week_number)
  cross join (
    values
      (1, 'A', 90),
      (3, 'B', 105),
      (5, 'C', 120)
  ) as sessions(day_of_week, session_name, duration_minutes)
) as schedule
where not exists (
  select 1
  from public.weekly_schedule_items existing
  where existing.week_number = schedule.week_number
    and existing.day_of_week = schedule.day_of_week
    and existing.category = 'sport'
    and existing.title = schedule.program || ' · ' || schedule.session_name
);
