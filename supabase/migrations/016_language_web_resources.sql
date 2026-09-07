-- Keltia: external learning resources attached to the first course of each language.
-- Links point to public learning platforms; Keltia stores links, not copied third-party content.

insert into public.language_course_resources (course_id, resource_type, title, url)
select course.id, resource.resource_type, resource.title, resource.url
from (
  values
    ('Allemand', 'audio', 'DW Deutsch lernen · Deutschtrainer', 'https://learngerman.dw.com/en/deutschtrainer/c-56705009'),
    ('Allemand', 'video', 'DW Deutsch lernen · Nicos Weg', 'https://learngerman.dw.com/en/nicos-weg/c-36519789'),
    ('Espagnol', 'document', 'Instituto Cervantes · Centro Virtual', 'https://cvc.cervantes.es/ensenanza/'),
    ('Italien', 'video', 'Rai Scuola · contenus éducatifs', 'https://www.raiscuola.rai.it/'),
    ('Japonais', 'video', 'Japan Foundation · Irodori', 'https://www.irodori.jpf.go.jp/'),
    ('Japonais', 'document', 'Irodori · supports PDF', 'https://www.irodori.jpf.go.jp/resources.html'),
    ('Coréen', 'document', 'Institut national du coréen · ressources', 'https://www.iksi.or.kr/'),
    ('Néerlandais', 'document', 'Naar Nederland · kit d’auto-apprentissage', 'https://www.naarnederland.nl/zelfstudiepakket'),
    ('Thaï', 'link', 'Thai Language · ressources publiques', 'https://www.thai-language.com/')
) as resource(language, resource_type, title, url)
join lateral (
  select id from public.language_courses
  where language = resource.language
  order by course_number
  limit 1
) course on true
where not exists (
  select 1 from public.language_course_resources existing
  where existing.course_id = course.id and existing.url = resource.url
);
