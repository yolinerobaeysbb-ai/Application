-- Keltia: multilingual recap library and course resources.

create table if not exists public.language_recap_sections (
  id uuid primary key default gen_random_uuid(),
  language text not null,
  section_type text not null check (section_type in ('alphabet', 'vocabulary', 'rule', 'declension', 'conjugation')),
  title text not null,
  content text not null default '',
  data jsonb not null default '{}'::jsonb,
  position integer not null default 1,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists language_recap_language_type_idx
  on public.language_recap_sections (language, section_type, position);

create table if not exists public.language_course_resources (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references public.language_courses(id) on delete cascade,
  resource_type text not null check (resource_type in ('audio', 'video', 'document', 'link')),
  title text not null,
  url text not null,
  created_at timestamptz not null default now()
);

alter table public.language_recap_sections enable row level security;
alter table public.language_course_resources enable row level security;

drop policy if exists "Authenticated members can read language recaps" on public.language_recap_sections;
create policy "Authenticated members can read language recaps"
on public.language_recap_sections for select to authenticated using (true);
drop policy if exists "Admins can manage language recaps" on public.language_recap_sections;
create policy "Admins can manage language recaps"
on public.language_recap_sections for all to authenticated using (public.is_admin()) with check (public.is_admin());
drop policy if exists "Authenticated members can read course resources" on public.language_course_resources;
create policy "Authenticated members can read course resources"
on public.language_course_resources for select to authenticated using (true);
drop policy if exists "Admins can manage course resources" on public.language_course_resources;
create policy "Admins can manage course resources"
on public.language_course_resources for all to authenticated using (public.is_admin()) with check (public.is_admin());

insert into public.language_recap_sections (language, section_type, title, content, data, position)
select language, 'alphabet', 'Alphabet et système d’écriture', case language
  when 'Japonais' then 'Hiragana, katakana et kanji : utilisez le manuel complet pour la progression des graphies.'
  when 'Coréen' then 'Hangeul : consonnes, voyelles et règles de combinaison.'
  when 'Thaï' then 'Alphabet thaï, classes de consonnes et voyelles.'
  else 'Alphabet latin, prononciation et particularités orthographiques.'
end, '{}'::jsonb, 1
from unnest(array['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaï']) as language
where not exists (select 1 from public.language_recap_sections existing where existing.language = language and existing.section_type = 'alphabet');

insert into public.language_recap_sections (language, section_type, title, content, data, position)
select language, 'rule', 'Règles essentielles', 'Ce récapitulatif suit le manuel de la langue et sera enrichi cours par cours.', '{}'::jsonb, 1
from unnest(array['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaï']) as language
where not exists (select 1 from public.language_recap_sections existing where existing.language = language and existing.section_type = 'rule');

insert into public.language_recap_sections (language, section_type, title, content, data, position)
select language, 'vocabulary', 'Vocabulaire des 16 semaines', 'Retrouvez ici les mots rencontrés dans vos cours et vos séances.', '{}'::jsonb, 1
from unnest(array['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaï']) as language
where not exists (select 1 from public.language_recap_sections existing where existing.language = language and existing.section_type = 'vocabulary');

insert into public.language_recap_sections (language, section_type, title, content, data, position)
select language, type, label, 'Les tableaux détaillés seront ajoutés depuis les manuels correspondants.', '{}'::jsonb, 1
from unnest(array['Allemand', 'Coréen', 'Espagnol', 'Italien', 'Japonais', 'Néerlandais', 'Thaï']) as language
cross join (values ('declension', 'Tableaux de déclinaisons'), ('conjugation', 'Tableaux de conjugaison')) as recap(type, label)
where not exists (select 1 from public.language_recap_sections existing where existing.language = language and existing.section_type = type);

insert into public.language_course_resources (course_id, resource_type, title, url)
select course.id, 'document', 'Manuel complet de ' || course.language, case course.language
  when 'Allemand' then '/documents/Allemand.pdf'
  when 'Coréen' then '/documents/Coreen.pdf'
  when 'Espagnol' then '/documents/Espagnol.pdf'
  when 'Italien' then '/documents/Italien.pdf'
  when 'Japonais' then '/documents/Japonais.pdf'
  when 'Néerlandais' then '/documents/Neerlandais.pdf'
  when 'Thaï' then '/documents/Thailandais.pdf'
end
from public.language_courses course
where not exists (select 1 from public.language_course_resources resource where resource.course_id = course.id and resource.resource_type = 'document');
