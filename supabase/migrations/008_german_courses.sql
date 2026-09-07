-- Keltia: German B1-B2 course catalogue and links to the 16-week schedule.
-- The source manual contains 48 courses: three sessions per week.

alter table public.weekly_schedule_items
  add column if not exists language text;

insert into public.language_courses (language, title, level, course_number, week_number, summary, theory, examples)
select 'Allemand', course.title, 'B1-B2', course.number, ceil(course.number / 3.0)::integer,
  course.summary,
  'Cours issu du manuel Intensivkurs Deutsch. ' || course.summary,
  course.examples
from (values
  (1, 'Cours 1 · Syntaxe de base', 'Place du verbe en proposition principale et subordonnée.', 'Ich lerne heute Deutsch. · Ich lerne Deutsch, weil ich in Berlin wohne.'),
  (2, 'Cours 2 · Relations sociales et présentation avancée', 'Se présenter, écouter et enrichir son vocabulaire social.', 'Ich freue mich, Sie kennenzulernen. · Ich wohne seit drei Jahren in Berlin.'),
  (3, 'Cours 3 · Déclinaison de l’adjectif', 'Utiliser les terminaisons de l’adjectif selon le déterminant et le cas.', 'Das ist ein guter Plan. · Ich sehe den neuen Kurs.'),
  (4, 'Cours 4 · Perfekt et Präteritum', 'Raconter au passé avec les temps usuels de l’allemand.', 'Ich habe gestern gelernt. · Früher wohnte ich in Köln.'),
  (5, 'Cours 5 · Le logement et la colocation', 'Parler de son logement, de ses habitudes et d’une WG.', 'Ich suche ein helles Zimmer. · Wir teilen uns die Küche.'),
  (6, 'Cours 6 · Verbes à particules', 'Distinguer les particules séparables et inséparables.', 'Ich stehe um sieben Uhr auf. · Sie besucht ihre Freundin.'),
  (7, 'Cours 7 · Prépositions mixtes', 'Choisir l’Akkusativ ou le Dativ après les prépositions de lieu.', 'Das Buch liegt auf dem Tisch. · Ich lege das Buch auf den Tisch.'),
  (8, 'Cours 8 · Voyages et transports', 'S’orienter, demander son chemin et parler des transports.', 'Wie komme ich zum Bahnhof? · Der Zug fährt um acht Uhr ab.'),
  (9, 'Cours 9 · Espace et mouvement', 'Exprimer la position et le déplacement avec Wo et Wohin.', 'Ich bin in der Stadt. · Ich gehe in die Stadt.'),
  (10, 'Cours 10 · Connecteurs doubles', 'Relier deux idées avec des connecteurs structurés.', 'Sowohl Deutsch als auch Italienisch interessieren mich.'),
  (11, 'Cours 11 · Bilan B1+', 'Réviser la compréhension et la production du premier bloc.', 'Ich kann meine Meinung klar und strukturiert ausdrücken.'),
  (12, 'Cours 12 · Production écrite et orale', 'Construire une lettre et un pitch continus.', 'Ich möchte Ihnen kurz mein Projekt vorstellen.'),
  (13, 'Cours 13 · Souhait et regret', 'Employer le Konjunktiv II pour l’imaginaire et le regret.', 'Ich würde gern länger bleiben. · Ich hätte mehr Zeit gebraucht.'),
  (14, 'Cours 14 · Système éducatif allemand', 'Parler des études, de l’université et des parcours.', 'Ich studiere an einer deutschen Universität.'),
  (15, 'Cours 15 · Conseils et politesse', 'Formuler un conseil nuancé avec sollte et le Konjunktiv II.', 'Du solltest früher anfangen. · Könnten Sie mir helfen?'),
  (16, 'Cours 16 · Propositions relatives', 'Préciser un nom avec une proposition relative.', 'Das ist der Mann, der nebenan wohnt.'),
  (17, 'Cours 17 · Médias et numérique', 'Décrire ses usages numériques et analyser une information.', 'Ich habe den Artikel online gelesen.'),
  (18, 'Cours 18 · Portrait et profil', 'Décrire une personne, ses compétences et son profil.', 'Sie ist eine zuverlässige Kollegin.'),
  (19, 'Cours 19 · Exprimer le but', 'Choisir entre um...zu et damit pour exprimer l’intention.', 'Ich lerne, um die Prüfung zu bestehen.'),
  (20, 'Cours 20 · Travail et recrutement', 'Parler du recrutement, du stage et de l’expérience professionnelle.', 'Ich habe ein Praktikum in einem Unternehmen gemacht.'),
  (21, 'Cours 21 · Candidature et entretien', 'Rédiger une candidature et simuler un entretien.', 'Ich bewerbe mich um diese Stelle.'),
  (22, 'Cours 22 · Verbes à régime', 'Mémoriser les couples verbe-préposition.', 'Ich interessiere mich für Sprachen.'),
  (23, 'Cours 23 · Bilan du bloc 2', 'Consolider les structures et le vocabulaire du deuxième bloc.', 'Meiner Meinung nach ist diese Lösung sinnvoll.'),
  (24, 'Cours 24 · Débat argumenté', 'Structurer un essai et défendre une position à l’oral.', 'Einerseits ist das praktisch, andererseits gibt es Risiken.'),
  (25, 'Cours 25 · Voix passive', 'Former le passif au présent et au parfait.', 'Das Gebäude wird renoviert. · Die Daten sind gespeichert worden.'),
  (26, 'Cours 26 · Consommation et publicité', 'Analyser les habitudes de consommation et les messages publicitaires.', 'Die Werbung beeinflusst unsere Entscheidungen.'),
  (27, 'Cours 27 · Description de processus', 'Décrire un processus technique ou commercial avec précision.', 'Zuerst werden die Daten gesammelt.'),
  (28, 'Cours 28 · Génitif et prépositions', 'Utiliser le génitif avec wegen, trotz et les expressions formelles.', 'Wegen des Wetters bleiben wir zu Hause.'),
  (29, 'Cours 29 · Environnement et climat', 'Parler du climat et de la transition écologique.', 'Die Energiewende braucht langfristige Lösungen.'),
  (30, 'Cours 30 · Plaidoyer écologique', 'Argumenter sur un sujet écologique avec un style nominal.', 'Die Reduzierung des Verbrauchs ist notwendig.'),
  (31, 'Cours 31 · Futur I', 'Exprimer l’avenir, la supposition et la probabilité.', 'Morgen werde ich früher anfangen. · Er wird schon zu Hause sein.'),
  (32, 'Cours 32 · Culture et traditions germaniques', 'Présenter l’art, la culture et les traditions germanophones.', 'Dieses Fest hat eine lange Tradition.'),
  (33, 'Cours 33 · Récit prospectif', 'Décrire l’avenir de la société et formuler des hypothèses.', 'In zehn Jahren wird sich vieles verändern.'),
  (34, 'Cours 34 · Infinitives complexes', 'Utiliser ohne...zu et anstatt...zu dans un style B2.', 'Er ging, ohne sich zu verabschieden.'),
  (35, 'Cours 35 · Bilan du bloc 3', 'Analyser une actualité et synthétiser les structures B2.', 'Der Artikel zeigt, dass die Entwicklung komplex ist.'),
  (36, 'Cours 36 · Synthèse de documents', 'Croiser des documents et présenter un résumé oral.', 'Zusammenfassend lässt sich sagen, dass...'),
  (37, 'Cours 37 · Concession avancée', 'Nuancer une opposition avec obwohl, trotzdem et zwar...aber.', 'Obwohl es regnet, gehen wir spazieren.'),
  (38, 'Cours 38 · Santé et recherche', 'Parler de santé, de science et de recherche médicale.', 'Die Forschung hat neue Ergebnisse veröffentlicht.'),
  (39, 'Cours 39 · Graphiques et données', 'Décrire un graphique et présenter des données.', 'Die Grafik zeigt einen deutlichen Anstieg.'),
  (40, 'Cours 40 · Konjunktiv I', 'Rapporter un discours avec neutralité journalistique.', 'Der Minister sagt, die Lage sei stabil.'),
  (41, 'Cours 41 · Politique et citoyenneté', 'Discuter de l’Union européenne et de la citoyenneté.', 'Die europäische Zusammenarbeit ist wichtig.'),
  (42, 'Cours 42 · Compte-rendu journalistique', 'Rédiger et présenter un compte-rendu neutre.', 'Laut dem Bericht habe sich die Situation verbessert.'),
  (43, 'Cours 43 · Adjectifs substantivés', 'Nominaliser les adjectifs en respectant les déclinaisons.', 'Die Reisenden warten am Bahnsteig.'),
  (44, 'Cours 44 · Variations régionales', 'Comparer les usages d’Allemagne, d’Autriche et de Suisse.', 'In der Schweiz sagt man Velo statt Fahrrad.'),
  (45, 'Cours 45 · Monologue argumentatif', 'Soutenir une argumentation complexe sur un sujet de société.', 'Ich vertrete die Ansicht, dass Bildung entscheidend ist.'),
  (46, 'Cours 46 · Syntaxe avancée', 'Réviser les structures complexes et les pièges du niveau B2.', 'Je komplexer der Satz, desto wichtiger ist die Struktur.'),
  (47, 'Cours 47 · Bilan final écrit', 'Évaluer la compréhension écrite et la synthèse B2.', 'Der Text verdeutlicht die wichtigsten Zusammenhänge.'),
  (48, 'Cours 48 · Bilan final oral', 'Réaliser une production orale continue et conclure le manuel.', 'Abschließend möchte ich die wichtigsten Punkte zusammenfassen.')
) as course(number, title, summary, examples)
on conflict (language, course_number) do update set
  title = excluded.title,
  level = excluded.level,
  week_number = excluded.week_number,
  summary = excluded.summary,
  theory = excluded.theory,
  examples = excluded.examples,
  updated_at = now();

update public.weekly_schedule_items schedule
set language = 'Allemand',
    title = courses.title,
    description = courses.summary,
    duration_minutes = case ((courses.course_number - 1) % 3)
      when 0 then 30
      when 1 then 45
      else 60
    end
from public.language_courses courses
where schedule.category = 'language'
  and schedule.title = 'Allemand'
  and courses.language = 'Allemand'
  and courses.week_number = schedule.week_number
  and courses.course_number = ((schedule.week_number - 1) * 3) + case schedule.day_of_week
    when 2 then 1
    when 4 then 2
    when 6 then 3
  end;
