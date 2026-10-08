-- Keltia : contenu réel des 48 cours de allemand (source : manuel Allemand.pdf).
-- Cible uniquement la bibliothèque Plan & Plate (language_courses / language_exercises).
-- Ne touche PAS au planning (weekly_schedule_items).
-- Relançable sans risque : les cours sont mis à jour par (language, course_number),
-- les exercices du manuel sont recréés, les exercices ajoutés par les membres sont conservés.

begin;

-- 1) Cours : titre, objectif, théorie et exemples réels ; plus de « Semaine X » (hors planning)
insert into public.language_courses (language, course_number, title, summary, theory, examples, week_number)
values
  ('Allemand', 1, $kt$Cours 1 · Syntaxe de base (Principale et Subordonnée)$kt$, $kt$La place du verbe conjugué$kt$, $kt$Grammaire & Syntaxe : La place du verbe conjugué
La position du verbe conjugué est la clé de voûte de la syntaxe allemande.
— Proposition principale : Le verbe conjugué occupe toujours la deuxième position. Le sujet peut se placer en première position ou être déplacé après le verbe si un complément (de temps ou de lieu) commence la phrase (inversion sujet-verbe).
Sujet en 1 : Ich lerne heute Deutsch.
Complément en 1 : Heute lerne ich Deutsch.
— Proposition subordonnée (weil, dass) : Le verbe conjugué est rejeté à la toute fin de la proposition.
Weil (Parce que) : Ich lerne Deutsch, weil ich in Berlin wohne.
Dass (Que) : Ich weiß, dass du Deutsch lernst.

Expression Orale & Phonétique : L’accentuation
En allemand, l’accentuation de la phrase repose sur les mots porteurs de sens (les radicaux des verbes et des noms). Entraînez-vous à prononcer les phrases ci-dessus à haute voix. Marquez une micro-pause avant les conjonctions weil ou dass, puis baissez l’intonation sur le verbe final.$kt$, $kt$$kt$, null),
  ('Allemand', 2, $kt$Cours 2 · Relations sociales et Présentation avancée$kt$, $kt$Script de laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script de laboratoire d’écoute
Dialogue professionnel lors d’un séminaire d’affaires à Munich.

Banque de Vocabulaire Enrichi
— Die Vorstellung : La présentation
— Beruflich : Professionnellement / Sur le plan professionnel
— Der Projektleiter / Die Projektleiterin : Le chef de projet
— Kennenlernen : Faire la connaissance de
— Ganz meinerseits : Tout le plaisir est pour moi / De même
— Seit (+ Datif) : Depuis. Note : On utilise le présent en allemand (Ich wohne seit zwei Jahren hier).
— Deshalb : C’est pourquoi. Note : Engendre une inversion immédiate (deshalb bin ich hier).$kt$, $kt$Thomas : Guten Tag ! Mein Name ist Thomas Meyer. Es freut mich, Sie kennenzulernen. · Sarah : Guten Tag, Herr Meyer ! Ich heiße Sarah König. Ganz meinerseits. Sagen Sie, woher kommen Sie eigentlich ? · Thomas : Ich komme aus Hamburg, aber ich wohne seit zwei Jahren in München, weil ich hier als Projektleiter bei einer Tech-Firma arbeite. Und Sie ? Was machen Sie beruflich ? · Sarah : Ich bin Marketingexpertin. Ich habe früher in Paris gelebt, aber jetzt arbeite ich hier in Bayern. Ich interessiere mich sehr für neue Technologien, deshalb bin ich heute auf diesem Seminar. · Thomas : Das ist ja interessant ! Wissen Sie, ob das Seminar pünktlich beginnt ? · Sarah : Ich glaube, dass es in fünf Minuten anfängt. Gehen wir zusammen in den Saal ?$kt$, null),
  ('Allemand', 3, $kt$Cours 3 · Le laboratoire des déclinaisons de l’adjectif$kt$, $kt$Les déclinaisons de l’adjectif épithète$kt$, $kt$Grammaire : Les déclinaisons de l’adjectif épithète
L’adjectif placé directement devant un nom prend une terminaison spécifique selon le déterminant qui le précède.

Déclinaison Faible vs Déclinaison Mixte A. Déclinaison faible (Après un article
défini : der, die, das) : L’article portant déjà la marque du cas, l’adjectif prend la terminaison -e (au Nominatif singulier) ou -en (aux cas indirects et au pluriel).
Nominativ Masc. : Der neue Kollege ist nett.
Akkusativ Masc. : Ich kenne den neuen Kollegen.

B. Déclinaison mixte (Après un article indéfini, possessif ou kein) : L’adjectif doit porter la marque du genre si l’article est neutre ou incomplet au Nominatif.
Nominativ Masc. : Das ist ein neuer Kollege.
Nominativ Neutre : Das ist ein schönes Auto.
Akkusativ Fem. : Er sucht eine gute Stelle.$kt$, $kt$$kt$, null),
  ('Allemand', 4, $kt$Cours 4 · Les temps du passé (Perfekt et Präteritum)$kt$, $kt$Le système du passé en allemand$kt$, $kt$Grammaire : Le système du passé en allemand
L’allemand utilise deux temps principaux pour exprimer le passé, selon le canal de communication utilisé.
— Le Parfait (Perfekt) : C’est le temps de l’oral et de la communication quotidienne. Il se construit avec l’auxiliaire haben ou sein au présent (en position 2) et le participe II (Partizip II ) rejeté à la toute fin de la phrase.
Auxiliaire sein : Utilisé pour les verbes de déplacement (gehen, fahren) ou de changement d’état (aufstehen).
Exemple 1 : Ich habe gestern ein Buch gelesen.
Exemple 2 : Er ist nach Berlin gefahren.
— Le Prétérit (Präteritum) : C’est le temps de l’écrit (récits, presse). Cependant, pour les auxiliaires (sein, haben) et les verbes modaux (können, müssen...), on utilise presque toujours le prétérit, même à l’oral.
Sein au prétérit : ich war, du warst, er war, wir waren, ihr wart, sie waren.
Haben au prétérit : ich hatte, du hattest, er hatte, wir hatten, ihr hattet, sie hatten.

Expression Orale & Phonétique : Le rythme des verbes forts
Les verbes irréguliers (forts) changent de voyelle au participe II et se terminent en -en (ex : sehen → gesehen, sprechen → gesprochen). Le préfixe ge- est totalement atone (non accentué). Entraînez-vous à prononcer ces mots à voix haute en accentuant fortement la syllabe radicale : ge-spro-chen, ge-fah-ren.$kt$, $kt$Exemple 1 : Ich habe gestern ein Buch gelesen. · Exemple 2 : Er ist nach Berlin gefahren.$kt$, null),
  ('Allemand', 5, $kt$Cours 5 · Le logement et la vie en colocation (WG)$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Conversation téléphonique pour une recherche d’appartement entre Lukas et Mia.

Banque de Vocabulaire Enrichi
— Die WG (Wohngemeinschaft) : La colocation
— Das WG-Zimmer : La chambre en colocation
— Der Mitbewohner / Die Mitbewohnerin : Le colocataire
— Die Besichtigung : La visite (d’un bien immobilier)
— Die Kaltmiete : Le loyer hors charges
— Die Warmmiete : Le loyer charges comprises
— Die Nebenkosten : Les charges (eau, électricité, chauffage)
— Ordentlich : Ordonné, propre$kt$, $kt$Lukas : Hallo ! Mein Name ist Lukas. Ich rufe wegen des WG-Zimmers an. Ist es noch frei ? · Mia : Hallo Lukas ! Ja, das Zimmer ist noch zu haben. Es ist etwa 18 Quadratmeter groß, sehr hell und hat ein großes Fenster. · Lukas : Das klingt super ! Wie viele Personen wohnen insgesamt in der Wohngemeinschaft ? · Mia : Wir sind momentan zu zweit, ich und ein Informatikstudent. Wir suchen einen netten und ordentlichen Mitbewohner. Die Warmmiete beträgt 450 Euro, inklusive Internet und Nebenkosten. · Lukas : Der Preis ist fair. Wie sieht es mit der Küche aus ? Gibt es eine Spülmaschine ? · Mia : Ja, die Küche ist voll ausgestattet. Wann hättest du Zeit für eine Besichtigung ? · Lukas : Ich könnte morgen Abend vorbeikommen, wenn es dir passt.$kt$, null),
  ('Allemand', 6, $kt$Cours 6 · Les verbes à particules séparables et inséparables$kt$, $kt$Séparables vs Inséparables$kt$, $kt$Grammaire : Séparables vs Inséparables
L’allemand possède des verbes composés dont le comportement dépend de leur préfixe.

Fonctionnement des particules A. Les verbes à particule séparable : Le préfixe (auf-, an-, mit-, aus-, ein-...) se détache du verbe conjugué au présent et se place à la toute fin de la proposition principale. Au parfait, le préfixe -ge- s’intercale au milieu.
Présent : Ich stehe jeden Morgen um 7 Uhr auf (aufstehen).
Parfait : Ich bin aufgestanden.

B. Les verbes à particule inséparable : Les préfixes (be-, ver-, er-, ge-, zer-, ent-...) ne se détachent jamais. Ils ne prennent pas de préfixe -ge- au parfait.
Présent : Ich verstehe das Problem (verstehen).
Parfait : Ich habe verstanden (et non geverstanden).$kt$, $kt$$kt$, null),
  ('Allemand', 7, $kt$Cours 7 · Les prépositions mixtes (Wechselpräpositionen)$kt$, $kt$Le dilemme Akkusativ vs Dativ$kt$, $kt$Grammaire : Le dilemme Akkusativ vs Dativ
L’allemand possède 9 prépositions mixtes (an, auf, hinter, in, neben, über, unter, vor, zwischen) dont le cas dépend du type de procès.

Mouvement vs Position statique A. Mouvement avec changement de lieu (Des-
tination / Wohin ?) → ACCUSATIV : L’action décrit un déplacement d’un point
originel vers une nouvelle destination.
Ejemplo : Ich stelle das Buch auf den Tisch (der Tisch au masculin accusatif).

B. Position statique (Localisation / Wo ?) → DATIV : L’action s’accomplit au
sein d’un espace fixe, sans transfert géographique.
Ejemplo : Das Buch liegt auf dem Tisch (der Tisch au masculin datif).

Expression Orale & Phonétique : Le son -ch
En allemand, le groupe consonantique -ch possède deux réalisations phonétiques distinctes :
— Der ach-Laut : Après a, o, u, il se prononce de manière rugueuse au fond de la gorge, comme la jota espagnole (das Buch, das Loch).
— Der ich-Laut : Après e, i, ä, ö, ü et les consonnes, il se prononce de façon très douce vers l’avant du palais, comme un sifflement de chat (ich, sprechen, die Küche, ou le pluriel die Bücher).
Entraînez-vous à prononcer le contraste à voix haute : das Buch (→ fond de la gorge) vs die Bücher (→ avant du palais).$kt$, $kt$$kt$, null),
  ('Allemand', 8, $kt$Cours 8 · Les voyages, l’orientation et les transports$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Annonces sonores de la Deutsche Bahn en gare centrale de Francfort.

Banque de Vocabulaire Enrichi
— Das Gleis : La voie (de train)
— Der Fahrgast / Die Fahrgäste : Le passager / les passagers
— Die Störung : La panne, la perturbation
— Die Verspätung : Le retard
— Der Gleiswechsel : Le changement de voie
— Einsteigen / Aussteigen / Umsteigen : Monter / Descendre / Changer de train
(Particules séparables)
— Voraussichtlich : Prévisible / Probablement$kt$, $kt$Annonce 1 : Achtung am Gleis 4 ! Der Intercity-Express nach Berlin Ostbahnhof, über Kassel und Hannover, fährt jetzt ein. Bitte steigen Sie ein und halten Sie Abstand von der Bahnsteigkante. · Annonce 2 : Sehr geehrte Fahrgäste, wegen einer technischen Störung an einem Signal hat der Regionalexpress nach Stuttgart heute voraussichtlich 20 Minuten Verspätung. Wir bitten um Entschuldigung für diese Unannehmlichkeit. · Annonce 3 : Gleiswechsel ! Der Zug nach Hamburg-Altona fährt heute nicht von Gleis 9, sondern von Gleis 11 ein. Ich wiederhole : Zug nach Hamburg von Gleis 11.$kt$, null),
  ('Allemand', 9, $kt$Cours 9 · Expression de l’espace et du mouvement (Wohin vs Wo)$kt$, $kt$Les paires de verbes de position et mouvement$kt$, $kt$Grammaire : Les paires de verbes de position et mouvement
L’allemand distingue les verbes d’action transitive (faibles, réguliers + Accusatif) et les verbes d’état résultant (forts, irréguliers + Datif).

Action / Mouvement (+ Accusatif)           Position résultante (+ Datif) stellen (placer verticalement)             stehen (être debout/placé)
legen (poser à plat)                       liegen (être couché/posé)
setzen (asseoir / se mettre)               sitzen (être assis)
hängen (suspendre)                         hängen (être suspendu)

Ejemplo : Ich lege das Buch auf das Sofa. → Das Buch liegt auf dem Sofa.$kt$, $kt$$kt$, null),
  ('Allemand', 10, $kt$Cours 10 · Les connecteurs doubles (Doppelkonnektoren)$kt$, $kt$Associer les idées avec élégance$kt$, $kt$Grammaire : Associer les idées avec élégance
Les connecteurs doubles permettent d’unir des mots, des groupes de mots ou des propositions indépendantes de manière binaire. Ils n’entraînent pas le rejet du verbe à la fin puisqu’ils introduisent des propositions principales.

Les trois structures fondamentales A. Sowohl ... als auch (Tant ... que / non seulement ... mais aussi) : Addition positive.
Ejemplo : Ich spreche sowohl Deutsch als auch Englisch.

B. Entweder ... oder (Soit ... soit) : Alternative exclusive.
Ejemplo : Wir gehen entweder ins Kino oder wir bleiben zu Hause.

C. Weder ... noch (Ni ... ni) : Double négation.
Ejemplo : Er hat weder Zeit noch Geld. Note : “noch” peut provoquer une inversion verbe-sujet s’il commence une proposition.

Expression Orale & Phonétique : Le rythme binaire
Ces structures imposent une courbe mélodique rigoureuse à l’oral. La voix doit monter légèrement sur le premier terme (sowohl, entweder, weder), puis redescendre de manière marquée sur le second (als auch, oder, noch). Entraînez-vous à prononcer à voix haute : Er ist entweder im Büro ↗ oder er arbeitet zu Hause ↘.$kt$, $kt$$kt$, null),
  ('Allemand', 11, $kt$Cours 11 · Grand Bilan de réactivation B1+$kt$, $kt$Lecture d’un profil professionnel$kt$, $kt$Compréhension Écrite : Lecture d’un profil professionnel

Compréhension Orale : Script du laboratoire d’écoute
Message vocal laissé sur le répondeur de Markus par sa cliente, Frau Weber.
Hallo Herr Schmidt, hier spricht Sabine Weber von der Firma Logix. Ich rufe an, weil wir ein kleines Problem mit unserer neuen Webseite haben. Gestern ist ein technischer Fehler aufgetre-
ten : Die Kunden können sich nicht einloggen. Da Sie unser Projektleiter sind, müssen Sie diesen Fehler voraussichtlich heute beenden. Bitte rufen Sie mich auf meinem Mobiltelefon an, sobald Sie im Büro ankommen. Vielen Dank und auf Wiederhören !$kt$, $kt$Mein Name ist Markus Schmidt. Ich arbeite seit zwei Jahren als selbstständiger Webdesigner in Hamburg. Ich liebe meinen Beruf, weil ich jeden Tag kreative Projekte realisiere. Früher habe ich in einer großen Agentur gearbeitet, aber dort hatte ich weder Freiheit noch Freizeit. Letzte Woche bin ich in ein neues, helles Büro im Stadtzentrum eingezogen. Mein neuer Arbeitsplatz liegt direkt neben dem Park, deshalb kann ich in der Mittagspause dort spazieren gehen.$kt$, null),
  ('Allemand', 12, $kt$Cours 12 · Grand Laboratoire de production écrite et orale$kt$, $kt$Lettre amicale$kt$, $kt$Consigne : Rédigez un courriel de 10 à 12 lignes à un ami allemand (Lieber... / Liebe...). Racontez votre récente installation ou vos projets professionnels. Vous devez obligatoirement intégrer : un parfait avec sein, un parfait avec haben, une inversion syntaxique, deux adjectifs épithètes déclinés, un connecteur double et une subordonnée avec weil.

Consigne : En vous basant sur la trame de votre texte écrit, détachez-vous de vos notes et présentez votre situation à voix haute durant 3 minutes continues. Veillez scrupuleusement au rejet du verbe conjugué dans les subordonnées et à placer correctement vos particules séparables en fin de proposition.$kt$, $kt$$kt$, null),
  ('Allemand', 13, $kt$Cours 13 · L’expression du souhait et du regret (Konjunktiv II )$kt$, $kt$Le mode de l’imaginaire au présent$kt$, $kt$Grammaire : Le mode de l’imaginaire au présent
Le Konjunktiv II correspond fonctionnellement au conditionnel présent français. Il permet de s’extraire de la réalité pour formuler des hypothèses, des souhaits ou des regrets. On l’utilise sous deux formes principales :

Forme Composée vs Forme Simple A. La forme composée (würde + Infinitif) : C’est la structure la plus fréquente pour la grande majorité des verbes réguliers et irréguliers. L’auxiliaire würde occupe la position 2 et l’infinitif est rejeté en fin de proposition. Conjugaison de werden au Konjunktiv II : ich würde, du würdest, er würde, wir würden, ihr würdet, sie würden.
Ejemplo : Ich würde gerne nach Berlin reisen.

B. La forme simple (Verbes de base et modaux) : Pour les auxiliaires (sein, haben) et les verbes modaux, on utilise une forme synthétique dérivée du prétérit, à laquelle on ajoute un umlaut (inflexion) et les terminaisons du subjonctif.
Sein → wäre : ich wäre, du wärst, er wäre, wir wären, ihr wärt, sie wären.
Haben → hätte : ich hätte, du hättest, er hätte, wir hätten, ihr hättet, sie hätten.
Ejemplo : Ich hätte gerne mehr Zeit und ich wäre jetzt gerne am Strand.

Expression Orale & Phonétique : L’intonation du regret
Pour marquer la dimension affective du regret ou du souhait irréalisable à l’oral, l’accentuation tonique insiste fortement sur les adverbes de modalité comme gerne ou doch, ainsi que sur l’auxiliaire. La courbe mélodique monte sur l’auxiliaire puis descend de manière marquée en fin de phrase. Entraînez-vous à prononcer avec mélancolie : Ich hätte ↗ so gerne ein großes Haus ↘.$kt$, $kt$$kt$, null),
  ('Allemand', 14, $kt$Cours 14 · Le système éducatif et universitaire allemand$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Témoignage de Leon, étudiant inscrit à l’Université Humboldt de Berlin.

Banque de Vocabulaire Enrichi
— Das Studium : Les études supérieures. Note de distinction fondamentale : “lernen” signifie étudier/réviser une leçon précise, tandis que “studieren” signifie être inscrit à l’université.
— Die Vorlesung : Le cours magistral (à l’amphithéâtre)
— Die Prüfung bestehen : Réussir/valider un examen
— Das Studentenwohnheim : La résidence universitaire
— Das Stipendium : La bourse d’études
— Der Abschluss : Le diplôme de fin d’études (Bachelor- / Masterabschluss)
— Die Ausbildung : La formation professionnelle / l’apprentissage$kt$, $kt$Journaliste : Leon, du studierst jetzt im dritten Semester Informatik. Wie gefällt dir das Studium ? · Leon : Es gefällt mir sehr gut, aber es ist auch anstrengend. Ich muss jede Woche viele Vorlesungen besuchen und schwierige Prüfungen bestehen. · Journaliste : Wohnst du noch bei deinen Eltern oder in einem Studentenwohnheim ? · Leon : Ich habe ein Zimmer in einer WG gefunden. Das ist praktischer. Ich habe auch ein Stipendium bekommen, deshalb muss ich momentan nicht nebenbei arbeiten. · Journaliste : Was möchtest du nach dem Bachelorabschluss machen ? · Leon : Wenn ich gute Noten habe, würde ich gerne einen Master machen oder direkt eine praktische Ausbildung anhängen.$kt$, null),
  ('Allemand', 15, $kt$Cours 15 · Formulation de conseils et interactions hypothétiques$kt$, $kt$Le conseil atténué et la politesse avec sollte$kt$, $kt$Grammaire : Le conseil atténué et la politesse avec sollte
Pour formuler une suggestion ou donner un conseil de manière beaucoup plus diplomatique et douce que l’impératif direct, l’allemand recourt au verbe modal sollen conjugué au Konjunktiv II.
— Structure au singulier (Tú) : Du solltest mehr lernen. (Tu devrais étudier davantage).
— Structure de politesse (Vouvoiement) : Sie sollten den Professor fragen. (Vous devriez demander au professeur).
— La structure hypothétique : Permet de créer des scénarios avec wenn (si). Le verbe est rejeté à la fin de la conditionnelle, et la principale commence par l’inversion.
Ejemplo : Wenn ich Zeit hätte, würde ich dir helfen. (Si j’avais le temps, je t’aiderais).$kt$, $kt$$kt$, null),
  ('Allemand', 16, $kt$Cours 16 · Les propositions relatives (Relativsätze)$kt$, $kt$Caractériser un nom avec précision$kt$, $kt$Grammaire : Caractériser un nom avec précision
La proposition relative apporte une précision sur un nom de la phrase principale. Le pronom relatif dépend du genre et du nombre du nom qualifié, et du cas dicté par sa fonction dans la relative. Le verbe conjugué est rejeté à la toute fin de la relative.

Les pronoms relatifs fondamentaux A. Nominativ (Sujet) : Masc : der / Fém : die /
Neutre : das / Pluriel : die.
Ejemplo : Das ist der Kollege, der hier arbeitet.

B. Akkusativ (COD) : Masc : den / Fém : die / Neutre : das / Pluriel : die.
Ejemplo : Das ist der Kollege, den ich gestern getroffen habe.

C. Dativ (COI / Après préposition) : Masc : dem / Fém : der / Neutre : dem /
Pluriel : denen.
Ejemplo : Das ist der Kollege, mit dem ich das Projekt leite.

Expression Orale & Phonétique : Le rythme des relatives
Les propositions relatives rallongent considérablement les phrases. À l’oral, il est impératif de marquer une légère pause respiratoire juste avant le pronom relatif (matérialisé par la virgule obligatoire à l’écrit) et de faire monter l’intonation, puis de la faire redescendre sur le verbe final. Entraînez-vous à prononcer à voix haute : Das ist das Buch, ↗ das ich gelesen habe ↘.$kt$, $kt$$kt$, null),
  ('Allemand', 17, $kt$Cours 17 · Les médias, Internet et le numérique$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait d’un débat sur la radio publique NDR au sujet du temps d’écran.

Banque de Vocabulaire Enrichi
— Die sozialen Medien : Les réseaux sociaux
— Nachrichten teilen : Partager des messages / des actualités
— Der Medienkonsum : La consommation de médias / le temps d’écran
— Das Gerät : L’appareil / le dispositif (ex : le smartphone)
— Online / Offline sein : Être en ligne / hors ligne
— Herunterladen : Télécharger (Verbe séparable : Ich lade eine App herunter)
— Die App nutzen : Utiliser une application$kt$, $kt$Animatrice : Guten Abend ! Heute diskutieren wir über das Thema Medienkonsum bei Jugendlichen. Bei uns ist der Soziologe Dr. Weber. Herr Weber, wie beeinflussen soziale Medien unsere Jugend ? · Dr. Weber : Guten Abend. Viele Jugendliche verbringen täglich mehrere Stunden online. Sie nutzen Apps, um Nachrichten zu teilen oder Videos anzuschauen. Das Smartphone ist ein Gerät, das sie ständig in der Hand haben. · Animatrice : Ist dieser hohe Medienkonsum gefährlich ? · Dr. Weber : Nicht direkt, aber das Risiko für soziale Isolation steigt. Es ist wichtig, dass Jugendliche auch reale Kontakte pflegen und dass die Bildschirmzeit limitiert wird.$kt$, null),
  ('Allemand', 18, $kt$Cours 18 · Le laboratoire du portrait et de la description de profil$kt$, $kt$Profil technologique$kt$, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes décrivant un outil numérique ou une application logicielle essentielle à votre quotidien. Vous devez intégrer au least une relative au nominatif, une à l’accusatif, une au datif introduite par une préposition (mit, in, auf ), et employer le vocabulaire des médias du cours précédent.

Consigne : En vous basant sur votre texte écrit, présentez cet objet ou cette application à voix haute pendant 2 minutes en continu sans jamais prononcer son nom, comme pour le faire deviner à un interlocuteur. Exemple de structure orale à utiliser : Das ist ein Tool, mit dem ich täglich arbeite und das ich auf mein Smartphone heruntergeladen habe... Soignez le rejet absolu du verbe conjugué à la fin de la relative.$kt$, $kt$$kt$, null),
  ('Allemand', 19, $kt$Cours 19 · Les propositions subordonnées de but (Um... zu vs Damit)$kt$, $kt$Exprimer le but et l’intention$kt$, $kt$Grammaire : Exprimer le but et l’intention
L’allemand possède deux manières d’exprimer le but (“pour que” / “afin de”), selon que les sujets des propositions sont identiques ou différents.

Même sujet vs Sujets différents A. Même sujet → Structure infinitive : UM ...
ZU + Infinitif : Le sujet de l’action principale est le même que celui du but. On omet le pronom sujet dans la subordonnée. Zu se place juste avant l’infinitif en toute fin (ou s’intercale s’il s’agit d’un verbe séparable).
Ejemplo : Ich lerne Deutsch, um in Berlin zu arbeiten.

B. Sujets différents → Proposition subordonnée : DAMIT + Verbe conjugué
à la fin : Le sujet de la principale est différent de celui de la subordonnée. Le verbe conjugué est obligatoirement rejeté tout à la fin.
Ejemplo : Ich spreche Deutsch, damit mein Chef mich versteht.

Expression Orale & Phonétique : Le contraste mélodique
À l’oral, la structure infinitive avec um... zu glisse de manière fluide vers la fin sans accentuer le mot um. En revanche, le mot damit reçoit une forte accentuation tonique sur sa première syllabe (da-mit) pour poser l’intention, suivie d’un rythme suspendu jusqu’au verbe final. Entraînez-vous à prononcer à voix haute : Ich helfe dir, ↗ damit du fertig bist ↘.$kt$, $kt$$kt$, null),
  ('Allemand', 20, $kt$Cours 20 · Le monde du travail, du recrutement et du stage (Praktikum)$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Simulation d’un entretien d’embauche pour un poste de chef de projet à Francfort.

Banque de Vocabulaire Enrichi
— Die Stelle / Der Posten : Le poste / l’emploi
— Sich bewerben um (+ Akkusativ) : Postuler pour / faire acte de candidature pour
— Die Berufserfahrung : L’expérience professionnelle

— Das Praktikum : Le stage (étudiant ou de réorientation)
— Das Gehalt / Der Lohn : Le salaire / la paye
— Die Vollzeit / Die Teilzeit : Le plein temps / le temps partiel
— Die Verantwortung übernehmen : Prendre ses responsabilités / assumer la responsabilité$kt$, $kt$Recruteur : Guten Tag, Herr Müller. Willkommen bei Logix. Erzählen Sie uns : Warum interessieren Sie sich für diese Stelle ? · Herr Müller : Guten Tag. Ich bewerbe mich um diese Position, weil ich viel Berufserfahrung im IT-Bereich habe. Ich habe sowohl Projekte geleitet als auch in internationalen Teams gearbeitet. · Recruteur : Das klingt gut. Wir suchen jemanden, der flexibel ist. Wie sieht es mit Ihren Gehaltsvorstellungen aus ? Suchen Sie eine Vollzeit- oder eine Teilzeitstelle ? · Herr Müller : Ich suche eine Vollzeitstelle mit einem fairen Gehalt. Ich möchte mich beruflich weiterentwickeln, um mehr Verantwortung zu übernehmen.$kt$, null),
  ('Allemand', 21, $kt$Cours 21 · Rédaction de candidature et simulation d’entretien d’embauche$kt$, $kt$Lettre de motivation formelle$kt$, $kt$Consigne : Rédigez le corps d’une lettre de motivation formelle de 8 à 10 lignes pour postuler au poste de votre choix. Vous devez obligatoirement intégrer : une structure de but avec um... zu, une structure avec damit, une forme de continuité au présent avec seit, et mobiliser le vocabulaire professionnel acquis au cours précédent.

Consigne : Enregistrez-vous ou placez-vous face à un miroir pour simuler votre entretien. Répondez de manière fluide et dynamique aux questions suivantes à voix haute pendant 3 minutes au total : 1. Warum bewerben Sie sich um diese Stelle ? 2. Welche Berufserfahrung bringen Sie mit ? 3. Warum sollten wir gerade Sie einstellen ? Soignez le positionnement du verbe conjugué lors des justifications et utilisez le conditionnel de politesse pour valoriser vos compétences.$kt$, $kt$$kt$, null),
  ('Allemand', 22, $kt$Cours 22 · Les verbes à régime (prépositions fixes)$kt$, $kt$Les couples verbe / préposition indissociables$kt$, $kt$Grammaire : Les couples verbe / préposition indissociables
En allemand, de nombreux verbes construisent leur complément à l’aide d’une préposition fixe qui exige un cas précis (Accusatif ou Datif), indépendamment des règles spatiales ou directionnelles habituelles.

Verbes à prépositions fixes courantes A. Verbes exigeant l’Akkusativ :
— sich interessieren für (s’intéresser à) → Ich interessiere mich für den neuen Posten.
— sich freuen auf (se réjouir d’un événement futur) → Ich freue mich auf den nächsten Urlaub.
— denken an (penser à) → Ich denke oft an die Arbeit.
B. Verbes exigeant le Dativ :
— sprechen mit (parler avec) → Ich spreche mit dem Chef.
— träumen von (rêver de) → Er träumt von einem eigenen Geschäft.
— teilnehmen an (participer à) → Wir nehmen an dem Seminar teil.

Expression Orale & Phonétique : L’automatisation réflexe
Ces couples verbe-préposition doivent être mémorisés comme un bloc rythmique unique. À l’oral, liez phonétiquement la préposition au verbe ou au pronom réfléchi sans marquer de pause respiratoire. Entraînez-vous à prononcer d’une seule traite : Ich-interessiere-mich-für-dasProjekt. / Ich-sprech-mit-dem-Chef.$kt$, $kt$$kt$, null),
  ('Allemand', 23, $kt$Cours 23 · Grand Bilan du Bloc 2$kt$, $kt$Analyse d’un éditorial sur les études$kt$, $kt$Compréhension Écrite : Analyse d’un éditorial sur les études

Compréhension Orale : Script du laboratoire d’écoute
Discussion sur l’organisation interne du travail entre Frau König (Directrice), Herr Meyer et Herr Müller.

Frau König : Guten Morgen zusammen. Ich möchte heute über unsere Arbeitsorganisation sprechen. Herr Meyer, Sie arbeiten seit sechs Monaten im Homeoffice. Wie läuft es ?
Herr Meyer : Guten Morgen, Frau König. Ich bin sehr zufrieden, weil ich flexibler arbeiten kann. Ich verschwende keine Zeit im Stau, um ins Büro zu fahren.
Herr Müller : Ich verstehe deinen Punkt, aber ich denke an die Teamarbeit. Wenn wir uns nie im Büro treffen, befürchte ich, dass die Kommunikation schwieriger wird.
Frau König : Da haben Sie beide recht. Deshalb sollten wir ein Modell finden, das sowohl Flexibilität als auch persönlichen Austausch ermöglicht. Was halten Sie von zwei Präsenztagen pro Woche ?$kt$, $kt$Es ist unbestreitbar, dass ein Universitätsstudium viele Türen öffnet. Ein Student, der ein Stipendium erhält, kann sich ganz auf seine Vorlesungen konzentrieren, um das Bachelorstudium erfolgreich zu beenden. Viele Jugendliche interessieren sich heute jedoch für eine praktische Ausbildung, weil sie direkt im Berufsleben stehen möchten. Wenn die Universitäten flexibler wären, würden sich wahrscheinlich noch mehr junge Menschen für ein Masterstudium entscheiden.$kt$, null),
  ('Allemand', 24, $kt$Cours 24 · Grand Laboratoire de débat argumenté écrit et oral$kt$, $kt$Essai d’argumentation structuré$kt$, $kt$Consigne : Rédigez un paragraphe d’argumentation de 10 à 12 lignes sur le thème : Vor- und Nachteile des Homeoffices (Avantages et inconvénients du télétravail). Vous devez obligatoirement y intégrer : au moins deux verbes à prépositions fixes (denken an, sich freuen auf, sprechen mit), une structure conditionnelle complète au Konjunktiv II (wenn... wäre/hätte, würde...) et des connecteurs logiques de transition (einerseits... andererseits, zudem, jedoch).

Consigne : Imaginez que vous présentez votre point de vue lors d’une réunion officielle devant Frau König. Détachez-vous complètement de vos notes manuscrites et prenez la parole à voix haute de manière ferme, articulée et fluide pendant 3 minutes continues. Structurez votre pitch en trois phases distinctes : introduction du sujet, balance d’un argument favorable versus une objection (en employant des relatives complexes), puis conclusion sous forme de proposition de compromis hybride.$kt$, $kt$$kt$, null),
  ('Allemand', 25, $kt$Cours 25 · La voix passive (Passiv) au présent et au parfait$kt$, $kt$Le fonctionnement du Passiv$kt$, $kt$Grammaire : Le fonctionnement du Passiv
À la voix active, le locuteur met en valeur l’entité qui accomplit l’action. À la voix passive, l’attention se déplace vers l’action elle-même ou l’objet qui la subit. Le complément d’objet direct (COD) de la phrase active devient ainsi le sujet de la phrase passive. L’agent reste facultatif et s’introduit par la préposition von + Dativ.

Passif Présent vs Passif Parfait A. Le Passif Présent (Präsens Passiv) : Il se forme à l’aide de l’auxiliaire werden conjugué au présent (en position 2) et du participe II du verbe principal rejeté à la toute fin de la proposition.
Conjugaison de werden : ich werde, du wirst, er/sie/es wird, wir werden, ihr werdet, sie werden.
Actif : Ein Experte repariert das Auto.
Passif : Das Auto wird (von einem Experten) repariert.

B. Le Passif Parfait (Perfekt Passiv) : Il se construit avec l’auxiliaire sein conjugué au présent (en position 2), suivi du participe II et de la forme immuable worden (participe passé tronqué de werden) à la toute fin.
Actif : Ein Experte hat das Auto repariert.
Passif : Das Auto ist (von einem Experten) repariert worden.

Expression Orale & Phonétique : L’accentuation de l’auxiliaire
Au passif présent, l’auxiliaire werden ou wird demeure court et atone (non accentué). L’accentuation tonique de la phrase se reporte entièrement sur le radical du participe passé final. Entraînez-vous à prononcer à voix haute de manière rythmée en insistant uniquement sur la fin
des énoncés : Das Produkt wird ge-kauft. / Die Webseite wird ge-stal-tet.$kt$, $kt$$kt$, null),
  ('Allemand', 26, $kt$Cours 26 · La consommation, l’économie et la publicité$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Spot publicitaire radiophonique pour une marque allemande d’éco-technologie.

Banque de Vocabulaire Enrichi
— Die Werbung : La publicité / la réclame
— Der Verbrauch : La consommation (der Verbraucher = le consommateur)
— Ein Produkt herstellen : Fabriquer / produire un article commerciale
— Der Strom / Die Energie : L’électricité / l’énergie
— Die Bedienung : L’utilisation / la manipulation / la prise en main
— Etwas verschwenden : Gaspiller / dissiper quelque chose
— Nachhaltig : Durable / écoresponsable$kt$, $kt$Voix off : Suchen Sie ein Produkt, das Ihr Leben verändert ? Jeden Tag werden in Europa Millionen Tonnen Energie verschwendet. Aber mit unserem neuen, intelligenten Heim-System wird Strom sparen leicht gemacht ! · Client : Seitdem das System in meinem Haus installiert wurde, ist mein Verbrauch um 30 Prozent reduziert worden. Die Bedienung ist kinderleicht. · Voix off : Unser System wird komplett in Deutschland hergestellt und garantiert beste Qualität. Besuchen Sie unsere Webseite ! Die Werbung verspricht oft viel, aber wir halten unsere Versprechen. Kaufen Sie nachhaltig !$kt$, null),
  ('Allemand', 27, $kt$Cours 27 · Le laboratoire de description de processus industriels et commerciaux$kt$, $kt$Description technique de processus$kt$, $kt$Atelier d’Écriture : Description technique de processus$kt$, $kt$(ist... worden), intégrer des connecteurs temporels d’étape (Zuerst, Danach, Schließlich) et mobiliser le lexique de l’économie (herstellen, der Verbraucher, das Produkt).$kt$, null),
  ('Allemand', 28, $kt$Cours 28 · Le cas du Génitif et ses prépositions (Wegen, Trotz)$kt$, $kt$Le cas de la possession et de la rigueur formelle$kt$, $kt$Grammaire : Le cas de la possession et de la rigueur formelle
Le génitif (Genitiv) exprime principalement le complément du nom (la possession, le lien de parenté ou l’appartenance). S’il tend à s’estomper à l’oral informel au profit du datif, il demeure une structure incontournable du niveau B2 à l’écrit et dans le langage soutenu.

Déclinaisons et prépositions du Génitif A. Les déclinaisons des déterminants au génitif :
— Masculin / Neutre : Le déterminant devient des. Le nom prend impérativement la marque casuelle -s ou -es.
Ejemplos : Das Auto des Chefs / Das Ende des Jahres.
— Féminin / Pluriel : Le déterminant devient der. Le nom ne prend aucune terminaison.
Ejemplos : Die Tasche der Kollegin / Die Probleme der Mitarbeiter.
B. Les prépositions régies par le Génitif : Certaines prépositions logiques exigent systématiquement l’emploi du génitif :
— wegen (à cause de – causalité) → Wegen des Regens bleiben wir im Büro.
— trotz (malgré – concession) → Trotz der Kälte arbeitet er draußen.

Expression Orale & Phonétique : La liaison du -s final
Au masculin et au neutre, la présence de la désinence casuelle -s ou -es à la fin du nom modifie le rythme de l’énoncé. À l’oral, cette marque doit être fermement articulée et liée au

mot pour garantir la fluidité de la structure nominale B2. Entraînez-vous à prononcer de manière nette d’une seule traite : wegen-des-Technikfehlers, trotz-des-Streiks.$kt$, $kt$$kt$, null),
  ('Allemand', 29, $kt$Cours 29 · L’environnement, le climat et la transition écologique (Energiewende)$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait d’une chronique écologique diffusée sur la chaîne d’information Deutsche Welle.

Banque de Vocabulaire Enrichi
— Die Energiewende : La transition énergétique (concept politique et sociétal majeur en Allemagne)
— Der CO2-Ausstoß : L’émission de dioxyde de carbone (CO2)
— Der Klimawandel : Le changement / dérèglement climatique
— Erneuerbare Energien : Les énergies renouvelables
— Der Umweltschutz : La protection de l’environnement (der Klimaschutz = la défense du climat)
— Die Mülltrennung : Le tri sélectif des déchets
— Nachhaltig : Durable / écoresponsable / pérenne$kt$, $kt$Présentateur : Die Reduzierung des CO2-Ausstoßes ist das wichtigste Ziel der aktuellen Politik. Wegen des Klimawandels wird die sogenannte Energiewende in Deutschland beschleunigt. · Experte : Richtig. Trotz der hohen Kosten müssen wir massiv in erneuerbare Energien investieren. Der Ausbau von Windkraft und Solarenergie wird jeden Tag vorangetrieben, um den Umweltschutz zu garantieren. · Présentateur : Ein großes Problem bleibt die Mülltrennung in den Städten, aber immer mehr Verbraucher achten erfreulicherweise auf einen nachhaltigen Konsum.$kt$, null),
  ('Allemand', 30, $kt$Cours 30 · Le laboratoire du plaidoyer écologique et du style nominal$kt$, $kt$Introduction au style nominal (Nominalstil)$kt$, $kt$Grammaire : Introduction au style nominal (Nominalstil)
Le niveau B2 exige de savoir condenser l’information en utilisant des structures nominales denses au génitif à la place de propositions subordonnées verbales (ex : transposer la forme B1 weil das Klima sich wandelt en forme B2 wegen des Klimawandels).$kt$, $kt$$kt$, null),
  ('Allemand', 31, $kt$Cours 31 · Le Futur I pour l’avenir et la supposition$kt$, $kt$Les deux visages du Futur I$kt$, $kt$Grammaire : Les deux visages du Futur I
Le Futur I se forme à l’aide de l’auxiliaire werden conjugué au présent (en position 2) et de l’infinitif du verbe principal rejeté à la toute fin de la proposition. Au niveau B2, ce temps acquiert une double valeur sémantique :

Expression de l’avenir vs Supposition présente A. Exprimer l’avenir (Projet /
Promesse) : Valeur classique de projection temporelle.
Ejemplo : Nächstes Jahr werden wir eine Reise nach Wien machen.

B. Exprimer la supposition au présent (Nuance B2) : En y associant un adverbe
de modalité comme wohl (probablement) ou wahrscheinlich (sans doute), le Futur I permet de formuler une hypothèse sur un fait contemporain à l’énonciation.
Ejemplo : Wo ist Thomas ? Er wird wohl im Büro sein. (Où est Thomas ? Il doit probablement être au bureau / Il sera sans doute au bureau actuellement).

Expression Orale & Phonétique : L’intonation de la probabilité
Lorsque le Futur I est employé pour exprimer une supposition présente, l’accentuation tonique de la phrase se déplace sur l’adverbe de probabilité (wohl ou wahrscheinlich). La voix doit monter légèrement sur cet adverbe pour marquer l’incertitude intellectuelle, puis redescendre calmement sur l’infinitif final. Entraînez-vous à prononcer à voix haute avec une intonation
dubitative : Sie wird wohl ↗ zu Hause arbeiten ↘.$kt$, $kt$$kt$, null),
  ('Allemand', 32, $kt$Cours 32 · La culture, l’art et les traditions germaniques$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait d’un guide audio thématique présenté au Musée d’Art Moderne de Francfort.

Banque de Vocabulaire Enrichi
— Die zeitgenössische Kunst : L’art contemporain
— Die Ausstellung : L’exposition / la galerie éphémère

— Das Meisterwerk : Le chef-d’uvre
— Die Tradition / Die Kultur : La tradition / la culture
— Der Künstler / Die Künstlerin : L’artiste / le créateur
— Etwas widerspiegeln : Refléter / faire écho à (Verbe séparable : Es spiegelt etwas wider)
— Die Galerie : La galerie d’art$kt$, $kt$Audioguide : Herzlich willkommen ! Vor Ihnen hängt ein Meisterwerk der zeitgenössischen Kunst. Dieses Bild wird wohl im frühen zwanzigsten Jahrhundert gemalt worden sein. Es spiegelt die tiefen Veränderungen der deutschen Gesellschaft wider. · Visiteur : Schau mal, der Stil ist wirklich einzigartig. Die Ausstellung ist extrem gut besucht. · Audioguide : In dieser Galerie werden wir gleich die Skulpturen des Künstlers sehen. Diese Tradition der Abstraktion prägt die Kultur des Landes bis heute. Bitte beachten Sie, dass das Fotografieren mit Blitz streng verboten ist.$kt$, null),
  ('Allemand', 33, $kt$Cours 33 · Le laboratoire du récit spéculatif sur l’avenir de la société$kt$, $kt$L’essai prospectif$kt$, $kt$Consigne : Rédigez un paragraphe d’anticipation de 8 à 10 lignes décrivant l’évolution du monde de la culture et des musées face à la numérisation et à l’intelligence artificielle d’ici les trente prochaines années. Vous devez obligatoirement intégrer : au moins trois structures de Futur I à valeur d’avenir, deux structures de Futur I à valeur de supposition présente (avec wohl), et deux compléments du nom déclinés au cas du génitif.

Consigne : Imaginez que vous êtes invité en tant qu’expert à un débat sur l’avenir des institutions culturelles en Allemagne. Sans lire vos notes manuscrites, prenez la parole à voix haute pendant 2 minutes et 30 secondes en continu. Formulez vos hypothèses avec clarté en veillant au rejet systématique de l’infinitif final après werden : In der Zukunft werden die Menschen Museen anders erleben. Die Technologie wird wohl eine zentrale Rolle spielen...$kt$, $kt$$kt$, null),
  ('Allemand', 34, $kt$Cours 34 · Les structures infinitives complexes (Ohne... zu, Anstatt... zu)$kt$, $kt$Fluidifier son style avec les infinitives B2$kt$, $kt$Grammaire : Fluidifier son style avec les infinitives B2
Lorsque le sujet de la proposition principale et celui de la nuance logique sont strictement identiques, l’allemand privilégie l’utilisation de structures infinitives denses. Cela permet d’éviter l’ouverture d’une proposition subordonnée lourde avec verbe conjugué.

Restriction et Substitution A. Ohne ... zu + Infinitif (Sans ... + infinitif) : Exprime l’absence d’une action pourtant attendue ou prévisible.
Ejemplo : Er ist gegangen, ohne ein Wort zu sagen. (Il est parti sans dire un mot).

B. Anstatt ... zu + Infinitif (Au lieu de ... + infinitif) : Exprime la substitution d’une action par une autre.
Ejemplo : Anstatt im Büro zu arbeiten, bleibt er heute zu Hause. (Au lieu de travailler au bureau, il reste à la maison).
Note de position : L’infinitif précédé de la particule zu occupe impérativement la toute dernière position de la clause infinitive. S’il s’agit d’un verbe séparable, zu s’intercale (anstatt fernzusehen).

Expression Orale & Phonétique : La mélodie des clauses infinitives
À l’oral, la conjonction de départ (ohne ou anstatt) marque le début d’une courbe mélodique ascendante. On observe un rythme suspendu sur les compléments intermédiaires, puis la voix redescend de manière abrupte sur le bloc final zu + infinitif. Entraînez-vous à prononcer à voix
haute : Anstatt fernzusehen, ↗ sollte er Deutsch zu lernen ↘.$kt$, $kt$$kt$, null),
  ('Allemand', 35, $kt$Cours 35 · Grand Bilan du Bloc 3 (Analyse d’actualité)$kt$, $kt$Lecture d’un article de presse socio-économique$kt$, $kt$Compréhension Écrite : Lecture d’un article de presse socio-économique

Compréhension Orale : Script du laboratoire d’écoute
Flash d’actualité national diffusé en direct sur la station Deutschlandfunk.
Hier ist das Inlandsupdate. Im Rahmen der nationalen Energiewende wurde heute ein neues Gesetz verabschiedet. Ab nächstem Jahr wird der Bau von Solaranlagen auf öffentlichen Gebäuden stark gefördert. Wegen des Klimawandels muss der CO2-Ausstoß schneller sinken. Experten vermuten, die neuen Klimaziele werden wohl trotz der wirtschaftlichen Krise erreicht werden. Die Umweltschutzverbände zeigen sich optimistisch.$kt$, $kt$Die deutsche Wirtschaft befindet sich im Wandel. Wegen des Mangels an Fachkräften werden immer mehr Prozesse in den Fabriken automatisiert. Neue Technologien werden rasant entwickelt, um die Effizienz der Produktion zu steigern. Trotz der anfänglichen Kritik der Gewerkschaften wird dieser Trend wohl im nächsten Jahrzehnt anhalten. Viele Unternehmen investieren massiv in die Digitalisierung, anstatt traditionelle Strukturen beizubehalten.$kt$, null),
  ('Allemand', 36, $kt$Cours 36 · Grand Laboratoire de synthèse de documents et résumé oral$kt$, $kt$Synthèse croisée de documents$kt$, $kt$Consigne : En vous appuyant sur l’article économique du cours 35 et sur le script du flash info, rédigez une note de synthèse cohérente de 10 à 12 lignes résumant les défis croisés (économiques, climatiques et technologiques) de la société allemande actuelle. Vous devez obli- gatoirement intégrer : au moins une structure passive au présent ou au passé, une structure infinitive complexe (ohne/anstatt... zu), deux prépositions au génitif (wegen et trotz), et une conjecture formulée au Futur I avec l’adverbe wohl.

Consigne : Imaginez que vous devez débriefer un cadre supérieur germanophone de votre entreprise sur la dynamique socio-écologique en Allemagne. Sans regarder vos notes de travail, prenez la parole à voix haute de manière synthétique et percutante pendant exactement 2 minutes (chronométré). Amorcez votre discours par le fait principal à la voix passive : Heute wurde ein neues Gesetz verabschiedet... Articulez clairement vos conclusions en soignant le rythme.$kt$, $kt$$kt$, null),
  ('Allemand', 37, $kt$Cours 37 · Les connecteurs de concession avancés (Obwohl, Trotzdem, Zwar... aber)$kt$, $kt$L’art de la concession syntaxique$kt$, $kt$Grammaire : L’art de la concession syntaxique
Le niveau B2 exige une manipulation fluide et précise des structures concessives et d’opposition. Selon le connecteur choisi, l’architecture syntaxique de la phrase varie grandement :

Subordonnée, Adverbe ou Structure double A. Obwohl + Verbe conjugué à la fin
(Bien que / Quoique) : Introduit une proposition subordonnée concessive. La virgule est obligatoire avant obwohl.
Ejemplo : Ich arbeite weiter, obwohl ich sehr müde bin.

B. Trotzdem + Inversion Sujet-Verbe (Pourtant / Malgré cela) : C’est un adverbe de liaison qui introduit une proposition principale. Le verbe conjugué se place immédiatement en deuxième position, juste après trotzdem.
Ejemplo : Ich bin sehr müde. Trotzdem arbeite ich weiter.

C. Zwar ... aber (Certes ... mais) : Structure de coordination double extrêmement élégante à l’écrit comme à l’oral. Elle permet de concéder un premier fait avant de le nuancer ou de le contredire immédiatement.
Ejemplo : Ich bin zwar müde, aber ich arbeite weiter.

Expression Orale & Phonétique : Marquer l’opposition
À l’oral, la structure double zwar... aber impose un rythme de balancier très marqué. Le locuteur doit poser une accentuation d’insistance sur le mot zwar, marquer une micro-pause suspensive au niveau de la virgule, puis effectuer une relance tonique énergique sur l’élément qui suit immédiatement la conjonction aber. Entraînez-vous à prononcer à voix haute : Das Produkt ist zwar ↗ teuer, aber ↘ sehr gut.$kt$, $kt$$kt$, null),
  ('Allemand', 38, $kt$Cours 38 · La santé, la recherche médicale et la science$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait du podcast de vulgarisation scientifique hebdomadaire Gesundheit Heute.

Banque de Vocabulaire Enrichi
— Die medizinische Forschung : La recherche médicale
— Die Auswirkung (auf + Akkusativ) : L’impact / l’effet direct (sur)
— Die Gesundheit / Die Krankheit : La santé / la maladie
— Die Vorbeugung / Die Prävention : La prévention / la prophylaxie
— Eine Tendenz zeigen : Présenter / afficher une tendance claire
— Der Fortschritt : Le progrès / l’avancée scientifique
— Die Wissenschaft : La science / la discipline académique$kt$, $kt$Animatrice : Willkommen bei unserem Podcast. Heute sprechen wir über die medizinische Forschung. Obwohl die Wissenschaft rasant große Fortschritte macht, gibt es immer noch viele ungelöste Fragen. · Dr. Keller : Das stimmt. Wir untersuchen momentan intensiv die Auswirkungen von Stress auf die Gesundheit. Viele Menschen sind zwar im Alltag chronisch gestresst, aber trotzdem ignorieren sie leichtsinnig die ersten Symptome einer ernsten Krankheit. · Animatrice : Welche konkrete Rolle spielt hierbei die Prävention ? · Dr. Keller : Eine absolut zentrale Rolle. Durch eine gesunde Ernährung und gezielte Vorbeugung können wir viele chronische Krankheiten frühzeitig vermeiden. Die gesammelten Daten zeigen eine eindeutige Tendenz.$kt$, null),
  ('Allemand', 39, $kt$Cours 39 · Le laboratoire d’analyse de graphiques et données statistiques$kt$, $kt$L’analyse méthodologique de graphiques (Grafikbes-$kt$, $kt$Atelier d’Écriture : L’analyse méthodologique de graphiques (Grafikbes-
chreibung)
Le commentaire synthétique de données chiffrées et de diagrammes est un exercice académique et professionnel pivot du niveau B2.$kt$, $kt$$kt$, null),
  ('Allemand', 40, $kt$Cours 40 · Le subjonctif I (Konjunktiv I ) pour le discours rapporté$kt$, $kt$La neutralité journalistique au style indirect$kt$, $kt$Grammaire : La neutralité journalistique au style indirect
En allemand, pour rapporter des propos de manière totalement objective et neutre sans prendre parti, on utilise le Konjunktiv I. C’est le mode par excellence de la presse écrite et des médias d’information. S’il s’avère que la forme du Konjunktiv I est identique à celle du présent de l’indicatif (ce qui arrive souvent aux première et troisième personnes du pluriel), on la remplace par le Konjunktiv II pour éviter toute ambiguïté syntaxique.

Formation et exemple du Konjunktiv I A. Formation standard (sur la racine de
l’infinitif) : Les terminaisons régulières sont : -e, -est, -e, -en, -et, -en.
— Le verbe SEIN (Irrégulier mais capital) : ich sei, du seiest, er/sie/es sei, wir seien, ihr seiet, sie seien.
— La 3e personne du singulier (la plus utilisée) : er habe, er werde, er reise, er arbeite. B. Exemple de passage au discours indirect :
— Discours direct : Der Minister sagt : Ich bin für das neue Gesetz.
— Discours indirect : Der Minister sagt, er sei für das neue Gesetz.

Expression Orale & Phonétique : L’intonation neutre
Le discours indirect journalistique requiert une diction posée, objective et uniforme, caractéristique des présentateurs de journaux télévisés d’autorité (Tagesschau). À l’oral, la voix ne doit manifester aucune émotion ni jugement de valeur. Entraînez-vous à prononcer à voix haute avec un ton journalistique strict : Der Kanzler erklärte, die politische Krise sei endlich beendet.$kt$, $kt$$kt$, null),
  ('Allemand', 41, $kt$Cours 41 · La politique, l’Union européenne et la citoyenneté$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Compte-rendu d’une conférence de presse officielle au Parlement européen à Bruxelles.

Banque de Vocabulaire Enrichi
— Die europäische Integration : L’intégration européenne
— Die Bürgerbeteiligung : La participation citoyenne / l’engagement civique
— Die Mitgliedstaaten : Les États membres
— Die Verhandlungen : Les négociations (politiques, diplomatiques ou commerciales)

— Die Demokratie : La démocratie
— Der Minister / Die Sprecherin : Le ministre / la porte-parole
— Die Bürger : Les citoyens / le corps civique$kt$, $kt$Sprecherin : Guten Tag, meine Damen und Herren. Der Minister hat heute vor dem Ausschuss gesprochen. Er betonte, die europäische Integration sei der einzige Weg nach vorn. · Journalist : Hat er auch konkrete Maßnahmen zur Bürgerbeteiligung genannt ? · Sprecherin : Ja. Er erklärte, die Bürger sollten mehr Rechte erhalten, damit die Demokratie gestärkt werde. Trotz der aktuellen Differenzen zwischen den Mitgliedstaaten werde die Regierung die politischen Verhandlungen fortsetzen. Ein Sprecher fügte hinzu, man habe bereits wichtige Fortschritte erzielt.$kt$, null),
  ('Allemand', 42, $kt$Cours 42 · Le laboratoire du compte-rendu journalistique neutre$kt$, $kt$Le compte-rendu de presse au Konjunktiv I$kt$, $kt$Consigne : Rédigez une note de synthèse ou une dépêche de presse de 6 à 8 lignes résumant avec la plus stricte neutralité les déclarations de la porte-parole du cours précédent. Vous devez impérativement intégrer : au moins trois formes distinctes de Konjunktiv I (sei, habe, werde), insérer une clause concessive (obwohl ou trotzdem), et mobiliser quatre notions du lexique des institutions politiques.

Consigne : Imaginez que vous êtes correspondant permanent à Bruxelles pour un grand média télévisuel. Sans regarder vos notes de travail, prenez la parole face caméra à voix haute pendant 2 minutes et 30 secondes en continu. Structurez votre allocution de manière journalistique : Die Sprecherin erklärte heute, die Verhandlungen seien... Sie fügte hinzu, dass die Mitgliedstaaten enger zusammenarbeiten müssten... Laut Bericht wolle man die Demokratie durch Bürgerbeteiligung stärken... Assurez un débit fluide et constant.$kt$, $kt$$kt$, null),
  ('Allemand', 43, $kt$Cours 43 · Les adjectifs substantivés (Substantivierte Adjektive)$kt$, $kt$La nominalisation de l’adjectif$kt$, $kt$Grammaire : La nominalisation de l’adjectif
En allemand, un adjectif peut être employé directement comme un nom (on lui applique alors une majuscule). Bien qu’il devienne un nom, il conserve exactement les mêmes terminaisons qu’un adjectif épithète classique selon qu’il suit la déclinaison forte, faible ou mixte.

Les personnes et les concepts abstraits A. Les personnes (Masculin / Féminin) :
— Masculin : der Angestellte (l’employé – faible), ein Angestellter (un employé – mixte).
— Féminin : die Angestellte (l’employée – faible), eine Angestellte (une employée – mixte).
— Pluriel : die Angestellten (les employés – faible), viele Angestellte (beaucoup d’employés – forte).
B. Les concepts abstraits (Neutre) : Ils sont extrêmement fréquents après les pronoms indéfinis tels que alles (tout), etwas (quelque chose), nichts (rien) ou viel (beaucoup). L’adjectif substantivé adopte alors une terminaison neutre.
— Nominativ / Akkusativ : Ich wünsche dir alles Gute. (Je te souhaite le meilleur).
— Après un indéfini : Es gibt etwas Neues / nichts Interessantes.

Expression Orale & Phonétique : L’accentuation des concepts
À l’oral, la nominalisation déplace la force de l’énoncé sur le concept substantivé. La terminaison doit être clairement articulée, notamment le -er final masculin de la déclinaison mixte qui se vocalise légèrement en un son -a ouvert et bref. Entraînez-vous à prononcer à voix haute : Es gibt nichts Schö-nes. / Er ist ein Be-kann-ter.$kt$, $kt$$kt$, null),
  ('Allemand', 44, $kt$Cours 44 · Les variations régionales et culturelles (Allemagne, Autriche, Suisse)$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Reportage culturel croisé sur les spécificités de l’espace linguistique DACH.

Banque de Vocabulaire Enrichi
— Der Sprachraum / Plurizentrisch : L’espace linguistique / pluricentrique (composé de plusieurs centres d’autorité)
— Das Hochdeutsch : L’allemand standard / officiel (langue normée)
— Die kulturelle Vielfalt : La diversité culturelle
— Österreich / Die Schweiz : L’Autriche / la Suisse
— Helvetismus / Austriazismus : Tournure linguistique helvétique / autrichienne
— Das Spital : L’hôpital (variante helvétique et autrichienne commune)
— Der Jänner : Le mois de janvier (austriacisme officiel)$kt$, $kt$Journaliste : Wer Deutsch lernt, denkt oft nur an Deutschland. Doch der deutsche Sprachraum ist plurizentrisch. In Österreich sagt man zum Beispiel der Jänner statt Januar, und das Spital ersetzt oft das Krankenhaus in der Schweiz. · Intervenant suisse : Genau. Bei uns im Schweizerhochdeutsch gibt es auch kein Eszet (SS). Wir schreiben immer Doppel-s. Das ist eine wichtige Tradition, die unsere Identität widerspiegelt. · Journaliste : Obwohl es regionale Unterschiede gibt, ist das Hochdeutsch die gemeinsame Basis. Es ist faszinierend zu sehen, wie die kulturelle Vielfalt diese Sprache bereichert.$kt$, null),
  ('Allemand', 45, $kt$Cours 45 · Le laboratoire du monologue soutenu sur un sujet de société complexe$kt$, $kt$L’essai d’argumentation culturelle$kt$, $kt$Consigne : Rédigez un paragraphe d’essai critique de 10 à 12 lignes sur le thème suivant : Sollte man im Sprachunterricht nur das Standarddeutsch lernen oder auch regionale Varianten beachten ? (Devrait-on apprendre uniquement l’allemand standard ou s’ouvrir aux variantes régionales ?). Vous devez obligatoirement intégrer : au moins deux adjectifs substantivés (etwas Wichtiges, das Neue, das Beste), un connecteur de concession avancé (obwohl ou zwar... aber), et mobiliser le lexique thématique de l’espace pluricentrique (die kulturelle Vielfalt, der Sprachraum).

Consigne : Imaginez que vous soutenez votre point de vue lors d’une table ronde universitaire ou d’une épreuve de certification B2 supérieure. Sans regarder vos notes de travail, prenez la parole à voix haute de manière fluide, rythmée et convaincante pendant 3 minutes continues. Structurez votre monologue en valorisant les concepts abstraits : Der deutsche Sprachraum bietet eine enorme kulturelle Vielfalt. Es ist zwar wichtig, das Hochdeutsch zu beherrschen, aber man sollte auch das Neue kennenlernen...$kt$, $kt$$kt$, null),
  ('Allemand', 46, $kt$Cours 46 · Syntaxe avancée et révision des pièges B2$kt$, $kt$Synthèse des structures de phrases complexes$kt$, $kt$Grammaire : Synthèse des structures de phrases complexes
Le niveau B2 se caractérise par la maîtrise absolue de l’agencement syntaxique et l’élimination des erreurs récurrentes.

Le piège du rejet double et de la négation A. Le rejet double dans les proposi-
tions subordonnées : Lorsque plusieurs formes verbales s’accumulent à la fin d’une subordonnée (comme au passif ou aux temps composés), le verbe conjugué se place impérativement en toute dernière position, juste après les participes passés ou les infinitifs.
Ejemplo : Ich weiß, dass das neue Produkt gestern hergestellt worden ist.

B. La place de la négation nicht : Elle se positionne généralement juste devant l’élément qu’elle nie, ou immédiatement avant le bloc verbal final.
Ejemplo : Er hat das Ziel trotz aller Bemühungen nicht erreicht.$kt$, $kt$$kt$, null),
  ('Allemand', 47, $kt$Cours 47 · Grand Bilan Final B2 (Écrit & Compréhension)$kt$, $kt$Texte de synthèse socio-économique B2$kt$, $kt$Compréhension Écrite : Texte de synthèse socio-économique B2

Compréhension Orale : Script du laboratoire d’écoute final
Chronique de fin d’année sur l’évolution de la société civile germanophone.
Présentateur : Guten Abend. Der Abschlussbericht zur Bürgerbeteiligung wurde heute in Berlin offiziell vorgestellt. Die Sprecherin erklärte vor Journalisten, die Demokratie lebe maßgeblich von dem Engagement der Bürger.
Experte : Das ist absolut richtig. Trotz anfänglicher Zweifel ist das Interesse an politischen Verhandlungen im ganzen Land stark gestiegen. Es wird wohl in den nächsten Jahren eine steigende Tendenz zu beobachten sein, dass immer mehr junge Menschen die Zukunft aktiv mitgestalten wollen, ohne ihre traditionellen Werte zu verlieren.$kt$, $kt$Die fortschreitende Digitalisierung verändert nicht nur die Arbeitswelt, sondern prägt auch die kulturelle Vielfalt unseres Sprachraums. Obwohl viele Prozesse automatisiert werden, bleibt die menschliche Kreativität das wichtigste Gut. Ein Angestellter, der sich für den technologischen Wandel interessiert, sollte sich kontinuierlich weiterbilden, anstatt traditionelle Methoden beizubehalten. Wegen des Fachkräftemangels wird die gezielte Ausbildung der Jugend in Zukunft noch stärker gefördert werden.$kt$, null),
  ('Allemand', 48, $kt$Cours 48 · Grand Bilan Final Oral & Clôture du manuel$kt$, $kt$La certification continue$kt$, $kt$Grand Atelier d’Expression Orale : La certification continue

Herzlichen Glückwunsch ! Sie haben den Deutschkurs
erfolgreich beendet.$kt$, $kt$$kt$, null)
on conflict (language, course_number) do update
set title = excluded.title,
    summary = excluded.summary,
    theory = excluded.theory,
    examples = excluded.examples,
    week_number = null,
    updated_at = now();

-- 2) Exercices : on retire les anciens exercices génériques (pas ceux des membres)
delete from public.language_exercises e
using public.language_courses c
where e.course_id = c.id
  and c.language = 'Allemand'
  and e.origin <> 'member';

