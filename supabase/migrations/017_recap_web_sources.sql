-- Keltia: verified web sources for the multilingual recap.
-- Links are stored as references; third-party content is not copied into Keltia.

update public.language_recap_sections
set data = data || jsonb_build_object('web_resources', case language
  when 'Allemand' then jsonb_build_array(
    jsonb_build_object('type', 'audio', 'title', 'DW Deutschtrainer', 'url', 'https://learngerman.dw.com/en/deutschtrainer/c-56705009'),
    jsonb_build_object('type', 'video', 'title', 'DW Nicos Weg', 'url', 'https://learngerman.dw.com/en/nicos-weg/c-36519789')
  )
  when 'Espagnol' then jsonb_build_array(jsonb_build_object('type', 'document', 'title', 'Instituto Cervantes · ressources ELE', 'url', 'https://cvc.cervantes.es/ensenanza/'))
  when 'Italien' then jsonb_build_array(jsonb_build_object('type', 'video', 'title', 'Rai Scuola', 'url', 'https://www.raiscuola.rai.it/'))
  when 'Japonais' then jsonb_build_array(
    jsonb_build_object('type', 'video', 'title', 'Irodori · vidéo de présentation', 'url', 'https://youtu.be/q4HUrMsh2uY'),
    jsonb_build_object('type', 'document', 'title', 'Irodori · supports pédagogiques', 'url', 'https://www.irodori.jpf.go.jp/resources.html')
  )
  when 'Coréen' then jsonb_build_array(jsonb_build_object('type', 'link', 'title', 'Institut King Sejong', 'url', 'https://www.iksi.or.kr/'))
  when 'Néerlandais' then jsonb_build_array(
    jsonb_build_object('type', 'document', 'title', 'Naar Nederland · auto-apprentissage', 'url', 'https://www.naarnederland.nl/zelfstudiepakket'),
    jsonb_build_object('type', 'link', 'title', 'Naar Nederland · e-learning', 'url', 'https://elearning.naarnederland.nl/examen/registration/login.spring')
  )
  when 'Thaï' then jsonb_build_array(jsonb_build_object('type', 'link', 'title', 'Thai Language', 'url', 'https://www.thai-language.com/'))
  else '[]'::jsonb
end)
where section_type in ('alphabet', 'vocabulary', 'rule', 'declension', 'conjugation');
