-- Keltia: link every native language course to its complete source manual.

alter table public.language_courses
  add column if not exists source_document text;

update public.language_courses
set source_document = case language
  when 'Allemand' then '/documents/Allemand.pdf'
  when 'Espagnol' then '/documents/Espagnol.pdf'
  when 'Italien' then '/documents/Italien.pdf'
  when 'Japonais' then '/documents/Japonais.pdf'
  when 'Coréen' then '/documents/Coreen.pdf'
  when 'Néerlandais' then '/documents/Neerlandais.pdf'
  when 'Thaï' then '/documents/Thailandais.pdf'
  else source_document
end
where language in ('Allemand', 'Espagnol', 'Italien', 'Japonais', 'Coréen', 'Néerlandais', 'Thaï');