-- les exercices des membres passent après ceux du manuel (position + 1000, une seule fois)
update public.language_exercises e
set position = e.position + 1000
from public.language_courses c
where e.course_id = c.id
  and c.language = 'Allemand'
  and e.origin = 'member'
  and e.position < 1000;

-- 3) Nouveaux exercices du manuel
insert into public.language_exercises
  (course_id, position, prompt, answer, expected_answer, accepted_answers, explanation, exercise_type, origin)
select c.id, x.pos, x.prompt, x.expected, x.expected, x.accepted, x.explanation, 'written', 'manual'
from (values
  (1, 1, $kt$Remettez les éléments dans l’ordre syntaxique correct : Ich bin heute müde, weil (ich / viel / gearbeitet / habe) ____________________.$kt$, $kt$weil ich viel gearbeitet habe$kt$, array[$kt$weil ich viel gearbeitet habe$kt$]::text[], $kt$... weil ich viel gearbeitet habe. (L’auxiliaire habe se place après le participe passé à la fin).$kt$),
  (1, 2, $kt$Remettez les éléments dans l’ordre syntaxique correct : Jeden Tag (wir / Deutsch / lernen / im Kurs) ____________________.$kt$, $kt$lernen wir jeden Tag Deutsch$kt$, array[$kt$lernen wir jeden Tag Deutsch$kt$]::text[], $kt$... lernen wir jeden Tag Deutsch. (Inversion obligatoire car le complément de temps occupe la position 1).$kt$),
  (2, 1, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le script audio : Thomas Meyer wohnt erst seit ein paar Wochen in München. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Il y vit depuis deux ans : seit zwei Jahren).$kt$),
  (2, 2, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le script audio : Sarah König hat eine berufliche Vergangenheit in Frankreich. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (Elle a vécu à Paris : früher in Paris gelebt).$kt$),
  (3, 1, $kt$Ajoutez la terminaison manquante à l’adjectif épithète : Er ist ein sehr nett_____ Mann. (der Mann – Nominativ).$kt$, $kt$netter$kt$, array[$kt$netter$kt$]::text[], $kt$netter (Déclinaison mixte, masc. nominatif).$kt$),
  (3, 2, $kt$Ajoutez la terminaison manquante à l’adjectif épithète : Wir haben ein groß_____ Haus gekauft. (das Haus – Akkusativ).$kt$, $kt$großes$kt$, array[$kt$großes$kt$]::text[], $kt$großes (Déclinaison mixte, neutre accusatif).$kt$),
  (3, 3, $kt$Ajoutez la terminaison manquante à l’adjectif épithète : Sie arbeitet mit der neu_____ Chefin. (die Chefin – Dativ après mit).$kt$, $kt$neuen$kt$, array[$kt$neuen$kt$]::text[], $kt$neuen (Déclinaison faible, le datif prend toujours -en).$kt$),
  (3, 4, $kt$Consigne : Rédigez un profil de présentation de 6 lignes. Intégrez obligatoirement : une subordonnée avec weil, une avec dass, et trois adjectifs épithètes déclinés (ein interessanter Beruf, etc.). Une fois le texte écrit, simulez l’interaction à voix haute de manière fluide pour valider l’expression orale.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (4, 1, $kt$Choisissez le bon auxiliaire (haben ou sein) au présent : Wir __________ gestern ins Kino gegangen.$kt$, $kt$sind$kt$, array[$kt$sind$kt$]::text[], $kt$sind (déplacement)$kt$),
  (4, 2, $kt$Choisissez le bon auxiliaire (haben ou sein) au présent : __________ du das neue Auto gesehen ?$kt$, $kt$Hast$kt$, array[$kt$Hast$kt$]::text[], $kt$Hast (action transitive).$kt$),
  (4, 3, $kt$Remplacez le parfait par du prétérit : Ich bin gestern müde gewesen → Ich __________ gestern müde.$kt$, $kt$war$kt$, array[$kt$war$kt$]::text[], $kt$war (le prétérit de sein est privilégié).$kt$),
  (5, 1, $kt$Répondez aux questions d’après le script audio : Wie groß ist das angebotene Zimmer ? __________$kt$, $kt$Es ist etwa 18 Quadratmeter groß$kt$, array[$kt$Es ist etwa 18 Quadratmeter groß$kt$]::text[], $kt$Es ist etwa 18 Quadratmeter groß.$kt$),
  (5, 2, $kt$Répondez aux questions d’après le script audio : Was ist in der Warmmiete von 450 Euro enthalten ? __________$kt$, $kt$Internet und Nebenkosten sind inklusive$kt$, array[$kt$Internet und Nebenkosten sind inklusive$kt$]::text[], $kt$Internet und Nebenkosten sind inklusive.$kt$),
  (6, 1, $kt$Conjuguez les verbes au présent de l’indicatif : Der Bus __________ um acht Uhr __________. (ankommen)$kt$, $kt$kommt / an$kt$, array[$kt$kommt / an$kt$, $kt$kommt an$kt$]::text[], $kt$kommt / an$kt$),
  (6, 2, $kt$Conjuguez les verbes au présent de l’indicatif : Ich __________ meine Hausaufgaben. (beenden)$kt$, $kt$beende$kt$, array[$kt$beende$kt$]::text[], $kt$beende (particule inséparable).$kt$),
  (6, 3, $kt$Mettez ces mêmes phrases au Parfait (Perfekt) : Der Bus __________ __________.$kt$, $kt$ist angekommen$kt$, array[$kt$ist angekommen$kt$]::text[], $kt$ist angekommen$kt$),
  (6, 4, $kt$Mettez ces mêmes phrases au Parfait (Perfekt) : Ich __________ meine Hausaufgaben __________.$kt$, $kt$habe beendet$kt$, array[$kt$habe beendet$kt$]::text[], $kt$habe beendet.$kt$),
  (6, 5, $kt$Consigne : Rédigez un court message de 6 lignes destiné à Mia pour confirmer l’heure de votre visite. Intégrez au moins un verbe séparable (ankommen ou vorbeikommen) et un verbe inséparable (besichtigen). Entraînez-vous ensuite à le déclamer de manière fluide à voix haute en veillant au rejet de la particule séparable en fin de phrase.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (7, 1, $kt$Choisissez entre l’Accusatif et le Datif selon le contexte : Wir gehen in __________ (die) Küche. (Wohin ?)$kt$, $kt$die Küche$kt$, array[$kt$die Küche$kt$]::text[], $kt$die Küche (Accusatif féminin – directionnel).$kt$),
  (7, 2, $kt$Choisissez entre l’Accusatif et le Datif selon le contexte : Die Tasse steht auf __________ (der) Tisch. (Wo ?)$kt$, $kt$dem Tisch$kt$, array[$kt$dem Tisch$kt$]::text[], $kt$dem Tisch (Datif masculin – locatif).$kt$),
  (8, 1, $kt$Répondez aux questions d’après les annonces de la gare : Welcher Zug hat heute eine Verspätung von 20 Minuten ? __________$kt$, $kt$Der Regionalexpress nach Stuttgart$kt$, array[$kt$Der Regionalexpress nach Stuttgart$kt$]::text[], $kt$Der Regionalexpress nach Stuttgart.$kt$),
  (8, 2, $kt$Répondez aux questions d’après les annonces de la gare : Was passiert mit dem Zug nach Hamburg ? __________$kt$, $kt$Er hat einen Gleiswechsel und fährt heute von Gleis 11 statt Gleis 9 ein$kt$, array[$kt$Er hat einen Gleiswechsel und fährt heute von Gleis 11 statt Gleis 9 ein$kt$]::text[], $kt$Er hat einen Gleiswechsel und fährt heute von Gleis 11 statt Gleis 9 ein.$kt$),
  (9, 1, $kt$Complétez avec le verbe adéquat (legen / liegen / stellen / stehen) au présent : Der Koffer __________ in der Ecke neben der Tür. (Position fixe).$kt$, $kt$steht$kt$, array[$kt$steht$kt$]::text[], $kt$steht (position verticale d’un objet lourd)$kt$),
  (9, 2, $kt$Complétez avec le verbe adéquat (legen / liegen / stellen / stehen) au présent : Ich __________ die Blumen in eine Vase auf den Tisch. (Mouvement).$kt$, $kt$stelle$kt$, array[$kt$stelle$kt$]::text[], $kt$stelle (action de placer).$kt$),
  (9, 3, $kt$Consigne : Un touriste égaré vous demande comment se rendre à la gare centrale. Prenez la parole à voix haute pendant 2 minutes pour le guider. Utilisez des impératifs et des verbes de mouvement à particule séparable (abbiegen, weitergehen) : Gehen Sie geradeaus, biegen Sie an der Kreuzung rechts ab, und am Ende sehen Sie den Bahnhof.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (10, 1, $kt$Reliez les éléments en utilisant le connecteur double indiqué : Ich mag Kaffee. Ich mag Tee. (sowohl ... als auch) → Ich mag __________ Kaffee __________ Tee.$kt$, $kt$sowohl Kaffee als auch Tee$kt$, array[$kt$sowohl Kaffee als auch Tee$kt$]::text[], $kt$... sowohl Kaffee als auch Tee.$kt$),
  (10, 2, $kt$Reliez les éléments en utilisant le connecteur double indiqué : Er raucht nicht. Er trinkt keinen Alkohol. (weder ... noch) → Er trinkt __________ Alkohol __________ raucht er.$kt$, $kt$weder Alkohol noch raucht er$kt$, array[$kt$weder Alkohol noch raucht er$kt$]::text[], $kt$... weder Alkohol noch raucht er (ou : ... weder Alkohol noch Zigaretten).$kt$),
  (11, 1, $kt$(Lecture) Répondez par Richtig (Vrai) ou Falsch (Faux) : Markus Schmidt arbeitet heute in einer großen Marketingagentur. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Il est indépendant)$kt$),
  (11, 2, $kt$(Lecture) Répondez par Richtig (Vrai) ou Falsch (Faux) : Sein neues Büro befindet sich in der Nähe einer Grünfläche. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (À côté du parc).$kt$),
  (11, 3, $kt$(Écoute) Répondez à la question d’après le message vocal : Welches Problem ist gestern auf der Webseite der Firma Logix aufgetreten ? ____________________$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (12, 1, $kt$Consigne : Rédigez un courriel de 10 à 12 lignes à un ami allemand (Lieber... / Liebe...). Racontez votre récente installation ou vos projets professionnels. Vous devez obligatoirement intégrer : un parfait avec sein, un parfait avec haben, une inversion syntaxique, deux adjectifs épithètes déclinés, un connecteur double et une subordonnée avec weil.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (12, 2, $kt$Consigne : En vous basant sur la trame de votre texte écrit, détachez-vous de vos notes et présentez votre situation à voix haute durant 3 minutes continues. Veillez scrupuleusement au rejet du verbe conjugué dans les subordonnées et à placer correctement vos particules séparables en fin de proposition.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (13, 1, $kt$Transformez les énoncés réels de l’indicatif au Konjunktiv II du souhait : Ich habe kein Geld. → Ich __________ gerne Geld !$kt$, $kt$hätte$kt$, array[$kt$hätte$kt$]::text[], $kt$hätte (forme simple de haben)$kt$),
  (13, 2, $kt$Transformez les énoncés réels de l’indicatif au Konjunktiv II du souhait : Ich wohne nicht in Deutschland. → Ich __________ gerne in Deutschland __________. (wohnen)$kt$, $kt$würde / wohnen$kt$, array[$kt$würde / wohnen$kt$, $kt$würde wohnen$kt$]::text[], $kt$würde / wohnen (forme com- posée).$kt$),
  (14, 1, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le script audio : Leon muss neben seinem Studium arbeiten, um sein WG-Zimmer zu bezahlen. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Il bénéficie d’une bourse : Ich habe ein Stipendium bekom- men).$kt$),
  (14, 2, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le script audio : Er plant, nach elfte Woche eventuell einen Master zu machen. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (C’est son intention si ses notes le lui permettent).$kt$),
  (15, 1, $kt$Traduisez les recommandations suivantes en utilisant sollten ou solltest : Tu devrais postuler pour une bourse d’études. → Du __________ dich für ein Stipendium bewerben.$kt$, $kt$solltest$kt$, array[$kt$solltest$kt$]::text[], $kt$solltest (tutoiement)$kt$),
  (15, 2, $kt$Traduisez les recommandations suivantes en utilisant sollten ou solltest : Vous devriez (vouvoiement) visiter la bibliothèque universitaire. → Sie __________ die Universitätsbibliothek besuchen.$kt$, $kt$sollten$kt$, array[$kt$sollten$kt$]::text[], $kt$sollten (vouvoiement de politesse).$kt$),
  (15, 3, $kt$Consigne : Un ami proche vient d’échouer à un examen important à la faculté. Prenez la parole à voix haute pendant 2 minutes continues pour simuler une conversation de soutien. Utilisez obligatoirement des tournures atténuées avec solltest et formulez une hypothèse : Wenn ich du wäre, würde ich mit dem Professor sprechen. Du solltest den Kurs noch einmal wiederholen. Soignez le positionnement des verbes terminaux.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (16, 1, $kt$Complétez avec le pronom relatif correct : Wie heißt die Studentin, __________ neben Leon sitzt ? (Sujet Fém)$kt$, $kt$die$kt$, array[$kt$die$kt$]::text[], $kt$die$kt$),
  (16, 2, $kt$Complétez avec le pronom relatif correct : Das ist das neue Smartphone, __________ ich gekauft habe. (COD Neutre)$kt$, $kt$das$kt$, array[$kt$das$kt$]::text[], $kt$das$kt$),
  (17, 1, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le débat radio : Dr. Weber findet, dass soziale Medien für Jugendliche absolut verboten werden sollten. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Il parle plutôt de fixer des limites).$kt$),
  (17, 2, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le débat radio : Das Smartphone wird von Jugendlichen fast ununterbrochen genutzt. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (Il indique qu’ils l’ont constamment en main).$kt$),
  (18, 1, $kt$Fusionnez ces deux phrases simples en une phrase complexe contenant une proposition relative : Phrase A : Das ist die neue App. Phrase B : Ich arbeite täglich mit dieser App. → Das ist die neue App, mit __________ ich täglich __________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ... mit der ich täglich arbeite. (mit exige le datif, die App se décline en der au datif féminin, le verbe conjugué est rejeté à la fin).$kt$),
  (18, 2, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes décrivant un outil numérique ou une application logicielle essentielle à votre quotidien. Vous devez intégrer au least une relative au nominatif, une à l’accusatif, une au datif introduite par une préposition (mit, in, auf ), et employer le vocabulaire des médias du cours précédent.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (18, 3, $kt$Consigne : En vous basant sur votre texte écrit, présentez cet objet ou cette application à voix haute pendant 2 minutes en continu sans jamais prononcer son nom, comme pour le faire deviner à un interlocuteur. Exemple de structure orale à utiliser : Das ist ein Tool, mit dem ich täglich arbeite und das ich auf mein Smartphone heruntergeladen habe... Soignez le rejet absolu du verbe conjugué à la fin de la relative.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (19, 1, $kt$Choisissez entre um... zu et damit selon la logique des sujets : Er spart Geld, __________ ein neues Auto __________ kaufen. (Même sujet)$kt$, $kt$um / zu$kt$, array[$kt$um / zu$kt$, $kt$um zu$kt$]::text[], $kt$um / zu$kt$),
  (19, 2, $kt$Choisissez entre um... zu et damit selon la logique des sujets : Ich schicke dir die Datei, __________ du sie __________. (lesen – Sujets différents)$kt$, $kt$damit / liest$kt$, array[$kt$damit / liest$kt$, $kt$damit liest$kt$]::text[], $kt$damit / liest (le verbe s’accorde avec du et va à la fin).$kt$),
  (20, 1, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le script de l’entretien : Herr Müller sucht eine Arbeit, bei der er nur halbtags arbeiten muss. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Il cherche un poste à temps plein : eine Vollzeitstelle).$kt$),
  (20, 2, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le script de l’entretien : Er hat bereits Erfahrung in der Leitung von Projekten gesammelt. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (Il affirme : Ich habe Projekte geleitet).$kt$),
  (21, 1, $kt$Complétez la phrase suivante en traduisant les éléments entre parenthèses : Ich bewerbe mich um diese Stelle, __________ neue Herausforderungen __________ __________. (pour relever de nouveaux défis – verbe séparable : Herausforderungen annehmen).$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ... um neue Herausforderungen anzunehmen. (Pour les verbes sé- parables à l’infinitif, la particule zu s’intercale obligatoirement entre le préfixe et la base verbale).$kt$),
  (21, 2, $kt$Consigne : Rédigez le corps d’une lettre de motivation formelle de 8 à 10 lignes pour postuler au poste de votre choix. Vous devez obligatoirement intégrer : une structure de but avec um... zu, une structure avec damit, une forme de continuité au présent avec seit, et mobiliser le vocabulaire professionnel acquis au cours précédent.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (21, 3, $kt$Consigne : Enregistrez-vous ou placez-vous face à un miroir pour simuler votre entretien. Répondez de manière fluide et dynamique aux questions suivantes à voix haute pendant 3 minutes au total : 1. Warum bewerben Sie sich um diese Stelle ? 2. Welche Berufserfahrung bringen Sie mit ? 3. Warum sollten wir gerade Sie einstellen ? Soignez le positionnement du verbe conjugué lors des justifications et utilisez le conditionnel de politesse pour valoriser vos compétences.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (22, 1, $kt$Remplissez avec la préposition correcte et déclinez l’article au cas requis : Sie freut sich __________ __________ (die) Geburtstagsparty von morgen.$kt$, $kt$auf die$kt$, array[$kt$auf die$kt$]::text[], $kt$auf die (Événement futur → Akkusativ féminin).$kt$),
  (22, 2, $kt$Remplissez avec la préposition correcte et déclinez l’article au cas requis : Er träumt __________ __________ (ein) neuen Auto.$kt$, $kt$von einem$kt$, array[$kt$von einem$kt$]::text[], $kt$von einem (Le verbe träumen régit le Dativ masculin).$kt$),
  (23, 1, $kt$(Lecture) Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le texte : Laut Text würden mehr Jugendliche studieren, wenn das Studium praxisorientierter wäre. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Le texte mentionne la flexibilité administra- tive et non l’orientation pratique : wenn die Universitäten flexibler wären).$kt$),
  (23, 2, $kt$(Écoute) Répondez aux questions d’après le script audio : Welchen Vorteil nennt Herr Meyer für das Homeoffice ? __________$kt$, $kt$Er verschwendet keine Zeit im Stau$kt$, array[$kt$Er verschwendet keine Zeit im Stau$kt$]::text[], $kt$Er verschwendet keine Zeit im Stau (Il ne perd pas de temps dans les bouchons)$kt$),
  (23, 3, $kt$(Écoute) Répondez aux questions d’après le script audio : Was befürchtet Herr Müller, wenn alle Mitarbeiter im Homeoffice arbeiten ? __________$kt$, $kt$Er befürchtet, dass die Kommunikation schwieriger wird$kt$, array[$kt$Er befürchtet, dass die Kommunikation schwieriger wird$kt$]::text[], $kt$Er befürchtet, dass die Kommunikation schwieriger wird (Il craint une dégradation de la communication d’équipe).$kt$),
  (24, 1, $kt$Consigne : Rédigez un paragraphe d’argumentation de 10 à 12 lignes sur le thème : Vor- und Nachteile des Homeoffices (Avantages et inconvénients du télétravail). Vous devez obligatoirement y intégrer : au moins deux verbes à prépositions fixes (denken an, sich freuen auf, sprechen mit), une structure conditionnelle complète au Konjunktiv II (wenn... wäre/hätte, würde...) et des connecteurs logiques de transition (einerseits... andererseits, zudem, jedoch).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (24, 2, $kt$Consigne : Imaginez que vous présentez votre point de vue lors d’une réunion officielle devant Frau König. Détachez-vous complètement de vos notes manuscrites et prenez la parole à voix haute de manière ferme, articulée et fluide pendant 3 minutes continues. Structurez votre pitch en trois phases distinctes : introduction du sujet, balance d’un argument favorable versus une objection (en employant des relatives complexes), puis conclusion sous forme de proposition de compromis hybride.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (25, 1, $kt$Transformez l’énoncé actif en phrase passive au présent : Ein Mechaniker prüft den Motor. → Der Motor __________ von einem Mechaniker __________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : wird / geprüft (Masculin singulier Nominativ au passif).$kt$),
  (25, 2, $kt$Transposez l’énoncé suivant au passif parfait (Perfekt Passiv) : Das Projekt wird beendet. → Das Projekt __________ beendet __________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ist / worden (L’auxiliaire du passé composé passif est toujours sein).$kt$),
  (26, 1, $kt$Répondez aux questions d’après l’écoute du spot publicitaire : Wo wird das neue intelligente Heim-System hergestellt ? __________$kt$, $kt$Es wird komplett in Deutschland hergestellt$kt$, array[$kt$Es wird komplett in Deutschland hergestellt$kt$]::text[], $kt$Es wird komplett in Deutschland hergestellt.$kt$),
  (26, 2, $kt$Répondez aux questions d’après l’écoute du spot publicitaire : Um wie viel Prozent ist der Verbrauch des Kunden reduziert worden ? __________$kt$, $kt$Der Verbrauch ist um 30 Prozent reduziert worden$kt$, array[$kt$Der Verbrauch ist um 30 Prozent reduziert worden$kt$]::text[], $kt$Der Verbrauch ist um 30 Prozent reduziert worden.$kt$),
  (27, 1, $kt$Transformez cette suite d’actions actives en étapes de processus passif au présent : Wir informieren die Kunden. → Zuerst __________ die Kunden __________.$kt$, $kt$werden / informiert$kt$, array[$kt$werden / informiert$kt$, $kt$werden informiert$kt$]::text[], $kt$werden / informiert (Attention à l’accord pluriel avec die Kunden)$kt$),
  (27, 2, $kt$Transformez cette suite d’actions actives en étapes de processus passif au présent : Wir verkaufen das Produkt. → Danach __________ das Produkt __________.$kt$, $kt$wird / verkauft$kt$, array[$kt$wird / verkauft$kt$, $kt$wird verkauft$kt$]::text[], $kt$wird / verkauft (Singulier).$kt$),
  (27, 3, $kt$Consigne : Rédigez un court rapport professionnel de 6 à 8 lignes décrivant la trajectoire d’un produit commercial, de sa conception usinée à sa distribution finale. Vous devez obligatoirement employer au moins deux structures passives au présent, une structure passive au parfait$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (27, 4, $kt$Consigne : Imaginez que vous présentez ce processus d’ingénierie lors d’une réunion stratégique devant des partenaires germanophones. Détachez-vous de vos notes manuscrites et prenez la parole à voix haute pendant 2 minutes en continu. Structurez votre flux de manière mé- thodique : Zuerst wird die Idee entwickelt. Danach wird das Produkt in der Fabrik hergestellt. Schließlich wird das fertige Produkt an die Verbraucher geliefert... Soignez l’intonation descendante sur le participe passé.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (28, 1, $kt$Déclinez les éléments au génitif après la préposition requise : Wegen __________ __________ (der / Klimawandel) müssen wir sofort handeln.$kt$, $kt$des Klimawandels$kt$, array[$kt$des Klimawandels$kt$]::text[], $kt$des Klimawandels (Masculin singulier au génitif, ajout du -s).$kt$),
  (28, 2, $kt$Déclinez les éléments au génitif après la préposition requise : Trotz __________ __________ (das / Problem) haben wir das Ziel erreicht.$kt$, $kt$des Problems$kt$, array[$kt$des Problems$kt$]::text[], $kt$des Problems (Neutre singulier au génitif, ajout du -s).$kt$),
  (29, 1, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après la chronique écoutée : Die Energiewende in Deutschland wird trotz der finanziellen Kosten fortgesetzt. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (L’expert confirme : Trotz der hohen Kosten müssen wir investieren).$kt$),
  (29, 2, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après la chronique écoutée : Der CO2-Ausstoß spielt in der aktuellen Politik keine wichtige Rolle mehr. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Le présentateur rappelle qu’il s’agit de l’objectif prioritaire : das wichtigste Ziel).$kt$),
  (30, 1, $kt$Transposez la proposition subordonnée causale (B1) en un groupe nominal condensé (Style nominal B2) : Forme verbale (B1) : Weil die Industrie viel verschwendet, ... Forme nominale (B2) : Wegen __________ großen __________ (die Verschwendung) der Industrie, ...$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ... Wegen der großen Verschwendung der Industrie... (La pré- position wegen exige le génitif, die Verschwendung se décline donc en der au féminin singulier).$kt$),
  (30, 2, $kt$Consigne d’écriture : Rédigez un court manifeste écologiste de 6 à 8 lignes pour promouvoir le tri des déchets et les éco-gestes au sein de votre entreprise. Vous devez obligatoirement intégrer : deux compléments du nom au génitif, deux prépositions régies par le génitif (wegen et trotz), et mobiliser quatre termes du lexique de l’environnement.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (30, 3, $kt$Consigne : Imaginez que vous devez sensibiliser votre équipe lors d’un séminaire d’entreprise dédié au développement durable. Sans lire vos notes manuscrites, improvisez un plaidoyer dynamique de 2 minutes en continu à voix haute. Appuyez-vous sur des structures denses introduites par des prépositions au génitif placées en position 1 pour créer un effet de style oratoire soutenu : Trotz der wirtschaftlichen Schwierigkeiten müssen wir den Umweltschutz priorisieren... Soignez l’inversion sujet-verbe qui en découle immédiatement.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (31, 1, $kt$Transformez la phrase suivante au présent en une supposition au Futur I en insérant l’adverbe wohl : Sarah arbeitet viel. → Sarah __________ wohl viel __________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : wird / arbeiten (Structure de supposition sur le présent).$kt$),
  (31, 2, $kt$Complétez l’énoncé prospectif avec l’auxiliaire correct : Im nächsten Jahrzehnt __________ die Städte grüner werden.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : werden (Sujet au pluriel : die Städte).$kt$),
  (32, 1, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après l’écoute de l’audioguide : Das beschriebene Meisterwerk stammt gesichert aus dem 21. Jahrhundert. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (L’audioguide émet une supposition sur le début du 20e siècle : im frühen zwanzigsten Jahrhundert gemalt worden sein).$kt$),
  (32, 2, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après l’écoute de l’audioguide : Die aktuelle Kunstausstellung zieht viele Besucher an. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (Le texte précise que la galerie est très fréquentée : sehr gut besucht).$kt$),
  (33, 1, $kt$Traduisez l’hypothèse suivante en allemand en mobilisant la structure du Futur I et l’adverbe wahrscheinlich : L’artiste est probablement en train de peindre un nouveau tableau. → Der Künstler __________ wahrscheinlich ein neues Bild __________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ... wird wahrscheinlich ein neues Bild malen. (L’utilisation du Futur I combinée à un adverbe est la tournure privilégiée en niveau B2 pour exprimer une forte probabilité présente).$kt$),
  (33, 2, $kt$Consigne : Rédigez un paragraphe d’anticipation de 8 à 10 lignes décrivant l’évolution du monde de la culture et des musées face à la numérisation et à l’intelligence artificielle d’ici les trente prochaines années. Vous devez obligatoirement intégrer : au moins trois structures de Futur I à valeur d’avenir, deux structures de Futur I à valeur de supposition présente (avec wohl), et deux compléments du nom déclinés au cas du génitif.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (33, 3, $kt$Consigne : Imaginez que vous êtes invité en tant qu’expert à un débat sur l’avenir des institutions culturelles en Allemagne. Sans lire vos notes manuscrites, prenez la parole à voix haute pendant 2 minutes et 30 secondes en continu. Formulez vos hypothèses avec clarté en veillant au rejet systématique de l’infinitif final après werden : In der Zukunft werden die Menschen Museen anders erleben. Die Technologie wird wohl eine zentrale Rolle spielen...$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (34, 1, $kt$Fusionnez les deux énoncés en une structure infinitive complexe : Er surft im Internet. Er arbeitet nicht. (anstatt ... zu) → __________ im Internet __________ __________, arbeitet er nicht.$kt$, $kt$Anstatt im Internet zu surfen, arbeitet er nicht$kt$, array[$kt$Anstatt im Internet zu surfen, arbeitet er nicht$kt$]::text[], $kt$Anstatt im Internet zu surfen, arbeitet er nicht.$kt$),
  (34, 2, $kt$Fusionnez les deux énoncés en une structure infinitive complexe : Sie hat die Prüfung bestanden. Sie hat nicht viel gelernt. (ohne ... zu) → Sie hat die Prüfung bestanden, __________ viel __________ __________.$kt$, $kt$Sie hat die Prüfung bestanden, ohne viel zu lernen$kt$, array[$kt$Sie hat die Prüfung bestanden, ohne viel zu lernen$kt$]::text[], $kt$Sie hat die Prüfung bestanden, ohne viel zu lernen.$kt$),
  (35, 1, $kt$(Lecture) Répondez par Richtig (Vrai) ou Falsch (Faux) d’après l’article de presse : Die Gewerkschaften haben den Trend zur Automatisierung von Anfang an unterstützt. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Le texte mentionne une opposition initiale des syndicats : Trotz der anfänglichen Kritik der Gewerkschaften).$kt$),
  (35, 2, $kt$(Écoute) Répondez à la question d’après le flash info radiophonique : Was wird ab nächstem Jahr auf öffentlichen Gebäuden stark gefördert ? ____________________$kt$, $kt$Der Bau von Solaranlagen$kt$, array[$kt$Der Bau von Solaranlagen$kt$]::text[], $kt$Der Bau von Solaranlagen (La construction de panneaux/installations solaires).$kt$),
  (36, 1, $kt$Consigne : En vous appuyant sur l’article économique du cours 35 et sur le script du flash info, rédigez une note de synthèse cohérente de 10 à 12 lignes résumant les défis croisés (économiques, climatiques et technologiques) de la société allemande actuelle. Vous devez obli- gatoirement intégrer : au moins une structure passive au présent ou au passé, une structure infinitive complexe (ohne/anstatt... zu), deux prépositions au génitif (wegen et trotz), et une conjecture formulée au Futur I avec l’adverbe wohl.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (36, 2, $kt$Consigne : Imaginez que vous devez débriefer un cadre supérieur germanophone de votre entreprise sur la dynamique socio-écologique en Allemagne. Sans regarder vos notes de travail, prenez la parole à voix haute de manière synthétique et percutante pendant exactement 2 minutes (chronométré). Amorcez votre discours par le fait principal à la voix passive : Heute wurde ein neues Gesetz verabschiedet... Articulez clairement vos conclusions en soignant le rythme.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (37, 1, $kt$Reliez les énoncés en utilisant le connecteur concessif demandé : Das Wetter ist schlecht. Er geht im Park spazieren. (obwohl) → Er geht im Park spazieren, __________ das Wetter schlecht __________.$kt$, $kt$obwohl das Wetter schlecht ist$kt$, array[$kt$obwohl das Wetter schlecht ist$kt$]::text[], $kt$... obwohl das Wetter schlecht ist. (Le verbe conjugué va à la fin).$kt$),
  (37, 2, $kt$Reliez les énoncés en utilisant le connecteur concessif demandé : Das Wetter ist schlecht. Er geht im Park spazieren. (trotzdem) → Das Wetter ist schlecht. __________ __________ er im Park spazieren.$kt$, $kt$Trotzdem geht er im Park spazieren$kt$, array[$kt$Trotzdem geht er im Park spazieren$kt$]::text[], $kt$... Trotzdem geht er im Park spazieren. (Inversion obligatoire après l’adverbe).$kt$),
  (38, 1, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après l’écoute du podcast : Dr. Keller behauptet, dass gestresste Menschen sofort beim ersten Symptom zum Arzt gehen. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Il souligne au contraire qu’ils ont tendance à ignorer les alertes du corps : trotzdem ignorieren sie die Symptome).$kt$),
  (38, 2, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après l’écoute du podcast : Durch eine gezielte Prävention lassen sich viele chronische Krankheiten verhindern. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (Il affirme qu’elle joue un rôle capital pour éviter le développement des pa- thologies : Krankheiten frühzeitig vermeiden).$kt$),
  (39, 1, $kt$Complétez la phrase type de description statistique en traduisant les verbes requis : Die Grafik __________ (montre), dass die Zahl der chronischen Krankheiten weltweit kontinuierlich __________ (augmente).$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ... zeigt ..., dass die Zahl der chronischen Krankheiten weltweit kontinuierlich steigt (ou zunimmt). (La conjonction de subordination dass rejette le verbe conjugué à la toute fin de la proposition complétive).$kt$),
  (39, 2, $kt$Consigne d’écriture : Rédigez un compte-rendu analytique de 6 à 8 lignes pour commenter un graphique d’actualité mettant en évidence l’évolution croissante des budgets de santé publique alloués aux maladies de civilisation. Vous devez intégrer : un connecteur de concession (obwohl ou trotzdem), la structure double zwar... aber, et mobiliser quatre notions issues du lexique médical du cours précédent.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (39, 3, $kt$Consigne : Imaginez que vous devez soutenir ces résultats quantitatifs lors d’un rapport budgétaire devant un comité de direction germanophone. Sans lire vos notes de travail, prenez la parole à voix haute pendant 2 minutes et 30 secondes en continu. Structurez vos transitions de manière académique : Die Grafik zeigt anschaulich die Entwicklung... Es ist eine steigende Tendenz zu beobachten... Obwohl die Kosten steigen, investieren wir zu wenig... Soignez l’inversion syntaxique après vos compléments d’introduction.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (40, 1, $kt$Transposez l’énoncé direct au discours indirect en utilisant le Konjunktiv I : Die Sprecherin sagt : Wir haben eine Lösung. → Die Sprecherin sagt, sie __________ eine Lösung.$kt$, $kt$hätten$kt$, array[$kt$hätten$kt$]::text[], $kt$hätten (La forme régulière haben étant homonyme de l’indica- tif, on bascule au Konjunktiv II par substitution)$kt$),
  (40, 2, $kt$Transposez l’énoncé direct au discours indirect en utilisant le Konjunktiv I : Der Präsident betont : Die Zusammenarbeit ist wichtig. → Der Präsident betont, die Zusammenarbeit __________ wichtig.$kt$, $kt$sei$kt$, array[$kt$sei$kt$]::text[], $kt$sei (Forme pure et singulière du Konjunktiv I ).$kt$),
  (41, 1, $kt$Répondez aux questions d’après l’écoute du rapport de la conférence de presse : Was ist laut Minister der einzige Weg nach vorn ? __________$kt$, $kt$Die europäische Integration sei der einzige Weg$kt$, array[$kt$Die europäische Integration sei der einzige Weg$kt$]::text[], $kt$Die europäische Integration sei der einzige Weg.$kt$),
  (41, 2, $kt$Répondez aux questions d’après l’écoute du rapport de la conférence de presse : Warum sollten die Bürger laut Minister mehr Rechte erhalten ? __________$kt$, $kt$Damit die Demokratie gestärkt werde$kt$, array[$kt$Damit die Demokratie gestärkt werde$kt$]::text[], $kt$Damit die Demokratie gestärkt werde (Pour que la démocratie soit consolidée).$kt$),
  (42, 1, $kt$Transposez la déclaration politique directe suivante au discours indirect B2, sans utiliser la conjonction dass : Déclaration : Der Politiker verspricht : Ich werde die Steuern senken. Style indirect B2 : Der Politiker verspricht, er __________ die Steuern __________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ... er werde die Steuern senken. (Dans le style indirect formel sans dass, le verbe à l’infinitif occupe la dernière position absolue tandis que l’auxiliaire conjugué au Konjunktiv I prend la deuxième position de la proposition subordonnée intégrée).$kt$),
  (42, 2, $kt$Consigne : Rédigez une note de synthèse ou une dépêche de presse de 6 à 8 lignes résumant avec la plus stricte neutralité les déclarations de la porte-parole du cours précédent. Vous devez impérativement intégrer : au moins trois formes distinctes de Konjunktiv I (sei, habe, werde), insérer une clause concessive (obwohl ou trotzdem), et mobiliser quatre notions du lexique des institutions politiques.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (42, 3, $kt$Consigne : Imaginez que vous êtes correspondant permanent à Bruxelles pour un grand média télévisuel. Sans regarder vos notes de travail, prenez la parole face caméra à voix haute pendant 2 minutes et 30 secondes en continu. Structurez votre allocution de manière journalistique : Die Sprecherin erklärte heute, die Verhandlungen seien... Sie fügte hinzu, dass die Mitgliedstaaten enger zusammenarbeiten müssten... Laut Bericht wolle man die Demokratie durch Bürgerbeteiligung stärken... Assurez un débit fluide et constant.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (43, 1, $kt$Ajoutez la terminaison correcte à l’adjectif substantivé selon le cas : In diesem Unternehmen arbeiten viele __________ (Angestellt – pluriel kuat).$kt$, $kt$Angestellte$kt$, array[$kt$Angestellte$kt$]::text[], $kt$Angestellte (Pluriel après l’indéfini viele, déclinaison forte sans article)$kt$),
  (43, 2, $kt$Ajoutez la terminaison correcte à l’adjectif substantivé selon le cas : Ich habe gestern etwas __________ (Interessant) im Radio gehört.$kt$, $kt$Interessantes$kt$, array[$kt$Interessantes$kt$]::text[], $kt$Interessantes (Déclinaison nominale neutre après etwas).$kt$),
  (44, 1, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le rapport écouté : In der Schweiz wird die orthografische Regel des Eszet (SS) wie in Berlin angewendet. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (La Suisse alémanique a totalement banni le SS de son orthographe officielle au profit du double ss).$kt$),
  (44, 2, $kt$Répondez par Richtig (Vrai) ou Falsch (Faux) d’après le rapport écouté : Das Wort Jänner ist eine typische Variante, die man in Österreich für den ersten Monat des Jahres nutzt. __________$kt$, $kt$Richtig$kt$, array[$kt$Richtig$kt$]::text[], $kt$Richtig (Il s’agit d’un exemple classique d’austriacisme lexical).$kt$),
  (45, 1, $kt$Traduisez la structure nominalisée suivante en allemand formel de niveau B2 : Le plus important est le respect de la diversité culturelle. → Das __________ (Wichtigst) ist der Respekt vor der kulturellen Vielfalt.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ... Das Wichtigste ist... (L’adjectif au superlatif est substantivé au genre neutre singulier et prend la majuscule. Placé au Nominativ après l’article défini das, sa terminaison faible est -e).$kt$),
  (45, 2, $kt$Consigne : Rédigez un paragraphe d’essai critique de 10 à 12 lignes sur le thème suivant : Sollte man im Sprachunterricht nur das Standarddeutsch lernen oder auch regionale Varianten beachten ? (Devrait-on apprendre uniquement l’allemand standard ou s’ouvrir aux variantes régionales ?). Vous devez obligatoirement intégrer : au moins deux adjectifs substantivés (etwas Wichtiges, das Neue, das Beste), un connecteur de concession avancé (obwohl ou zwar... aber), et mobiliser le lexique thématique de l’espace pluricentrique (die kulturelle Vielfalt, der Sprachraum).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (45, 3, $kt$Consigne : Imaginez que vous soutenez votre point de vue lors d’une table ronde universitaire ou d’une épreuve de certification B2 supérieure. Sans regarder vos notes de travail, prenez la parole à voix haute de manière fluide, rythmée et convaincante pendant 3 minutes continues. Structurez votre monologue en valorisant les concepts abstraits : Der deutsche Sprachraum bietet eine enorme kulturelle Vielfalt. Es ist zwar wichtig, das Hochdeutsch zu beherrschen, aber man sollte auch das Neue kennenlernen...$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (46, 1, $kt$Corrigez la faute de syntaxe dans la phrase suivante : Falsch : Weil ich habe keine Zeit, kann ich heute nicht kommen. → Richtig : __________________________________________________________$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Weil ich keine Zeit habe, kann ich heute nicht kommen. (La conjonction weil exige le rejet du verbe conjugué habe à la fin de sa proposition).$kt$),
  (47, 1, $kt$(Lecture) Répondez par Richtig (Vrai) ou Falsch (Faux) : Laut Text führt die Automatisierung dazu, dass menschliche Kreativität an Bedeutung verliert. __________$kt$, $kt$Falsch$kt$, array[$kt$Falsch$kt$]::text[], $kt$Falsch (Le texte précise qu’elle reste le bien le plus précieux : bleibt das wichtigste Gut).$kt$),
  (47, 2, $kt$(Écoute) Répondez à la question d’après le script audio : Was wurde laut Präsentator heute in Berlin vorgestellt ? ____________________$kt$, $kt$Der Abschlussbericht zur Bürgerbeteiligung$kt$, array[$kt$Der Abschlussbericht zur Bürgerbeteiligung$kt$]::text[], $kt$Der Abschlussbericht zur Bürgerbeteiligung (Le rapport final sur la participation citoyenne).$kt$),
  (48, 1, $kt$Consigne : Sélectionnez un grand sujet de société parmi ceux traités dans les blocs précédents (la transition énergétique, l’impact des réseaux sociaux ou l’évolution du télétravail). Prenez la parole à voix haute de manière autonome pendant 3 minutes complètes en continu. Vous devez valider l’intégration fluide de connecteurs concessifs (obwohl, zwar... aber), de structures nominales au génitif (wegen, trotz) et assurer un débit constant sans coupure artificielle.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$)
) as x(course_number, pos, prompt, expected, accepted, explanation)
join public.language_courses c
  on c.language = 'Allemand' and c.course_number = x.course_number;

commit;

-- Contrôle (à lancer après) : doit afficher 48 cours et 113 exercices du manuel
-- select count(*) from public.language_courses where language = 'Allemand';
-- select count(*) from public.language_exercises e join public.language_courses c on c.id = e.course_id
--   where c.language = 'Allemand' and e.origin = 'manual';
