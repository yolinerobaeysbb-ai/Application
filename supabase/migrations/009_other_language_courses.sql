-- Keltia: native course entries for Spanish, Italian, Thai, Japanese, Korean and Dutch.
-- One course is linked to every language session in the existing 16-week schedule.
-- The schedule days and durations are preserved exactly as defined in migration 007.

with scheduled as (
  select
    id,
    title as language_name,
    week_number,
    day_of_week,
    duration_minutes,
    row_number() over (partition by title order by week_number, day_of_week, id) as course_number
  from public.weekly_schedule_items
  where category = 'language'
    and language is null
    and title in ('Espagnol', 'Italien', 'Thaï', 'Japonais', 'Coréen', 'Néerlandais')
), inserted_courses as (
  insert into public.language_courses (
    language,
    title,
    level,
    course_number,
    week_number,
    summary,
    theory,
    examples
  )
  select
    language_name,
    'Cours ' || course_number::text || ' · ' || language_name || ' · semaine ' || week_number::text,
    case language_name
      when 'Espagnol' then 'Débutant à A2/B1'
      when 'Italien' then 'Débutant à A2/B1'
      when 'Thaï' then 'Lecture, tons et fluidité'
      when 'Japonais' then 'Lecture, syntaxe et expression'
      when 'Coréen' then 'Lecture et syntaxe SOV'
      else 'Néerlandais professionnel'
    end,
    course_number,
    week_number,
    'Séance de ' || language_name || ' du ' || case day_of_week
      when 1 then 'lundi'
      when 2 then 'mardi'
      when 3 then 'mercredi'
      when 4 then 'jeudi'
      when 5 then 'vendredi'
      when 6 then 'samedi'
      else 'dimanche'
    end || '.',
    'Cours natif construit à partir du support ' || language_name || '. La séance suit la progression du manuel et travaille la compréhension, la production et la mémorisation.',
    'Relisez la leçon du support, puis produisez trois phrases en ' || language_name || ' liées au thème de la séance.'
  from scheduled
  on conflict (language, course_number) do update set
    title = excluded.title,
    level = excluded.level,
    week_number = excluded.week_number,
    summary = excluded.summary,
    theory = excluded.theory,
    examples = excluded.examples,
    updated_at = now()
  returning language, course_number, title, summary
)
select count(*) from inserted_courses;

with scheduled as (
  select
    id,
    title as language_name,
    week_number,
    day_of_week,
    row_number() over (partition by title order by week_number, day_of_week, id) as course_number
  from public.weekly_schedule_items
  where category = 'language'
    and language is null
    and title in ('Espagnol', 'Italien', 'Thaï', 'Japonais', 'Coréen', 'Néerlandais')
)
update public.weekly_schedule_items schedule
set language = scheduled.language_name,
    title = courses.title,
    description = courses.summary
from scheduled
join public.language_courses courses
  on courses.language = scheduled.language_name
 and courses.course_number = scheduled.course_number
where schedule.id = scheduled.id;
