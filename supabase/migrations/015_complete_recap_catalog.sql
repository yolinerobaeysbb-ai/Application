-- Keltia: complete recap catalogue from all native language courses.
-- This migration fills the recap with every course already registered for each language.

insert into public.language_recap_sections (language, section_type, title, content, data, position)
select
  language,
  'vocabulary',
  'Index complet des cours et notions',
  string_agg(course_number::text || '. ' || title || ' — ' || summary, E'\n' order by course_number),
  jsonb_build_object('course_count', count(*), 'source', 'language_courses'),
  2
from public.language_courses
where language in ('Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaï')
group by language
having not exists (
  select 1 from public.language_recap_sections existing
  where existing.language = public.language_courses.language
    and existing.section_type = 'vocabulary'
    and existing.title = 'Index complet des cours et notions'
);

update public.language_recap_sections recap
set content = catalog.content,
    data = catalog.data,
    updated_at = now()
from (
  select language, string_agg(course_number::text || '. ' || title || ' — ' || summary, E'\n' order by course_number) as content,
    jsonb_build_object('course_count', count(*), 'source', 'language_courses') as data
  from public.language_courses
  where language in ('Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaï')
  group by language
) catalog
where recap.language = catalog.language
  and recap.section_type = 'vocabulary'
  and recap.title = 'Index complet des cours et notions';

-- Add an explicit reference section for every language so the full manual is always discoverable.
insert into public.language_recap_sections (language, section_type, title, content, data, position)
select language, 'rule', 'Manuel complet et progression',
  'Cette langue possède un parcours complet de ' || course_count::text || ' cours. Ouvrez le manuel source depuis Plan & Plate ou Supports pour consulter les explications, exemples et exercices détaillés.',
  jsonb_build_object('course_count', course_count, 'source_document', source_document),
  2
from (
  select language, count(*) as course_count,
    case language
      when 'Allemand' then '/documents/Allemand.pdf'
      when 'Coréen' then '/documents/Coreen.pdf'
      when 'Espagnol' then '/documents/Espagnol.pdf'
      when 'Italien' then '/documents/Italien.pdf'
      when 'Japonais' then '/documents/Japonais.pdf'
      when 'Néerlandais' then '/documents/Neerlandais.pdf'
      when 'Thaï' then '/documents/Thailandais.pdf'
    end as source_document
  from public.language_courses
  group by language
) languages
where not exists (
  select 1 from public.language_recap_sections existing
  where existing.language = languages.language
    and existing.section_type = 'rule'
    and existing.title = 'Manuel complet et progression'
);
