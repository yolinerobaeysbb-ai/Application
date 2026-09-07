-- Keltia: initial language schedule for week 1.
-- Durations are stored in minutes: 30, 45, 60, 90 and 105.

insert into public.weekly_schedule_items (
  week_number,
  day_of_week,
  category,
  title,
  description,
  duration_minutes
)
select
  1,
  schedule.day_of_week,
  'language',
  schedule.title,
  'Session de langue',
  schedule.duration_minutes
from (
  values
    (1, 'Espagnol', 30),
    (1, 'Italien', 30),
    (1, 'Thaï', 30),
    (2, 'Allemand', 30),
    (2, 'Japonais', 60),
    (2, 'Coréen', 30),
    (3, 'Japonais', 60),
    (3, 'Thaï', 60),
    (4, 'Espagnol', 30),
    (4, 'Allemand', 45),
    (4, 'Coréen', 45),
    (5, 'Japonais', 45),
    (5, 'Italien', 30),
    (5, 'Néerlandais', 45),
    (6, 'Thaï', 60),
    (6, 'Allemand', 60),
    (6, 'Coréen', 60),
    (7, 'Japonais', 105),
    (7, 'Thaï', 90),
    (7, 'Néerlandais', 105)
) as schedule(day_of_week, title, duration_minutes)
where not exists (
  select 1
  from public.weekly_schedule_items existing
  where existing.week_number = 1
    and existing.day_of_week = schedule.day_of_week
    and existing.category = 'language'
    and existing.title = schedule.title
);
