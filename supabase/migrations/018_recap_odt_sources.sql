-- Keltia: local recap documents supplied by the member.

update public.language_recap_sections
set data = data || jsonb_build_object(
  'local_documents', jsonb_build_array(
    jsonb_build_object('title', 'Alphabet.odt', 'url', '/documents/Alphabet.odt'),
    jsonb_build_object('title', 'Conjugaison.odt', 'url', '/documents/Conjugaison.odt')
  )
),
updated_at = now()
where section_type in ('alphabet', 'conjugation');
