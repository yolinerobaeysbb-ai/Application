-- Keltia : contenu réel du Récap (alphabet, vocabulaire, règles, déclinaisons, conjugaisons) pour les 7 langues.
-- Source : théorie des cours issus des manuels PDF (migrations 029 à 035) + tableaux d'écriture (kana, hangeul, consonnes thaïes).
-- Relançable sans risque : les sections générées (data.source = 'manuel_pdf') sont recréées ; les sections ajoutées par l'admin sont conservées.

begin;

delete from public.language_recap_sections where data->>'source' = 'manuel_pdf';

-- Anciennes sections vides (textes provisoires des migrations 014)
delete from public.language_recap_sections
where (title = 'Alphabet et système d’écriture' and section_type = 'alphabet')
   or (title = 'Règles essentielles' and content like 'Ce récapitulatif suit le manuel%')
   or (title = 'Vocabulaire des 16 semaines' and content like 'Retrouvez ici les mots%')
   or (title in ('Tableaux de déclinaisons', 'Tableaux de conjugaison') and content like 'Les tableaux détaillés%');

insert into public.language_recap_sections (language, section_type, title, content, data, position)
values
  ('Allemand', 'alphabet', $kt$Alphabet et prononciation$kt$, $kt$Alphabet latin de 26 lettres + ä, ö, ü et ß (« eszett », son [s] long).$kt$, $kt${"source":"manuel_pdf","table":{"headers":["Graphie","Son","Exemple"],"rows":[["ch","[ç] après e/i, [x] après a/o/u","ich, Buch"],["sch","[ʃ] comme « ch » français","Schule"],["z","[ts]","Zeit"],["v","[f] (mots germaniques)","Vater"],["w","[v]","Wasser"],["s + voyelle","[z]","Sonne"],["ei","[aɪ]","nein"],["ie","[iː] long","Liebe"],["eu / äu","[ɔʏ]","neu, Häuser"],["ä / ö / ü","[ɛ] / [ø] / [y]","Mädchen, schön, Tür"]]}}$kt$::jsonb, 0),
  ('Allemand', 'declension', $kt$Articles définis aux quatre cas$kt$, $kt$Le cas (Nominativ, Akkusativ, Dativ, Genitiv) change l’article et la terminaison de l’adjectif. Au datif pluriel, le nom prend un -n (den Kindern).$kt$, $kt${"source":"manuel_pdf","table":{"headers":["Cas","Masculin","Féminin","Neutre","Pluriel"],"rows":[["Nominativ","der","die","das","die"],["Akkusativ","den","die","das","die"],["Dativ","dem","der","dem","den"],["Genitiv","des (+ s)","der","des (+ s)","der"]]}}$kt$::jsonb, 0),
  ('Néerlandais', 'alphabet', $kt$Alphabet et prononciation$kt$, $kt$Alphabet latin de 26 lettres. Les graphies ci-dessous sont les plus piégeuses pour un francophone.$kt$, $kt${"source":"manuel_pdf","table":{"headers":["Graphie","Son","Exemple"],"rows":[["g / ch","[x] fricative gutturale","goed, acht"],["ij / ei","[ɛi]","tijd, trein"],["ui","[œy]","huis"],["ou / au","[ɑu]","koud, auto"],["eu","[ø]","deur"],["oe","[u]","boek"],["sch","[sx]","school"],["w","[ʋ] entre v et w","water"]]}}$kt$::jsonb, 0),
  ('Néerlandais', 'declension', $kt$Articles, genre et pluriel$kt$, $kt$Pas de déclinaison par cas : seuls le genre de l’article (de / het) et le pluriel comptent. Le diminutif en -je est toujours het.$kt$, $kt${"source":"manuel_pdf","table":{"headers":["Élément","Règle","Exemple"],"rows":[["Article défini","de (masculin/féminin et pluriel), het (neutre)","de man, het huis"],["Article indéfini","een (invariable)","een boek"],["Pluriel","-en ou -s","boeken, auto’s"],["Diminutif","-je, -tje, -pje (neutre)","huisje"]]}}$kt$::jsonb, 0),
  ('Japonais', 'declension', $kt$Particules de base$kt$, $kt$Le japonais n’a pas de déclinaison : ce sont les particules, placées après le mot, qui marquent sa fonction. Le verbe est toujours en fin de phrase.$kt$, $kt${"source":"manuel_pdf","table":{"headers":["Particule","Lecture","Rôle"],"rows":[["は","wa","thème de la phrase"],["が","ga","sujet"],["を","o","objet direct"],["に","ni","cible, heure, lieu d’existence"],["で","de","lieu de l’action, moyen"],["の","no","appartenance, complément du nom"],["へ","e","direction"],["と","to","avec / et"],["も","mo","aussi"]]}}$kt$::jsonb, 0),
  ('Japonais', 'alphabet', $kt$Hiragana$kt$, $kt$Syllabaire de base de l’écriture japonaise. À compléter par ん (n), les sons voisés (が, ざ, だ, ば) et les sons p (ぱ).$kt$, $kt${"source":"manuel_pdf","table":{"headers":["","∅","k","s","t","n","h","m","y","r","w"],"rows":[["a","あ a","か ka","さ sa","た ta","な na","は ha","ま ma","や ya","ら ra","わ wa"],["i","い i","き ki","し shi","ち chi","に ni","ひ hi","み mi","","り ri",""],["u","う u","く ku","す su","つ tsu","ぬ nu","ふ fu","む mu","ゆ yu","る ru",""],["e","え e","け ke","せ se","て te","ね ne","へ he","め me","","れ re",""],["o","お o","こ ko","そ so","と to","の no","ほ ho","も mo","よ yo","ろ ro","を wo"]]}}$kt$::jsonb, 0),
  ('Japonais', 'alphabet', $kt$Katakana$kt$, $kt$Syllabaire utilisé pour les mots étrangers. À compléter par ン (n), les sons voisés (ガ, ザ, ダ, バ) et les sons p (パ).$kt$, $kt${"source":"manuel_pdf","table":{"headers":["","∅","k","s","t","n","h","m","y","r","w"],"rows":[["a","ア a","カ ka","サ sa","タ ta","ナ na","ハ ha","マ ma","ヤ ya","ラ ra","ワ wa"],["i","イ i","キ ki","シ shi","チ chi","ニ ni","ヒ hi","ミ mi","","リ ri",""],["u","ウ u","ク ku","ス su","ツ tsu","ヌ nu","フ fu","ム mu","ユ yu","ル ru",""],["e","エ e","ケ ke","セ se","テ te","ネ ne","ヘ he","メ me","","レ re",""],["o","オ o","コ ko","ソ so","ト to","ノ no","ホ ho","モ mo","ヨ yo","ロ ro","ヲ wo"]]}}$kt$::jsonb, 0),
  ('Coréen', 'alphabet', $kt$Hangeul : consonnes et voyelles de base$kt$, $kt$Les syllabes se composent d’une consonne initiale, d’une voyelle et éventuellement d’une consonne finale (batchim). ㅇ est muet en initiale.
Consonnes tendues : ㄲ (kk), ㄸ (tt), ㅃ (pp), ㅆ (ss), ㅉ (jj).$kt$, $kt${"source":"manuel_pdf","table":{"headers":["Consonne","Son","Voyelle","Son"],"rows":[["ㄱ","g / k","ㅏ","a"],["ㄴ","n","ㅑ","ya"],["ㄷ","d / t","ㅓ","eo"],["ㄹ","r / l","ㅕ","yeo"],["ㅁ","m","ㅗ","o"],["ㅂ","b / p","ㅛ","yo"],["ㅅ","s","ㅜ","u"],["ㅇ","∅ / ng","ㅠ","yu"],["ㅈ","j","ㅡ","eu"],["ㅊ","ch","ㅣ","i"],["ㅋ","k","",""],["ㅌ","t","",""],["ㅍ","p","",""],["ㅎ","h","",""]]}}$kt$::jsonb, 0),
  ('Thaï', 'alphabet', $kt$Consonnes thaïes par classe$kt$, $kt$La classe de la consonne (moyenne, haute, basse) détermine le ton de la syllabe. Les chiffres traditionnels : ๑ (1), ๒ (2), ๓ (3), ๔ (4), ๕ (5).$kt$, $kt${"source":"manuel_pdf","table":{"headers":["Classe","Consonnes (nom)"],"rows":[["Moyenne","ก (ko kaï) · จ (tcho tchan) · ด (do dek) · ต (to tao) · บ (bo baïmaï) · ป (po pla) · อ (o ang)"],["Haute","ข (kho khaï) · ฉ (tcho tching) · ถ (to thung) · ผ (pho pheung) · ฝ (fo fa) · ส (so sua) · ห (ho hip)"],["Basse","ค (kho khway) · ม (mo ma) · น (no nou) · พ (pho phan) · ร (ro rua) · ล (lo ling)"]]}}$kt$::jsonb, 0),
  ('Espagnol', 'alphabet', $kt$Cours 1 · Salutations, présentations et alphabet$kt$, $kt$Lecture
Dialogue entre deux personnes qui se rencontrent dans une université à Madrid.

Grammaire & Conjugaison
En espagnol, l’usage des pronoms sujets est facultatif. On n’utilise pas obligatoirement les pronoms sujets (yo, tú...) car la terminaison du verbe suffit à identifier la personne. Voici les conjugaisons intégrales au présent de l’indicatif :

Verbe Llamarse (S’appeler) & Ser (Être)

Llamarse : Yo me llamo, tú te llamas, él/ella/usted se llama, nosotros/nosotras nos llamamos, vosotros/vosotras os llamáis, ellos/ellas/ustedes se llaman.
Ser : Yo soy, tú eres, él/ella/usted es, nosotros/nosotras somos, vosotros/vosotras sois, ellos/ellas/ustedes son.

Vocabulaire & Prononciation Audio
— ¡Hola ! : Salut !
— Buenos días / Buenas tardes : Bonjour (matin) / Bonjour (après-midi).
— ¡Buenas noches ! : Bonsoir / Bonne nuit.
— ¿Qué tal ? / ¿Cómo estás ? : Comment ça va ? / Comment vas-tu ?
— Mucho gusto / Encantado/a : Enchanté(e).

— Règle de prononciation clé : La lettre C devant un e ou un i se prononce comme le "th" anglais (avec la langue entre les dents en Espagne) ou comme un "s" (en Amérique Latine). Le H est toujours totalement muet.
— Ressource audio : Écoutez la prononciation exacte sur Forvo ou SpanishDict.$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Salutations, présentations et alphabet$kt$, $kt$Vocabulaire & Prononciation Audio
— ¡Hola ! : Salut !
— Buenos días / Buenas tardes : Bonjour (matin) / Bonjour (après-midi).
— ¡Buenas noches ! : Bonsoir / Bonne nuit.
— ¿Qué tal ? / ¿Cómo estás ? : Comment ça va ? / Comment vas-tu ?
— Mucho gusto / Encantado/a : Enchanté(e).
— Règle de prononciation clé : La lettre C devant un e ou un i se prononce comme le "th" anglais (avec la langue entre les dents en Espagne) ou comme un "s" (en Amérique Latine). Le H est toujours totalement muet.
— Ressource audio : Écoutez la prononciation exacte sur Forvo ou SpanishDict.$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Espagnol', 'vocabulary', $kt$Cours 2 · L’identité et les chiffres$kt$, $kt$Grammaire & Conjugaison : Ser vs Tener
Pour donner son âge en espagnol, on n’utilise pas le verbe être, mais le verbe avoir (Tener).

Tener

Tener : Yo tengo, tú tienes, él/ella/usted tiene, nosotros/nosotras tenemos, vosotros/vosotras tenéis, ellos/ellas/ustedes tienen.

Chiffres

Les chiffres (0-20) : cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve, diez, once, doce, trece, catorce, quince, dieciséis, diecisiete, dieciocho, diecinueve, veinte.

Vocabulaire
— ¿Cuántos años tienes ? : Quel âge as-tu ?
— Tengo [...] años : J’ai [...] ans.
— ¿A qué te dedicas ? / ¿Cuál es tu profesión ? : Que fais-tu dans la vie ?

N Nationalidades traduction Profesiones traduction
1 Francés / Francesa français(e) Abogado / Abogada avocat(e)
2 Español / Española espagnol(e) Médico / Médica médecin
3 Mexicano / Mexicana mexicain(e) Enfermero / Enfermera infirmier / infirmière
4 Argentino / Argentina argentin(e) Profesor / Profesora professeur(e)
5 Colombiano / Colombiana colombien(ne) Estudiante étudiant(e)
6 Chileno / Chilena chilien(ne) Ingeniero / Ingeniera ingénieur(e)
7 Peruano / Peruana péruvien(ne) Arquitecto / Arquitecta architecte
8 Estadounidense américain(e) Camarero / Camarera serveur / serveuse
9 Canadiense canadien(ne) Cocinero / Cocinera cuisinier / cuisinière
10 Inglés / Inglesa anglais(e) Dependiente / Dependienta vendeur / vendeuse
11 Alemán / Alemana allemand(e) Informático / Informática informaticien(ne)
12 Italiano / Italiana italien(ne) Periodista journaliste
13 Portugués / Portuguesa portugais(e) Artista artiste
14 Belga belge Músico / Música musicien(ne)
15 Suizo / Suiza suisse Peluquero / Peluquera coiffeur / coiffeuse
16 Marroquí marocain(e) Conductor / Conductora chauffeur / conductrice
17 Chino / China chinois(e) Policía policier / policière
18 Japonés / Japonesa japonais(e) Bombero / Bombera pompier
19 Cubano / Cubana cubain(e) Administrativo / Administrativa employé(e) administratif
20 Venezolano / Venezolana vénézuélien(ne) Empresario / Empresaria chef d’entreprise$kt$, $kt${"source":"manuel_pdf","course_number":2}$kt$::jsonb, 2),
  ('Espagnol', 'vocabulary', $kt$Cours 3 · Description physique et psychologique$kt$, $kt$Grammaire : L’accord de genre et de nombre
En espagnol, la règle générale pour accorder les adjectifs est simple :
— Masculin en -o → Féminin en -a (alto/alta).
— Invariable en genre (se termine par -e ou une consonne) : inteligente, joven.
— Pluriel : +s après une voyelle (altos), +es après une consonne (azul → azules).

Vocabulaire : Banque d’adjectifs de description
Physique

Alto/Bajo (Grand/Petit), Delgado/Gordo (Mince/Gros), Guapo/Feo (Beau/Laid), Joven/Viejo (Jeune/Vieux), Fuerte/Débil (Fort/Faible), Castaño/Rubio/Moreno/Pelirrojo (Châtain/Blond/Brun/Roux)

Caractère

Simpático/Antipático (Sympatique/Antipatique), Inteligente (Intelligent), Tímido/Extrovertido (Timide/Extraverti), Trabajador/Trabajadora (Travailleur), Perezoso/Perezosa (Paresseux), Alegre/Triste (Joyeux/Triste), Amable (Aimable, gentil),
Paciente/Impaciente (Patient/Impatient)$kt$, $kt${"source":"manuel_pdf","course_number":3}$kt$::jsonb, 3),
  ('Espagnol', 'vocabulary', $kt$Cours 4 · La famille et l’entourage$kt$, $kt$Grammaire : Les Possessifs & le verbe Gustar
— Les adjectifs possessifs s’accordent en nombre (singulier/pluriel) avec l’objet possédé, et non avec le possesseur. Pour nuestro et vuestro, ils s’accordent aussi en genre.

Gustar (Aimer / Plaire)

On ne conjugue pas gustar comme un verbe régulier. Sa conjugaison dépend de ce qui suit :
— Gusta + verbe à l’infinitif OU nom au singulier.
— Gustan + nom au pluriel.

Personne Singulier Pluriel
1re sg. (Mon, ma, mes) mi mis
2e sg. (Ton, ta, tes) tu tus
3e sg. (Son, sa, ses) su sus
1re pl. (Notre, nos) nuestro / nuestra nuestros / nuestras
2e pl. (Votre, vos) vuestro / vuestra vuestros / vuestras
3e pl. (Leur, leurs) su sus

Les pronoms compléments (me, te, le, nos, os, les) sont obligatoires. Les formes entre parenthèses servent à insister ou à lever une ambiguïté.

Pronoms d’insistance (Optionnels) Structure obligatoire + Gusta(n) (A mí) me gusta / gustan (A ti) te gusta / gustan (A él / ella / usted) le gusta / gustan (A nosotros / nosotras) nos gusta / gustan (A vosotros / vosotras) os gusta / gustan (A ellos / ellas / ustedes) les gusta / gustan

Vocabulaire & Prononciation
Pour écouter la prononciation exacte des mots par des natifs, vous pouvez consulter Forvo (Espagnol) ou le dictionnaire visuel SpanishDict.
— El padre / La madre : Le père / La mère
— El hijo / La hija : Le fils / La fille
— El hermano / La hermana : Le frère / La sœur
— El abuelo / La abuela : Le grand-père / La grand-mère
— Leer : Lire
— Cocinar : Cuisiner
— Escuchar música : Écouter de la musique
— Viajar : Voyager$kt$, $kt${"source":"manuel_pdf","course_number":4}$kt$::jsonb, 4),
  ('Espagnol', 'conjugation', $kt$Cours 5 · Le temps qui passe (L’heure, l’agenda et le climat)$kt$, $kt$Grammaire & Conjugaison : Exprimer l’heure et le temps
L’heure
On utilise le verbe Ser. On utilise Es la pour une heure, et Son las pour toutes les autres heures.
— Es la una (Il est 1h).
— Son las dos (Il est 2h).
— Les minutes : y cuarto (:15), y media (:30), menos cuarto (:45).

Le climat
On utilise souvent le verbe Hacer (Faire) ou Estar.
— Hace sol (Il fait soleil) / Hace frío (Il fait froid) / Hace calor (Il fait chaud).
— Está nublado (C’est nuageux).

Vocabulaire
— Los días de la semana : lunes, martes, miércoles, jueves, viernes, sábado, domingo.
— Las estaciones : primavera (printemps), verano (été), otoño (automne), invierno (hiver).
Audio de référence : Écoutez les jours et les heures énoncés distinctement sur SpanishDict Hours.$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Le temps qui passe (L’heure, l’agenda et le climat)$kt$, $kt$Vocabulaire
— Los días de la semana : lunes, martes, miércoles, jueves, viernes, sábado, domingo.
— Las estaciones : primavera (printemps), verano (été), otoño (automne), invierno (hiver).
Audio de référence : Écoutez les jours et les heures énoncés distinctement sur SpanishDict Hours.$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Espagnol', 'rule', $kt$Cours 6 · La routine quotidienne$kt$, $kt$Grammaire : Les verbes réguliers et pronominaux
Terminaisons du Présent (Régulier)

-AR (Hablar) : -o, -as, -a, -amos, -áis, -an. -ER (Comer) : -o, -es, -e, -emos, -éis, -en.
-IR (Vivir) : -o, -es, -e, -imos, -ís, -en. -IR (Vivir) : -o, -es, -e, -imos, -ís, -en.

Les verbes pronominaux (avec le pronom réfléchi en tête)

Levantarse : me levanto, te levantas, se levanta, nos levantamos, os levantáis, se levantan.

Vocabulaire
— Despertarse (e → ie) = Se réveiller
— Ducharse = Se doucher
— Desayunar / Comer / Cenar = Déjeuner (matin) / Manger (midi) / Dîner (soir)
— Salir = Sortir (Yo salgo)
— Volver (o → ue) = Rentrer, revenir$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · La routine quotidienne$kt$, $kt$Vocabulaire
— Despertarse (e → ie) = Se réveiller
— Ducharse = Se doucher
— Desayunar / Comer / Cenar = Déjeuner (matin) / Manger (midi) / Dîner (soir)
— Salir = Sortir (Yo salgo)
— Volver (o → ue) = Rentrer, revenir$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Espagnol', 'conjugation', $kt$Cours 7 · Les loisirs, invitations et verbes à changements$kt$, $kt$Grammaire : Les verbes à modifications radicales (Diphtongues)
Certains verbes transforment leur voyelle radicale aux personnes 1, 2, 3 et 6 (jamais à nosotros ni vosotros).
— E → IE : Querer (Vouloir)
Yo quiero, tú quieres, él quiere, nosotros queremos, vosotros queréis, ellos quieren.
— O → UE : Poder (Pouvoir) / Soler (Avoir l’habitude de)
Yo puedo, tú puedes, él puede, nosotros podemos, vosotros podéis, ellos pueden.
Yo suelo, tú sueles, él suele, nosotros solemos, vosotros soléis, ellos suelen.

Vocabulaire
— Jugar al fútbol / al tenis = Jouer au football / au tennis (Attention : Yo juego)
— Ir al cine / al teatro = Aller au cinéma / au théâtre
— Escuchar música = Écouter de la musique
— Quedar con amigos = Donner rendez-vous / voir des amis$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Les loisirs, invitations et verbes à changements$kt$, $kt$Vocabulaire
— Jugar al fútbol / al tenis = Jouer au football / au tennis (Attention : Yo juego)
— Ir al cine / al teatro = Aller au cinéma / au théâtre
— Escuchar música = Écouter de la musique
— Quedar con amigos = Donner rendez-vous / voir des amis$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Espagnol', 'vocabulary', $kt$Cours 9 · La ville, les déplacements et l’orientation$kt$, $kt$Grammaire & Conjugaison : L’existence (Hay) vs La localisation (Estar)
HAY (Forme impersonnelle du verbe Haber – "Il y a")

On l’utilisera pour exprimer l’existence de quelque chose d’indéterminé.
Suivi de : un article indéfini (un, una, unos, unas), un chiffre, ou un nom sans article.
— Ejemplo : En este barrio hay un parque. / ¿Hay museos aquí ?

ESTAR (Être – Localisation)

On l’utilise pour situer un lieu, une personne ou un objet précis et déterminé.
Suivi de : un article défini (el, la, los, las), un nom propre, ou un possessif (mi, tu, su).

Conjugaison complète de ESTAR au Présent

Yo estoy, tú estás, él/ella/usted está, nosotros/as estamos, vosotros/as estáis, ellos/ellas/ustedes están.
— Ejemplo : El museo está cerca de la estación. / Madrid está en el centro de España.

Vocabulaire : La ville et l’orientation
Lugares de la ciudad (Lieux) :
— La estación de tren / de autobús : La gare / station de bus
— El ayuntamiento : La mairie
— La comisaría de policía : Le commissariat
— El hospital : L’hôpital
— La oficina de correos : La poste
— La iglesia / La catedral : L’église / La cathédrale
— El banco : La banque
— El cine / El teatro / El museo : Le cinéma / théâtre / musée

Direcciones & Movimiento (Directions) :
— Girar a la izquierda / a la derecha : Tourner à gauche / à droite
— Seguir todo recto : Continuer tout droit
— Cruzar la calle / el puente : Traverser la rue / le pont
— Cerca (de) / Lejos (de) : Près de / Loin de
— Al lado de / Enfrente de : À côté de / En face de
— En la esquina : Au coin / À l’angle de la rue$kt$, $kt${"source":"manuel_pdf","course_number":9}$kt$::jsonb, 9),
  ('Espagnol', 'vocabulary', $kt$Cours 10 · Au restaurant et faire les courses$kt$, $kt$Grammaire : L’obligation personnelle (Tener que) vs impersonnelle (Hay que)
TENER QUE + Infinitif (Obligation personnelle : "Devoir / Il faut que je/tu...")

Se conjugue à toutes les personnes : Yo tengo que, tú tienes que, él tiene que, nosotros tenemos que, vosotros tenéis que, ellos tienen que.
— Ejemplo : Tengo que comprar verduras para la cena. (C’est mon obligation).

HAY QUE + Infinitif (Obligation générale / impersonnelle : "Il faut / Il est nécessaire de...")

Ne change jamais de forme. Règle générale s’appliquant à tout le monde.
— Ejemplo : Hay que pagar en la caja. (Il faut payer à la caisse, règle générale).

Vocabulaire : Alimentation et Restaurant
La mesa y cubiertos (La table) :
— El tenedor : la fourchette
— El cuchillo : le couteau
— La cuchara : la cuillère
— El vaso : le verre
— La servilleta : la serviette

Alimentos de base (Nourriture) :
— La carne (La viande) : el pollo (le poulet), la ternera (le bœuf), el cerdo (le porc).
— El pescado y marisco (Poisson & fruits de mer) : el atún (le thon), el salmón (le saumon), los camarones / gambas (les crevettes).
— Verduras y frutas (Légumes & fruits) : las patatas (les pommes de terre), la ensalada (la salade), el tomate (la tomate), la manzana (la pomme), el plátano (la banane).
— Bebidas (Boissons) : El vino tinto/blanco (le vin rouge/blanc), la cerveza (la bière), el café, el zumo de naranja (le jus d’orange).$kt$, $kt${"source":"manuel_pdf","course_number":10}$kt$::jsonb, 10),
  ('Espagnol', 'vocabulary', $kt$Cours 11 · Les achats, les vêtements et la comparaison$kt$, $kt$Grammaire & Conjugaison : Les Démonstratifs & La Comparaison
Les Adjectifs Démonstratifs (Proximité spatiale ou temporelle) :
— Proche de moi : Este / Esta (Ce/Cette) Pluriel : Estos / Estas
— Proche de toi / Moyennement éloigné : Ese / Esa (Ce/Cette) Pluriel : Esos / Esas
— Loin de nous deux : Aquel / Aquella (Ce/Cette là-bas) Pluriel : Aquellos / Aquellas

La Comparaison :
— Supériorité : más + adjectif + que (ex : más alto que).
— Infériorité : moins + adjectif + que (ex : menos caro que).
— Égalité : tan + adjectif + como (ex : tan guapo como).
— Irréguliers : mejor que (meilleur que), peor que (pire que), mayor que (plus âgé que), menor que (plus jeune que).

Vocabulaire Enrichi : Les vêtements et le shopping
Prendas de vestir (Vêtements) :
— La camisa (La chemise), la camiseta (Le t-shirt), los pantalones (Le pantalon), los vaqueros (Le jean).
— La chaqueta (La veste), el abrigo (Le manteau), el jersey (Le pull).
— La falda (La jupe), el vestido (La robe).
— Los zapatos (Les chaussures), las zapatillas de deporte (Les baskets).

Atributos (Caractéristiques)

— La talla (La taille), el precio (Le prix), caro / barato (Cher / Bon marché), cómodo / incómodo (Confortable / Inconfortable).$kt$, $kt${"source":"manuel_pdf","course_number":11}$kt$::jsonb, 11),
  ('Espagnol', 'vocabulary', $kt$Cours 12 · Le logement et l’espace habitable$kt$, $kt$Grammaire : Les prépositions et locutions de lieu
Pour décrire la position des meubles, on utilise impérativement le verbe Estar suivi d’une préposition :
— En = Dans / À (lieu général)
— Encima de = Au-dessus de / Sur
— Debajo de = Sous / En-dessous de
— Delante de = Devant
— Detrás de = Derrière
— Entre = Entre
— A la derecha de / A la izquierda de = À droite de / À gauche de

Vocabulaire Enrichi : La maison et les meubles
Partes de la casa (Pièces) :
— La casa (La maison), el piso / apartamento (L’appartement).
— El salón / El comedor (Le salon / La salle à manger).
— La cocina (La cuisine).
— El dormitorio / La habitación (La chambre).
— El baño (La salle de bain).
— El pasillo (Le couloir), el balcón (Le balcon), la terraza (La terrasse).

Los muebles (Les meubles) :
— El sofá (Le canapé), la mesa (La table), la silla (La chaise), la cama (Le lit), el armario (L’armoire), la lámpara (La lampe), el espejo (Le miroir).$kt$, $kt${"source":"manuel_pdf","course_number":12}$kt$::jsonb, 12),
  ('Espagnol', 'conjugation', $kt$Cours 13 · Parler du passé proche (Le Passé Composé / Pretérito Perfecto)$kt$, $kt$Grammaire & Conjugaison : Le Pretérito Perfecto
Il exprime une action passée s’inscrivant dans une période de temps non révolue (hoy, esta semana). Il se construit avec l’auxiliaire Haber conjugué au présent + le participe passé du verbe. L’auxiliaire et le participe ne sont jamais séparés en espagnol.

Conjugaison complète de l’auxiliaire Haber

Yo he, tú has, él/ella ha, nosotros hemos, vosotros habéis, ellos/ellas han.

Formation du participe passé

1. Formation du participe passé régulier :
— Verbes en -AR → -ado (Hablar → hablado)
— Verbes en -ER / -IR → -ido (Comer → comido, Vivir → vivido)
2. Participes irréguliers indispensables :
— Hacer → hecho (fait)
— Escribir → escrito (écrit)
— Ver → visto (vu)
— Volver → vuelto (revenu)
— Decir → dicho (dit).

Marqueurs temporels :
Hoy (Aujourd’hui), este mes (Ce mois-ci), esta semana (Cette semaine), ya (Déjà), todavía no (Pas encore).

Vocabulaire : Les activités récentes
— Enviar un mensaje = Envoyer un message
— Asistir a una reunión = Assister à une réunion
— Hacer la compra = Faire les courses
— Organizar los documentos = Organiser les documents$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Parler du passé proche (Le Passé Composé / Pretérito Perfecto)$kt$, $kt$Vocabulaire : Les activités récentes
— Enviar un mensaje = Envoyer un message
— Asistir a una reunión = Assister à une réunion
— Hacer la compra = Faire les courses
— Organizar los documentos = Organiser les documents$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Espagnol', 'conjugation', $kt$Cours 14 · Raconter un souvenir d’enfance (L’Imparfait / Pretérito Imperfecto)$kt$, $kt$Grammaire & Conjugaison : L’Imparfait
Utilisé pour décrire des habitudes passées, des souvenirs, des états d’esprit ou décors passés.
Ce temps est très régulier en espagnol. Il n’existe que trois verbes irréguliers dans toute la langue.

Terminaisons Régulières

Verbes en -AR : -aba, -abas, -aba, -ábamos, -abais, -aban.
Yo jugaba, tú jugabas, él jugaba, nosotros jugábamos, vosotros jugabais, ellos jugaban
Verbes en -ER / -IR : -ía, -ías, -ía, -íamos, -íais, -ían.
Yo vivía, tú vivías, él vivía, nosotros vivíamos, vosotros vivíais, ellos vivían

Les 3 seuls irréguliers de toute la langue

1. Ser : era, eras, era, éramos, erais, eran.
2. Ir : iba, ibas, iba, íbamos, ibais, iban.
3. Ver : veía, veías, veía, veíamos, veíais, vean.

Vocabulaire : L’enfance et les souvenirs
— Cuando era joven / niño = Quand j’étais jeune / enfant
— En aquella época = À cette époque-là
— Soler (imparfait : solía) + Infinitif = Avoir l’habitude de (dans le passé)
— Los juguetes / Los dibujos animados = Les jouets / Les dessins animés$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Raconter un souvenir d’enfance (L’Imparfait / Pretérito Imperfecto)$kt$, $kt$Vocabulaire : L’enfance et les souvenirs
— Cuando era joven / niño = Quand j’étais jeune / enfant
— En aquella época = À cette époque-là
— Soler (imparfait : solía) + Infinitif = Avoir l’habitude de (dans le passé)
— Los juguetes / Los dibujos animados = Les jouets / Les dessins animés$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Espagnol', 'vocabulary', $kt$Cours 15 · Exprimer la douleur et la santé$kt$, $kt$Grammaire & Conjugaison : Le verbe Doler (Faire mal)
Le verbe Doler (o → ue) fonctionne exactement comme le verbe Gustar. On utilise les pronoms compléments et on ne l’accorde qu’en fonction de ce qui fait mal (singulier ou pluriel).

Structures :
— Me duele + nom singulier (Ex : Me duele la espalda = J’ai mal au dos).
— Me duelen + nom pluriel (Ex : Me duelen los pies = J’ai mal aux pieds).

Conjugaison avec les pronoms

(A mí) me duele/n | (A ti) te duele/n | (A él/ella) le duele/n | (A nosotros) nos duele/n
| (A vosotros) os duele/n | (A ellos) les duele/n.

Vocabulaire : Le corps humain et la santé
Partes del cuerpo (Le corps) :
— La cabeza (la tête)
— la espalda (le dos),

— el estómago (l’estomac),
— la garganta (la gorge),
— los brazos (les bras),
— las piernas (les jambes),
— los dientes (les dents).

Síntomas (Symptômes) :
— Tener fiebre (avoir de la fièvre),
— estar resfriado/a (être enrhumé),
— tener tos (tousser),
— el cansancio (la fatigue).

Remedios (Remèdes) :
— La receta (l’ordonnance),
— la pastilla / el comprimido (le comprimé),
— guardar cama (rester au lit).$kt$, $kt${"source":"manuel_pdf","course_number":15}$kt$::jsonb, 15),
  ('Espagnol', 'conjugation', $kt$Cours 17 · Raconter une action ponctuelle (Le Passé Simple Régulier / Pretérito Indefinido)$kt$, $kt$Grammaire & Conjugaison : Le Pretérito Indefinido Régulier
Ce temps correspond au passé simple français, mais il est utilisé quotidiennement à l’oral en
Espagne et en Amérique latine pour toutes les actions passées coupées du présent.

Terminaisons des Verbes Réguliers

— Verbes en -AR (Hablar) : -é, -aste, -ó, -amos, -asteis, -aron. (Yo hablé, tú hablaste, él habló, nosotros hablamos, vosotros hablasteis, ellos hablaron).
— Verbes en -ER / -IR (Comer / Vivir) : -í, -iste, -ió, -imos, -isteis, -ieron. (Yo comí/viví, tú comiste/viviste, él comió/vivió, nosotros comimos/vivimos, vosotros comisteis/vivisteis, ellos comieron/vivieron).

Marqueurs temporels clés :
Ayer (Hier), anoche (Hier soir), el año pasado (L’année dernière), el lunes pasado (Lundi dernier), en 2015.

Vocabulaire Enrichi : Le voyage et les actions ponctuelles
— Viajar por el monde : Voyager à travers le monde

— Tomar un avión / un tren : Prendre un avion / un train
— Sacar fotos : Prendre des photos
— Descubrir un lugar : Découvrir un endroit
— El recuerdo / La postal : Le souvenir (objet) / La carte postale$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Raconter une action ponctuelle (Le Passé Simple Régulier / Pretérito Indefinido)$kt$, $kt$Vocabulaire Enrichi : Le voyage et les actions ponctuelles
— Viajar por el monde : Voyager à travers le monde
— Tomar un avión / un tren : Prendre un avion / un train
— Sacar fotos : Prendre des photos
— Descubrir un lugar : Découvrir un endroit
— El recuerdo / La postal : Le souvenir (objet) / La carte postale$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Espagnol', 'conjugation', $kt$Cours 18 · Maîtriser les irrégularités majeures du Passé Simple$kt$, $kt$Grammaire & Conjugaison : Les Irréguliers du Pretérito Indefinido
Ces verbes changent de radical et adoptent des terminaisons spécifiques (sans aucun accent écrit).

SER (Être) & IR (Aller) :

Ils ont exactement la même conjugaison.
Yo fui, tú fuiste, él fue, nosotros fuimos, vosotros fuisteis, ellos fueron.

HACER (Faire)

Radical hic- (avec un z à la 3e personne du singulier).
Yo hice, tú hiciste, él hizo, nosotros hicimos, vosotros hicisteis, ellos hicieron.

DECIR (Dire)

Radical dij-.
Yo dije, tú dijiste, él dijo, nosotros dijimos, vosotros dijisteis, ellos dijeron.

TENER (Avoir) & ESTAR (Être)

Radicaux tuv- et estuv-.
Yo tuve / estuve, tú tuviste / estuviste, él tuvo / estuvo...

Vocabulaire Enrichi : Les verbes d’action au passé
— Hacer una excursión : Faire une randonnée / excursion
— Tener éxito : Avoir du succès / Réussir
— Ponerse la ropa : Mettre ses vêtements
— Estar de vacaciones : Être en vacances$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Maîtriser les irrégularités majeures du Passé Simple$kt$, $kt$Vocabulaire Enrichi : Les verbes d’action au passé
— Hacer una excursión : Faire une randonnée / excursion
— Tener éxito : Avoir du succès / Réussir
— Ponerse la ropa : Mettre ses vêtements
— Estar de vacaciones : Être en vacances$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Espagnol', 'conjugation', $kt$Cours 19 · Alterner les temps du passé (Imparfait vs Passé Simple)$kt$, $kt$Grammaire : La règle de l’alternance
— Pretérito Imperfecto (L’arrière-plan) : On l’utilise pour décrire le décor, la situation en cours, l’état d’esprit, le temps qu’il faisait. C’est l’action qui durait dans le temps (Ex : Yo leía = Je lisais).
— Pretérito Indefinido (L’action de premier plan) : On l’utilise pour l’événement soudain, l’action qui interrompt la situation ou qui fait avancer l’histoire (Ex : El teléfono sonó = Le téléphone a sonné).

Vocabulaire Enrichi : Connecteurs de rupture et de narration
— De repente / De pronto = Soudain / Tout à coup
— Mientras = Pendant que / Tandis que
— Entonces / Luego = Alors / Ensuite
— Al final = Finalement / À la fin$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Alterner les temps du passé (Imparfait vs Passé Simple)$kt$, $kt$Vocabulaire Enrichi : Connecteurs de rupture et de narration
— De repente / De pronto = Soudain / Tout à coup
— Mientras = Pendant que / Tandis que
— Entonces / Luego = Alors / Ensuite
— Al final = Finalement / À la fin$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Espagnol', 'conjugation', $kt$Cours 20 · Projets et avenir (Le Futur et le Futur Proche)$kt$, $kt$Grammaire & Conjugaison : Le Futur Proche et le Futur de l’Indicatif
Le Futur Proche (Intention immédiate ou projet sûr) : IR A + Infinitif
On conjugue le verbe Ir au présent + la préposition a + le verbe à l’infinitif.
Yo voy a, tú vas a, él va a, nosotros vamos a, vosotros vais a, ellos van a. (Ex : Voy a viajar).

Le Futur Simple (Actions plus lointaines ou promesses) :
On garde l’infinitif complet du verbe et on ajoute les mêmes terminaisons pour tous les verbes (-AR, -ER, -IR) : -é, -ás, -á, -emos, -éis, -án.
Hablaré, hablarás, hablará, hablaremos, hablaréis, hablarán.

Vocabulaire Enrichi : L’avenir et le temps futur
— El próximo año / La próxima semana = L’année prochaine / La semaine prochaine
— En el futuro / Algún día = Dans le futur / Un jour
— El proyecto / La meta = Le projet / L’objectif, le but
— Mudarse de casa = Déménager$kt$, $kt${"source":"manuel_pdf","course_number":20}$kt$::jsonb, 20),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Projets et avenir (Le Futur et le Futur Proche)$kt$, $kt$Vocabulaire Enrichi : L’avenir et le temps futur
— El próximo año / La próxima semana = L’année prochaine / La semaine prochaine
— En el futuro / Algún día = Dans le futur / Un jour
— El proyecto / La meta = Le projet / L’objectif, le but
— Mudarse de casa = Déménager$kt$, $kt${"source":"manuel_pdf","course_number":20}$kt$::jsonb, 20),
  ('Espagnol', 'conjugation', $kt$Cours 21 · Donner des ordres et des conseils (L’Impératif Affirmatif)$kt$, $kt$Grammaire & Conjugaison : L’Impératif
L’impératif varie selon que l’on s’adresse à un proche (Tú) ou de manière formelle (supérieur/inconnu) (Usted).

Modèles de l’Impératif Affirmatif Formes régulières

Verbes en -AR (Hablar) : Tú habla | Usted hable | Vosotros hablad | Ustedes hablen.
Verbes en -ER (Comer) : Tú come | Usted coma | Vosotros comed | Ustedes coman.
Verbes en -IR (Escribir) : Tú escribe | Usted escriba | Vosotros escribid | Ustedes escriban.

Irréguliers majeurs à la personne “Tú”

Haz (Hacer), di (Decir), ve (Ir), sé (Ser), ten (Tener), pon (Poner), sal (Salir), ven (Venir).

Vocabulaire : Les verbes d’instruction
— Escuchar atentamente = Écouter attentivement
— Tomar una décision = Prendre une décision
— Subir / Bajar = Monter / Descendre (ou Augmenter / Baisser)
— Firmar un documento = Signer un document$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Donner des ordres et des conseils (L’Impératif Affirmatif)$kt$, $kt$Vocabulaire : Les verbes d’instruction
— Escuchar atentamente = Écouter attentivement
— Tomar una décision = Prendre une décision
— Subir / Bajar = Monter / Descendre (ou Augmenter / Baisser)
— Firmar un documento = Signer un document$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Espagnol', 'vocabulary', $kt$Cours 22 · Le monde du travail, l’entreprise et le CV$kt$, $kt$Grammaire : Exprimer la durée et la continuité
— DESDE HACE + Durée : Trabajo en esta empresa desde hace tres años. (Je travaille dans cette entreprise depuis trois ans).
— LLEVAR + Durée + GÉRONDIF : Structure très idiomatique.
Formation du gérondif : -AR → -ando (Hablar → hablando) ; -ER / -IR → -iendo (Vivir → viviendo).
Ejemplo : Llevo tres años trabajando aquí. (Cela fait trois ans que je travaille ici).

Vocabulaire Enrichi : Le lexique du travail
— El puesto de trabajo / de empleo = Le poste de travail / l’emploi
— El sueldo / El salario = Le salaire
— La entrevista de trabajo = L’entretien d’embauche
— El contrato indefinido / temporal = Le contrat à durée indéterminée (CDI) / déterminée (CDD)
— La empresa / El negocio = L’entreprise / le commerce, l’affaire
— Las habilidades / Las competencias = Les compétences, les atouts$kt$, $kt${"source":"manuel_pdf","course_number":22}$kt$::jsonb, 22),
  ('Espagnol', 'rule', $kt$Cours 23 · Téléphone et communication formelle$kt$, $kt$Grammaire : Le Conditionnel de Courtoisie
Pour s’aimer ou s’exprimer poliment au téléphone ou par courriel, on utilise le conditionnel présent des verbes Querer ou Poder à la place du présent brut.

Verbe Querer au Conditionnel

Yo querría, tú querrías, él/ella/usted querría, nosotros querríamos, vosotros querríais, ellos/ellas/ustedes querrían.
Ejemplo 1 : Querría pedir una cita con el señor Martínez (Je voudrais demander un rendez-vous...).
Ejemplo 2 : ¿Podría hablar con la directora ? (Pourrais-je parler à la directrice ?).

Vocabulaire : Formules de courriels professionnels
Formules d’appel (Téléphone) :
1. ¿Dígame ? / ¿Sí ? (Allô ?),
2. ¿De parte de quién ? (De la part de qui ?),
3. Pasar la llamada (Transférer l’appel).

Formules de politesse (E-mails) :
— Estimado/a Señor/Señora : (Cher/Chère Monsieur/Madame – Début de mail formel)
— Atentamente / Un cordial saludo (Veuillez agréer... / Cordialement – Fin de mail)$kt$, $kt${"source":"manuel_pdf","course_number":23}$kt$::jsonb, 23),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Téléphone et communication formelle$kt$, $kt$Vocabulaire : Formules de courriels professionnels
Formules d’appel (Téléphone) :
1. ¿Dígame ? / ¿Sí ? (Allô ?),
2. ¿De parte de quién ? (De la part de qui ?),
3. Pasar la llamada (Transférer l’appel).$kt$, $kt${"source":"manuel_pdf","course_number":23}$kt$::jsonb, 23),
  ('Espagnol', 'conjugation', $kt$Cours 25 · Exprimer l’hypothèse et la condition (Le Conditionnel Présent)$kt$, $kt$Grammaire & Conjugaison : Le Conditionnel Présent
Le conditionnel se forme de manière très régulière en ajoutant les terminaisons directement à l’infinitif complet du verbe (exactement comme au futur simple). Les terminaisons sont identiques pour tous les groupes (-AR, -ER, -IR).

Terminaisons uniques

-ía, -ías, -ía, -íamos, -íais, -ían.

— Verbe Hablar (Parler) : hablaría, hablarías, hablaría, hablaríamos, hablaríais, hablarían.
— Verbe Comer (Manger) : comería, comerías, comería...
— Verbe Vivir (Vivre) : viviría, vivirías, viviría...

Verbes irréguliers

Ce sont les mêmes radicaux modifiés qu’au futur simple.
Hacer → haría | Decir → diría | Tener → tendría | Poder → podría | Querer → querría | Saber → sabría | Poner → pondría.

Vocabulaire Enrichi : L’imaginaire et la condition
— Si fuera posible... = Si c’était possible...

— En ese caso... = Dans ce cas-là...
— Ganar la lotería = Gagner à la loterie
— Hacer realidad un sueño = Réaliser un rêve$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Exprimer l’hypothèse et la condition (Le Conditionnel Présent)$kt$, $kt$Vocabulaire Enrichi : L’imaginaire et la condition
— Si fuera posible... = Si c’était possible...
— En ese caso... = Dans ce cas-là...
— Ganar la lotería = Gagner à la loterie
— Hacer realidad un sueño = Réaliser un rêve$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Espagnol', 'conjugation', $kt$Cours 26 · Introduction au Subjonctif Présent (Souhait et Désir)$kt$, $kt$Grammaire & Conjugaison
Le subjonctif s’utilise pour exprimer la subjectivité, la volonté ou le souhait après la conjonction que. On observe une inversion des voyelles thématiques par rapport au présent de l’indicatif.

Tableau des conjugaisons régulières

— Verbes en -AR prendront les terminaisons en -E : -e, -es, -e, -emos, -éis, -en.
Conjugaison (Hablar) : hable, hables, hable, hablemos, habléis, hablen.
— Verbes en -ER / -IR prendront les terminaisons en -A : -a, -as, -a, -amos, -áis,
-an.
Conjugaison (Comer) : coma, comas, coma, comamos, comáis, coman.

Structure de base : Verbe de souhait/volonté (ex : Quiero, Espero) + QUE + verbe au subjonctif.
Ejemplo : Quiero que tú vengas conmigo. (Je veux que tu viennes avec moi).

Vocabulaire Enrichi : Exprimer le souhait et l’attente
— ¡Ojalá ! / ¡Ojalá que (+ subjonctif) ! = Pourvu que ! / Espérons que !
— Desear que... = Désirer que...
— Exigir que... = Exiger que...
— Tener la esperanza de que... = Avoir l’espoir que...$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Introduction au Subjonctif Présent (Souhait et Désir)$kt$, $kt$Vocabulaire Enrichi : Exprimer le souhait et l’attente
— ¡Ojalá ! / ¡Ojalá que (+ subjonctif) ! = Pourvu que ! / Espérons que !
— Desear que... = Désirer que...
— Exigir que... = Exiger que...
— Tener la esperanza de que... = Avoir l’espoir que...$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Espagnol', 'rule', $kt$Cours 27 · Exprimer l’opinion, la certitude et le doute$kt$, $kt$Grammaire : La bascule Indicatif / Subjonctif
Règle fondamentale de la syntaxe espagnole pour exprimer une opinion :

Certitude / Affirmation → INDICATIF
Creo que... (Je crois que) / Pienso que... (Je pense que) / Es verdad que... (Il est vrai que).
— Ejemplo : Creo que Juan tiene razón.

Doute / Négation / Incertitude → SUBJONCTIF
No creo que... (Je ne crois pas que) / No pienso que... (Je ne pense pas que) / Dudo que... (Je doute que).
— Ejemplo : No creo que Juan tenga razón.

Vocabulaire Enrichi : Les nuances de l’opinion
— A mi parecer / En mi opinión = À mon sens / À mon avis
— Desde mi punto de vista = De mon point de vue
— Estar de acuerdo con = Être d’accord avec
— No cabe duda de que... (+ indicatif) = Il ne fait aucun doute que...$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Espagnol', 'vocabulary', $kt$Vocabulaire · Exprimer l’opinion, la certitude et le doute$kt$, $kt$Vocabulaire Enrichi : Les nuances de l’opinion
— A mi parecer / En mi opinión = À mon sens / À mon avis
— Desde mi punto de vista = De mon point de vue
— Estar de acuerdo con = Être d’accord avec
— No cabe duda de que... (+ indicatif) = Il ne fait aucun doute que...$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Espagnol', 'rule', $kt$Cours 28 · Les connecteurs logiques et l’argumentation$kt$, $kt$Grammaire : Les familles de connecteurs
Pour opposer deux idées

— Sin embargo (Cependant / Néanmoins)
— Pero (Mais)
— Aunque + Indicatif / Subjonctif (Bien que / Même si)

Pour exprimer la cause ou la conséquence

— Porque (Parce que)
— Por lo tanto / Por eso (Par conséquent / C’est pourquoi)
— Ya que / Puesto que (Puisque / Étant donné que)

Pour structurer et ajouter des arguments

— En primer lugar / En segundo lugar (En premier lieu / En second lieu)
— Además (De plus)
— En conclusión (En conclusion)$kt$, $kt${"source":"manuel_pdf","course_number":28}$kt$::jsonb, 28),
  ('Espagnol', 'vocabulary', $kt$Cours 29 · Les médias, la technologie et l’actualité$kt$, $kt$Grammaire : Les tournures affectives impersonnelles (Es + Adjectif + Que)
Pour commenter une actualité ou donner une opinion générale sur un fait de société :

Es + Adjectif de certitude + QUE + INDICATIF

Es verdad que... / Es obvio que... / Es evidente que...
— Ejemplo : Es evidente que la tecnología cambia nuestras vidas.

Es + Adjectif de jugement ou sentiment + QUE + SUBJONCTIF

Es importante que... / Es una lástima que... / Es increíble que...
— Ejemplo : Es importante que nosotros protejamos nuestros datos personales.

Vocabulaire Enrichi : Le monde numérique et l’information
— La prensa / El telediario = La presse / Le journal télévisé
— La libertad de expresión = La liberté d’expression
— El usuario / Compartir un enlace = L’utilisateur / Partager un lien
— Estar conectado/a = Être connecté(e)
— Descargar una aplicación = Télécharger une application$kt$, $kt${"source":"manuel_pdf","course_number":29}$kt$::jsonb, 29),
  ('Espagnol', 'vocabulary', $kt$Cours 30 · L’environnement, l’écologie et l’avenir de la planète$kt$, $kt$Grammaire : Exprimer la peur et le regret au subjonctif
Lorsque le sujet principal exprime un sentiment de peur ou une crainte vis-à-vis d’une autre action, la subordonnée se met systématiquement au subjonctif.

Temer que... / Tener miedo de que... + SUBJONCTIF

— Ejemplo : Tengo miedo de que el planeta sufra daños irreversibles. (J’ai peur que la planète souffre de dommages irréversibles).
— Ejemplo : Los ecologistas temen que los recursos se agoten pronto. (Les écologistes craignent que les ressources ne s’épuisent bientôt).

Vocabulaire Enrichi : Écologie et Développement durable
— El reciclaje / Reciclar = Le recyclage / Recycler
— Cuidar la naturaleza = Prendre soin de la nature
— Los residuos / La contaminación = Les déchets / La pollution
— La escasez de agua = La pénurie d’eau
— La fauna y la flora = La faune et la flore$kt$, $kt${"source":"manuel_pdf","course_number":30}$kt$::jsonb, 30),
  ('Espagnol', 'rule', $kt$Cours 31 · Variations culturelles et expressions idiomatiques$kt$, $kt$Grammaire & Vocabulaire : Espagne vs Amérique Latine
Concept Espagne Amérique Latine
La voiture El coche El carro / El auto
L’ordinateur El ordenador La computadora
Le téléphone portable El móvil El celular
Le jus de fruits El zumo El jugo
Les pommes de terre Las patatas Las papas$kt$, $kt${"source":"manuel_pdf","course_number":31}$kt$::jsonb, 31),
  ('Allemand', 'rule', $kt$Cours 1 · Syntaxe de base (Principale et Subordonnée)$kt$, $kt$Grammaire & Syntaxe : La place du verbe conjugué
La position du verbe conjugué est la clé de voûte de la syntaxe allemande.
— Proposition principale : Le verbe conjugué occupe toujours la deuxième position. Le sujet peut se placer en première position ou être déplacé après le verbe si un complément (de temps ou de lieu) commence la phrase (inversion sujet-verbe).
Sujet en 1 : Ich lerne heute Deutsch.
Complément en 1 : Heute lerne ich Deutsch.
— Proposition subordonnée (weil, dass) : Le verbe conjugué est rejeté à la toute fin de la proposition.
Weil (Parce que) : Ich lerne Deutsch, weil ich in Berlin wohne.
Dass (Que) : Ich weiß, dass du Deutsch lernst.

Expression Orale & Phonétique : L’accentuation
En allemand, l’accentuation de la phrase repose sur les mots porteurs de sens (les radicaux des verbes et des noms). Entraînez-vous à prononcer les phrases ci-dessus à haute voix. Marquez une micro-pause avant les conjonctions weil ou dass, puis baissez l’intonation sur le verbe final.$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Allemand', 'conjugation', $kt$Cours 2 · Relations sociales et Présentation avancée$kt$, $kt$Compréhension Orale : Script de laboratoire d’écoute
Dialogue professionnel lors d’un séminaire d’affaires à Munich.

Banque de Vocabulaire Enrichi
— Die Vorstellung : La présentation
— Beruflich : Professionnellement / Sur le plan professionnel
— Der Projektleiter / Die Projektleiterin : Le chef de projet
— Kennenlernen : Faire la connaissance de
— Ganz meinerseits : Tout le plaisir est pour moi / De même
— Seit (+ Datif) : Depuis. Note : On utilise le présent en allemand (Ich wohne seit zwei Jahren hier).
— Deshalb : C’est pourquoi. Note : Engendre une inversion immédiate (deshalb bin ich hier).$kt$, $kt${"source":"manuel_pdf","course_number":2}$kt$::jsonb, 2),
  ('Allemand', 'vocabulary', $kt$Vocabulaire · Relations sociales et Présentation avancée$kt$, $kt$Banque de Vocabulaire Enrichi
— Die Vorstellung : La présentation
— Beruflich : Professionnellement / Sur le plan professionnel
— Der Projektleiter / Die Projektleiterin : Le chef de projet
— Kennenlernen : Faire la connaissance de
— Ganz meinerseits : Tout le plaisir est pour moi / De même
— Seit (+ Datif) : Depuis. Note : On utilise le présent en allemand (Ich wohne seit zwei Jahren hier).
— Deshalb : C’est pourquoi. Note : Engendre une inversion immédiate (deshalb bin ich hier).$kt$, $kt${"source":"manuel_pdf","course_number":2}$kt$::jsonb, 2),
  ('Allemand', 'declension', $kt$Cours 3 · Le laboratoire des déclinaisons de l’adjectif$kt$, $kt$Grammaire : Les déclinaisons de l’adjectif épithète
L’adjectif placé directement devant un nom prend une terminaison spécifique selon le déterminant qui le précède.

Déclinaison Faible vs Déclinaison Mixte A. Déclinaison faible (Après un article
défini : der, die, das) : L’article portant déjà la marque du cas, l’adjectif prend la terminaison -e (au Nominatif singulier) ou -en (aux cas indirects et au pluriel).
Nominativ Masc. : Der neue Kollege ist nett.
Akkusativ Masc. : Ich kenne den neuen Kollegen.

B. Déclinaison mixte (Après un article indéfini, possessif ou kein) : L’adjectif doit porter la marque du genre si l’article est neutre ou incomplet au Nominatif.
Nominativ Masc. : Das ist ein neuer Kollege.
Nominativ Neutre : Das ist ein schönes Auto.
Akkusativ Fem. : Er sucht eine gute Stelle.$kt$, $kt${"source":"manuel_pdf","course_number":3}$kt$::jsonb, 3),
  ('Allemand', 'conjugation', $kt$Cours 4 · Les temps du passé (Perfekt et Präteritum)$kt$, $kt$Grammaire : Le système du passé en allemand
L’allemand utilise deux temps principaux pour exprimer le passé, selon le canal de communication utilisé.
— Le Parfait (Perfekt) : C’est le temps de l’oral et de la communication quotidienne. Il se construit avec l’auxiliaire haben ou sein au présent (en position 2) et le participe II (Partizip II ) rejeté à la toute fin de la phrase.
Auxiliaire sein : Utilisé pour les verbes de déplacement (gehen, fahren) ou de changement d’état (aufstehen).
Exemple 1 : Ich habe gestern ein Buch gelesen.
Exemple 2 : Er ist nach Berlin gefahren.
— Le Prétérit (Präteritum) : C’est le temps de l’écrit (récits, presse). Cependant, pour les auxiliaires (sein, haben) et les verbes modaux (können, müssen...), on utilise presque toujours le prétérit, même à l’oral.
Sein au prétérit : ich war, du warst, er war, wir waren, ihr wart, sie waren.
Haben au prétérit : ich hatte, du hattest, er hatte, wir hatten, ihr hattet, sie hatten.

Expression Orale & Phonétique : Le rythme des verbes forts
Les verbes irréguliers (forts) changent de voyelle au participe II et se terminent en -en (ex : sehen → gesehen, sprechen → gesprochen). Le préfixe ge- est totalement atone (non accentué). Entraînez-vous à prononcer ces mots à voix haute en accentuant fortement la syllabe radicale : ge-spro-chen, ge-fah-ren.$kt$, $kt${"source":"manuel_pdf","course_number":4}$kt$::jsonb, 4),
  ('Allemand', 'vocabulary', $kt$Cours 5 · Le logement et la vie en colocation (WG)$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Conversation téléphonique pour une recherche d’appartement entre Lukas et Mia.

Banque de Vocabulaire Enrichi
— Die WG (Wohngemeinschaft) : La colocation
— Das WG-Zimmer : La chambre en colocation
— Der Mitbewohner / Die Mitbewohnerin : Le colocataire
— Die Besichtigung : La visite (d’un bien immobilier)
— Die Kaltmiete : Le loyer hors charges
— Die Warmmiete : Le loyer charges comprises
— Die Nebenkosten : Les charges (eau, électricité, chauffage)
— Ordentlich : Ordonné, propre$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Allemand', 'conjugation', $kt$Cours 6 · Les verbes à particules séparables et inséparables$kt$, $kt$Grammaire : Séparables vs Inséparables
L’allemand possède des verbes composés dont le comportement dépend de leur préfixe.

Fonctionnement des particules A. Les verbes à particule séparable : Le préfixe (auf-, an-, mit-, aus-, ein-...) se détache du verbe conjugué au présent et se place à la toute fin de la proposition principale. Au parfait, le préfixe -ge- s’intercale au milieu.
Présent : Ich stehe jeden Morgen um 7 Uhr auf (aufstehen).
Parfait : Ich bin aufgestanden.

B. Les verbes à particule inséparable : Les préfixes (be-, ver-, er-, ge-, zer-, ent-...) ne se détachent jamais. Ils ne prennent pas de préfixe -ge- au parfait.
Présent : Ich verstehe das Problem (verstehen).
Parfait : Ich habe verstanden (et non geverstanden).$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Allemand', 'declension', $kt$Cours 7 · Les prépositions mixtes (Wechselpräpositionen)$kt$, $kt$Grammaire : Le dilemme Akkusativ vs Dativ
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
Entraînez-vous à prononcer le contraste à voix haute : das Buch (→ fond de la gorge) vs die Bücher (→ avant du palais).$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Allemand', 'vocabulary', $kt$Cours 8 · Les voyages, l’orientation et les transports$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Annonces sonores de la Deutsche Bahn en gare centrale de Francfort.

Banque de Vocabulaire Enrichi
— Das Gleis : La voie (de train)
— Der Fahrgast / Die Fahrgäste : Le passager / les passagers
— Die Störung : La panne, la perturbation
— Die Verspätung : Le retard
— Der Gleiswechsel : Le changement de voie
— Einsteigen / Aussteigen / Umsteigen : Monter / Descendre / Changer de train
(Particules séparables)
— Voraussichtlich : Prévisible / Probablement$kt$, $kt${"source":"manuel_pdf","course_number":8}$kt$::jsonb, 8),
  ('Allemand', 'rule', $kt$Cours 9 · Expression de l’espace et du mouvement (Wohin vs Wo)$kt$, $kt$Grammaire : Les paires de verbes de position et mouvement
L’allemand distingue les verbes d’action transitive (faibles, réguliers + Accusatif) et les verbes d’état résultant (forts, irréguliers + Datif).

Action / Mouvement (+ Accusatif)           Position résultante (+ Datif) stellen (placer verticalement)             stehen (être debout/placé)
legen (poser à plat)                       liegen (être couché/posé)
setzen (asseoir / se mettre)               sitzen (être assis)
hängen (suspendre)                         hängen (être suspendu)

Ejemplo : Ich lege das Buch auf das Sofa. → Das Buch liegt auf dem Sofa.$kt$, $kt${"source":"manuel_pdf","course_number":9}$kt$::jsonb, 9),
  ('Allemand', 'rule', $kt$Cours 10 · Les connecteurs doubles (Doppelkonnektoren)$kt$, $kt$Grammaire : Associer les idées avec élégance
Les connecteurs doubles permettent d’unir des mots, des groupes de mots ou des propositions indépendantes de manière binaire. Ils n’entraînent pas le rejet du verbe à la fin puisqu’ils introduisent des propositions principales.

Les trois structures fondamentales A. Sowohl ... als auch (Tant ... que / non seulement ... mais aussi) : Addition positive.
Ejemplo : Ich spreche sowohl Deutsch als auch Englisch.

B. Entweder ... oder (Soit ... soit) : Alternative exclusive.
Ejemplo : Wir gehen entweder ins Kino oder wir bleiben zu Hause.

C. Weder ... noch (Ni ... ni) : Double négation.
Ejemplo : Er hat weder Zeit noch Geld. Note : “noch” peut provoquer une inversion verbe-sujet s’il commence une proposition.

Expression Orale & Phonétique : Le rythme binaire
Ces structures imposent une courbe mélodique rigoureuse à l’oral. La voix doit monter légèrement sur le premier terme (sowohl, entweder, weder), puis redescendre de manière marquée sur le second (als auch, oder, noch). Entraînez-vous à prononcer à voix haute : Er ist entweder im Büro ↗ oder er arbeitet zu Hause ↘.$kt$, $kt${"source":"manuel_pdf","course_number":10}$kt$::jsonb, 10),
  ('Allemand', 'conjugation', $kt$Cours 13 · L’expression du souhait et du regret (Konjunktiv II )$kt$, $kt$Grammaire : Le mode de l’imaginaire au présent
Le Konjunktiv II correspond fonctionnellement au conditionnel présent français. Il permet de s’extraire de la réalité pour formuler des hypothèses, des souhaits ou des regrets. On l’utilise sous deux formes principales :

Forme Composée vs Forme Simple A. La forme composée (würde + Infinitif) : C’est la structure la plus fréquente pour la grande majorité des verbes réguliers et irréguliers. L’auxiliaire würde occupe la position 2 et l’infinitif est rejeté en fin de proposition. Conjugaison de werden au Konjunktiv II : ich würde, du würdest, er würde, wir würden, ihr würdet, sie würden.
Ejemplo : Ich würde gerne nach Berlin reisen.

B. La forme simple (Verbes de base et modaux) : Pour les auxiliaires (sein, haben) et les verbes modaux, on utilise une forme synthétique dérivée du prétérit, à laquelle on ajoute un umlaut (inflexion) et les terminaisons du subjonctif.
Sein → wäre : ich wäre, du wärst, er wäre, wir wären, ihr wärt, sie wären.
Haben → hätte : ich hätte, du hättest, er hätte, wir hätten, ihr hättet, sie hätten.
Ejemplo : Ich hätte gerne mehr Zeit und ich wäre jetzt gerne am Strand.

Expression Orale & Phonétique : L’intonation du regret
Pour marquer la dimension affective du regret ou du souhait irréalisable à l’oral, l’accentuation tonique insiste fortement sur les adverbes de modalité comme gerne ou doch, ainsi que sur l’auxiliaire. La courbe mélodique monte sur l’auxiliaire puis descend de manière marquée en fin de phrase. Entraînez-vous à prononcer avec mélancolie : Ich hätte ↗ so gerne ein großes Haus ↘.$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Allemand', 'rule', $kt$Cours 14 · Le système éducatif et universitaire allemand$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Témoignage de Leon, étudiant inscrit à l’Université Humboldt de Berlin.

Banque de Vocabulaire Enrichi
— Das Studium : Les études supérieures. Note de distinction fondamentale : “lernen” signifie étudier/réviser une leçon précise, tandis que “studieren” signifie être inscrit à l’université.
— Die Vorlesung : Le cours magistral (à l’amphithéâtre)
— Die Prüfung bestehen : Réussir/valider un examen
— Das Studentenwohnheim : La résidence universitaire
— Das Stipendium : La bourse d’études
— Der Abschluss : Le diplôme de fin d’études (Bachelor- / Masterabschluss)
— Die Ausbildung : La formation professionnelle / l’apprentissage$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Allemand', 'vocabulary', $kt$Vocabulaire · Le système éducatif et universitaire allemand$kt$, $kt$Banque de Vocabulaire Enrichi
— Das Studium : Les études supérieures. Note de distinction fondamentale : “lernen” signifie étudier/réviser une leçon précise, tandis que “studieren” signifie être inscrit à l’université.
— Die Vorlesung : Le cours magistral (à l’amphithéâtre)
— Die Prüfung bestehen : Réussir/valider un examen
— Das Studentenwohnheim : La résidence universitaire
— Das Stipendium : La bourse d’études
— Der Abschluss : Le diplôme de fin d’études (Bachelor- / Masterabschluss)
— Die Ausbildung : La formation professionnelle / l’apprentissage$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Allemand', 'rule', $kt$Cours 15 · Formulation de conseils et interactions hypothétiques$kt$, $kt$Grammaire : Le conseil atténué et la politesse avec sollte
Pour formuler une suggestion ou donner un conseil de manière beaucoup plus diplomatique et douce que l’impératif direct, l’allemand recourt au verbe modal sollen conjugué au Konjunktiv II.
— Structure au singulier (Tú) : Du solltest mehr lernen. (Tu devrais étudier davantage).
— Structure de politesse (Vouvoiement) : Sie sollten den Professor fragen. (Vous devriez demander au professeur).
— La structure hypothétique : Permet de créer des scénarios avec wenn (si). Le verbe est rejeté à la fin de la conditionnelle, et la principale commence par l’inversion.
Ejemplo : Wenn ich Zeit hätte, würde ich dir helfen. (Si j’avais le temps, je t’aiderais).$kt$, $kt${"source":"manuel_pdf","course_number":15}$kt$::jsonb, 15),
  ('Allemand', 'rule', $kt$Cours 16 · Les propositions relatives (Relativsätze)$kt$, $kt$Grammaire : Caractériser un nom avec précision
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
Les propositions relatives rallongent considérablement les phrases. À l’oral, il est impératif de marquer une légère pause respiratoire juste avant le pronom relatif (matérialisé par la virgule obligatoire à l’écrit) et de faire monter l’intonation, puis de la faire redescendre sur le verbe final. Entraînez-vous à prononcer à voix haute : Das ist das Buch, ↗ das ich gelesen habe ↘.$kt$, $kt${"source":"manuel_pdf","course_number":16}$kt$::jsonb, 16),
  ('Allemand', 'vocabulary', $kt$Cours 17 · Les médias, Internet et le numérique$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait d’un débat sur la radio publique NDR au sujet du temps d’écran.

Banque de Vocabulaire Enrichi
— Die sozialen Medien : Les réseaux sociaux
— Nachrichten teilen : Partager des messages / des actualités
— Der Medienkonsum : La consommation de médias / le temps d’écran
— Das Gerät : L’appareil / le dispositif (ex : le smartphone)
— Online / Offline sein : Être en ligne / hors ligne
— Herunterladen : Télécharger (Verbe séparable : Ich lade eine App herunter)
— Die App nutzen : Utiliser une application$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Allemand', 'vocabulary', $kt$Cours 18 · Le laboratoire du portrait et de la description de profil$kt$, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes décrivant un outil numérique ou une application logicielle essentielle à votre quotidien. Vous devez intégrer au least une relative au nominatif, une à l’accusatif, une au datif introduite par une préposition (mit, in, auf ), et employer le vocabulaire des médias du cours précédent.

Consigne : En vous basant sur votre texte écrit, présentez cet objet ou cette application à voix haute pendant 2 minutes en continu sans jamais prononcer son nom, comme pour le faire deviner à un interlocuteur. Exemple de structure orale à utiliser : Das ist ein Tool, mit dem ich täglich arbeite und das ich auf mein Smartphone heruntergeladen habe... Soignez le rejet absolu du verbe conjugué à la fin de la relative.$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Allemand', 'rule', $kt$Cours 19 · Les propositions subordonnées de but (Um... zu vs Damit)$kt$, $kt$Grammaire : Exprimer le but et l’intention
L’allemand possède deux manières d’exprimer le but (“pour que” / “afin de”), selon que les sujets des propositions sont identiques ou différents.

Même sujet vs Sujets différents A. Même sujet → Structure infinitive : UM ...
ZU + Infinitif : Le sujet de l’action principale est le même que celui du but. On omet le pronom sujet dans la subordonnée. Zu se place juste avant l’infinitif en toute fin (ou s’intercale s’il s’agit d’un verbe séparable).
Ejemplo : Ich lerne Deutsch, um in Berlin zu arbeiten.

B. Sujets différents → Proposition subordonnée : DAMIT + Verbe conjugué
à la fin : Le sujet de la principale est différent de celui de la subordonnée. Le verbe conjugué est obligatoirement rejeté tout à la fin.
Ejemplo : Ich spreche Deutsch, damit mein Chef mich versteht.

Expression Orale & Phonétique : Le contraste mélodique
À l’oral, la structure infinitive avec um... zu glisse de manière fluide vers la fin sans accentuer le mot um. En revanche, le mot damit reçoit une forte accentuation tonique sur sa première syllabe (da-mit) pour poser l’intention, suivie d’un rythme suspendu jusqu’au verbe final. Entraînez-vous à prononcer à voix haute : Ich helfe dir, ↗ damit du fertig bist ↘.$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Allemand', 'vocabulary', $kt$Cours 20 · Le monde du travail, du recrutement et du stage (Praktikum)$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Simulation d’un entretien d’embauche pour un poste de chef de projet à Francfort.

Banque de Vocabulaire Enrichi
— Die Stelle / Der Posten : Le poste / l’emploi
— Sich bewerben um (+ Akkusativ) : Postuler pour / faire acte de candidature pour
— Die Berufserfahrung : L’expérience professionnelle

— Das Praktikum : Le stage (étudiant ou de réorientation)
— Das Gehalt / Der Lohn : Le salaire / la paye
— Die Vollzeit / Die Teilzeit : Le plein temps / le temps partiel
— Die Verantwortung übernehmen : Prendre ses responsabilités / assumer la responsabilité$kt$, $kt${"source":"manuel_pdf","course_number":20}$kt$::jsonb, 20),
  ('Allemand', 'rule', $kt$Cours 21 · Rédaction de candidature et simulation d’entretien d’embauche$kt$, $kt$Consigne : Rédigez le corps d’une lettre de motivation formelle de 8 à 10 lignes pour postuler au poste de votre choix. Vous devez obligatoirement intégrer : une structure de but avec um... zu, une structure avec damit, une forme de continuité au présent avec seit, et mobiliser le vocabulaire professionnel acquis au cours précédent.

Consigne : Enregistrez-vous ou placez-vous face à un miroir pour simuler votre entretien. Répondez de manière fluide et dynamique aux questions suivantes à voix haute pendant 3 minutes au total : 1. Warum bewerben Sie sich um diese Stelle ? 2. Welche Berufserfahrung bringen Sie mit ? 3. Warum sollten wir gerade Sie einstellen ? Soignez le positionnement du verbe conjugué lors des justifications et utilisez le conditionnel de politesse pour valoriser vos compétences.$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Allemand', 'conjugation', $kt$Cours 22 · Les verbes à régime (prépositions fixes)$kt$, $kt$Grammaire : Les couples verbe / préposition indissociables
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
Ces couples verbe-préposition doivent être mémorisés comme un bloc rythmique unique. À l’oral, liez phonétiquement la préposition au verbe ou au pronom réfléchi sans marquer de pause respiratoire. Entraînez-vous à prononcer d’une seule traite : Ich-interessiere-mich-für-dasProjekt. / Ich-sprech-mit-dem-Chef.$kt$, $kt${"source":"manuel_pdf","course_number":22}$kt$::jsonb, 22),
  ('Allemand', 'rule', $kt$Cours 24 · Grand Laboratoire de débat argumenté écrit et oral$kt$, $kt$Consigne : Rédigez un paragraphe d’argumentation de 10 à 12 lignes sur le thème : Vor- und Nachteile des Homeoffices (Avantages et inconvénients du télétravail). Vous devez obligatoirement y intégrer : au moins deux verbes à prépositions fixes (denken an, sich freuen auf, sprechen mit), une structure conditionnelle complète au Konjunktiv II (wenn... wäre/hätte, würde...) et des connecteurs logiques de transition (einerseits... andererseits, zudem, jedoch).

Consigne : Imaginez que vous présentez votre point de vue lors d’une réunion officielle devant Frau König. Détachez-vous complètement de vos notes manuscrites et prenez la parole à voix haute de manière ferme, articulée et fluide pendant 3 minutes continues. Structurez votre pitch en trois phases distinctes : introduction du sujet, balance d’un argument favorable versus une objection (en employant des relatives complexes), puis conclusion sous forme de proposition de compromis hybride.$kt$, $kt${"source":"manuel_pdf","course_number":24}$kt$::jsonb, 24),
  ('Allemand', 'conjugation', $kt$Cours 25 · La voix passive (Passiv) au présent et au parfait$kt$, $kt$Grammaire : Le fonctionnement du Passiv
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
des énoncés : Das Produkt wird ge-kauft. / Die Webseite wird ge-stal-tet.$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Allemand', 'rule', $kt$Cours 26 · La consommation, l’économie et la publicité$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Spot publicitaire radiophonique pour une marque allemande d’éco-technologie.

Banque de Vocabulaire Enrichi
— Die Werbung : La publicité / la réclame
— Der Verbrauch : La consommation (der Verbraucher = le consommateur)
— Ein Produkt herstellen : Fabriquer / produire un article commerciale
— Der Strom / Die Energie : L’électricité / l’énergie
— Die Bedienung : L’utilisation / la manipulation / la prise en main
— Etwas verschwenden : Gaspiller / dissiper quelque chose
— Nachhaltig : Durable / écoresponsable$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Allemand', 'vocabulary', $kt$Vocabulaire · La consommation, l’économie et la publicité$kt$, $kt$Banque de Vocabulaire Enrichi
— Die Werbung : La publicité / la réclame
— Der Verbrauch : La consommation (der Verbraucher = le consommateur)
— Ein Produkt herstellen : Fabriquer / produire un article commerciale
— Der Strom / Die Energie : L’électricité / l’énergie
— Die Bedienung : L’utilisation / la manipulation / la prise en main
— Etwas verschwenden : Gaspiller / dissiper quelque chose
— Nachhaltig : Durable / écoresponsable$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Allemand', 'vocabulary', $kt$Cours 27 · Le laboratoire de description de processus industriels et commerciaux$kt$, $kt$Atelier d’Écriture : Description technique de processus$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Allemand', 'declension', $kt$Cours 28 · Le cas du Génitif et ses prépositions (Wegen, Trotz)$kt$, $kt$Grammaire : Le cas de la possession et de la rigueur formelle
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

mot pour garantir la fluidité de la structure nominale B2. Entraînez-vous à prononcer de manière nette d’une seule traite : wegen-des-Technikfehlers, trotz-des-Streiks.$kt$, $kt${"source":"manuel_pdf","course_number":28}$kt$::jsonb, 28),
  ('Allemand', 'vocabulary', $kt$Cours 29 · L’environnement, le climat et la transition écologique (Energiewende)$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait d’une chronique écologique diffusée sur la chaîne d’information Deutsche Welle.

Banque de Vocabulaire Enrichi
— Die Energiewende : La transition énergétique (concept politique et sociétal majeur en Allemagne)
— Der CO2-Ausstoß : L’émission de dioxyde de carbone (CO2)
— Der Klimawandel : Le changement / dérèglement climatique
— Erneuerbare Energien : Les énergies renouvelables
— Der Umweltschutz : La protection de l’environnement (der Klimaschutz = la défense du climat)
— Die Mülltrennung : Le tri sélectif des déchets
— Nachhaltig : Durable / écoresponsable / pérenne$kt$, $kt${"source":"manuel_pdf","course_number":29}$kt$::jsonb, 29),
  ('Allemand', 'rule', $kt$Cours 30 · Le laboratoire du plaidoyer écologique et du style nominal$kt$, $kt$Grammaire : Introduction au style nominal (Nominalstil)
Le niveau B2 exige de savoir condenser l’information en utilisant des structures nominales denses au génitif à la place de propositions subordonnées verbales (ex : transposer la forme B1 weil das Klima sich wandelt en forme B2 wegen des Klimawandels).$kt$, $kt${"source":"manuel_pdf","course_number":30}$kt$::jsonb, 30),
  ('Allemand', 'conjugation', $kt$Cours 31 · Le Futur I pour l’avenir et la supposition$kt$, $kt$Grammaire : Les deux visages du Futur I
Le Futur I se forme à l’aide de l’auxiliaire werden conjugué au présent (en position 2) et de l’infinitif du verbe principal rejeté à la toute fin de la proposition. Au niveau B2, ce temps acquiert une double valeur sémantique :

Expression de l’avenir vs Supposition présente A. Exprimer l’avenir (Projet /
Promesse) : Valeur classique de projection temporelle.
Ejemplo : Nächstes Jahr werden wir eine Reise nach Wien machen.

B. Exprimer la supposition au présent (Nuance B2) : En y associant un adverbe
de modalité comme wohl (probablement) ou wahrscheinlich (sans doute), le Futur I permet de formuler une hypothèse sur un fait contemporain à l’énonciation.
Ejemplo : Wo ist Thomas ? Er wird wohl im Büro sein. (Où est Thomas ? Il doit probablement être au bureau / Il sera sans doute au bureau actuellement).

Expression Orale & Phonétique : L’intonation de la probabilité
Lorsque le Futur I est employé pour exprimer une supposition présente, l’accentuation tonique de la phrase se déplace sur l’adverbe de probabilité (wohl ou wahrscheinlich). La voix doit monter légèrement sur cet adverbe pour marquer l’incertitude intellectuelle, puis redescendre calmement sur l’infinitif final. Entraînez-vous à prononcer à voix haute avec une intonation
dubitative : Sie wird wohl ↗ zu Hause arbeiten ↘.$kt$, $kt${"source":"manuel_pdf","course_number":31}$kt$::jsonb, 31),
  ('Allemand', 'rule', $kt$Cours 32 · La culture, l’art et les traditions germaniques$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait d’un guide audio thématique présenté au Musée d’Art Moderne de Francfort.

Banque de Vocabulaire Enrichi
— Die zeitgenössische Kunst : L’art contemporain
— Die Ausstellung : L’exposition / la galerie éphémère

— Das Meisterwerk : Le chef-d’uvre
— Die Tradition / Die Kultur : La tradition / la culture
— Der Künstler / Die Künstlerin : L’artiste / le créateur
— Etwas widerspiegeln : Refléter / faire écho à (Verbe séparable : Es spiegelt etwas wider)
— Die Galerie : La galerie d’art$kt$, $kt${"source":"manuel_pdf","course_number":32}$kt$::jsonb, 32),
  ('Allemand', 'vocabulary', $kt$Vocabulaire · La culture, l’art et les traditions germaniques$kt$, $kt$Banque de Vocabulaire Enrichi
— Die zeitgenössische Kunst : L’art contemporain
— Die Ausstellung : L’exposition / la galerie éphémère
— Das Meisterwerk : Le chef-d’uvre
— Die Tradition / Die Kultur : La tradition / la culture
— Der Künstler / Die Künstlerin : L’artiste / le créateur
— Etwas widerspiegeln : Refléter / faire écho à (Verbe séparable : Es spiegelt etwas wider)
— Die Galerie : La galerie d’art$kt$, $kt${"source":"manuel_pdf","course_number":32}$kt$::jsonb, 32),
  ('Allemand', 'rule', $kt$Cours 33 · Le laboratoire du récit spéculatif sur l’avenir de la société$kt$, $kt$Consigne : Rédigez un paragraphe d’anticipation de 8 à 10 lignes décrivant l’évolution du monde de la culture et des musées face à la numérisation et à l’intelligence artificielle d’ici les trente prochaines années. Vous devez obligatoirement intégrer : au moins trois structures de Futur I à valeur d’avenir, deux structures de Futur I à valeur de supposition présente (avec wohl), et deux compléments du nom déclinés au cas du génitif.

Consigne : Imaginez que vous êtes invité en tant qu’expert à un débat sur l’avenir des institutions culturelles en Allemagne. Sans lire vos notes manuscrites, prenez la parole à voix haute pendant 2 minutes et 30 secondes en continu. Formulez vos hypothèses avec clarté en veillant au rejet systématique de l’infinitif final après werden : In der Zukunft werden die Menschen Museen anders erleben. Die Technologie wird wohl eine zentrale Rolle spielen...$kt$, $kt${"source":"manuel_pdf","course_number":33}$kt$::jsonb, 33),
  ('Allemand', 'rule', $kt$Cours 34 · Les structures infinitives complexes (Ohne... zu, Anstatt... zu)$kt$, $kt$Grammaire : Fluidifier son style avec les infinitives B2
Lorsque le sujet de la proposition principale et celui de la nuance logique sont strictement identiques, l’allemand privilégie l’utilisation de structures infinitives denses. Cela permet d’éviter l’ouverture d’une proposition subordonnée lourde avec verbe conjugué.

Restriction et Substitution A. Ohne ... zu + Infinitif (Sans ... + infinitif) : Exprime l’absence d’une action pourtant attendue ou prévisible.
Ejemplo : Er ist gegangen, ohne ein Wort zu sagen. (Il est parti sans dire un mot).

B. Anstatt ... zu + Infinitif (Au lieu de ... + infinitif) : Exprime la substitution d’une action par une autre.
Ejemplo : Anstatt im Büro zu arbeiten, bleibt er heute zu Hause. (Au lieu de travailler au bureau, il reste à la maison).
Note de position : L’infinitif précédé de la particule zu occupe impérativement la toute dernière position de la clause infinitive. S’il s’agit d’un verbe séparable, zu s’intercale (anstatt fernzusehen).

Expression Orale & Phonétique : La mélodie des clauses infinitives
À l’oral, la conjonction de départ (ohne ou anstatt) marque le début d’une courbe mélodique ascendante. On observe un rythme suspendu sur les compléments intermédiaires, puis la voix redescend de manière abrupte sur le bloc final zu + infinitif. Entraînez-vous à prononcer à voix
haute : Anstatt fernzusehen, ↗ sollte er Deutsch zu lernen ↘.$kt$, $kt${"source":"manuel_pdf","course_number":34}$kt$::jsonb, 34),
  ('Allemand', 'rule', $kt$Cours 36 · Grand Laboratoire de synthèse de documents et résumé oral$kt$, $kt$Consigne : En vous appuyant sur l’article économique du cours 35 et sur le script du flash info, rédigez une note de synthèse cohérente de 10 à 12 lignes résumant les défis croisés (économiques, climatiques et technologiques) de la société allemande actuelle. Vous devez obli- gatoirement intégrer : au moins une structure passive au présent ou au passé, une structure infinitive complexe (ohne/anstatt... zu), deux prépositions au génitif (wegen et trotz), et une conjecture formulée au Futur I avec l’adverbe wohl.

Consigne : Imaginez que vous devez débriefer un cadre supérieur germanophone de votre entreprise sur la dynamique socio-écologique en Allemagne. Sans regarder vos notes de travail, prenez la parole à voix haute de manière synthétique et percutante pendant exactement 2 minutes (chronométré). Amorcez votre discours par le fait principal à la voix passive : Heute wurde ein neues Gesetz verabschiedet... Articulez clairement vos conclusions en soignant le rythme.$kt$, $kt${"source":"manuel_pdf","course_number":36}$kt$::jsonb, 36),
  ('Allemand', 'rule', $kt$Cours 37 · Les connecteurs de concession avancés (Obwohl, Trotzdem, Zwar... aber)$kt$, $kt$Grammaire : L’art de la concession syntaxique
Le niveau B2 exige une manipulation fluide et précise des structures concessives et d’opposition. Selon le connecteur choisi, l’architecture syntaxique de la phrase varie grandement :

Subordonnée, Adverbe ou Structure double A. Obwohl + Verbe conjugué à la fin
(Bien que / Quoique) : Introduit une proposition subordonnée concessive. La virgule est obligatoire avant obwohl.
Ejemplo : Ich arbeite weiter, obwohl ich sehr müde bin.

B. Trotzdem + Inversion Sujet-Verbe (Pourtant / Malgré cela) : C’est un adverbe de liaison qui introduit une proposition principale. Le verbe conjugué se place immédiatement en deuxième position, juste après trotzdem.
Ejemplo : Ich bin sehr müde. Trotzdem arbeite ich weiter.

C. Zwar ... aber (Certes ... mais) : Structure de coordination double extrêmement élégante à l’écrit comme à l’oral. Elle permet de concéder un premier fait avant de le nuancer ou de le contredire immédiatement.
Ejemplo : Ich bin zwar müde, aber ich arbeite weiter.

Expression Orale & Phonétique : Marquer l’opposition
À l’oral, la structure double zwar... aber impose un rythme de balancier très marqué. Le locuteur doit poser une accentuation d’insistance sur le mot zwar, marquer une micro-pause suspensive au niveau de la virgule, puis effectuer une relance tonique énergique sur l’élément qui suit immédiatement la conjonction aber. Entraînez-vous à prononcer à voix haute : Das Produkt ist zwar ↗ teuer, aber ↘ sehr gut.$kt$, $kt${"source":"manuel_pdf","course_number":37}$kt$::jsonb, 37),
  ('Allemand', 'vocabulary', $kt$Cours 38 · La santé, la recherche médicale et la science$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait du podcast de vulgarisation scientifique hebdomadaire Gesundheit Heute.

Banque de Vocabulaire Enrichi
— Die medizinische Forschung : La recherche médicale
— Die Auswirkung (auf + Akkusativ) : L’impact / l’effet direct (sur)
— Die Gesundheit / Die Krankheit : La santé / la maladie
— Die Vorbeugung / Die Prävention : La prévention / la prophylaxie
— Eine Tendenz zeigen : Présenter / afficher une tendance claire
— Der Fortschritt : Le progrès / l’avancée scientifique
— Die Wissenschaft : La science / la discipline académique$kt$, $kt${"source":"manuel_pdf","course_number":38}$kt$::jsonb, 38),
  ('Allemand', 'rule', $kt$Cours 39 · Le laboratoire d’analyse de graphiques et données statistiques$kt$, $kt$Atelier d’Écriture : L’analyse méthodologique de graphiques (Grafikbes-
chreibung)
Le commentaire synthétique de données chiffrées et de diagrammes est un exercice académique et professionnel pivot du niveau B2.$kt$, $kt${"source":"manuel_pdf","course_number":39}$kt$::jsonb, 39),
  ('Allemand', 'conjugation', $kt$Cours 40 · Le subjonctif I (Konjunktiv I ) pour le discours rapporté$kt$, $kt$Grammaire : La neutralité journalistique au style indirect
En allemand, pour rapporter des propos de manière totalement objective et neutre sans prendre parti, on utilise le Konjunktiv I. C’est le mode par excellence de la presse écrite et des médias d’information. S’il s’avère que la forme du Konjunktiv I est identique à celle du présent de l’indicatif (ce qui arrive souvent aux première et troisième personnes du pluriel), on la remplace par le Konjunktiv II pour éviter toute ambiguïté syntaxique.

Formation et exemple du Konjunktiv I A. Formation standard (sur la racine de
l’infinitif) : Les terminaisons régulières sont : -e, -est, -e, -en, -et, -en.
— Le verbe SEIN (Irrégulier mais capital) : ich sei, du seiest, er/sie/es sei, wir seien, ihr seiet, sie seien.
— La 3e personne du singulier (la plus utilisée) : er habe, er werde, er reise, er arbeite. B. Exemple de passage au discours indirect :
— Discours direct : Der Minister sagt : Ich bin für das neue Gesetz.
— Discours indirect : Der Minister sagt, er sei für das neue Gesetz.

Expression Orale & Phonétique : L’intonation neutre
Le discours indirect journalistique requiert une diction posée, objective et uniforme, caractéristique des présentateurs de journaux télévisés d’autorité (Tagesschau). À l’oral, la voix ne doit manifester aucune émotion ni jugement de valeur. Entraînez-vous à prononcer à voix haute avec un ton journalistique strict : Der Kanzler erklärte, die politische Krise sei endlich beendet.$kt$, $kt${"source":"manuel_pdf","course_number":40}$kt$::jsonb, 40),
  ('Allemand', 'rule', $kt$Cours 41 · La politique, l’Union européenne et la citoyenneté$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Compte-rendu d’une conférence de presse officielle au Parlement européen à Bruxelles.

Banque de Vocabulaire Enrichi
— Die europäische Integration : L’intégration européenne
— Die Bürgerbeteiligung : La participation citoyenne / l’engagement civique
— Die Mitgliedstaaten : Les États membres
— Die Verhandlungen : Les négociations (politiques, diplomatiques ou commerciales)

— Die Demokratie : La démocratie
— Der Minister / Die Sprecherin : Le ministre / la porte-parole
— Die Bürger : Les citoyens / le corps civique$kt$, $kt${"source":"manuel_pdf","course_number":41}$kt$::jsonb, 41),
  ('Allemand', 'vocabulary', $kt$Vocabulaire · La politique, l’Union européenne et la citoyenneté$kt$, $kt$Banque de Vocabulaire Enrichi
— Die europäische Integration : L’intégration européenne
— Die Bürgerbeteiligung : La participation citoyenne / l’engagement civique
— Die Mitgliedstaaten : Les États membres
— Die Verhandlungen : Les négociations (politiques, diplomatiques ou commerciales)
— Die Demokratie : La démocratie
— Der Minister / Die Sprecherin : Le ministre / la porte-parole
— Die Bürger : Les citoyens / le corps civique$kt$, $kt${"source":"manuel_pdf","course_number":41}$kt$::jsonb, 41),
  ('Allemand', 'rule', $kt$Cours 42 · Le laboratoire du compte-rendu journalistique neutre$kt$, $kt$Consigne : Rédigez une note de synthèse ou une dépêche de presse de 6 à 8 lignes résumant avec la plus stricte neutralité les déclarations de la porte-parole du cours précédent. Vous devez impérativement intégrer : au moins trois formes distinctes de Konjunktiv I (sei, habe, werde), insérer une clause concessive (obwohl ou trotzdem), et mobiliser quatre notions du lexique des institutions politiques.

Consigne : Imaginez que vous êtes correspondant permanent à Bruxelles pour un grand média télévisuel. Sans regarder vos notes de travail, prenez la parole face caméra à voix haute pendant 2 minutes et 30 secondes en continu. Structurez votre allocution de manière journalistique : Die Sprecherin erklärte heute, die Verhandlungen seien... Sie fügte hinzu, dass die Mitgliedstaaten enger zusammenarbeiten müssten... Laut Bericht wolle man die Demokratie durch Bürgerbeteiligung stärken... Assurez un débit fluide et constant.$kt$, $kt${"source":"manuel_pdf","course_number":42}$kt$::jsonb, 42),
  ('Allemand', 'declension', $kt$Cours 43 · Les adjectifs substantivés (Substantivierte Adjektive)$kt$, $kt$Grammaire : La nominalisation de l’adjectif
En allemand, un adjectif peut être employé directement comme un nom (on lui applique alors une majuscule). Bien qu’il devienne un nom, il conserve exactement les mêmes terminaisons qu’un adjectif épithète classique selon qu’il suit la déclinaison forte, faible ou mixte.

Les personnes et les concepts abstraits A. Les personnes (Masculin / Féminin) :
— Masculin : der Angestellte (l’employé – faible), ein Angestellter (un employé – mixte).
— Féminin : die Angestellte (l’employée – faible), eine Angestellte (une employée – mixte).
— Pluriel : die Angestellten (les employés – faible), viele Angestellte (beaucoup d’employés – forte).
B. Les concepts abstraits (Neutre) : Ils sont extrêmement fréquents après les pronoms indéfinis tels que alles (tout), etwas (quelque chose), nichts (rien) ou viel (beaucoup). L’adjectif substantivé adopte alors une terminaison neutre.
— Nominativ / Akkusativ : Ich wünsche dir alles Gute. (Je te souhaite le meilleur).
— Après un indéfini : Es gibt etwas Neues / nichts Interessantes.

Expression Orale & Phonétique : L’accentuation des concepts
À l’oral, la nominalisation déplace la force de l’énoncé sur le concept substantivé. La terminaison doit être clairement articulée, notamment le -er final masculin de la déclinaison mixte qui se vocalise légèrement en un son -a ouvert et bref. Entraînez-vous à prononcer à voix haute : Es gibt nichts Schö-nes. / Er ist ein Be-kann-ter.$kt$, $kt${"source":"manuel_pdf","course_number":43}$kt$::jsonb, 43),
  ('Allemand', 'rule', $kt$Cours 44 · Les variations régionales et culturelles (Allemagne, Autriche, Suisse)$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Reportage culturel croisé sur les spécificités de l’espace linguistique DACH.

Banque de Vocabulaire Enrichi
— Der Sprachraum / Plurizentrisch : L’espace linguistique / pluricentrique (composé de plusieurs centres d’autorité)
— Das Hochdeutsch : L’allemand standard / officiel (langue normée)
— Die kulturelle Vielfalt : La diversité culturelle
— Österreich / Die Schweiz : L’Autriche / la Suisse
— Helvetismus / Austriazismus : Tournure linguistique helvétique / autrichienne
— Das Spital : L’hôpital (variante helvétique et autrichienne commune)
— Der Jänner : Le mois de janvier (austriacisme officiel)$kt$, $kt${"source":"manuel_pdf","course_number":44}$kt$::jsonb, 44),
  ('Allemand', 'vocabulary', $kt$Vocabulaire · Les variations régionales et culturelles (Allemagne, Autriche, Suisse)$kt$, $kt$Banque de Vocabulaire Enrichi
— Der Sprachraum / Plurizentrisch : L’espace linguistique / pluricentrique (composé de plusieurs centres d’autorité)
— Das Hochdeutsch : L’allemand standard / officiel (langue normée)
— Die kulturelle Vielfalt : La diversité culturelle
— Österreich / Die Schweiz : L’Autriche / la Suisse
— Helvetismus / Austriazismus : Tournure linguistique helvétique / autrichienne
— Das Spital : L’hôpital (variante helvétique et autrichienne commune)
— Der Jänner : Le mois de janvier (austriacisme officiel)$kt$, $kt${"source":"manuel_pdf","course_number":44}$kt$::jsonb, 44),
  ('Allemand', 'rule', $kt$Cours 45 · Le laboratoire du monologue soutenu sur un sujet de société complexe$kt$, $kt$Consigne : Rédigez un paragraphe d’essai critique de 10 à 12 lignes sur le thème suivant : Sollte man im Sprachunterricht nur das Standarddeutsch lernen oder auch regionale Varianten beachten ? (Devrait-on apprendre uniquement l’allemand standard ou s’ouvrir aux variantes régionales ?). Vous devez obligatoirement intégrer : au moins deux adjectifs substantivés (etwas Wichtiges, das Neue, das Beste), un connecteur de concession avancé (obwohl ou zwar... aber), et mobiliser le lexique thématique de l’espace pluricentrique (die kulturelle Vielfalt, der Sprachraum).

Consigne : Imaginez que vous soutenez votre point de vue lors d’une table ronde universitaire ou d’une épreuve de certification B2 supérieure. Sans regarder vos notes de travail, prenez la parole à voix haute de manière fluide, rythmée et convaincante pendant 3 minutes continues. Structurez votre monologue en valorisant les concepts abstraits : Der deutsche Sprachraum bietet eine enorme kulturelle Vielfalt. Es ist zwar wichtig, das Hochdeutsch zu beherrschen, aber man sollte auch das Neue kennenlernen...$kt$, $kt${"source":"manuel_pdf","course_number":45}$kt$::jsonb, 45),
  ('Allemand', 'rule', $kt$Cours 46 · Syntaxe avancée et révision des pièges B2$kt$, $kt$Grammaire : Synthèse des structures de phrases complexes
Le niveau B2 se caractérise par la maîtrise absolue de l’agencement syntaxique et l’élimination des erreurs récurrentes.

Le piège du rejet double et de la négation A. Le rejet double dans les proposi-
tions subordonnées : Lorsque plusieurs formes verbales s’accumulent à la fin d’une subordonnée (comme au passif ou aux temps composés), le verbe conjugué se place impérativement en toute dernière position, juste après les participes passés ou les infinitifs.
Ejemplo : Ich weiß, dass das neue Produkt gestern hergestellt worden ist.

B. La place de la négation nicht : Elle se positionne généralement juste devant l’élément qu’elle nie, ou immédiatement avant le bloc verbal final.
Ejemplo : Er hat das Ziel trotz aller Bemühungen nicht erreicht.$kt$, $kt${"source":"manuel_pdf","course_number":46}$kt$::jsonb, 46),
  ('Coréen', 'alphabet', $kt$Cours 1 · Les combinaisons complexes du Hangeul$kt$, $kt$Phonétique & Écriture : Les extensions du système
Pour atteindre une fluidité naturelle, il est essentiel de distinguer l’intensité et le débit d’air des consonnes coréennes. On sépare les consonnes simples, aspirées (fort rejet d’air) et doubles (bloquées à la gorge).

Consonnes doubles (tendues) & Diphtongues

A. Les consonnes doubles : Se prononcent de manière très sèche, sans expira-
tion.
ﾢ (kk – plus sec que ﾡ ) / ﾨ (tt) / ﾳ (pp) / ﾶ (ss) / ﾹ (jj).
Exemple : 방 (chambre) vs 빵 (pain – son tendu ﾳ ).

B. Les voyelles complexes (diphtongues) :
Les sons “é” : 애 (ae) et 에 (e) ont aujourd’hui une prononciation quasi identique. Les sons avec “y” : 얘 (yae) / 예 (ye).
Les combinaisons avec “w” : 와 (wa) / 워 (wo) / 왜 (wae) / 외 (we) / 위 (wi).
La voyelle mixte verticale/horizontale : 의 (ui).

Expression Orale : Le test du courant d’air
Entraînement pratique : Placez votre main devant votre bouche. Lorsque vous prononcez 코 (nez – aspiré), vous devez sentir un souffle d’air net. Lorsque vous prononcez 꼬리 (queue – consonne double), aucun air ne doit s’échapper. Répétez à voix haute : 가 (simple) → 카 (aspiré) → 까 (double).$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Coréen', 'rule', $kt$Cours 2 · Le secret du Batchim (받침 ) et les liaisons$kt$, $kt$Grammaire & Phonétique : Les règles de la consonne finale
Toutes les consonnes peuvent s’insérer en position basse (Batchim), mais elles ne peuvent produire que 7 sons distincts si elles sont suivies d’une autre consonne ou d’un silence.
— ﾡ , ﾻ , ﾢ → se prononcent [K] (ex : 한국 → [Han-guk]).
— ﾤ → se prononce [N] (ex : 안 ).
— ﾧ , ﾼ , ﾵ , ﾶ , ﾸ , ﾺ , ﾾ → se prononcent toutes [T] (ex : 옷 → se prononce [ot]).
— ﾩ → se prononce [L] (ex : 딸 → [ttal]).
— ﾱ → se prononce [M] (ex : 몸 ).
— ﾲ , ﾽ → se prononcent [P] (ex : 집 → [jip]).
— ﾷ → se prononce [NG] (ex : 공 ).

La règle d’or de la Liaison (Resyllabation)
Lorsqu’une syllabe se termine par un Batchim et que la suivante débute par la consonne muette ﾷ , la consonne du bas remonte phonétiquement pour prendre sa place.
Exemple 1 : 한국어 (Langue coréenne) s’écrit 한 - 국 - 어 mais se prononce oralement [한구 거 ] (Han-gu-gco).
Exemple 2 : 집에 (À la maison) s’écrit 집 - 에 mais se prononce [지베 ] (ji-bé).$kt$, $kt${"source":"manuel_pdf","course_number":2}$kt$::jsonb, 2),
  ('Coréen', 'conjugation', $kt$Cours 3 · Présentations officielles (Style Poli-Formel)$kt$, $kt$Grammaire & Syntaxe : L’affirmation de courtoisie
Le coréen module ses structures selon le statut de l’interlocuteur. Le style poli-formel (입 ̃ 니다 ) est la clé des interactions formelles, médiatiques ou premières rencontres d’affaires.

Structure SOV & Particule de Thème

La structure d’identité : [Substantif] + 입니다 (im-ni-da) = “Je suis [X]”.
Note phonétique : Le ﾲ devant le ﾤ se transforme en son [M], on prononce donc
[임니다 ].

La particule de thème (은 ̃ / 는 ̃) : S’attache au sujet pour délimiter le thème. On emploie 는 après une voyelle ( 저 → 저는 ) et 은 après une consonne basse ( 당신 → 당신은 ).

Lexique de l’Identité
— 저 (je – humble) / 저는 (En ce qui me concerne, je...)
— 사람 : Personne / Être humain
— 프랑스 : La France
— 한국 : La Corée
— 학생 : Étudiant
— 회사원 : Employé de bureau$kt$, $kt${"source":"manuel_pdf","course_number":3}$kt$::jsonb, 3),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · Présentations officielles (Style Poli-Formel)$kt$, $kt$Lexique de l’Identité
— 저 (je – humble) / 저는 (En ce qui me concerne, je...)
— 사람 : Personne / Être humain
— 프랑스 : La France
— 한국 : La Corée
— 학생 : Étudiant
— 회사원 : Employé de bureau$kt$, $kt${"source":"manuel_pdf","course_number":3}$kt$::jsonb, 3),
  ('Coréen', 'declension', $kt$Cours 4 · La structure SOV et la particule d’objet (을 ̃/를 )$kt$, $kt$Grammaire & Syntaxe : L’architecture de la phrase coréenne
Contrairement au français (Sujet-Verbe-Objet), le coréen place systématiquement le verbe à la toute fin de la phrase. Pour identifier les rôles grammaticaux dans cette structure Sujet-Objet-Verbe (SOV), on attache des particules directement derrière les mots.

La particule d’objet direct (을 ̃ / 를 ̃)

Elle marque le complément d’objet direct (COD), c’est-à-dire l’entité qui subit directement l’action du verbe. Elle se colle au nom sans espace.

— 를 : S’utilise après une voyelle. → 사과 (pomme) + 를 → 사과를
— 을 : S’utilise après une consonne finale (Batchim). → 책 (livre) + 을 → 책을
Exemple de phrase SOV : 저는책을읽습니다 . (Je [thème] + livre [objet] + lis [poliformel] = Je lis un livre).

Vocabulaire de base
— 사과 : Pomme
— 책 : Livre
— 물 : Eau
— 커피 : Café
— 읽다 : Lire (radical : 읽 )
— 마시다 : Boire (radical : 마시 )$kt$, $kt${"source":"manuel_pdf","course_number":4}$kt$::jsonb, 4),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · La structure SOV et la particule d’objet (을 ̃/를 )$kt$, $kt$Vocabulaire de base
— 사과 : Pomme
— 책 : Livre
— 물 : Eau
— 커피 : Café
— 읽다 : Lire (radical : 읽 )
— 마시다 : Boire (radical : 마시 )$kt$, $kt${"source":"manuel_pdf","course_number":4}$kt$::jsonb, 4),
  ('Coréen', 'declension', $kt$Cours 5 · Le duel des particules : Thème (은 ̃/는 ) vs Sujet (이 ̃/가 )$kt$, $kt$Grammaire : Distinguer le cadre de l’action de son auteur
Savoir faire la différence entre la particule de thème et celle de sujet est l’un des piliers majeurs pour s’exprimer couramment en coréen.
— La particule de thème (은 ̃/는 ) : Elle pose le cadre général, le sujet de conversation global. Elle équivaut à “En ce qui concerne [X]” ou sert à marquer un contraste.
Exemple : 이름이무엇입니까 ? 저는미나입니다 . (Quel est votre nom ? En ce qui me concerne, je suis Mina).
— La particule de sujet (이 ̃/가 ) : Elle désigne l’auteur précis de l’action. On l’utilise pour apporter une information nouvelle ou répondre à la question spécifique “Qui ?”.
가 s’emploie après une voyelle ( 미나가 ) et 이 après une consonne finale ( 학생이 ).
Exemple : 누가커피를마십니까 ? 제가마십니다 . (Qui boit du café ? C’est moi qui bois.
Note : 저 + 가 devient 제가 ).

Compréhension Orale : Script du laboratoire d’écoute
Dialogue court dans un contexte professionnel lors d’une première rencontre.$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Coréen', 'conjugation', $kt$Cours 6 · Le style poli-informel (아 ̃ 요/어요 ) au présent$kt$, $kt$Grammaire : La conjugaison usuelle de la vie courante
Le style poli-informel est le niveau de politesse le plus fréquent et indispensable pour la fluidité au quotidien. Pour conjuguer au présent, on extrait le radical du verbe (sans 다 ) et on applique trois règles selon la dernière voyelle :

Règles de conjugaison du présent usuel

1. Voyelle ￂ (a) ou ￌ (o) → on ajoute 아 ̃ 요 (a-yo)
가다 (aller) → radical 가 + 아요 → 가요 (fusion phonétique).
보다 (regarder) → radical 보 + 아요 → 봐요 (contraction de ￌ + 아 ).

Toutes les autres voyelles → on ajoute 어 ̃ 요 (eo-yo)
먹다 (manger) → radical 먹 + 어요 → 먹어요 (prononciation liée : 머거요 ).
마시다 (boire) → 마시 + 어요 → 마셔요 (contraction de ￜ + 어 → ￊ ).

Tous les verbes se terminant en 하다 → deviennent 해 ̃ 요 (hae-yo)
공부하다 (étudier) → 공부해요 / 운동하다 (faire du sport) → 운동해요 .$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Coréen', 'rule', $kt$Cours 7 · L’existence, la non-existence et la localisation$kt$, $kt$Grammaire & Syntaxe : 있다 vs 없다
En coréen, pour exprimer la présence, l’absence, la possession ou la localisation statique, on emploie deux verbes opposés qui se placent systématiquement en fin de phrase.

Structure d’existence et particule de lieu (에 ̃)

— 있다 (it-da → conjugué au présent usuel : 있어요 ) : Exister / Se trouver / Avoir.
— 없다 (eop-da → conjugué au présent usuel : 없어요 ) : Ne pas exister / Ne pas se trouver / Ne pas avoir.
— La particule de lieu 에 ̃ : Elle s’attache directement derrière le nom de lieu pour indiquer l’endroit où l’on se situe de manière statique.
Structure type : [Lieu] 에 [Sujet] 이/가있어요/없어요 .
Ejemplo : 집에책이있어요 . (Il y a un livre à la maison / À la maison, le livre existe).

Vocabulaire de l’espace
— 집 : Maison / Logement
— 학교 : École
— 식당 : Restaurant
— 돈 : Argent
— 친구 : Ami(e)$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’existence, la non-existence et la localisation$kt$, $kt$Vocabulaire de l’espace
— 집 : Maison / Logement
— 학교 : École
— 식당 : Restaurant
— 돈 : Argent
— 친구 : Ami(e)$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Coréen', 'vocabulary', $kt$Cours 8 · La gymnastique des deux systèmes de chiffres$kt$, $kt$Grammaire : Chiffres sino-coréens vs Chiffres coréens purs
Le coréen intègre deux systèmes numériques distincts. Pour atteindre une fluidité authentique, vous devez automatiser les contextes d’utilisation de chacun.

Les deux systèmes numériques

A. Les chiffres sino-coréens (D’origine chinoise) :
Usage : Les prix (l’argent), les numéros de téléphone, les minutes, les mois, les étages.
Les bases (1-10) : 일 (1), 이 (2), 삼 (3), 사 (4), 오 (5), 육 (6), 칠 (7), 팔 (8), 구 (9), 십 (10). 백 (100), 천 (1000), 만 (10000).

B. Les chiffres coréens purs (D’origine autochtone) :
Usage : L’âge, les heures, et le comptage d’éléments concrets via des spécificateurs. Les bases (1-10) : 하나 (1), 둘 (2), 셋 (3), 넷 (4), 다섯 (5), 여덟 (6), 일곱 (7), 여덟 (8), 아홉 (9), 열 (10). 스물 (20).
Règle de modification : Devant un compteur, 1, 2, 3, 4 et 20 changent de forme → 한 (1), 두 (2), 세 (3), 네 (4), 스무 (20).

Compréhension Orale : Script du laboratoire d’écoute
Interaction commerciale entre un client et une marchande sur un marché traditionnel de Séoul.$kt$, $kt${"source":"manuel_pdf","course_number":8}$kt$::jsonb, 8),
  ('Coréen', 'vocabulary', $kt$Cours 9 · Commander au restaurant et faire des demandes (주 ̃ 세요 )$kt$, $kt$Grammaire & Syntaxe : La requête polie avec 주 ̃ 세요 (Ju-sé-yo)
La structure [Substantif] + 주세요 signifie littéralement “Donnez-moi [X], s’il vous plaît”. C’est la formule clé pour commander ou acheter de manière courante.
— L’ordre des mots pour le décompte : Pour insérer une quantité, l’architecture naturelle de la phrase suit l’ordre suivant : [Nom] + [Chiffre coréen pur] + [Compteur] + 주세요 .

— Ejemplo : 커피한잔주세요 . (Café + un + tasse + donnez-moi = Donnez-moi une tasse de café, s’il vous plaît).

Lexique des compteurs et de la restauration
— 개 : Compteur général pour les objets inanimés (pommes, pains, etc.)
— 잔 : Compteur pour les verres, tasses et tasses de boisson (café, thé)
— 병 : Compteur pour les liquides en bouteille
— 명 : Compteur pour les êtres humains (amis, collègues)
— 메뉴판 : La carte / le menu du restaurant
— 비빔밥 : Le Bibimbap (plat coréen traditionnel)$kt$, $kt${"source":"manuel_pdf","course_number":9}$kt$::jsonb, 9),
  ('Coréen', 'conjugation', $kt$Cours 10 · L’expression du temps et la particule 에 ̃$kt$, $kt$Grammaire & Syntaxe : Le marquage temporel
Tout comme pour la localisation statique, le coréen recourt à la particule 에 ̃ (é) pour indiquer le moment précis où se déroule une action. Elle se colle directement après le substantif temporel.

Structure temporelle et exceptions

Structure type : [Temps] 에 [Objet] 을/를 [Verbe].
Ejemplo : 월요일에한국어를공부해요 . (Le lundi, j’étudie le coréen).

Exception majeure : On n’ajoute jamais la particule 에 ̃ derrière les adverbes temporels relatifs suivants : 오늘 (aujourd’hui), 어제 (hier), 내일 (demain).

Vocabulaire du temps
— 월요일 : Lundi / 토요일 : Samedi / 일요일 : Dimanche

— 아침 : Le matin / le petit-déjeuner
— 저녁 : Le soir / le dîner
— 주말 : Le week-end
— 시 : L’heure (s’utilise obligatoirement avec les chiffres coréens purs : 한시 = 1h, 두시 = 2h).$kt$, $kt${"source":"manuel_pdf","course_number":10}$kt$::jsonb, 10),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’expression du temps et la particule 에 ̃$kt$, $kt$Vocabulaire du temps
— 월요일 : Lundi / 토요일 : Samedi / 일요일 : Dimanche
— 아침 : Le matin / le petit-déjeuner
— 저녁 : Le soir / le dîner
— 주말 : Le week-end
— 시 : L’heure (s’utilise obligatoirement avec les chiffres coréens purs : 한시 = 1h, 두시 = 2h).$kt$, $kt${"source":"manuel_pdf","course_number":10}$kt$::jsonb, 10),
  ('Coréen', 'conjugation', $kt$Cours 11 · La conjugaison au passé ( 았 ̃ 어요/었어요 )$kt$, $kt$Grammaire : La construction du passé usuel
Pour conjuguer un verbe au passé au style poli-informel, on applique la même logique de sélection vocalique qu’au présent, mais on insère le suffixe de passé 았 ̃ 어요 ou 었 ̃ 어 요 directement après le radical :

Règles de sélection du passé

1. Si la dernière voyelle du radical est ￂ (a) ou ￌ (o) → 았 ̃ 어요
가다 (aller) → 가 + 았어요 → 갔어요 (ga-sseo-yo / contraction).
보다 (regarder) → 보 + 았어요 → 봤어요 (bwa-sseo-yo / contraction).

Si la dernière voyelle est différente → 었 ̃ 어요
먹다 (manger) → radical 먹 + 어요 → 먹었어요 (meo-gceo-sseo-yo).
마시다 (boire) → 마시 + 었어요 → 마셨어요 (ma-syeo-sseo-yo).

Tous les verbes se terminant par 하다 → 했 ̃ 어요 (hae-sseo-yo)
공부하다 (étudier) → 공부했어요 (j’ai étudié) / 운동하다 → 운동했어요 .

Compréhension Orale : Script du laboratoire d’écoute
Récit rétrospectif de Min-jun résumant ses activités du week-end passé.$kt$, $kt${"source":"manuel_pdf","course_number":11}$kt$::jsonb, 11),
  ('Coréen', 'conjugation', $kt$Cours 13 · L’expression des projets et le futur ( ﾩ /̃ 을거예요 )$kt$, $kt$Grammaire & Syntaxe : La construction du futur poli-informel
Pour exprimer une action future, une intention ferme ou un projet à moyen terme, le coréen recourt à la terminaison ﾩ ̃/을거예요 (l/eul gco-yé-yo) rattachée directement au radical du verbe.

Règles de sélection du futur

1. Si le radical se termine par une voyelle → on ajoute ﾩ ̃ 거예요
가다 (aller) → radical 가 + ﾩ거예요 → 갈거예요 (gal gco-yé-yo).
보다 (regarder) → radical 보 + ﾩ거예요 → 볼거예요 (bwol gco-yé-yo).

Si le radical se termine par une consonne (Batchim) → on ajoute 을 ̃ 거예요
먹다 (manger) → radical 먹 + 을거예요 → 먹을거예요 (meo-geul gco-yé-yo).
읽다 (lire) → radical 읽 + 을거예요 → 읽을거예요 (il-geul gco-yé-yo).

Tous les verbes se terminant par 하다 → 할 ̃ 거예요 (hal gco-yé-yo)
여행하다 (voyager) → 여행할거예요 / 공부하다 → 공부할거예요 .

Vocabulaire des projets
— 여행하다 : Voyager
— 만나다 : Rencontrer / voir quelqu’un
— 내일 : Demain
— 다음주 : La semaine prochaine
— 부산 : Busan (deuxième plus grande métropole de Corée)$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’expression des projets et le futur ( ﾩ /̃ 을거예요 )$kt$, $kt$Vocabulaire des projets
— 여행하다 : Voyager
— 만나다 : Rencontrer / voir quelqu’un
— 내일 : Demain
— 다음주 : La semaine prochaine
— 부산 : Busan (deuxième plus grande métropole de Corée)$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Coréen', 'rule', $kt$Cours 14 · Les déplacements et l’itinéraire ( 로 ̃/으로 ,에̃서까̃지)$kt$, $kt$Grammaire : Les directions et les jalons de l’itinéraire
Complexifier la structure spatiale est une étape clé vers la fluidité. Le coréen emploie des particules spécifiques pour indiquer les bornes d’un déplacement et la direction d’un mouvement.
— La particule de direction 로 ̃ / 으 ̃ 로 : Elle indique la direction vers laquelle on se meut (ou le moyen de transport utilisé).
로 s’emploie après une voyelle ou la consonne basse ﾩ ( 서울로 ).
으로 s’emploie après une consonne ( 부산으로 , 오른쪽으로 → vers la droite).
— Les bornes de l’itinéraire (에 ̃ 서 ... 까 ̃ 지 ) : Signifie littéralement “de [Lieu A] ... jusqu’à [Lieu B]”.
Ejemplo : 집에서학교까지걸어가요 . (Je vais à pied de la maison jusqu’à l’école).

Compréhension Orale : Script du laboratoire d’écoute
Échange de planification logistique entre Min-ji et un ami préparant un itinéraire en Corée.$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Coréen', 'vocabulary', $kt$Cours 15 · Le laboratoire de planification de voyage à Séoul$kt$, $kt$Consigne : Rédigez une note descriptive de 6 à 8 lignes en Hangeul résumant vos intentions de déplacement pour la semaine prochaine (villes traversées, bornes de l’itinéraire, transports utilisés). Vous devez obligatoirement intégrer : au moins deux verbes conjugués au futur ( ﾩ ̃/을거예요 ), une structure de délimitation d’itinéraire ( 에 ̃ 서 까 ̃ 지 ), et un marquage directionnel via la particule 로 ̃/으로 .

Consigne : Imaginez que vous décrivez vos projets de voyage de manière décontractée à un ami coréen. Sans regarder vos notes manuscrites, prenez la parole à voix haute pendant 2 minutes complètes en continu. Conseil de fluidité : Pour assurer un débit naturel, amalgamez le bloc verbal du futur sans coupure artificielle. 할거예요 doit s’assimiler phonétiquement comme [할꺼예요 ] (doublement du son k).$kt$, $kt${"source":"manuel_pdf","course_number":15}$kt$::jsonb, 15),
  ('Coréen', 'rule', $kt$Cours 16 · L’expression du désir ( 고 ̃ 싶다 )$kt$, $kt$Grammaire & Syntaxe : Exprimer la volonté d’action
Pour exprimer l’envie ou le désir d’accomplir une action (à la première ou à la deuxième personne), le coréen attache la structure 고 ̃ 싶 다 (go sip-da) directement au radical du verbe principal. Le verbe 싶다 se comporte syntaxiquement comme un adjectif et
se conjugue selon le niveau de politesse requis.

Présent vs Passé au style poli-informel

A. Présent usuel : radical + 고 ̃ 싶어요 (go si-peo-yo) :
Ejemplo 1 : 저는한국에 가고싶어요 . ( 가다 + 고싶어요 = Je veux aller en Corée).
Ejemplo 2 : 영화를 보고싶어요 . ( 보다 + 고싶어요 = Je veux regarder un film).

B. Passé usuel : radical + 고 ̃ 싶었어요 (go si-peo-sseo-yo) :
Ejemplo : 커피를 마시고싶었어요 . ( 마시다 + 고싶었어요 = Je voulais boire du café).

Vocabulaire des envies
— 영화 : Film
— 영화관 : Salle de cinéma
— 만들다 : Faire / fabriquer / cuisiner
— 쉬다 : Se reposer
— 쇼핑하다 : Faire du shopping$kt$, $kt${"source":"manuel_pdf","course_number":16}$kt$::jsonb, 16),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’expression du désir ( 고 ̃ 싶다 )$kt$, $kt$Vocabulaire des envies
— 영화 : Film
— 영화관 : Salle de cinéma
— 만들다 : Faire / fabriquer / cuisiner
— 쉬다 : Se reposer
— 쇼핑하다 : Faire du shopping$kt$, $kt${"source":"manuel_pdf","course_number":16}$kt$::jsonb, 16),
  ('Coréen', 'rule', $kt$Cours 17 · Les propositions et invitations ( ﾩ ̃/을까 요 ?, 읍 ̃ 시다 )$kt$, $kt$Grammaire : Formuler des suggestions collectives et valider un projet
Interagir de manière fluide nécessite de maîtriser l’art de la suggestion et de l’invitation conjointe.
— Formuler une proposition (ﾩ ̃/을까요 ?) : Équivaut à “Et si on... ?” ou “Que diraistu de... ?”.
ﾩ ̃ 까요 ? s’utilise après une voyelle : 가다 → 갈까요 ? (Et si on y allait ?). 을 ̃ 까요 ? s’utilise après une consonne (Batchim) : 먹다 → 먹을까요 ? (Et si on mangeait ?).
— Inviter ou acter une décision (읍 ̃ 시다 / ﾲ ̃ 시다 ) : Style poli-formel signifiant “Faisons cela / Allons-y”.
ﾲ ̃ 시다 après une voyelle ( 가다 → 갑시다 ) et 읍 ̃ 시다 après une consonne ( 먹다 → 먹읍시다 ).
Note d’oralité informelle : Entre amis très proches, on utilise la terminaison 자 ̃ ( 가 자 = allons-y).

Compréhension Orale : Script du laboratoire d’écoute
Planification d’une sortie de week-end lors d’un échange téléphonique entre Min-su et Yuna.$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Coréen', 'rule', $kt$Cours 18 · Le laboratoire de l’invitation et des sorties amicales$kt$, $kt$Atelier d’Écriture : Script de dialogue interactif$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Coréen', 'rule', $kt$Cours 19 · Donner des instructions polies et des ordres ( 세 ̃ 요 )$kt$, $kt$Grammaire & Syntaxe : L’impératif poli de courtoisie
Pour demander poliment à son interlocuteur d’accomplir une action, de suivre une direction ou pour formuler une consigne bienveillante, le coréen utilise la terminaison 세 ̃ 요 (sé-yo) rattachée directement au radical.

Règles de sélection de l’impératif

1. Si le radical se termine par une voyelle → on ajoute 세 ̃ 요
가다 (aller) → radical 가 + 세요 → 가세요 (Allez-y / S’il vous plaît, allez-y). 오다 (venir) → radical 오 + 세요 → 오세요 (Venez / Soyez le bienvenu).

Si le radical se termine par une consonne (Batchim) → on ajoute 으 ̃ 세요
(eu-sé-yo)
읽다 (lire) → radical 읽 + 으세요 → 읽으세요 (Lisez, s’il vous plaît).
앉다 (s’asseoir) → radical 앉 + 으세요 → 앉으세요 (Asseyez-vous, s’il vous plaît).

Tous les verbes se terminant par 하다 → 하 ̃ 세요 (hae-sé-yo)
공부하다 (étudier) → 공부하세요 (Étudiez, s’il vous plaît) / 일하다 → 일하세요 .

Vocabulaire des instructions
— 오른쪽 : La droite / 왼쪽 : La gauche
— 똑바로 : Tout droit
— 기다리다 : Attendre

— 앉다 : S’asseoir$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · Donner des instructions polies et des ordres ( 세 ̃ 요 )$kt$, $kt$Vocabulaire des instructions
— 오른쪽 : La droite / 왼쪽 : La gauche
— 똑바로 : Tout droit
— 기다리다 : Attendre
— 앉다 : S’asseoir$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Coréen', 'vocabulary', $kt$Cours 20 · Exprimer l’interdiction et la santé ( 지 ̃ 마세요 )$kt$, $kt$Grammaire : L’interdiction formelle polie
Pour formuler une interdiction ou demander de ne pas faire une action, le coréen utilise la structure immuable 지 ̃ 마세요 (ji ma-sé-yo). Elle se greffe directement sur le radical du verbe, qu’il se termine par une voyelle ou une consonne.
— Structure type : Radical + 지 ̃ 마세요
Ejemplo 1 : 가다 (aller) → 가지마세요 (N’y allez pas / Ne partez pas).
Ejemplo 2 : 먹다 (manger) → 먹지마세요 (Ne mangez pas).

Compréhension Orale : Script du laboratoire d’écoute
Consultation médicale standard au sein d’une clinique de quartier à Séoul.

Lexique du corps et de la santé
— 머리 : La tête
— 배 : Le ventre / l’estomac
— 눈 : Les yeux
— 약 : Le médicament
— 아프다 : Être malade / avoir mal (conjugaison usuelle au présent : 아파요 )$kt$, $kt${"source":"manuel_pdf","course_number":20}$kt$::jsonb, 20),
  ('Coréen', 'vocabulary', $kt$Cours 21 · Le laboratoire de l’interaction médicale et des conseils de santé$kt$, $kt$Consigne : Rédigez un dialogue de 8 à 10 répliques en Hangeul mettant en scène une consultation entre un médecin et un patient. Vous devez décrire vos symptômes (zones douloureuses comme la gorge 나 les yeux) et le médecin doit formuler deux consignes impératives positives ( 세 ̃ 요 ) ainsi qu’une interdiction formelle ( 지 ̃ 마세요 ). Mobilisez le lexique de la santé.

Consigne : Donnez de la voix en interprétant les deux rôles de votre script de manière fluide pendant 2 minutes et 30 secondes. Incarnez un ton fatigué pour le patient et une diction claire et directive pour le praticien. Conseil de fluidité : Soignez la resyllabation de la particule d’objet devant la voyelle. 약을 (médicament) s’écrit 약 - 을 mais doit glisser oralement comme [야글 ] (le ﾡ du bas monte).$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Coréen', 'rule', $kt$Cours 22 · Les connecteurs de coordination et d’opposition ( 고 ̃, 지 ̃ 만 )$kt$, $kt$Grammaire & Syntaxe : L’art de lier les propositions complexes
Pour dépasser le stade des phrases simples et développer une véritable fluidité, il est indispensable de maîtriser les suffixes de liaison. Ils s’attachent directement au radical du premier verbe et permettent de fusionner deux énoncés.

Coordination vs Contraste

A. L’association / La succession : 고 ̃ (go) = Et / Puis
S’attache au radical du verbe sans modification, quel que soit le Batchim.
Ejemplo : 저는한국어를 공부하고친구는요리를해요 . (J’étudie le coréen et mon ami cuisine).

B. L’opposition / La concession : 지 ̃ 만 (ji-man) = Mais / Cependant
S’attache directement au radical pour marquer un contraste fort entre deux propositions.
Ejemplo : 한국어는 어렵지만재미있어요 . (Le coréen est difficile mais intéressant / 어렵다 = être difficile).

Expression Orale & Phonétique : Le rythme suspendu
À l’oral, les suffixes de liaison ( 고 ̃, 지 ̃ 만 ) agissent comme un pivot rythmique. La voix doit monter légèrement sur la syllabe du suffixe, marquer une micro-pause de suspension (symbolisée par la virgule), puis repartir de manière fluide sur la seconde proposition sans faire descendre l’intonation générale. Entraînez-vous à prononcer à voix
haute : „ 한국어는어렵지만 ↗, 재미있어요 ↘.“$kt$, $kt${"source":"manuel_pdf","course_number":22}$kt$::jsonb, 22),
  ('Coréen', 'rule', $kt$Cours 24 · Grand Laboratoire de débat argumenté écrit et oral$kt$, $kt$Atelier d’Expression Orale : La soutenance de point de vue

CHAPITRE 3$kt$, $kt${"source":"manuel_pdf","course_number":24}$kt$::jsonb, 24),
  ('Coréen', 'rule', $kt$Cours 25 · L’expression de la cause (* 아/어서 *, * 기 때문에 *)$kt$, $kt$Grammaire & Syntaxe : Expliquer le “Pourquoi”
Le passage au niveau intermédiaire exige de savoir lier logiquement les propositions pour exprimer la cause ou la raison (“parce que” / “donc”). Le coréen utilise principalement deux structures aux nuances distinctes :

Cause harmonique vs Cause factuelle

A. La cause séquentielle et fluide : 아 ̃/어서 (a/eo-seo) :
S’attache directement au radical en suivant les mêmes règles d’harmonie voca-
lique que le présent usuel.  Attention : Le verbe de la cause ne prend jamais la marque du passé (았 ̃/었 ), le temps de la phrase est entièrement porté par le verbe final.

— Radical avec ￂ / ￌ → 아 ̃ 서 : 가다 → 가서 / 좋다 → 좋아서
— Autres voyelles → 어 ̃ 서 : 먹다 → 먹어서 / 없다 → 없어서
— Verbes en 하다 → 해 ̃ 서 : 피곤하다 → 피곤해서 (être fatigué)
Ejemplo : 어제너무 피곤해서일찍잤어요 . (Hier, parce que j’étais très fatigué, j’ai dormi tôt).

B. La cause nominale et forte : 기 ̃ 때문에 (gi ttae-mun-é) :
S’attache de manière totalement régulière au radical verbal ou adjectif, sans modification. Elle marque une raison plus factuelle, objective ou justificative.
Structure : Radical + 기 ̃ 때문에
Ejemplo : 비가 오기때문에안나가요 . (Parce qu’il pleut, je ne sors pas / 비가오다 = pleuvoir).

Vocabulaire des causes et états
— 피곤하다 : Être fatigué
— 바쁘다 : Être occupé (radical 바쁘 + 어서 → 바빠서 )
— 늦다 : Être en retard
— 비가오다 : Pleuvoir

— 날씨 : Le temps / la météo$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’expression de la cause (* 아/어서 *, * 기 때문에 *)$kt$, $kt$Vocabulaire des causes et états
— 피곤하다 : Être fatigué
— 바쁘다 : Être occupé (radical 바쁘 + 어서 → 바빠서 )
— 늦다 : Être en retard
— 비가오다 : Pleuvoir
— 날씨 : Le temps / la météo$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Coréen', 'vocabulary', $kt$Cours 26 · Le climat, les émotions et les justifications$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Message audio d’explication envoyé sur une application de messagerie par Min-ho à sa collègue Ji-soo.

Banque de Vocabulaire Enrichi
— 차가막히다 : Y avoir des embouteillages / la circulation est bloquée
— 미안하다 : Être désolé / s’excuser
— 일찍 / 늦게 : Tôt / tard
— 춥다 : Faire froid (conjugaison de cause : 춥 + 어서 → 더부드럽게 추워서 – irrégulierﾲ)
— 덥다 : Faire chaud (conjugaison de cause : 덥 + 어서 → 더워서 )
— 기분 : L’humeur / l’état d’esprit ( 기분이좋다 = être de bonne humeur)$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Coréen', 'rule', $kt$Cours 27 · Le laboratoire de l’explication et de la justification spontanée$kt$, $kt$Atelier d’Écriture : Note formelle de justification

deux justifications claires (intempéries climatiques, fatigue accumulée, ou surcharge de travail). Vous devez impérativement intégrer : une structure causative en 아 ̃/어서 , une structure en 기 ̃ 때문에 , et mobiliser le vocabulaire du climat et des émotions.$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Coréen', 'rule', $kt$Cours 28 · L’expression de la capacité et de la possibilité (* ﾩ/을수있다/없다 *)$kt$, $kt$Grammaire & Syntaxe : Pouvoir vs Ne pas pouvoir
Pour exprimer la capacité physique, intellectuelle ou la possibilité matérielle de faire une action, le coréen utilise la structure ﾩ/을수있다/없다 (l/eul su it-da/eop-da) rattachée au radical du verbe :

Règles de sélection de la capacité

1. Si le radical se termine par une voyelle → radical + ﾩ수있다/없다
하다 (faire) → 할수있어요 (Je peux faire) / 할수없어요 (Je ne peux pas faire).
가다 (aller) → 갈수있어요 (Je peux y aller).

Si le radical se termine par une consonne (Batchim) → radical + 을수있
다/없다
먹다 (manger) → 먹을수있어요 (Je peux manger).
읽다 (lire) → 읽을수있어요 (Je peux lire).

Note de fluidité : À l’oral courante, 할수없어요 est très souvent remplacé par la forme courte restrictive 못해요 (Je ne peux pas / je n’arrive pas à faire).

Vocabulaire des compétences
— 운전하다 : Conduire
— 말하다 : Parler / dire
— 영어 : L’anglais

— 조금 : Un peu
— 태권도 : Le Taekwondo$kt$, $kt${"source":"manuel_pdf","course_number":28}$kt$::jsonb, 28),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’expression de la capacité et de la possibilité (* ﾩ/을수있다/없다 *)$kt$, $kt$Vocabulaire des compétences
— 운전하다 : Conduire
— 말하다 : Parler / dire
— 영어 : L’anglais
— 조금 : Un peu
— 태권도 : Le Taekwondo$kt$, $kt${"source":"manuel_pdf","course_number":28}$kt$::jsonb, 28),
  ('Coréen', 'rule', $kt$Cours 29 · Le monde professionnel et les compétences linguistiques$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait d’un entretien de recrutement entre un directeur des ressources humaines (면접 관 ) et une candidate (지원자 ).

Banque de Vocabulaire Enrichi
— 외국어 : Langue étrangère
— 컴퓨터프로그램 : Programme informatique
— 잘하다 : Être doué / bien faire
— 출근하다 : Aller au travail / commencer sa journée de travail
— 내일부터 : À partir de demain$kt$, $kt${"source":"manuel_pdf","course_number":29}$kt$::jsonb, 29),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · Le monde professionnel et les compétences linguistiques$kt$, $kt$Banque de Vocabulaire Enrichi
— 외국어 : Langue étrangère
— 컴퓨터프로그램 : Programme informatique
— 잘하다 : Être doué / bien faire
— 출근하다 : Aller au travail / commencer sa journée de travail
— 내일부터 : À partir de demain$kt$, $kt${"source":"manuel_pdf","course_number":29}$kt$::jsonb, 29),
  ('Coréen', 'rule', $kt$Cours 30 · Le laboratoire de l’entretien d’embauche et du pitch de compétences$kt$, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes en Hangeul pour présenter vos atouts professionnels à une entreprise coréenne (langues parlées, conduite, outils maîtrisés, flexibilité d’horaires). Vous devez obligatoirement intégrer : au moins deux structures de capacité ( ﾩ/을수있다 ), une structure de cause ( 아/어서 ou 기때문에 ), et utiliser le lexique professionnel du cours précédent.

Consigne : Imaginez que vous passez un entretien d’embauche par visioconférence avec Séoul. Sans regarder vos notes, répondez à voix haute aux questions du recruteur pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Attention au bloc phonétique 수있어요 . À l’oral, la consonne ﾵ glisse sur la voyelle 어 . Enchaînez d’un coup : [수이써요 - su-i-sseo-yo]. Répétez le bloc 할수있어요 jusqu’à ce qu’il sorte comme un mot unique : [할쑤이써요 ].$kt$, $kt${"source":"manuel_pdf","course_number":30}$kt$::jsonb, 30),
  ('Coréen', 'rule', $kt$Cours 31 · L’action en cours (* 고있다 *) et l’intention (* 려고하다 *)$kt$, $kt$Grammaire & Syntaxe : L’aspect verbal intermédiaire
Pour développer une fluidité naturelle, vous devez être capable de nuancer le déroulement d’une action dans le temps, qu’elle soit en cours d’exécution ou à l’état de projet immédiat.

Présent continu vs Intention programmée

A. Le présent continu : radical + 고있다 (→ 고있어요 ) :
Équivaut à la structure française “être en train de [faire]”. Elle se greffe sur le radical verbal sans aucune modification harmonique.
Ejemplo : 저는지금한국어를 공부하고있어요 . (Je suis en train d’étudier le coréen actuellement).

B. L’expression de l’intention : radical + 려고하다 / 으려고하다 :
Signifie “avoir l’intention de” ou “avoir le projet immédiat de”.

— 려고해요 : S’utilise après une voyelle. → 가다 → 가려고해요 (J’ai l’intention d’y aller).
— 으려고해요 : S’utilise après une consonne (Batchim). → 먹다 → 먹으려고해요 .
Ejemplo : 내년에한국에 가려고해요 . (J’ai l’intention d’aller en Corée l’année prochaine).

Vocabulaire des actions et des appels
— 전화하다 : Téléphoner
— 지금 : Maintenant / actuellement
— 준비하다 : Préparer
— 만나다 : Rencontrer / voir quelqu’un
— 일하다 : Travailler$kt$, $kt${"source":"manuel_pdf","course_number":31}$kt$::jsonb, 31),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’action en cours (* 고있다 *) et l’intention (* 려고하다 *)$kt$, $kt$Vocabulaire des actions et des appels
— 전화하다 : Téléphoner
— 지금 : Maintenant / actuellement
— 준비하다 : Préparer
— 만나다 : Rencontrer / voir quelqu’un
— 일하다 : Travailler$kt$, $kt${"source":"manuel_pdf","course_number":31}$kt$::jsonb, 31),
  ('Coréen', 'rule', $kt$Cours 32 · La communication et les appels téléphoniques professionnels$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Échange téléphonique professionnel entre un employé de bureau (수혁 ) et une cliente (영미 ).

Banque de Vocabulaire Enrichi
— 여보세요 : Allo (formule exclusive aux interactions téléphoniques)
— 보고서 : Rapport / compte-rendu écrit
— 회의 : Réunion / conférence professionnelle
— 자료 : Documents / données / matériel de travail
— 보내다 : Envoyer ( 보내겠습니다 = je vais envoyer – futur formel)$kt$, $kt${"source":"manuel_pdf","course_number":32}$kt$::jsonb, 32),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · La communication et les appels téléphoniques professionnels$kt$, $kt$Banque de Vocabulaire Enrichi
— 여보세요 : Allo (formule exclusive aux interactions téléphoniques)
— 보고서 : Rapport / compte-rendu écrit
— 회의 : Réunion / conférence professionnelle
— 자료 : Documents / données / matériel de travail
— 보내다 : Envoyer ( 보내겠습니다 = je vais envoyer – futur formel)$kt$, $kt${"source":"manuel_pdf","course_number":32}$kt$::jsonb, 32),
  ('Coréen', 'rule', $kt$Cours 33 · Le laboratoire de l’appel professionnel et de la gestion de projets$kt$, $kt$Atelier d’Écriture : Le script de la conversation téléphonique$kt$, $kt${"source":"manuel_pdf","course_number":33}$kt$::jsonb, 33),
  ('Coréen', 'rule', $kt$Cours 34 · L’expression de l’obligation (* 어야하다 *) et de la permission (* 어도되다 *)$kt$, $kt$Grammaire & Syntaxe : Règles, devoirs et autorisations
Le passage à une fluidité de niveau intermédiaire implique de savoir formuler les conditions de vie en société, à savoir ce que l’on doit faire et ce que l’on est autorisé à faire. Ces deux structures se greffent sur le radical verbal en suivant la même harmonie vocalique que le présent usuel :

Obligation vs Permission

A. L’obligation (Devoir faire) : radical + 아야/어야하다 (→ 아야/어야해요 ) :

— Radical avec ￂ / ￌ → 아야해요 : 가다 → 가야해요 (Je devez y aller) / 오다 → 와 야해요 .
— Autres voyelles → 어야해요 : 먹다 → 먹어야해요 (Je devez manger) / 읽다 → 읽 어야해요 .
— Verbes en 하다 → 해야해요 : 공부하다 → 공부해야해요 (Je devez étudier).
B. La permission (Être autorisé à) : radical + 아도/어도되다 (→ 아도/어도돼요 ) :

— Radical avec ￂ / ￌ → 아도돼요 : 앉다 → 앉아도돼요 (Vous pouvez vous asseoir).
— Autres voyelles → 어도돼요 : 먹다 → 먹어도돼요 (Vous pouvez manger).
— Verbes en 하다 → 해도돼요 : 전화하다 → 전화해도돼요 (Vous pouvez téléphoner).

Vocabulaire des règles et de la vie commune
— 여기 : Ici / 거기 : Là-bas
— 담배를피우다 : Fumer (une cigarette)
— 사진을찍다 : Prendre une photo
— 들어가다 : Entrer / pénétrer dans un lieu
— 규칙 : La règle / le règlement intérieur$kt$, $kt${"source":"manuel_pdf","course_number":34}$kt$::jsonb, 34),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’expression de l’obligation (* 어야하다 *) et de la permission (* 어도되다 *)$kt$, $kt$Vocabulaire des règles et de la vie commune
— 여기 : Ici / 거기 : Là-bas
— 담배를피우다 : Fumer (une cigarette)
— 사진을찍다 : Prendre une photo
— 들어가다 : Entrer / pénétrer dans un lieu
— 규칙 : La règle / le règlement intérieur$kt$, $kt${"source":"manuel_pdf","course_number":34}$kt$::jsonb, 34),
  ('Coréen', 'conjugation', $kt$Cours 36 · Grand Laboratoire de synthèse normative et présentation orale$kt$, $kt$Atelier d’Expression Orale : Le briefing direct de bienvenue

CHAPITRE 4$kt$, $kt${"source":"manuel_pdf","course_number":36}$kt$::jsonb, 36),
  ('Coréen', 'rule', $kt$Cours 37 · L’expression de l’hypothèse et de la condition (* 면/으면 *)$kt$, $kt$Grammaire & Syntaxe : Poser une condition structurelle
L’accès à l’autonomie conversationnelle vers le niveau B1 exige de savoir lier des clauses logiques complexes, notamment pour formuler des hypothèses (“si... alors...”). Le coréen emploie le suffixe de liaison 면 / 으면 (myeon / eu-myeon) directement adossé au radical de la proposition conditionnelle.

Règles de sélection du suffixe conditionnel

1. Si le radical se termine par une voyelle ou la consonne basse ﾩ → radical
+ 면
가다 (aller) → 가면 (Si j’y vais / S’il y va).
만들다 (faire/fabriquer) → 만들면 (Si je le fabrique – le ﾩ se maintient).

Si le radical se termine par une consonne (Batchim) → radical + 으면
먹다 (manger) → 먹으면 (Si tu manges / Si l’on mange).
있다 (avoir/exister) → 있으면 (Si tu as / S’il y a).

Structure combinée fréquente : [Condition] 면 + [Consequence au Futur] ﾩ/을거
예요 .
Ejemplo : 돈이 있으면차를 살거예요 . (Si j’ai de l’argent, j’achèterai une voiture).

Vocabulaire des scénarios
— 복권에당첨되다 : Gagner à la loterie
— 시간이있다 : Avoir du temps
— 만약 : Au cas où / Si (adverbe facultatif renforçant l’hypothèse en tête de phrase)
— 쉬다 : Se reposer
— 사다 : Acheter$kt$, $kt${"source":"manuel_pdf","course_number":37}$kt$::jsonb, 37),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · L’expression de l’hypothèse et de la condition (* 면/으면 *)$kt$, $kt$Vocabulaire des scénarios
— 복권에당첨되다 : Gagner à la loterie
— 시간이있다 : Avoir du temps
— 만약 : Au cas où / Si (adverbe facultatif renforçant l’hypothèse en tête de phrase)
— 쉬다 : Se reposer
— 사다 : Acheter$kt$, $kt${"source":"manuel_pdf","course_number":37}$kt$::jsonb, 37),
  ('Coréen', 'rule', $kt$Cours 38 · Imaginer des situations hypothétiques et des désirs$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Discussion spéculative et projection de vie entre 두친구 (deux amis), Min-su et Ji-won.

Banque de Vocabulaire Enrichi
— 세계여행 : Voyage autour du monde / international
— 크다 / 작다 : Être grand / être petit (adjectifs)
— 돈이많다 : Avoir beaucoup d’argent / être fortuné
— 계획 : Projet / plan / planification d’avenir
— 매일 : Chaque jour / quotidiennement$kt$, $kt${"source":"manuel_pdf","course_number":38}$kt$::jsonb, 38),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · Imaginer des situations hypothétiques et des désirs$kt$, $kt$Banque de Vocabulaire Enrichi
— 세계여행 : Voyage autour du monde / international
— 크다 / 작다 : Être grand / être petit (adjectifs)
— 돈이많다 : Avoir beaucoup d’argent / être fortuné
— 계획 : Projet / plan / planification d’avenir
— 매일 : Chaque jour / quotidiennement$kt$, $kt${"source":"manuel_pdf","course_number":38}$kt$::jsonb, 38),
  ('Coréen', 'rule', $kt$Cours 39 · Le laboratoire du manifeste spéculatif et de l’idéal de vie$kt$, $kt$Atelier d’Expression Orale : L’exposé des ambitions futures

nutes et 30 secondes. Conseil de fluidité : La structure conditionnelle exige un traitement prosodique spécifique. Évitez de segmenter la phrase après le 면 . Marquez une intonation montante suspendue sur la clause en 면 , puis délivrez la conséquence d’un
bloc lié : [당첨되면 ↗, 할거예요 ↘].$kt$, $kt${"source":"manuel_pdf","course_number":39}$kt$::jsonb, 39),
  ('Coréen', 'rule', $kt$Cours 40 · Le style indirect et le discours rapporté (* 다고하다 *)$kt$, $kt$Grammaire & Syntaxe : Transposer les propos au style indirect
L’accès à une fluidité de niveau intermédiaire supérieur (B2) exige de savoir rapporter les affirmations, pensées ou déclarations d’un tiers. En coréen, le discours indirect s’articule via la structure 다고하다 (da-go ha-da) fixée au radical, mais sa morphologie varie selon la nature du verbe au présent :

Verbe d’état vs Verbe d’action au style indirect

A. Avec un adjectif (Verbe d’état) : radical + 다고하다 (→ 다고해요 ) :
Le suffixe se greffe directement sur le radical sans modification.
Ejemplo 1 : 어렵다 (être difficile) → 한국어가 어렵다고해요 . (Il dit que le coréen est difficile).
Ejemplo 2 : 바쁘다 (être occupé) → 김씨가오늘 바쁘다고해요 .

B. Avec un verbe d’action : radical + ﾤ/는다고하다 :
On insère un ﾤ euphonique après une voyelle, ou 는 après une consonne basse
(Batchim).

— Fin voyelle : 가다 → 친구가한국에 간다고해요 . (Mon ami dit qu’il va en Corée).
— Fin consonne : 먹다 → 동생이밥을 먹는다고해요 . (Note phonétique : [멍는다고 ]).
— Verbes en 하다 : 공부하다 → 학생이한국어를 공부한다고해요 .

Vocabulaire des actualités
— 뉴스 : Les actualités / le journal télévisé
— 인터넷 : Internet
— 기사 : Un article de presse
— 말씀하시다 : Parler / dire (forme honorifique de 말하다 )
— 듣다 : Entendre / écouter (conjugaison passée : 들었어요 )$kt$, $kt${"source":"manuel_pdf","course_number":40}$kt$::jsonb, 40),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · Le style indirect et le discours rapporté (* 다고하다 *)$kt$, $kt$Vocabulaire des actualités
— 뉴스 : Les actualités / le journal télévisé
— 인터넷 : Internet
— 기사 : Un article de presse
— 말씀하시다 : Parler / dire (forme honorifique de 말하다 )
— 듣다 : Entendre / écouter (conjugaison passée : 들었어요 )$kt$, $kt${"source":"manuel_pdf","course_number":40}$kt$::jsonb, 40),
  ('Coréen', 'vocabulary', $kt$Cours 41 · Les médias, Internet et la transmission d’informations$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Échange quotidien au bureau entre Min-su et Seo-yeon au sujet des prévisions météorologiques lues en ligne.

Banque de Vocabulaire Enrichi
— 눈이오다 : Neiger
— 변경하다 : Modifier / restructurer (un plan, un horaire)
— 다 ̃ 고들었어요 : J’ai entendu dire que...
— 날씨예보 : Les prévisions météorologiques
— 사실 : En réalité / le fait / la vérité$kt$, $kt${"source":"manuel_pdf","course_number":41}$kt$::jsonb, 41),
  ('Coréen', 'rule', $kt$Cours 42 · Le laboratoire du compte-rendu d’information et de la revue de presse$kt$, $kt$Consigne : Rédigez un paragraphe de synthèse de 6 à 8 lignes en Hangeul compilant les affirmations de votre entourage ou des médias sur un sujet contemporain. Vous devez impérativement intégrer : au moins une structure indirecte basée sur un adjectif ( 다고 하다 ), une structure basée sur un verbe d’action ( ﾤ/는다고하다 ), et lier vos propositions par un connecteur logique du bloc précédent.

Consigne : Incarnez le rôle d’un journaliste ou d’un rapporteur transmettant des informations de synthèse. Sans regarder vos notes, prenez la parole à voix haute de manière neutre, claire et fluide pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Le bloc 다고해요 s’énonce sans coupure interne ([다고해요 ]). Appliquez rigoureusement l’assimilation nasale des verbes d’action au style indirect : 먹는다고 doit s’articuler phonétiquement comme [멍는다고 ] pour un rendu naturel.$kt$, $kt${"source":"manuel_pdf","course_number":42}$kt$::jsonb, 42),
  ('Coréen', 'rule', $kt$Cours 43 · Le système honorifique supérieur (* 께 서 *, * 시 *)$kt$, $kt$Grammaire & Syntaxe : Élever le sujet par respect sociolinguistique
Pour s’exprimer couramment en Corée, la maîtrise des niveaux de déférence verticale est indispensable. Lorsque le sujet de la phrase est une personne envers qui l’on doit le respect (professeur, supérieur hiérarchique, parents, aînés), les particules standards et la morphologie du verbe doivent s’élever conjointement.

Particule de sujet honorifique & Suffixe d’honneur

A. La particule de sujet honorifique : 께서 (kkeo-seo) :
Elle se substitue systématiquement aux particules de sujet classiques 이/가 lorsqu’elles suivent un sujet respecté.
Ejemplos : 선생님 (Professeur) → 선생님께서 / 어머니 (Mère) → 어머니께서 .

B. Le suffixe d’honneur verbal : 시 (si) :
On insère l’infixe 시 directement entre le radical et la terminaison. Au présent poliinformel, la combinaison 시 + 어요 fusionne pour devenir 세 ̃ 요 (sé-yo) (ou 으 ̃ 세 요 après un Batchim).
가다 (aller) → radical 가 + 세요 → 사장님께서 가세요 . (Le directeur y va – présent descriptif et non impératif).
읽다 (lire) → radical 읽 + 으세요 → 할머니께서책을 읽으세요 . (Ma grand-mère lit).

Vocabulaire du respect
— 선생님 : Professeur / enseignant (titre honorifique universel)
— 사장님 : Directeur / patron d’entreprise
— 부모님 : Les parents
— 연세 : L’âge (substantif honorifique exclusif pour 나이 )
— 성함 : Le prénom / nom (substantif honorifique exclusif pour 이름 )$kt$, $kt${"source":"manuel_pdf","course_number":43}$kt$::jsonb, 43),
  ('Coréen', 'vocabulary', $kt$Vocabulaire · Le système honorifique supérieur (* 께 서 *, * 시 *)$kt$, $kt$Vocabulaire du respect
— 선생님 : Professeur / enseignant (titre honorifique universel)
— 사장님 : Directeur / patron d’entreprise
— 부모님 : Les parents
— 연세 : L’âge (substantif honorifique exclusif pour 나이 )
— 성함 : Le prénom / nom (substantif honorifique exclusif pour 이름 )$kt$, $kt${"source":"manuel_pdf","course_number":43}$kt$::jsonb, 43),
  ('Coréen', 'conjugation', $kt$Cours 44 · Les verbes honorifiques spécifiques et le respect social$kt$, $kt$Grammaire : Les mutations lexicales de déférence
Certains verbes d’action ou d’état fondamentaux ne tolèrent pas la simple insertion du suffixe 시 . Ils mutent totalement vers un nouveau radical pour sceller le respect absolu envers le sujet de l’action.

Verbe Standard                Radical Honorifique     Conjugaison Présente Usuelle 있다 (se trouver)               계시다                     계세요 (gyé-sé-yo)
있다 (posséder/avoir)           있으시다                    있으세요
먹다 / 마시다 (manger/boire)       드시다                     드세요
자다 (dormir)                   주무시다                    주무세요

Compréhension Orale : Script du laboratoire d’écoute
Interaction polie au sein d’un secrétariat de direction d’entreprise à Séoul.$kt$, $kt${"source":"manuel_pdf","course_number":44}$kt$::jsonb, 44),
  ('Coréen', 'rule', $kt$Cours 45 · Le laboratoire de l’interaction respectueuse avec les aînés$kt$, $kt$Consigne : Rédigez une note ou un courriel de politesse de 6 à 8 lignes en Hangeul s’adressant à votre enseignant référent ( 선생님 ). Prenez de ses nouvelles avec déférence (demandez s’il se trouve en bonne santé, s’il se repose bien) et formulez vos intentions d’études futures d’ici la semaine prochaine. Vous devez intégrer : la particule 께서 , au moins deux verbes honorifiques spécifiques, et maintenir le style poli-informel élevé.

Consigne : Imaginez que vous êtes reçu en audience officielle par un cadre supérieur à Séoul. Sans regarder vos notes de travail, prenez la parole à voix haute de manière posée, digne et fluide pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Les formes honorifiques dessinent un rythme fluide spécifique. Amalgamez le bloc 계세 요 d’un seul élan ([계세요 ]). Ne confondez pas 있으세요 (possession respectée) et 계세요 (localisation physique respectée).$kt$, $kt${"source":"manuel_pdf","course_number":45}$kt$::jsonb, 45),
  ('Coréen', 'declension', $kt$Cours 46 · Syntaxe avancée, particules d’accentuation et révision des pièges$kt$, $kt$Grammaire : La rigueur de l’accumulation et de la place des particules
Le passage au niveau intermédiaire supérieur exige une automatisation absolue de la place des structures négatives et des particules restrictives ou inclusives.

La particule d’inclusion 도 ̃ & Le piège de la négation 안/못

A. La particule d’inclusion 도 ̃ (aussi / également) :
Elle se substitue entièrement aux particules de thème ( 은 ̃/는 ) et d’objet direct ( 을 /̃ 를 ), mais s’accumule obligatoirement après les particules casuelles de lieu ( 에 ̃) ou de provenance ( 에 ̃ 서 ).
Exemple d’objet : 사과를먹어요 . 커피도마셔요 . (Je mange une pomme. Je bois aussi du café).
Exemple de lieu : 학 교 에 가 요 . 회 사 에 도 가 요 . (Je vais à l’école. Je vais aussi à l’entreprise).

B. La place des adverbes de négation 안 (ne... pas) et 못 (ne pas pouvoir) :
Pour l’intégralité des verbes composés formés sur la base nominale + 하다 , l’adverbe négatif s’intercale rigoureusement juste avant le bloc 하다 .
Ejemplo : 공부 안해요 (et non 안공부해요 ) / 운전 못해요 (et non 못운전해요 ).$kt$, $kt${"source":"manuel_pdf","course_number":46}$kt$::jsonb, 46),
  ('Italien', 'alphabet', $kt$Cours 1 · Salutations, présentations et alphabet$kt$, $kt$Compréhension & Lecture
Dialogue entre deux personnes qui se rencontrent dans une université à Milan.

Grammaire & Conjugaison
En italien, l’usage des pronoms sujets est facultatif. On n’utilise pas obligatoirement les pronoms sujets (io, tu...) car la terminaison du verbe suffit à identifier la personne. Voici les conjugaisons intégrales au présent de l’indicatif :

Verbe Chiamarsi (S’appeler) & Essere (Être)

Chiamarsi : Io mi chiamo, tu ti chiami, lui/lei/Lei si chiama, noi ci chiamiamo, voi vi chiamate, loro si chiamano.
Essere : Io sono, tu sei, lui/lei/Lei è, noi siamo, voi siete, loro sono.

Vocabulaire & Prononciation Audio
— Ciao ! : Salut !
— Buongiorno / Buon pomeriggio : Bonjour (matin) / Bonjour (après-midi).
— Buonasera ! / Buonanotte ! : Bonsoir / Bonne nuit.
— Come va ? / Come stai ? : Comment ça va ? / Comment vas-tu ?
— Piacere / Piacere di conoscerti : Enchanté(e).
— Règle de prononciation clé : La lettre C devant un e ou un i se prononce comme le "tch" français (comme dans "chocolat"). Devant un a, o, ou u, elle se prononce comme un "k". Le H est toujours totalement muet.

— Ressource audio : Écoutez la prononciation exacte sur Forvo ou WordReference.$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Salutations, présentations et alphabet$kt$, $kt$Vocabulaire & Prononciation Audio
— Ciao ! : Salut !
— Buongiorno / Buon pomeriggio : Bonjour (matin) / Bonjour (après-midi).
— Buonasera ! / Buonanotte ! : Bonsoir / Bonne nuit.
— Come va ? / Come stai ? : Comment ça va ? / Comment vas-tu ?
— Piacere / Piacere di conoscerti : Enchanté(e).
— Règle de prononciation clé : La lettre C devant un e ou un i se prononce comme le "tch" français (comme dans "chocolat"). Devant un a, o, ou u, elle se prononce comme un "k". Le H est toujours totalement muet.
— Ressource audio : Écoutez la prononciation exacte sur Forvo ou WordReference.$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Italien', 'vocabulary', $kt$Cours 2 · L’identité et les chiffres$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : Essere vs Avere
Pour donner son âge en italien, on n’utilise pas le verbe être, mais le verbe avoir (Avere).

Avere

Avere : Io ho, tu hai, lui/lei/Lei ha, noi abbiamo, voi avete, loro hanno.

Chiffres

Les chiffres (0-20) : zero, uno, due, tre, quattro, cinque, sei, sette, otto, nove, dieci, undici, dodici, tredici, quattordici, quindici, sedici, diciassette, diciotto, diciannove, venti.

Vocabulaire
— Quanti anni hai ? : Quel âge as-tu ?
— Ho [...] anni : J’ai [...] ans.
— Che lavoro fai ? / Qual è la tua professione ? : Que fais-tu dans la vie ?

N          Nazionalità             traduction              Professioni                  traduction 1              Francese             français(e)       Avvocato / Avvocatessa               avocat(e) 2       Spagnolo / Spagnola         espagnol(e)                Medico                       médecin 3      Messicano / Messicana        mexicain(e)       Infermiere / Infermiera       infirmier / infirmière 4      Argentino / Argentina        argentin(e)      Professore / Professoressa          professeur(e) 5    Colombiano / Colombiana      colombien(ne)       Studente / Studentessa              étudiant(e) 6          Cileno / Cilena          chilien(ne)               Ingegnere                  ingénieur(e) 7      Peruviano / Peruviana       péruvien(ne)              Architetto                    architecte 8           Statunitense           américain(e)       Cameriere / Cameriera           serveur / serveuse 9             Canadese             canadien(ne)           Cuoco / Cuoca             cuisinier / cuisinière 10              Inglese              anglais(e)       Commesso / Commessa            vendeur / vendeuse 11       Tedesco / Tedesca         allemand(e)       Informatico / Informatica        informaticien(ne) 12       Italiano / Italiana         italien(ne)             Giornalista                  journaliste 13           Portoghese            portugais(e)                Artista                       artiste 14               Belga                  belge                 Musicista                  musicien(ne) 15       Svizzero / Svizzera            suisse      Parrucchiere / Parrucchiera      coiffeur / coiffeuse 16   Marocchino / Marocchina       marocain(e)                 Autista             chauffeur / conductrice 17              Cinese                chinois(e)       Poliziotto / Poliziotta        policier / policière 18           Giapponese             japonais(e)               Pompiere                      pompier 19       Cubano / Cubana              cubain(e)        Impiegato / Impiegata      employé(e) administratif 20   Venezuelano / Venezuelana   vénézuélien(ne)   Imprenditore / Imprenditrice        chef d’entreprise$kt$, $kt${"source":"manuel_pdf","course_number":2}$kt$::jsonb, 2),
  ('Italien', 'vocabulary', $kt$Cours 3 · Description physique et psychologique$kt$, $kt$Compréhension & Lecture

Grammaire : L’accord de genre et de nombre
En italien, la règle générale pour accorder les adjectifs dépend de leur terminaison au singulier :
— Masculin en -o → Féminin en -a (alto/alta). Pluriel : -i au masculin, -e au féminin (alti/alte).
— Les adjectifs en -e sont identiques au masculin et au féminin (intelligente). Pluriel en -i pour les deux genres (intelligenti).
— Pluriel des couleurs : azzurro → azzurri, verde → verdi.

Vocabulaire : Banque d’adjectifs de description
Physique

Alto/Basso (Grand/Petit), Magro/Grasso (Mince/Gros), Bello/Brutto (Beau/Laid), Giovane/Vecchio (Jeune/Vieux), Forte/Debole (Fort/Faible), Castano/Biondo/Moro/Rosso (Châtain/Blond/Brun/Roux)

Caractère

Simpatico/Antipatico (Sympathique/Antipatique), Intelligente (Intelligent), Timido/Estroverso (Timide/Extraverti), Lavoratore/Lavoratrice (Travailleur), Pi-
gro/Pigra (Paresseux), Allegro/Triste (Joyeux/Triste), Gentile (Aimable, gentil), Paziente/Impaziente (Patient/Impatient)$kt$, $kt${"source":"manuel_pdf","course_number":3}$kt$::jsonb, 3),
  ('Italien', 'vocabulary', $kt$Cours 4 · La famille et l’entourage$kt$, $kt$Compréhension & Lecture

Grammaire : Les Possessifs & le verbe Piacere
— Les adjectifs possessifs s’accordent en genre et en nombre avec l’objet possédé. En italien, ils sont généralement précédés d’un article défini (ex : il mio cane), sauf pour les membres de la famille singuliers et non modifiés (ex : mio padre, mia madre).

Personne (sans article pour la famille proche)             Singulier        Pluriel (avec article) 1re sg. (Mon, ma, mes)                                      mio / mia            i miei / le mie 2e sg. (Ton, ta, tes)                                       tuo / tua            i tuoi / le tue 3e sg. (Son, sa, ses)                                       suo / sua            i suoi / le sue 1re pl. (Notre, nos)                                    nostro / nostra       i nostri / le nostre 2e pl. (Votre, vos)                                     vostro / vostra       i vostri / le vostre 3e pl. (Leur, leurs - toujours avec article)            il loro / la loro        i loro / le loro

Piacere (Aimer / Plaire)

On ne conjugue pas piacere comme un verbe régulier. Sa conjugaison dépend de ce qui suit :
— Piace + verbe à l’infinitif OU nom au singulier.
— Piacciono + nom au pluriel.

Les pronoms compléments (mi, ti, gli/le, ci, vi, loro) sont obligatoires. Les formes avec "A" servent à insister ou à lever une ambiguïté.

Pronoms d’insistance (Optionnels)          Structure obligatoire + Piace/Piacciono (A me)                                     mi piace / piacciono
(A te)                                     ti piace / piacciono
(A lui / a lei)                            gli / le piace / piacciono
(A noi)                                    ci piace / piacciono
(A voi)                                    vi piace / piacciono
(A loro)                                   piace / piacciono loro (ou : a loro piace)

Vocabulaire & Prononciation
Pour écouter la prononciation exacte des mots par des natifs, vous pouvez consulter Forvo (Italiano) ou le dictionnaire WordReference.
— Il padre / La madre : Le père / La mère
— Il figlio / La figlia : Le fils / La fille
— Il fratello / La sorella : Le frère / La sur
— Il nonno / La nonna : Le grand-père / La grand-mère
— Leggere : Lire
— Cucinare : Cuisiner
— Ascoltare musica : Écouter de la musique
— Viaggiare : Voyager$kt$, $kt${"source":"manuel_pdf","course_number":4}$kt$::jsonb, 4),
  ('Italien', 'conjugation', $kt$Cours 5 · Le temps qui passe (L’heure, l’agenda et le climat)$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : Exprimer l’heure et le temps
L’heure

On utilise le verbe Essere. On utilise È pour une heure, midi ou minuit, et Sono le pour toutes les autres heures. Les heures sont précédées de l’article au pluriel.
— È l’una (Il est 1h).
— Sono le due (Il est 2h).
— Les minutes : e un quarto (:15), e mezza (:30), meno un quarto (:45).

Le climat
On utilise souvent le verbe Fare (Faire) ou des tournures impersonnelles.
— C’è il sole (Il fait soleil) / Fa freddo (Il fait froid) / Fa caldo (Il fait chaud).
— È nuvoloso (C’est nuageux) / Piove (Il pleut).

Vocabulaire
— I giorni della settimana : lunedì, martedì, mercoledì, giovedì, venerdì, sabato, domenica.
— Le stagioni : primavera (printemps), estate (été), autunno (automne), inverno (hiver).
Audio de référence : Écoutez les jours et les heures énoncés distinctement sur WordReference Hours.$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Le temps qui passe (L’heure, l’agenda et le climat)$kt$, $kt$Vocabulaire
— I giorni della settimana : lunedì, martedì, mercoledì, giovedì, venerdì, sabato, domenica.
— Le stagioni : primavera (printemps), estate (été), autunno (automne), inverno (hiver).
Audio de référence : Écoutez les jours et les heures énoncés distinctement sur WordReference Hours.$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Italien', 'rule', $kt$Cours 6 · La routine quotidienne$kt$, $kt$Compréhension & Lecture

Grammaire : Les verbes réguliers et pronominaux
Terminaisons du Présent (Régulier)

-ARE (Parlare) : -o, -i, -a, -iamo, -ate, -ano.
-ERE (Prendere) : -o, -i, -e, -iamo, -ete, -ono.
-IRE (Dormire) : -o, -i, -e, -iamo, -ite, -ono.
Certains verbes en -ire prennent l’interfixe -isc- (ex : Finire : finisco, finisci, finisce, finiamo, finite, finiscono).

Les verbes pronominaux (avec le pronom réfléchi en tête)

Alzarsi : mi alzo, ti alzi, si alza, ci alziamo, vi alzate, si alzano.

Vocabulaire
— Svegliarsi = Se réveiller
— Farsi la doccia = Se doucher
— Fare colazione / Pranzare / Cenare = Déjeuner (matin) / Manger (midi) / Dîner (soir)
— Uscire = Sortir (Io esco)
— Tornare = Rentrer, revenir$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Italien', 'vocabulary', $kt$Vocabulaire · La routine quotidienne$kt$, $kt$Vocabulaire
— Svegliarsi = Se réveiller
— Farsi la doccia = Se doucher
— Fare colazione / Pranzare / Cenare = Déjeuner (matin) / Manger (midi) / Dîner (soir)
— Uscire = Sortir (Io esco)
— Tornare = Rentrer, revenir$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Italien', 'conjugation', $kt$Cours 7 · Les loisirs, invitations et verbes irréguliers$kt$, $kt$Compréhension & Lecture

Grammaire : Les verbes irréguliers (Modaux et d’habitude)
En italien, les verbes modaux subissent d’importantes modifications de leur radical au présent de l’indicatif.
— Volere (Vouloir)
Io voglio, tu vuoi, lui/lei vuole, noi vogliamo, voi volete, loro vogliono.
— Potere (Pouvoir)
Io posso, tu puoi, lui/lei può, noi possiamo, voi potete, loro possono.
— Solere (Avoir l’habitude de / Être habitué à)
Io soglio, tu suoli, lui/lei suole, noi sogliamo, voi solete, loro sogliono. (Remarque : En italien moderne, on préfère souvent la tournure "di solito + verbe régulier").

Vocabulaire
— Giocare a calcio / a tennis = Jouer au football / au tennis (Attention : Io gioco)
— Andare al cinema / a teatro = Aller au cinéma / au théâtre
— Ascoltare musica = Écouter de la musique
— Incontrarsi con gli amici = Voir / retrouver des amis$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Les loisirs, invitations et verbes irréguliers$kt$, $kt$Vocabulaire
— Giocare a calcio / a tennis = Jouer au football / au tennis (Attention : Io gioco)
— Andare al cinema / a teatro = Aller au cinéma / au théâtre
— Ascoltare musica = Écouter de la musique
— Incontrarsi con gli amici = Voir / retrouver des amis$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Italien', 'vocabulary', $kt$Cours 9 · La ville, les déplacements et l’orientation$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : L’existence (C’è / Ci sono) vs La localisation
C’È / CI SONO (Formes du verbe Essere précédé de "ci" – "Il y a")

On l’utilisera pour exprimer l’existence de quelque chose d’indéterminé ou de général.
Suivi de : un article indéfini (un, una, dei, delle), un chiffre, ou un nom pluriel.
— Esempio : In questo quartiere c’è un parco. / Ci sono musei qui ?

LOCALISATION (Être)

On utilise le verbe Essere seul pour situer un lieu, une personne ou un objet précis et déterminé.
Suivi de : un article défini (il, la, i, le), un nom propre, ou un possessif (mio, tuo, suo).

Conjugaison complète du verbe ESSERE au Présent (Rappel Localisation)

Io sono, tu sei, lui/lei è, noi siamo, voi siete, loro sono.
— Esempio : Il museo è vicino alla stazione. / Milano è nel nord d’Italia.

Vocabulaire : La ville et l’orientation
Lugari della città (Lieux) :
— La stazione dei treni / degli autobus : La gare / station de bus
— Il comune / Il municipio : La mairie
— Il commissariato di polizia : Le commissariat
— L’ospedale : L’hôpital
— L’ufficio postale : La poste
— La chiesa / La cattedrale : L’église / La cathédrale
— La banca : La banque
— Il cinema / Il teatro / Il museo : Le cinéma / théâtre / musée

Direzioni & Movimento (Directions) :
— Girare a sinistra / a destra : Tourner à gauche / à droite
— Proseguire sempre dritto : Continuer tout droit
— Attraversare la strada / il ponte : Traverser la rue / le pont
— Vicino (a) / Lontano (da) : Près de / Loin de
— Accanto a / Di fronte a : À côté de / En face de
— All’angolo : Au coin / À l’angle de la rue$kt$, $kt${"source":"manuel_pdf","course_number":9}$kt$::jsonb, 9),
  ('Italien', 'vocabulary', $kt$Cours 10 · Au restaurant et faire les courses$kt$, $kt$Compréhension & Lecture
[Al fine del pasto] : Cameriere, il conto, per favore !

Grammaire : L’obligation personnelle (Dovere) vs impersonnelle (Bisogna / Ci
vuole)

DOVERE + Infinitif (Obligation personnelle : "Devoir / Il faut que je/tu...")

Se conjugue à toutes les personnes : Io devo, tu devi, lui deve, noi dobbiamo, voi dovete, loro devono.
— Esempio : Devo comprare le verdure per la cena. (C’est mon obligation).

BISOGNA + Infinitif (Obligation générale / impersonnelle : "Il faut / Il est
nécessaire de...")

Ne change jamais de forme. Règle générale s’appliquant à tout le monde.
— Esempio : Bisogna pagare alla cassa. (Il faut payer à la caisse, règle générale).

Vocabulaire : Alimentation et Restaurant
La tavola e le posate (La table) :
— La forchetta : la fourchette
— Il coltello : le couteau
— Il cucchiaio : le cuillère
— Il bicchiere : le verre
— Il tovagliolo : la serviette

Alimenti di base (Nourriture) :
— La carne (La viande) : il pollo (le poulet), il manzo (le buf), il maiale (le porc).
— Il pesce e i frutti di mare (Poisson & fruits de mer) : il tonno (le thon), il salmone (le saumon), i gamberetti (les crevettes).
— Verdura e frutta (Légumes & fruits) : le patate (les pommes de terre), l’insalata (la salade), il pomodoro (la tomate), la mela (la pomme), la banana (la banane).
— Bevande (Boissons) : Il vino rosso/bianco (le vin rouge/blanc), la birra (la bière), il caffè, il succo d’arancia (le jus d’orange).$kt$, $kt${"source":"manuel_pdf","course_number":10}$kt$::jsonb, 10),
  ('Italien', 'vocabulary', $kt$Cours 11 · Les achats, les vêtements et la comparaison$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : Les Démonstratifs & La Comparaison
Les Adjectifs Démonstratifs (Proximité spatiale ou temporelle) :
En italien, les adjectifs démonstratifs s’accordent en genre et en nombre. Quello suit les mêmes règles de déclinaison que l’article défini.
— Proche de moi : Questo / Questa (Ce/Cette) Pluriel : Questi / Queste
— Éloigné de moi : Quello / Quella (Ce/Cette là-bas) Pluriel : Quelli / Quelle (ou quel, quello, quell’, quei, quegli devant un nom).

La Comparaison :
— Supériorité : più + adjectif + di/che (ex : più alto di).
— Infériorité : meno + adjectif + di/che (ex : meno caro di).
— Égalité : (tanto) + adjectif + quanto OU (così) + adjectif + come (ex : comodo quanto / così bello come).
— Irréguliers : migliore di (meilleur que), peggiore di (pire que), più grande di / maggiore (plus âgé que), più piccolo di / minore (plus jeune que).

Vocabulaire Enrichi : Les vêtements et le shopping
Capi d’abbigliamento (Vêtements) :
— La camicia (La chemise), la maglietta (Le t-shirt), i pantaloni (Le pantalon), i jeans (Le jean).
— La giacca (La veste), il cappotto (Le manteau), il maglione (Le pull).
— La gonna (La jupe), il vestito (La robe).
— Le scarpe (Les chaussures), le scarpe da ginnastica (Les baskets).

Caratteristiche (Caractéristiques)

— La taglia (La taille), il prezzo (Le prix), caro / economico (Cher / Bon marché), comodo / scomodo (Confortable / Inconfortable).$kt$, $kt${"source":"manuel_pdf","course_number":11}$kt$::jsonb, 11),
  ('Italien', 'vocabulary', $kt$Cours 12 · Le logement et l’espace habitable$kt$, $kt$Compréhension & Lecture

Grammaire : Les prépositions et locutions de lieu
Pour décrire la position des meubles, on utilise le verbe Essere suivi d’une préposition simple ou articulée :
— In = Dans / À (lieu général)
— Sopra / Su = Au-dessus de / Sur
— Sotto = Sous / En-dessous de
— Davanti a = Devant
— Dietro (a) = Derrière
— Tra / Fra = Entre
— A destra di / A sinistra di = À droite de / À gauche de
— Accanto a = À côté de

Vocabulaire Enrichi : La maison et les meubles
Parti della casa (Pièces) :
— La casa (La maison), l’appartamento (L’appartement).
— Il salone / La sala da pranzo (Le salon / La salle à manger).
— La cucina (La cuisine).
— La camera da letto / La stanza (La chambre).
— Il bagno (La salle de bain).
— Il corridoio (Le couloir), il balcone (Le balcon), la terrazza (La terrasse).

I mobili (Les meubles) :
— Il divano (Le canapé), il tavolo (La table), la sedia (La chaise), il letto (Le lit), l’armadio (L’armoire), la lampada (La lampe), lo specchio (Le miroir).$kt$, $kt${"source":"manuel_pdf","course_number":12}$kt$::jsonb, 12),
  ('Italien', 'conjugation', $kt$Cours 13 · Parler du passé proche (Le Passé Composé / Passato Prossimo)$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : Le Passato Prossimo
Il exprime une action passée s’inscrivant dans une période de temps non révolue (oggi, questa settimana). Contrairement à l’espagnol, l’italien utilise deux auxiliaires : Avere (pour la majorité des verbes) et Essere (pour les verbes de mouvement, d’état et pronominaux). Lorsque l’on utilise Essere, le participe passé s’accorde en genre et en nombre avec le sujet.

Rappel du présent des auxiliaires

Avere : Io ho, tu hai, lui/lei ha, noi abbiamo, voi avete, loro hanno.
Essere : Io sono, tu sei, lui/lei è, noi siamo, voi siete, loro sono.

Formation du participe passé

1. Formation du participe passé régulier :
— Verbes en -ARE → -ato (Parlare → parlato)
— Verbes en -ERE → -uto ( → venduto)
— Verbes en -IRE → -ito (Capire → capito)
2. Participes irréguliers indispensables :
— Fare → fatto (fait)
— Scrivere → scritto (écrit)
— Vedere → visto / veduto (vu)
— Tornare → tornato (revenu – auxiliaire essere)
— Dire → detto (dit).

Marqueurs temporels :
Oggi (Aujourd’hui), questo mese (Ce mois-ci), questa settimana (Cette semaine), già (Déjà), non ancora (Pas encore).

Vocabulaire : Les activités récentes
— Inviare un messaggio = Envoyer un message
— Assistere a una riunione = Assister à une réunion
— Fare la spesa = Faire les courses
— Organizzare i documenti = Organiser les documents$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Parler du passé proche (Le Passé Composé / Passato Prossimo)$kt$, $kt$Vocabulaire : Les activités récentes
— Inviare un messaggio = Envoyer un message
— Assistere a una riunione = Assister à une réunion
— Fare la spesa = Faire les courses
— Organizzare i documenti = Organiser les documents$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Italien', 'conjugation', $kt$Cours 14 · Raconter un souvenir d’enfance (L’Imparfait / Imperfetto)$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : L’Imparfait
Utilisé pour décrire des habitudes passées, des souvenirs, des états d’esprit ou décors passés. Ce temps conserve la consonne thématique de l’infinitif (v) précédée de la voyelle propre à chaque groupe.

Terminaisons Régulières

Verbes en -ARE (Parlare) : -avo, -avi, -ava, -avamo, -avate, -avano.
Io parlavo, tu parlavi, lui parlava, noi parlavamo, voi parlavate, loro parlavano Verbes en -ERE (Prendere) : -evo, -evi, -eva, -evamo, -evate, -evano.
Io prendevo, tu prendevi, lui prendeva, noi prendevamo, voi prendevate, loro prendevano Verbes en -IRE (Dormire) : -ivo, -ivi, -iva, -ivamo, -ivate, -ivano.
Io dormivo, tu dormivi, lui dormiva, noi dormivamo, voi dormivate, loro dormivano

Les principaux verbes irréguliers à l’Imparfait

1. Essere : ero, eri, era, eravamo, eravate, erano.
2. Fare : facevo, facevi, faceva, facevamo, facevate, facevano.
3. Dire : dicevo, dicevi, diceva, dicevamo, dicevate, dicevano.
4. Bere : bevevo, bevevi, beveva, bevevamo, bevevate, bevevano.

Vocabulaire : L’enfance et les souvenirs
— Quando ero giovane / bambino = Quand j’étais jeune / enfant
— A quell’epoca = À cette époque-là
— Solere (imparfait : solevo) + Infinitif = Avoir l’habitude de (dans le passé / ou tournure "di solito" à l’imparfait)
— I giocattoli / I cartoni animati = Les jouets / Les dessins animés$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Raconter un souvenir d’enfance (L’Imparfait / Imperfetto)$kt$, $kt$Vocabulaire : L’enfance et les souvenirs
— Quando ero giovane / bambino = Quand j’étais jeune / enfant
— A quell’epoca = À cette époque-là
— Solere (imparfait : solevo) + Infinitif = Avoir l’habitude de (dans le passé / ou tournure "di solito" à l’imparfait)
— I giocattoli / I cartoni animati = Les jouets / Les dessins animés$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Italien', 'vocabulary', $kt$Cours 15 · Exprimer la douleur et la santé$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : L’expression de la douleur (Fare male)
En italien, pour exprimer la douleur, on utilise l’expression Fare male. Le verbe s’accorde uniquement avec la ou les parties du corps qui causent la douleur (singulier ou pluriel), précédé d’un pronom indirect.

Structures :
— Mi fa male + nom singulier (Ex : Mi fa male la schiena = J’ai mal au dos).
— Mi fanno male + nom pluriel (Ex : Mi fanno male i piedi = J’ai mal aux pieds).

Conjugaison avec les pronoms indirects

(A me) mi fa/fanno male | (A te) ti fa/fanno male | (A lui/lei) gli/le fa/fanno male | (A noi) ci fa/fanno male | (A voi) vi fa/fanno male | (A loro) fa/fanno male loro.

Vocabulaire : Le corps humain et la santé
Parti del corpo (Le corps) :
— La testa (la tête)
— la schiena (le dos),
— lo stomaco (l’estomac),
— la gola (la gorge),
— le braccia (les bras - pluriel irrégulier),
— le gambe (les jambes),
— i denti (les dents).

Sintomi (Symptômes) :
— Avere la febbre (avoir de la fièvre),
— essere raffreddato/a (être enrhumé),
— avere la tosse (tousser),
— la stanchezza (la fatigue).

Rimedi (Remèdes) :
— La ricetta (l’ordonnance),
— la pastiglia / la compressa (le comprimé),
— stare a letto (rester au lit).$kt$, $kt${"source":"manuel_pdf","course_number":15}$kt$::jsonb, 15),
  ('Italien', 'conjugation', $kt$Cours 17 · Raconter une action ponctuelle (Le Passé Simple Régulier / Passato Remoto)$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : Le Passato Remoto Régulier
Ce temps correspond au passé simple espagnol (*Pretérito Indefinido*). En italien, il est principalement utilisé dans la langue écrite, les récits historiques ou dans certaines régions pour marquer des actions totalement coupées du présent.

Terminaisons des Verbes Réguliers

— Verbes en -ARE (Parlare) : -ai, -asti, -ò, -ammo, -aste, -arono.
(Io parlai, tu parlasti, lui parlò, noi parlammo, voi parlaste, loro parlarono).
— Verbes en -ERE (Vendere) : -ei / -etti, -esti, -é / -ette, -emmo, -este, -erono / -ettero.
(Io vendei/vendetti, tu vendesti, lui vendé/vendette, noi vendemmo, voi vendeste, loro venderono/vendettero).
— Verbes en -IRE (Capire) : -ii, -isti, -ì, -immo, -iste, -irono.
(Io capii, tu capisti, lui capì, noi capimmo, voi capiste, loro capirono).

Marqueurs temporels clés :
Ieri (Hier), ieri sera (Hier soir), l’anno scorso (L’année dernière), lunedì scorso (Lundi dernier), nel 2015.

Vocabulaire Enrichi : Le voyage et les actions ponctuelles
— Viaggiare per il mondo : Voyager à travers le monde
— Prendere un aereo / un treno : Prendre un avion / un train
— Scattare foto : Prendre des photos
— Scoprire un luogo : Découvrir un endroit
— Il souvenir / La cartolina : Le souvenir (objet) / La carte postale$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Raconter une action ponctuelle (Le Passé Simple Régulier / Passato Remoto)$kt$, $kt$Vocabulaire Enrichi : Le voyage et les actions ponctuelles
— Viaggiare per il mondo : Voyager à travers le monde
— Prendere un aereo / un treno : Prendre un avion / un train
— Scattare foto : Prendre des photos
— Scoprire un luogo : Découvrir un endroit
— Il souvenir / La cartolina : Le souvenir (objet) / La carte postale$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Italien', 'conjugation', $kt$Cours 18 · Maîtriser les irrégularités majeures du Passé Simple$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : Les Irréguliers du Passato Remoto
En italien, de nombreux verbes ont une irrégularité dite "1-3-6" : le radical change uniquement à la première personne du singulier (io), à la troisième du singulier (lui/lei) et à la troisième du pluriel (loro). Les autres personnes se conjuguent sur le radical régulier.

ESSERE (Être) & IR / ANDARE (Aller) :

Contrairement à l’espagnol où ces verbes fusionnent, ils restent distincts en italien.
Essere : Yo fui → Io fui, tu fosti, lui fu, noi fummo, voi foste, loro furono.
Andare (Régulier au Passato Remoto) : Io andai, tu andasti, lui andò, noi an-
dammo, voi andaste, loro andarono.

FARE (Faire)

Se conjugue sur le vieux radical fac-.
Io facci → Io facessi (attention : irrégulier complet -> io facci → io fecci → Io feci, tu facesti, lui fece, noi facemmo, voi faceste, loro fecero).

DIRE (Dire)

Se conjugue sur le radical dic-.
Io dissi, tu dicesti, lui disse, noi dicemmo, voi diceste, loro dissero.

AVERE (Avoir – correspond à Tener) & STARE (Être – correspond à Estar)

Avere : Io ebbi, tu avesti, lui ebbe, noi avemmo, voi aveste, loro ebbero.
Stare : Io stetti, tu stasti, lui stette, noi stammo, voi staste, loro stettero.

Vocabulaire Enrichi : Les verbes d’action au passé
— Fare un’escursione : Faire une randonnée / excursion
— Avere successo : Avoir du succès / Réussir
— Mettersi i vestiti : Mettre ses vêtements
— Essere in vacanza : Être en vacances$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Maîtriser les irrégularités majeures du Passé Simple$kt$, $kt$Vocabulaire Enrichi : Les verbes d’action au passé
— Fare un’escursione : Faire une randonnée / excursion
— Avere successo : Avoir du succès / Réussir
— Mettersi i vestiti : Mettre ses vêtements
— Essere in vacanza : Être en vacances$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Italien', 'conjugation', $kt$Cours 19 · Alterner les temps du passé (Imparfait vs Passé Simple)$kt$, $kt$Compréhension & Lecture

Grammaire : La règle de l’alternance
— Imperfetto (L’arrière-plan) : On l’utilise pour décrire le décor, la situation en cours, l’état d’esprit, le temps qu’il faisait. C’est l’action qui durait dans le temps (Ex : Io leggevo = Je lisais).
— Passato Remoto / Passato Prossimo (L’action de premier plan) : On l’utilise
pour l’événement soudain, l’action qui interrompt la situation ou qui fait avancer l’histoire
(Ex : Il telefono suonò / ha suonato = Le téléphone a sonné).

Vocabulaire Enrichi : Connecteurs de rupture et de narration
— All’improvviso / Di colpo = Soudain / Tout à coup
— Mentre = Pendant que / Tandis que
— Allora / Poi / In seguito = Alors / Ensuite
— Alla fine = Finalement / À la fin$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Alterner les temps du passé (Imparfait vs Passé Simple)$kt$, $kt$Vocabulaire Enrichi : Connecteurs de rupture et de narration
— All’improvviso / Di colpo = Soudain / Tout à coup
— Mentre = Pendant que / Tandis que
— Allora / Poi / In seguito = Alors / Ensuite
— Alla fine = Finalement / À la fin$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Italien', 'conjugation', $kt$Cours 20 · Projets et avenir (Le Futur et le Futur Proche)$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : Le Futur Proche et le Futur de l’Indicatif
Le Futur Proche (Intention immédiate ou projet imminent) : STARE PER + Infi-
nitif
On conjugue le verbe Stare au présent + la préposition per + le verbe à l’infinitif. Io sto per, tu stai per, lui sta per, noi stiamo per, voi state per, loro stanno per. (Ex : Sto per viaggiare).

Le Futur Simple (Actions plus lointaines ou promesses) :
En italien, les terminaisons s’ajoutent après avoir supprimé la voyelle finale de l’infinitif. Attention, pour les verbes en -are, la voyelle change en -e- (parlare → parlerò). Les terminaisons
sont : -ò, -ai, -à, -emo, -ete, -anno.
Parlerò, parlerai, parlerà, parleremo, parlerete, parleranno.

Vocabulaire Enrichi : L’avenir et le temps futur
— L’anno prossimo / La settimana prossima = L’année prochaine / La semaine prochaine
— In futuro / Un giorno = Dans le futur / Un jour
— Il progetto / L’obiettivo = Le projet / L’objectif, le but
— Traslocare = Déménager$kt$, $kt${"source":"manuel_pdf","course_number":20}$kt$::jsonb, 20),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Projets et avenir (Le Futur et le Futur Proche)$kt$, $kt$Vocabulaire Enrichi : L’avenir et le temps futur
— L’anno prossimo / La settimana prossima = L’année prochaine / La semaine prochaine
— In futuro / Un giorno = Dans le futur / Un jour
— Il progetto / L’obiettivo = Le projet / L’objectif, le but
— Traslocare = Déménager$kt$, $kt${"source":"manuel_pdf","course_number":20}$kt$::jsonb, 20),
  ('Italien', 'conjugation', $kt$Cours 21 · Donner des ordres et des conseils (L’Impératif Affirmatif)$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : L’Impératif
L’impératif varie selon que l’on s’adresse à un proche (Tu) ou de manière formelle (courtoisie) (Lei). Attention, la forme de politesse utilise le subjonctif présent.

Modèles de l’Impératif Affirmatif Formes régulières

Verbes en -ARE (Parlare) : Tu parla | Lei parli | Voi parlate | Loro parlino.
Verbes en -ERE (Prendere) : Tu prendi | Lei prenda | Voi prendete | Loro prendano. Verbes en -IR (Scrivere) : Tu scrivi | Lei scriva | Voi scrivete | Loro scrivano.

Irréguliers majeurs à la personne “Tu”

Fa’ / Fai (Fare), di’ (Decir), va’ / vai (Andare), sii (Essere), abbi (Avere), poniti / metti (Poner/Mettere), esci (Uscire), vieni (Venir).

Vocabulaire : Les verbes d’instruction
— Ascoltare attentamente = Écouter attentivement
— Prendere una decisione = Prendre une décision
— Salire / Scendere = Monter / Descendre (ou Augmenter / Baisser)
— Firmare un documento = Signer un document$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Donner des ordres et des conseils (L’Impératif Affirmatif)$kt$, $kt$Vocabulaire : Les verbes d’instruction
— Ascoltare attentamente = Écouter attentivement
— Prendere una decisione = Prendre une décision
— Salire / Scendere = Monter / Descendre (ou Augmenter / Baisser)
— Firmare un documento = Signer un document$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Italien', 'vocabulary', $kt$Cours 22 · Le monde du travail, l’entreprise et le CV$kt$, $kt$Compréhension & Lecture

Grammaire : Exprimer la durée et la continuité
En italien, pour exprimer une action commencée dans le passé qui se poursuit dans le présent, on utilise simplement le présent de l’indicatif précédé ou suivi de la préposition DA :
— Verbe au présent + DA + Durée : Lavoro en questa azienda da tre anni. (Je travaille dans cette entreprise depuis trois ans / Cela fait trois ans que je travaille ici).

Vocabulaire : Formules de courriels professionnels
Formules d’appel (Téléphone) :
1. Pronto ? / Sì ? (Allô ?),
2. Da parte di chi ? (De la part de qui ?),
3. Passare la chiamata / Trasferire la chiamata (Transférer l’appel).

Formules de politesse (E-mails) :
— Gentile Signore/Signora : (Cher/Chère Monsieur/Madame – Début de mail formel)
— Cordiali saluti / Distinti saluti (Veuillez agréer... / Cordialement – Fin de mail)$kt$, $kt${"source":"manuel_pdf","course_number":22}$kt$::jsonb, 22),
  ('Italien', 'rule', $kt$Cours 23 · Téléphone et communication formelle$kt$, $kt$Compréhension & Lecture

Grammaire : Le Conditionnel de Courtoisie
Pour s’adresser ou s’exprimer poliment au téléphone ou par courriel, on utilise le conditionnel présent des verbes Volere ou Potere à la place du présent brut.

Verbe Volere au Conditionnel

Io vorrei, tu vorresti, lui/lei/Lei vorrebbe, noi vorremmo, voi vorreste, loro vorrebbero.
Esempio 1 : Vorrei prendere un appuntamento con il signor Martínez (Je voudrais demander un rendez-vous...).
Esempio 2 : Potrei parlare con la direttrice ? (Pourrais-je parler à la directrice ?).

Vocabulaire : Formules de courriels professionnels
Formules d’appel (Téléphone) :
1. Pronto ? / Sì ? (Allô ?),
2. Da parte di chi ? (De la part de qui ?),
3. Passare la chiamata / Trasferire la chiamata (Transférer l’appel).

Formules de politesse (E-mails) :
— Gentile Signore/Signora : (Cher/Chère Monsieur/Madame – Début de mail formel)
— Cordiali saluti / Distinti saluti (Veuillez agréer... / Cordialement – Fin de mail)$kt$, $kt${"source":"manuel_pdf","course_number":23}$kt$::jsonb, 23),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Téléphone et communication formelle$kt$, $kt$Vocabulaire : Formules de courriels professionnels
Formules d’appel (Téléphone) :
1. Pronto ? / Sì ? (Allô ?),
2. Da parte di chi ? (De la part de qui ?),
3. Passare la chiamata / Trasferire la chiamata (Transférer l’appel).$kt$, $kt${"source":"manuel_pdf","course_number":23}$kt$::jsonb, 23),
  ('Italien', 'conjugation', $kt$Cours 25 · Exprimer l’hypothèse et la condition (Le Conditionnel Présent)$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison : Le Conditionnel Présent
Le conditionnel se forme en modifiant la voyelle thématique de l’infinitif pour le premier groupe (-are → -er-) et en ajoutant des terminaisons spécifiques. Les terminaisons de l’italien varient selon les personnes mais s’appliquent de manière unifiée à tous les groupes.

Terminaisons du Conditionnel Présent

-ei, -esti, -ebbe, -emmo, -este, -ebbero.

— Verbe Parlare (Parler) : parlerei, parleresti, parlerebbe, parleremmo, parlereste, parlerebbero.
— Verbe Prendere (Prendere) : prenderei, prenderesti, prenderebbe...
— Verbe Dormire (Dormire) : dormirei, dormiresti, dormirebbe...

Verbes irréguliers

De nombreux verbes coupent leur voyelle thématique (comme au futur) ou doublent leur consonne.
Fare → farei | Dire → direi | Avere → avrei | Potere → potrei | Volere → vorrei | Sapere → saprei | Dovere → dovrei | Vedere → vedrei.

Vocabulaire Enrichi : L’imaginaire et la condition
— Se fosse possibile... = Si c’était possible...
— In quel caso... = Dans ce cas-là...
— Vincere alla lotteria = Gagner à la loterie
— Realizzare un sogno = Réaliser un rêve$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Exprimer l’hypothèse et la condition (Le Conditionnel Présent)$kt$, $kt$Vocabulaire Enrichi : L’imaginaire et la condition
— Se fosse possibile... = Si c’était possible...
— In quel caso... = Dans ce cas-là...
— Vincere alla lotteria = Gagner à la loterie
— Realizzare un sogno = Réaliser un rêve$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Italien', 'conjugation', $kt$Cours 26 · Introduction au Subjonctif Présent (Souhait et Désir)$kt$, $kt$Compréhension & Lecture

Grammaire & Conjugaison
Le subjonctif s’utilise pour exprimer la subjectivité, la volonté ou le souhait après la conjonction che. On observe une inversion des voyelles thématiques par rapport au présent de l’indicatif.

Tableau des conjugaisons régulières au subjonctif présent

— Verbes en -ARE prendront les terminaisons en -I au singulier : -i, -i, -i, -iamo, -iate, -ino.
Conjugaison (Parlare) : parli, parli, parli, parliamo, parliate, parlino.
— Verbes en -ERE / -IR prendront les terminaisons en -A au singulier : -a, -a, -a, -iamo, -iate, -ano.
Conjugaison (Prendere) : prenda, prenda, prenda, prendiamo, prendiate, prendano.
Conjugaison (Dormire) : dorma, dorma, dorma, dormiamo, dormiate, dormano.

Structure de base : Verbe de souhait/volonté (ex : Voglio, Spero) + CHE + verbe au subjonctif.
Esempio : Voglio que tu venga con me. (Je veux que tu viennes avec moi).

Vocabulaire Enrichi : Exprimer le souhait et l’attente
— Magari ! / Magari (+ subjonctif) ! = Pourvu que ! / Espérons que !
— Desiderare che... = Désirer que...
— Esigere che... = Exiger que...
— Avere la speranza che... = Avoir l’espoir que...$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Introduction au Subjonctif Présent (Souhait et Désir)$kt$, $kt$Vocabulaire Enrichi : Exprimer le souhait et l’attente
— Magari ! / Magari (+ subjonctif) ! = Pourvu que ! / Espérons que !
— Desiderare che... = Désirer que...
— Esigere che... = Exiger que...
— Avere la speranza che... = Avoir l’espoir que...$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Italien', 'rule', $kt$Cours 27 · Exprimer l’opinion, la certitude et le doute$kt$, $kt$Compréhension & Lecture

Grammaire : La bascule Indicatif / Subjonctif
Règle fondamentale de la syntaxe italienne pour exprimer une opinion (attention, contrairement à l’espagnol, l’italien utilise très souvent le subjonctif même à la forme affirmative avec "credere" ou "pensare" pour marquer la subjectivité) :

Opinion affirmative (Subjectivité) → SUBJONCTIF
Credo che... (Je crois que) / Penso que... (Je pense que).
— Esempio : Credo che Juan abbia ragione.
Remarque : Les expressions de certitude absolue comme "So che..." (Je sais que) ou "È vero che..." prennent l’indicatif.

Doute / Négation / Incertitude → SUBJONCTIF
Non credo che... (Je ne crois pas que) / Non penso che... (Je ne pense pas que) / Dubito che... (Je doute que).
— Esempio : Non credo che Juan abbia ragione.

Vocabulaire Enrichi : Les nuances de l’opinion
— A mio parere / Secondo me = À mon sens / À mon avis
— Dal mio punto de vista = De mon point de vue
— Essere d’accordo con = Être d’accord avec
— Non c’è dubbio che... (+ indicatif) = Il ne fait aucun doute que...$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Italien', 'vocabulary', $kt$Vocabulaire · Exprimer l’opinion, la certitude et le doute$kt$, $kt$Vocabulaire Enrichi : Les nuances de l’opinion
— A mio parere / Secondo me = À mon sens / À mon avis
— Dal mio punto de vista = De mon point de vue
— Essere d’accordo con = Être d’accord avec
— Non c’è dubbio che... (+ indicatif) = Il ne fait aucun doute que...$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Italien', 'rule', $kt$Cours 28 · Les connecteurs logiques et l’argumentation$kt$, $kt$Compréhension & Lecture

Grammaire : Les familles de connecteurs
Pour opposer deux idées

— Tuttavia / Ciononostante (Cependant / Néanmoins)
— Ma (Mais)
— Anche se / Sebbene (+ subjonctif) (Bien que / Même si)

Pour exprimer la cause ou la conséquence

— Perché (Parce que)
— Pertanto / Perciò / Per questo (Par conséquent / C’est why)
— Poiché / Dato che (Puisque / Étant donné que)

Pour structurer et ajouter des arguments

— In primo luogo / In secondo luogo (En premier lieu / En second lieu)
— Inoltre (De plus)
— In conclusione (En conclusion)$kt$, $kt${"source":"manuel_pdf","course_number":28}$kt$::jsonb, 28),
  ('Italien', 'vocabulary', $kt$Cours 29 · Les médias, la technologie et l’actualité$kt$, $kt$Compréhension & Lecture

Grammaire : Les tournures affectives impersonnelles (È + Adjectif + Che)
Pour commenter une actualité ou donner une opinion générale sur un fait de société :

È + Adjectif de certitude + CHE + INDICATIF

È vero che... / È ovvio che... / È evidente che...
— Esempio : È evidente che la tecnologia cambia le nostre vite.

È + Adjectif de jugement ou sentiment + CHE + SUBJONCTIF

È importante che... / È un peccato que... / È incredibile che...
— Esempio : È importante che noi proteggiamo i nostri dati personali.

Vocabulaire Enrichi : Le monde numérique et l’information
— La stampa / Il telegiornale = La presse / Le journal télévisé
— La libertà di espressione = La liberté d’expression
— L’utente / Condividere un link = L’utilisateur / Partager un lien
— Essere connesso/a = Être connecté(e)
— Scaricare un’applicazione = Télécharger une application$kt$, $kt${"source":"manuel_pdf","course_number":29}$kt$::jsonb, 29),
  ('Italien', 'vocabulary', $kt$Cours 30 · L’environnement, l’écologie et l’avenir de la planète$kt$, $kt$Compréhension & Lecture

Grammaire : Exprimer la peur et le regret au subjonctif
Lorsque le sujet principal exprime un sentiment de peur ou une crainte vis-à-vis d’une autre action, la subordonnée se met systématiquement au subjonctif.

Temere che... / Aver paura che... + SUBJONCTIF

— Esempio : Ho paura che il pianeta subisca danni irreversibili. (J’ai peur que la planète souffre de dommages irréversibles).
— Esempio : Gli ecologisti temono che le risorse si esauriscano presto. (Les écologistes craignent que les ressources ne s’épuisent bientôt).

Vocabulaire Enrichi : Écologie et Développement durable
— Il riciclaggio / Riciclare = Le recyclage / Recycler
— Prendersi cura della natura = Prendre soin de la nature
— I rifiuti / L’inquinamento = Les déchets / La pollution
— La scarsità d’acqua = La pénurie d’eau
— La fauna e la flora = La faune et la flore$kt$, $kt${"source":"manuel_pdf","course_number":30}$kt$::jsonb, 30),
  ('Italien', 'rule', $kt$Cours 31 · Variations régionales et expressions idiomatiques$kt$, $kt$Compréhension & Lecture

Grammaire & Vocabulaire : Exemples de nuances d’usage en Italie
Concept                   Terme courant / Variante             Précision régionale / Contexte Le torchon                Il canovaccio / Lo strofinaccio       Variantes Nord / Centre-Sud Le cintre                 La gruccia / L’appendiabiti          Terme quotidien vs formel Le watermelon             L’anguria / Il cocomero              Usage majoritaire au Nord vs Centre-Sud La brioche / Croissant    Il cornetto / La brioche             Usage au Sud/Centre vs Nord Le petit déjeuner         La colazione / La prima colazione    Usage standard vs administratif

Expressions Idiomatiques Courantes (Modismi)
— Essere un gioco da ragazzi = Être un jeu d’enfant (très facile). (Esempio : L’italiano è un gioco da ragazzi !)
— Avere la testa tra le nuvole = Être dans les nuages / être distrait.
— Essere matto come un cavallo = Être complètement fou/folle.
— Mancare (a qualcuno) = Manquer à quelqu’un. (Esempio : Mi manchi = Tu me
manques).$kt$, $kt${"source":"manuel_pdf","course_number":31}$kt$::jsonb, 31),
  ('Japonais', 'alphabet', $kt$Cours 1 · [ÉCRIT] Les Kanji fondamentaux et la structure d’identité$kt$, $kt$Tracé et Graphie : L’ordre des traits et l’équilibre
L’écriture des Kanji répond à trois règles d’or universelles : de gauche à droite, du haut vers le bas, et on ferme systématiquement la boîte avant d’en écrire le contenu interne.

Les 5 Kanji fondamentaux du cycle (À mémoriser) :
Pour l’affichage des idéogrammes, assurez-vous d’avoir configuré votre préambule (ex : \newfontfamily\japfont{MS Mincho}).
— 日 (soleil / jour) : 4 traits.
Ordre : trait vertical gauche, coin supérieur droit d’un seul mouvement, trait horizontal médian, trait horizontal de fermeture basse.
— 本 (origine / livre) : 5 traits.
Ordre : ligne horizontale, ligne verticale traversante, diagonale gauche, diagonale droite, petit trait horizontal bas traversant.
Combinaison essentielle : 日本 ( にほん - Nihon) = Le Japon.
— 人 (personne / humain) : 2 traits.
Ordre : grande diagonale courbe gauche, appui oblique droit.
Combinaison essentielle : 日本人 ( にほんじん - Nihonjin) = Un(e) Japonais(e).
— 私 (je / moi - neutre / poli) : 7 traits. Clé du riz ( 禾 ) à gauche, clé du soi ( 厶 ) à droite.
— 学 (étude / apprendre) : 8 traits. Les trois petits points supérieurs d’abord, le toit, puis le radical de l’enfant ( 子 ) en partie basse.
Combinaison essentielle : 学生 ( がくせい - Gakusei) = Étudiant(e).

Syntaxe : L’affirmation de base
Le japonais est une langue à structure rigoureuse SOV (Sujet-Objet-Verbe), où le verbe conjugué se positionne impérativement à la toute fin de l’énoncé. La structure d’identité fondamentale s’organise ainsi :

[Sujet / Thème] は [Attribut] です。

— La particule de thème は : Elle s’écrit avec le caractère Hiragana ha ( は ) mais se prononce obligatoirement [wa] lorsqu’elle remplit la fonction syntaxique de marqueur de thème. Elle isole le sujet principal de la conversation.
— La copule です (desu) : Équivaut au verbe ”être” au présent de politesse neutre. Elle s’attache en clôture de phrase.
Note phonétique : Le ”u” final est totalement assourdi/muet, on articule un net [dess].$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Japonais', 'rule', $kt$Cours 2 · [LECTURE] Clinique de Lecture & Décodage de textes continus$kt$, $kt$Théorie de la Lecture : L’absence d’espaces
Le japonais s’écrit de manière continue, sans aucune segmentation par des espaces. Pour décoder efficacement une phrase, vos yeux doivent cartographier l’alternance des blocs de carac-
tères : les Kanji portent le sens sémantique lourd (noms, racines verbales), tandis que les Hiragana servent pour les outils grammaticaux (particules) et les flexions.

Analyse visuelle d’une phrase type :
私は学生です。

Découpage mental analytique :
私 (Kanji : Nom = Je) | は (Hiragana : Particule de thème [wa]) | 学生 (Kanji : Nom = Étudiant) | です (Hiragana : Copule verbale être).

La particule interrogative か (ka) :
Elle se positionne à la toute fin de la phrase, immédiatement après la copule, et fait office de point d’interrogation (le point d’interrogation graphique n’étant pas utilisé en japonais traditionnel).
— Exemple : 学生ですか。 (Gakusei desu ka ? = Êtes-vous étudiant ?).$kt$, $kt${"source":"manuel_pdf","course_number":2}$kt$::jsonb, 2),
  ('Japonais', 'vocabulary', $kt$Cours 3 · [COMPRÉHENSION] Laboratoire de Pitch Accent & Nuances finales$kt$, $kt$Théorie de l’Écoute : Le Pitch Accent standard (Tokyo)
Contrairement au chinois ou au thaï qui attribuent un ton fixe à chaque syllabe, le japonais utilise un accent de hauteur (Pitch Accent). Au sein d’un mot, une syllabe est émise soit dans un registre haut (High), soit dans un registre bas (Low). Une inversion de cette courbe mélodique modifie radicalement le sens du mot :
— 雨 ( あめ - la pluie) : Rythme [H-L] → La voix commence en haut et descend instan-
tanément : a↗me↘.
— 飴 ( あめ - le bonbon) : Rythme [L-H] → La voix commence en bas et monte sur la
deuxième syllabe : a↗me↗.
— 日本 ( にほん - le Japon) : Rythme [L-H-H] → ni-HO-N.

Les Particules Finales d’Humeur
À l’oral, les locuteurs terminent très fréquemment leurs phrases par de petites particules expressives pour nuancer leur propos :
— ね (ne) : Recherche l’assentiment ou l’accord de l’interlocuteur, équivaut à « n’est-ce pas ? » ou « hein ? ».
Exemple : 学生ですね。 (Gakusei desu ne. = Vous êtes étudiant, n’est-ce pas ?).
— よ (yo) : Marque l’affirmation volontaire, apporte une information nouvelle avec assurance ou bienveillance, équivaut à « je vous l’assure ».
Exemple : 私は日本人ですよ。 (Watashi wa Nihonjin desu yo. = Je suis Japonais, je vous l’assure !).$kt$, $kt${"source":"manuel_pdf","course_number":3}$kt$::jsonb, 3),
  ('Japonais', 'alphabet', $kt$Cours 5 · [ÉCRIT] Les Kanji d’action et la particule d’objet direct$kt$, $kt$Tracé et Graphie : L’équilibre des radicaux verbaux
En japonais, le Kanji constitue la racine sémantique invariable du verbe. Il est systématiquement suivi de caractères en Hiragana servant à porter les flexions temporelles et de politesse (ce système d’écriture mixte s’appelle l’Okurigana).

Les 5 Kanji d’action et d’objets (À mémoriser) :
— 食 (manger / nourriture) : 9 traits.
Lecture radicale / Okurigana : た (ta - comme dans たべます ).
— 飲 (boire) : 12 traits. Clé de la nourriture à gauche, radical du bâillement à droite. Lecture radicale / Okurigana : の (no - comme dans のみます ).
— 読 (lire) : 14 traits. Clé de la parole ( 言 ) à gauche, radical de la vente à droite. Lecture radicale / Okurigana : よ (yo - comme dans よみます ).

— 水 (eau) : 4 traits.
Lecture : みず (mizu).
— 茶 (thé) : 9 traits. Clé de l’herbe ( 艹 ) en haut, radical de l’arbre en bas.
Lecture : ちゃ (cha) Note : On utilise très souvent la forme polie préfixée お茶 (ocha = thé vert).

Syntaxe : La conjugaison en ～ます et la particule を
Le japonais place le verbe en toute fin de phrase. Le Complément d’Objet Direct (COD) reçoit l’étiquette grammaticale ou particule de cas を (prononcée [o]).

Structure SOV standard : [Sujet] は [Objet] を [Verbe en ～ます ]。

Exemple : 私はお茶を飲みます。 (Watashi wa ocha o nomimasu → Je bois du thé).

La forme négative en ～ません ( masen) :
Pour passer à la forme négative au présent poli, il suffit de remplacer la terminaison ～ますpar ～ません .
— Exemple : 私は水を飲みません。 (Watashi wa mizu o nomimasen → Je ne bois pas
d’eau).$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Japonais', 'conjugation', $kt$Cours 6 · [LECTURE] Décodage de la routine quotidienne et des verbes transitifs$kt$, $kt$Théorie de la Lecture : Capter la frontière de l’Objet
Dans un texte continu et non segmenté, la particule de cas を agit comme une balise visuelle
majeure : tout ce qui se trouve immédiatement avant elle constitue l’objet direct, et ce qui se trouve immédiatement après (généralement un bloc Kanji suivi d’Hiragana) représente l’action verbale.

Analyse visuelle d’un énoncé complet :
私は本を読みます。

Décodage mécanique structurel :
私 (Je) + は (Particule de thème) → Cadre initial de la proposition.
本 ( ほん - Hon = Livre) + を (Particule d’objet).
読みます ( よみます - Yomimasu = Lis/lit) → Bloc verbal final.$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Japonais', 'vocabulary', $kt$Cours 7 · [COMPRÉHENSION] L’invitation en ～ま せんか et l’intonation polie$kt$, $kt$Théorie de l’Écoute : L’invitation indirecte adoucie
En japonais, pour proposer poliment une activité ou une sortie à quelqu’un (« Et si on faisait cela ensemble ? »), on utilise la forme négative interrogative : ～ませんか ( masenka). C’est une tournure stylistique essentielle pour éviter la directivité et adoucir la proposition.
— Structure type entendue : [Objet] を 読みませんか。 (... o yomimasen ka ? → Si on lisait... ?)

La particule de lieu de l’action で (de) :
Elle s’accola derrière un nom de lieu pour indiquer l’endroit précis où se déroule une action active.
— Exemple : レストランで食べます。 (Resutoran de tabemasu → Manger au restaurant).

Pitch Accent des Verbes (Norme de Tokyo)
— 食べます ( たべます ) : Schéma [L-H-L-L] → La voix monte sur be puis redescend de
manière stable : ta↗be↘ma-su.
— 飲みます ( のみます ) : Schéma [L-H-L-L] → La voix monte sur mi puis redescend : no↗mi ↘ma-su.$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Japonais', 'alphabet', $kt$Cours 9 · [ÉCRIT] Les Kanji de lieu, les Chiffres et les structures d’existence$kt$, $kt$Tracé et Graphie : L’écriture des repères spatiaux
L’organisation graphique des Kanji de lieu exige un respect strict de l’équilibre des radicaux d’encadrement et des clés de direction.

Les 5 Kanji clés du cycle (À mémoriser) :
— 国 (pays) : 8 traits.
Ordre : on trace d’abord le cadre gauche et supérieur/droit, on écrit le radical du roi ( 王) enrichi d’un point à l’intérieur, puis on referme le cadre par le trait horizontal inférieur.
Lectures : くに (kuni) ou ごく (goku - comme dans 中国 Chūgoku = la Chine).
— 中 (milieu / intérieur / dans) : 4 traits.
Ordre : le rectangle central d’abord, puis la ligne verticale traversante qui coupe le tout exactement au milieu.
Lectures : なか (naka) ou ちゅう (chuu).
— 外 (extérieur / dehors) : 5 traits. Radical du soir ( 夕 ) à gauche, clé du katana ( 卜) à droite.
Lectures : そと (soto) ou がい (gai).
— 駅 (gare) : 14 traits. Clé du cheval ( 馬 ) sur la partie gauche, radical du pilon ( 尺 ) sur la partie droite.
Lecture : えき (eki).
— 万 (dix mille) : 3 traits.
Ordre : ligne horizontale supérieure, ligne descendante incurvée munie d’un crochet droit, puis grande diagonale descendante gauche.
Lecture : まん (man).

Syntaxe : L’existence avec あります vs います
Pour exprimer la présence ou la localisation d’un objet, d’un lieu ou d’un être vivant (équivalant à « il y a » ou « se trouver »), la grammaire japonaise déploie deux verbes distincts qui se placent immuablement en toute fin de proposition :
— あります (arimasu) : S’utilise exclusivement pour les objets inanimés, les plantes, les concepts abstraits, les lieux ou l’argent.
— います (imasu) : S’utilise exclusivement pour les êtres animés doués de mouvement autonome (humains, animaux).

La particule de cible de localisation に (ni) :
Elle se positionne immédiatement derrière le nom de lieu pour indiquer le point d’ancrage spatial de l’existence. Le sujet réel qui existe est quant à lui marqué par la particule de sujet が(ga).

Structure type : [Lieu] に [Entité] が あります / います。

Exemple : 駅に学生がいます。 (Eki ni gakusei ga imasu → Il y a des étudiants à la gare).$kt$, $kt${"source":"manuel_pdf","course_number":9}$kt$::jsonb, 9),
  ('Japonais', 'rule', $kt$Cours 10 · [LECTURE] Clinique de Lecture & Décodage de repères spatiaux$kt$, $kt$Théorie de la Lecture : Isoler le cadre d’existence
Dans un paragraphe continu, la particule に marque l’ancrage spatial (Où se situe l’action ?) et la particule が introduit le sujet réel existant (Qui ou quoi s’y trouve ?). Le bloc verbal final valide mécaniquement s’il s’agit d’un objet ou d’un être vivant.

Analyse visuelle d’une phrase de structure :
かばんの中に本があります。                     (Note : かばん = sac)

Découpage visuel analytique :
かばんの中 (l’intérieur du sac) + に (balise de lieu d’ancrage) | 本 (livre) + が (particule de sujet réel) | あります (verbe d’existence inanimée).
Lecture fluide : Kaban no naka ni hon ga arimasu.$kt$, $kt${"source":"manuel_pdf","course_number":10}$kt$::jsonb, 10),
  ('Japonais', 'vocabulary', $kt$Cours 11 · [COMPRÉHENSION] La grande gymnastique des chiffres et le système des Man$kt$, $kt$Théorie de l’Écoute : Le système numérique japonais en base 10 000
Le français segmente ses grands nombres par milliers (1 000, puis 10 000 = dix milliers). Le système japonais, quant à lui, change d’unité de compte toutes les quatre décimales (base de 10 000). Pour acquérir une fluidité totale, votre oreille doit cesser de procéder à des conversions mentales et appréhender le mot  万  ( まん - man) comme une unité comptable pure.

Unités de base de la métrologie monétaire :
— 百 ( ひゃく - hyaku) = 100
— 千 ( せん - sen) = 1 000
— 万 ( まん - man) = 10 000
Exemple 1 : 50 000 yens s’écoute 五万円 ( ごまんえん - go-man en) → 5 unités de dix mille yens.
Exemple 2 : 15 000 yens s’écoute 一万五千円 ( いちまんごせんえん - ichi-man go-sen en) → 1 unité de dix mille + 5 milliers de yens.$kt$, $kt${"source":"manuel_pdf","course_number":11}$kt$::jsonb, 11),
  ('Japonais', 'alphabet', $kt$Cours 13 · [ÉCRIT] Les Kanji temporels et la conjugaison du passé poli$kt$, $kt$Tracé et Graphie : L’écriture de la temporalité
L’accès à l’autonomie en japonais exige une maîtrise fluide de l’écriture des repères de temps. Veillez à respecter l’ordre d’empilement des traits horizontaux et verticaux.

Les 5 Kanji temporels fondamentaux

— 年 (année / an) : 6 traits. Lecture : とし (toshi) ou ねん (nen / ex : 2029 年 ).
— 月 (lune / mois) : 4 traits. Lecture : つき (tsuki) ou げつ (getsu) / がつ (gatsu pour les mois).
— 何 (quoi / quel) : 7 traits. Clé de l’homme à gauche, radical de la bouche à droite.
Lecture : なに (nani) ou なん (nan).
— 先 (précédent / d’avance) : 6 traits. Lecture : さき (saki) ou せん (sen).
— Combinaison : 先月 (せんげつ – sengetsu) = Le mois dernier.
— 今 (actuel / maintenant) : 4 traits. Radical du toit protecteur. Lecture : いま (ima) ou こん (kon).
— Combinaison : 今月 (こんげつ – kongetsu) = Ce mois-ci.

Syntaxe : L’architecture morphologique du passé poli
Le japonais modifie la désinence finale de ses blocs verbaux pour marquer le passé de manière parfaitement régulière au style neutre-poli :
— Les verbes d’action : On remplace la terminaison ～ます par ～ました ( mashita). La forme négative passée devient ～ませんでした ( masen deshita).
— Exemple : 読みます (lit) → 読みました (a lu).
— La copule d’identité です : On la remplace par ～でした ( deshita). Le négatif passé est ～ではありませんでした ( de wa arimasen deshita).
— Exemple : 学生です (est étudiant) → 学生でした (était étudiant).$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Japonais', 'rule', $kt$Cours 14 · [LECTURE] Décodage de récits rétrospectifs et journaux de bord$kt$, $kt$Théorie de la Lecture : Cartographier la chronologie sans espaces
Dans un texte mixte continu, vos yeux doivent immédiatement chercher la désinence à quatre caractères Hiragana ました ou でした qui ferme la proposition pour identifier que l’action est passée.

Analyse visuelle d’un énoncé historique

私は先月日本に行きました。
Décodage et découpage mental :
1. 私 (Je) + は (Particule de thème) → Délimitation du cadre.
2. 先月 (せんげつ – Le mois dernier) → Point d’ancrage temporel passé.
3. 日本 (にほん – Japon) + に (Particule de destination/direction).
4. 行きました (いきました – Suis allé) → Bloc verbal final d’action au passé.$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Japonais', 'vocabulary', $kt$Cours 15 · [COMPRÉHENSION] Laboratoire d’Écoute & Dictée de repères temporels$kt$, $kt$Théorie de l’Écoute : Capturer les marqueurs de fin de phrase
À l’oral rapide à vitesse réelle, la distinction entre le présent et le passé se joue sur les dernières syllabes de l’unité verbale. Votre oreille doit rester active jusqu’au point final de la phrase.
— 読みます (yomimasu – présent) ↔ 読みました (yomimashita – passé).
— 読みません (yomimasen – négatif) ↔ 読みませんでした (yomimasen deshita – passé négatif).$kt$, $kt${"source":"manuel_pdf","course_number":15}$kt$::jsonb, 15),
  ('Japonais', 'alphabet', $kt$Cours 17 · [ÉCRIT] Les Kanji de mouvement et la mécanique de la forme en ～て$kt$, $kt$Tracé et Graphie : Les Kanji de déplacement
Ces caractères partagent ou exploitent des radicaux et des clés sémantiques structurellement liés à la marche, à l’orientation et au mouvement.

Les 4 Kanji de mouvement et de direction (À mémoriser) :
— 行 (aller) : 6 traits.
Okurigana / Forme polie : 行きます ( いきます - ikimasu).
— 来 (venir) : 7 traits.
Okurigana / Forme polie : 来ます ( きます - kimasu).  Attention cruciale : sa lecture phonétique change radicalement selon sa forme grammaticale.
— 帰 (revenir chez soi / rentrer) : 10 traits. Clé du couteau ( 刂 ) sur la partie gauche, radical du balai à droite.
Okurigana / Forme polie : 帰ります ( かえります - kaerimasu).
— 友 (ami) : 4 traits.
Lecture : とも (tomo) Combinaison essentielle : 友達 ( ともだち - tomodachi) = Ami / amis.

Syntaxe : La construction de la forme en ～て ( te)
Pour relier plusieurs verbes d’action au sein d’une même phrase afin de marquer la chronologie (« Je fais A, puis je fais B »), on fléchit le premier verbe à la forme en ～て , tandis que le second verbe porte la marque temporelle finale (présent ou passé).
La transformation morphologique dépend de la terminaison du verbe en masu :
— Verbes du Groupe 2 (Verbes en -e + masu ou exceptions) : On élide simplement masu pour ajouter ～て (te).
Exemple : 食べます (tabemasu) → 食べて (tabete).
— Verbes du Groupe 1 (Verbes en -i + masu) :
— Si ～ます est précédé de i, chi, ri → cela se transmute en ～って (tte - petit tsu + te).

Exemples : 買います (kaimasu - acheter) → 買って (katte) ; 帰ります → 帰って(kaette).
— Si ～ます est précédé de mi, bi, ni → cela se transmute en ～んで (nde).
Exemple : 読みます (yomimasu) → 読んで (yonde).
— Exception absolue à mémoriser : 行きます (ikimasu) → 行って (itte).
— Verbes du Groupe 3 (Irréguliers de base) :
Transformations : します (shimasu - faire) → して (shite) ; 来ます (kimasu) → 来て(kite).$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Japonais', 'rule', $kt$Cours 18 · [LECTURE] Décodage de la succession d’actions complexes$kt$, $kt$Théorie de la Lecture : Identifier le pivot de la phrase
Dans un texte japonais brut dénué d’espaces, la désinence en ～て ou ～んで fait office de virgule syntaxique et dynamique. Vos yeux doivent repérer cette rupture harmonique pour ordonner correctement la chronologie des événements.

Analyse visuelle d’un énoncé fluide :
私は本を読んでお茶を飲みます。

Découpage mécanique et fonctionnel :
私 + は → Cadre thématique de la phrase.
本を読んで ( ほんをよんで - Hon o yonde) → Première action (Lire un livre) + pivot connecteur.
お茶を飲みます ( おちゃをのみます - Ocha o nomimasu) → Seconde action finale (Boire du thé).
Sens global : Je lis un livre, puis je bois du thé.$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Japonais', 'vocabulary', $kt$Cours 19 · [COMPRÉHENSION] Laboratoire d’Écoute & Captation des liaisons orales$kt$, $kt$Théorie de l’Écoute : Isoler le doublement de consonne
À l’oral rapide, le principal piège pour un locuteur francophone consiste à rater l’occlusion marquée par le petit tsu ( っ ), qui matérialise un micro-silence suivi du doublement de la consonne suivante. Si vous confondez la prononciation de kate ( かて ) et celle de katte ( 買って ), le sens de l’énoncé s’effondre. Votre oreille doit traquer le blocage bref du flux d’air juste avant l’émission de la syllabe te.

Écoute active des contrastes phonétiques :
よんで (yonde - en lisant) ↔ いって (itte - en allant / en disant).
たべて (tabete - en mangeant) ↔ かえって (kaette - en rentrant).

Pitch Accent de la connexion (Norme de Tokyo)
— 食べて ( たべて ) : Schéma [H-L-L] → L’accent culmine sur la première syllabe puis
chute : ta↗be↘te.
— 行って ( いって ) : Schéma [L-H-H] → La voix s’amorce en bas et monte sur le double-
ment : i ↗tte↗.$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Japonais', 'alphabet', $kt$Cours 21 · [ÉCRIT] Les Kanji de communication et l’aspect progressif (～ています )$kt$, $kt$Tracé et Graphie : L’écriture de la communication et des sens
L’organisation structurelle de ces Kanji exige de soigner la superposition des clés complexes, notamment la clé de la pluie pour le domaine électrique et la clé de la parole ou des portes pour l’échange d’informations.

Les 5 Kanji clés du cycle (À mémoriser) :
— 電 (électricité) : 13 traits. Clé de la pluie ( 雨 ) en partie supérieure, radical de l’éclair en partie basse.
Combinaison essentielle : 電話 ( でんわ - denwa) = Le téléphone.
— 話 (parler / discussion) : 13 traits. Clé de la parole ( 言 ) sur la partie gauche, radical de la langue à droite.
Okurigana / Forme polie : 話します ( はなします - hanashimasu).

— 見 (voir / regarder) : 7 traits. Radical de l’œil ( 目 ) positionné au-dessus des jambes de marche.
Okurigana / Forme polie : 見ます ( みます - mimasu).
— 聞 (entendre / écouter) : 14 traits. Clé de la porte ( 門 ) à l’extérieur, radical de l’oreille ( 耳 ) encapsulé à l’intérieur.
Okurigana / Forme polie : 聞きます ( ききます - kikimasu).
— 新 (nouveau) : 13 traits. Radicaux combinés du pin, de la hache et du bois.
Combinaison essentielle : 新聞 ( しんぶん - shinbun) = Le journal (littéralement : nouvelle écoute).

Syntaxe : L’action en cours avec ～ています ( te imasu)
Pour exprimer qu’une action est en train de s’accomplir sous les yeux du locuteur au moment précis où l’on parle (le présent continu), on emploie le verbe d’action à la forme en ～て (étudiée au cycle 5) et on lui adjoint la copule d’existence animée います (imasu).

Structure progressive : [Sujet] は [Objet] を [Verbe en ～て ] います。

Exemple : 私は新聞を読んでいます。 (Watashi wa shinbun o yonde imasu → Je suis en train de lire le journal).

Déclinaisons temporelles et négatives de la structure progressives :
— Forme négative progressive : 読んでいません (yonde imasen → Je ne suis pas en train de lire).
— Forme passée progressive : 読んでいました (yonde imashita → J’étais en train de lire).$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Japonais', 'conjugation', $kt$Cours 22 · [LECTURE] Décodage de descriptions d’actions en temps réel$kt$, $kt$Théorie de la Lecture : Cartographier l’aspect en cours
Dans une phrase japonaise native exempte de repères d’espacement, vos yeux doivent traquer la balise grammaticale en Hiragana ています (ou ses variantes) qui verrouille le bloc verbal final. Elle vous indique instantanément que l’action s’inscrit dans un présent continu.

Analyse visuelle d’un énoncé descriptif :
友達は電話で話しています。                    (where で = particule de moyen / instrument)

Découpage visuel analytique :
友達 ( ともだち - Tomodachi = Ami) + は (Particule de thème).
電話 ( でんわ - Denwa = Téléphone) + で (Particule de moyen → au téléphone / par le biais du téléphone).
話しています ( はなしています - Hanashite imasu = Est en train de parler) → Bloc verbal final.
Lecture globale brute : Tomodachi wa denwa de hanashite imasu.$kt$, $kt${"source":"manuel_pdf","course_number":22}$kt$::jsonb, 22),
  ('Japonais', 'vocabulary', $kt$Cours 23 · [COMPRÉHENSION] Laboratoire d’Écoute & Les appels téléphoniques en direct$kt$, $kt$Théorie de l’Écoute : Capter le flux des contractions orales du présent continu
À l’oral quotidien, la forme progressive officielle ～ています subit très fréquemment une
synérèse : le i initial s’élide pour donner la contraction rythmique rapide ～てます ( temasu). Votre oreille doit s’habituer à intercepter ce raccourci phonétique sans bloquer votre mémoire de travail.

Écoute active des contrastes (Formel vs Oral familier) :
はなしています (hanashite imasu)            →    はなしてます (hanashitemasu).みています (mite imasu)               →    みてます (mitemasu).

Pitch Accent du présent continu (Norme de Tokyo)
— 見ています ( みています ) : Schéma [L-H-L-L-L] → La voix s’élève sur te puis redescend de manière monocorde : mi ↗te↘i-ma-su.
— 話しています ( はなしています ) : Schéma [L-H-H-H-L-L] → Le plateau de hauteur reste stable sur les syllabes centrales : ha↗na-shi-te-i ↘ma-su.$kt$, $kt${"source":"manuel_pdf","course_number":23}$kt$::jsonb, 23),
  ('Japonais', 'alphabet', $kt$Cours 25 · [ÉCRIT] Les Kanji d’action publique et les structures réglementaires$kt$, $kt$Tracé et Graphie : L’écriture des mouvements réglementés
Ces caractères sont essentiels pour appréhender la signalisation, les accès, les mémos de sécurité et les règles de vie au sein d’un atelier ou de l’espace public.

Les 5 Kanji clés du cycle (À mémoriser) :
— 入 (entrer / insérer) : 2 traits.
Note de vigilance : Attention à ne pas le confondre avec le Kanji 人 (personne). Pour 入, le premier trait commence en haut à gauche et s’arrête court, tandis que le second est le long trait traversant qui s’appuie vers la droite.
Okurigana / Forme polie : 入ります ( はいります - hairimasu).
— 出 (sortir / émettre) : 5 traits. Graphiquement représenté par deux montagnes ( 山 ) superposées.
Okurigana / Forme polie : 出ます ( でます - demasu) / 出します ( だします - dashimasu).
— 止 (s’arrêter) : 4 traits.
Okurigana / Forme polie : 止まります ( とまります - tomarimasu) / 止めます ( とめます - tomemasu).
— 車 (voiture / véhicule) : 7 traits. Représentation schématique d’une vue de dessus d’un chariot traditionnel avec son axe vertical central et ses roues.
Lectures : くるま (kuruma) ou しゃ (sha - comme dans 電車 densha = le train).
— 門 (porte / portail) : 8 traits. Représentation visuelle des deux battants d’un grand portail d’enceinte traditionnel.
Lecture : もん (mon).

Syntaxe : Permission (～てもいいです ) vs Interdiction (～てはいけません )
Ces deux structures intermédiaires majeures se greffent directement sur la forme en ～て du verbe d’action (étudiée en détail au cycle 5) :

La Permission (Avoir le droit / l’autorisation de faire) :
[Verbe en ～て ] もいいです。
Exemple : ここに入ってもいいです。 (Koko ni haitte mo ii desu → Vous pouvez entrer ici).

L’Interdiction (Formulation d’une règle stricte / ne pas avoir le droit de faire) :
[Verbe en ～て ] はいけません。
Exemple : ここで車を止めてはいけません。 (Koko de kuruma o tomete wa ikemasen → Il ne faut pas garer / arrêter sa voiture ici).$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Japonais', 'rule', $kt$Cours 26 · [LECTURE] Décodage de règlements intérieurs et consignes de sécurité$kt$, $kt$Théorie de la Lecture : Identifier le cadre normatif
Dans un texte réglementaire, un protocole d’atelier ou une notice de sécurité, vos yeux doivent cibler en toute priorité les blocs Hiragana terminaux もいいです (autorisation) ou はいけません (interdiction) afin de capter instantanément le statut légal ou normatif d’une action.

Analyse visuelle d’un panneau de consigne :
駅の門の前に車を止めてはいけません。

Découpage visuel analytique :
駅の門の前 ( えきのもんのまえ - Eki no mon no mae = Devant le portail de la gare) + に(Particule de lieu d’ancrage).
車 ( くるま - Kuruma = Voiture) + を (Particule d’objet direct).
止めてはいけません ( とめてはいけません - Tomete wa ikemasen = Il est interdit d’arrêter / de garer) → Bloc d’interdiction finale.$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Japonais', 'vocabulary', $kt$Cours 27 · [COMPRÉHENSION] Laboratoire d’Écoute & Les consignes de l’espace partagé$kt$, $kt$Théorie de l’Écoute : Capter la restriction à l’oral spontané
À l’oral quotidien ou familier, la structure d’interdiction officielle ～てはいけません subit une contraction morphologique très fréquente : le segment ～ては ( te wa) se transmute en ～ちゃ ( cha) et le segment ～では ( de wa) devient ～じゃ ( ja), généralement associés au couperet restrictif dame.

Écoute active des glissements et contractions (Formel vs Familier oral) :
とめてはいけません (tomete wa ikemasen) → とめちゃダメ (tomecha dame).
はいってもいいですか (haitte mo ii desu ka) → はいっていい？ (haitte ii ?).

Pitch Accent des structures (Norme de Tokyo)
— 入ってもいいです ( はいってもいいです ) : Schéma plat étendu [L-H-H-H-H-H-H-H] → La voix s’élève sur i et se maintient de manière monocorde : ha↗itte mo ii desu.

— 止めてはいけません ( とめてはいけません ) : Schéma [L-H-L-L-L-L-L-L-L] →
L’accent monte sur me puis descend lourdement sur toute la fin de la structure : to↗me↘te wa ikemasen.$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Japonais', 'alphabet', $kt$Cours 29 · [ÉCRIT] Les Kanji d’état et l’articulation logique (～から , ～が )$kt$, $kt$Tracé et Graphie : L’écriture des caractéristiques et des états
Ces caractères permettent de qualifier l’environnement, de décrire des infrastructures urbaines et de poser des jugements de valeur objectifs en contexte professionnel.

Les 5 Kanji clés du cycle (À mémoriser) :
— 高 (haut / cher / élevé) : 10 traits. Représentation schématique d’une haute tour de garde ou d’une porte de château fortifié.
Okurigana / Forme adjectivale : 高い ( たかい - takai).
— 安 (bon marché / paisible / sûr) : 6 traits. Radical de la femme ( 女 ) abrité sous le radical protecteur du toit ( 宀 ).
Okurigana / Forme adjectivale : 安い ( やすい - yasui).
— 大 (grand) : 3 traits. Représentation visuelle d’un être humain qui écarte les bras et les jambes pour marquer l’envergure.
Lectures : おお (oo - comme dans 大きい ookii) ou だい (dai - comme dans 大好き daisuki = adorer).
— 小 (petit) : 3 traits.
Okurigana / Forme adjectivale : 小さい ( ちいさい - chiisai).
— 古 (vieux / ancien) : 5 traits. Une croix supérieure surmontant le radical de la bouche ( 口 ) pour évoquer la transmission à travers les générations.
Okurigana / Forme adjectivale : 古い ( ふるい - furui).

Syntaxe : Les connecteurs de subordination ～から ( kara) et ～が ( ga)
Pour dépasser le stade des énoncés simples et argumenter de manière fluide, la syntaxe japonaise emploie deux pivots majeurs positionnés directement à la suite de la copule ou du bloc verbal de la première proposition :

La Cause / La Raison : [Raison] から、[Conséquence]。(Parce que / Donc...)
Règle d’or syntaxique : Contrairement au français, la proposition exprimant la cause ou la justification se place toujours en premier dans l’architecture de la phrase.
— Exemple : 車は高いですから、買いません。 (Kuruma wa takai desu kara, kaimasen → Comme les voitures sont chères, je n’en achète pas).

L’Opposition / Le Contraste : [Proposition A] が、[Proposition B]。(Mais / Cepen-
dant...)
— Exemple : この駅は古いですが、大きいです。 (Kono eki wa furui desu ga, ookii desu → Cette gare est ancienne, mais elle est grande).$kt$, $kt${"source":"manuel_pdf","course_number":29}$kt$::jsonb, 29),
  ('Japonais', 'rule', $kt$Cours 30 · [LECTURE] Décodage de structures causales et d’argumentations urbaines$kt$, $kt$Théorie de la Lecture : Cartographier les articulations du discours
Dans un paragraphe continu non segmenté, les particules から et が font office de véritables charnières logiques. Vos yeux doivent repérer ces balises en Hiragana (systématiquement suivies d’une virgule graphique dans l’écriture soignée) pour isoler les articulations de la pensée.

Analyse visuelle d’un texte argumentatif :
日本の電車は便利ですが、安くありません。

Découpage visuel analytique :
日本の電車は便利です (Nihon no densha wa benri desu = Le train japonais est pratique / 便利 = pratique) + が (Pivot d’opposition sémantique → Mais...).
安くありません (Yasukumarisen = Il n’est pas bon marché) → Conclusion contrastée négative.$kt$, $kt${"source":"manuel_pdf","course_number":30}$kt$::jsonb, 30),
  ('Japonais', 'vocabulary', $kt$Cours 31 · [COMPRÉHENSION] Le grand débat sur la vie à Tokyo$kt$, $kt$Compréhension Orale : Intercepter les motivations et les contrastes
Dans les discussions du quotidien comme dans les réunions professionnelles, les locuteurs japonais nuancent constamment leur position. Ils terminent parfois volontairement leurs phrases par la particule が ... laissée en suspens afin de marquer une hésitation polie ou une nuance sous-entendue. Votre oreille doit également capter la hauteur tonale stable du kara pour valider la structure justificative.
Script audio du laboratoire d’écoute (Deux collègues débattant du coût de la vie à Tokyo) :$kt$, $kt${"source":"manuel_pdf","course_number":31}$kt$::jsonb, 31),
  ('Japonais', 'alphabet', $kt$Cours 33 · [ÉCRIT] Les Kanji d’activité et la mécanique des formes neutres (Forme en ～う / ～ない )$kt$, $kt$Tracé et Graphie : Les Kanji d’expression et d’activité
Ces caractères étendent de manière significative votre champ lexical pour décrire des actions intellectuelles, cognitives et de communication interpersonnelle.

Les 5 Kanji d’activité (À mémoriser) :
— 書 (écrire) : 10 traits. Le radical du pinceau en partie supérieure, le conteneur en partie basse.
Okurigana / Forme polie : 書きます ( かきます - kakimasu).
— 話 (parler / discussion) : 13 traits. Révision de sa clé de la parole ( 言 ) à gauche et de sa structure d’accompagnement.
Okurigana / Forme polie : 話します ( はなします - hanashimasu).
— 言 (dire / parole) : 7 traits. Une bouche en base surmontée de quatre lignes horizontales symbolisant les vibrations de la voix.
Okurigana / Forme polie : 言います ( いいます - iimasu).
— 思 (penser / ressentir) : 9 traits. Le radical du champ ( 田 ) en partie supérieure surmontant la clé sémantique du cœur ( 心 ) en partie basse.
Okurigana / Forme polie : 思います ( おもいます - omoimasu).
— 知 (savoir / connaître) : 8 traits. Radical de la flèche ( 矢 ) sur la partie gauche, radical de la bouche ( 口 ) sur la partie droite.
Okurigana / Forme polie : 知ります ( しります - shirimasu).

Syntaxe : Le passage au Style Neutre (Présent affirmatif et négatif)
Pour passer du registre poli (Masu-kei) au registre familier ou neutre (Futsuu-kei), on emploie la forme du dictionnaire pour l’affirmation et la forme en ～ない pour la négation.

Les verbes du Groupe 2 (Verbes réguliers en -e + masu ou exceptions) :
— Affirmatif (Dictionnaire) : On substitue la désinence masu par ～る (ru).
Exemple : 食べます (tabemasu) → 食べる (taberu).
— Négatif : On substitue la désinence masu par ～ない (nai).
Exemple : 食べません (tabemaisen) → 食べない (tabenai).

Les verbes du Groupe 1 (Verbes consonantiques en -i + masu) :
— Affirmatif (Dictionnaire) : La voyelle en -i qui précède immédiatement la terminaison masu bascule sur sa ligne correspondante en ～う (u).
Exemples : 書きます → 書く (kaku) ; 読みます → 読む (numu) ; 言います → 言う (iu).
— Négatif : La voyelle en -i bascule sur sa ligne en ～あ (a) avant d’adjoindre la finale ～ない (nai).
Piège phonétique réglementaire : Si le verbe se termine par i-masu (comme 言います ), le ”i” de transition se mue obligatoirement en わ (wa) !
Exemples : 書きます → 書かない (kakanai) ; 言います → 言わない (iwanai).

Les verbes du Groupe 3 (Irréguliers de base) :
— します (shimasu) → する (suru) / しません → しない (shinai).
— 来ます (kimasu) → 来る (kuru) / 来ません → 来ない (konai).$kt$, $kt${"source":"manuel_pdf","course_number":33}$kt$::jsonb, 33),
  ('Japonais', 'rule', $kt$Cours 34 · [LECTURE] Décodage de dialogues informels et de récits familiers$kt$, $kt$Théorie de la Lecture : Capter la rupture du style poli
Dans les écrits de style informel, les correspondances privées ou les dialogues de mangas, les propositions ne se ferment plus par les repères classiques desu ou masu. Vos yeux doivent s’habituer à voir des phrases se clore de façon abrupte directement par une forme dictionnaire, par un adjectif racine ou par la négation courte ない .

Analyse visuelle d’un énoncé informel :
私は明日、本を書く。                   (where 明日 = demain)

Découpage mécanique structurel :
私 + は → Cadre thématique.
明 st / 明日 ( あした - Ashita) → Repère temporel futur.
本 + を ( ほんを - Hon o) → Complément d’objet direct.
書く ( かく - Kaku) → Verbe à la forme du dictionnaire. La phrase se ferme sans copule de
politesse : le style est neutre.
Sens global : Demain, je vais écrire un livre (style familier).$kt$, $kt${"source":"manuel_pdf","course_number":34}$kt$::jsonb, 34),
  ('Japonais', 'vocabulary', $kt$Cours 35 · [COMPRÉHENSION] Laboratoire de Pitch Accent & Nuances orales du style familier$kt$, $kt$Théorie de l’Écoute : La suppression des particules et les intonations
À l’oral familier de la vie quotidienne, les locuteurs japonais élident très souvent les particules de cas grammaticales telles que は (wa), を (o), ou へ (e). L’intonation et l’ordre des mots suffisent à lever toute ambiguïté. De plus, les interrogations ne se ferment plus par la balise ka mais par une simple inflexion montante sur la voyelle finale du verbe neutre.

Écoute active des contrastes de registres (Poli vs Familier oral) :
— Style Poli : Nani o shimasu ka. → Style Familier : Nani suru ? ↗ (Tu fais quoi ?).
— Style Poli : Gohan o tabemasu ka. → Style Familier : Gohan taberu ? ↗ (Tu manges ?).

Pitch Accent des formes courtes (Norme de Tokyo)
— 食べる ( たべる ) : Schéma [H-L-L] → L’accent s’amorce en haut sur la première syllabe
puis chute : ta↗beru↘.
— 書かない ( かかない ) : Schéma [L-H-L-L] → La voix monte sur la deuxième syllabe
puis redescend : ka↗ka↘nai.$kt$, $kt${"source":"manuel_pdf","course_number":35}$kt$::jsonb, 35),
  ('Japonais', 'alphabet', $kt$Cours 37 · [ÉCRIT] Les Kanji de projet et la mécanique du désir (～たい ) et de l’intention (～つもり )$kt$, $kt$Tracé et Graphie : Les Kanji de projection et d’avenir
Ces caractères étendent de manière significative votre champ lexical pour structurer, planifier et formuler des projets d’avenir professionnels et personnels.

Les 5 Kanji de projet (À mémoriser) :
— 来 (venir / futur) : 7 traits. Révision de son tracé et de ses lectures combinées selon le contexte syntaxique.
Combinaison essentielle : 来年 ( らいねん - rainen) = L’année prochaine.
— 買 (acheter) : 12 traits. Le radical du filet en partie supérieure surmontant la clé smentique du coquillage ( 貝 - qui faisait office de monnaie d’échange dans l’Antiquité). Okurigana / Forme polie : 買います ( かいます - kaimasu).
— 会 (rencontrer / association) : 6 traits. Le radical du toit protecteur surmontant une structure simplifiée d’assemblée.
Okurigana / Forme polie : 会います ( あいます - aimasu).
Combinaison essentielle : 会社 ( かいしゃ - kaisha) = L’entreprise / la société.
— 社 (société / sanctuaire) : 7 traits. Clé du rituel et des hommages sur la partie gauche, radical de la terre ( 土 ) sur la partie droite.
— 働 (travailler) : 13 traits. Clé de l’homme ( 人 ) sur la partie gauche, idéogramme du mouvement ( 動 ) sur la partie droite.
Okurigana / Forme polie : 働きます ( はたらきます - hatarakimasu).

Syntaxe : Le Désir (～たいです ) et l’Intention (～つもりです )
Ces deux structures intermédiaires majeures permettent de nuancer vos projections en exploitant les bases verbales étudiées précédemment :

L’expression du désir (Vouloir faire) : Radical en ～ます (Base en -i) + たいです
On prend le verbe au présent poli, on élide la désinence ～ます et on ajoute le suffixe ～たいです . Le bloc verbal se comporte et se conjugue ensuite exactement comme un adjectif en -i.
— Exemples : 食べます → 食べたいです (tabetai desu → Je veux manger) ; 買います →買いたいです (kaitai desu → Je veux acheter).
— Forme négative : 買いたくないです (kaitakunai desu → Je ne veux pas acheter).

L’expression de l’intention ferme (Avoir l’intention de / Plan validé) : Forme Dictionnaire + つもりです
On accole la structure つもりです directement derrière le verbe neutre à la forme courte du dictionnaire.
— Exemple : 来年、日本に行くつもりです。(Rainen, Nihon ni iku tsumori desu → L’année prochaine, j’ai l’intention d’aller au Japon).
— Forme négative : 行かないつもりです (ikanai tsumori desu → J’ai l’intention de ne pas y aller).$kt$, $kt${"source":"manuel_pdf","course_number":37}$kt$::jsonb, 37),
  ('Japonais', 'conjugation', $kt$Cours 38 · [LECTURE] Clinique de Lecture & Décodage d’ambitions futures$kt$, $kt$Théorie de la Lecture : Isoler le moteur de l’action
Dans un paragraphe continu et non segmenté, les structures de projection ferment la proposition principale. Vos yeux doivent repérer les caractères Hiragana たい (généralement suivis de desu) ou le nom pivot autonome つもり pour identifier immédiatement s’il s’agit d’un souhait ou d’une décision ferme planifiée.

La bascule de la particule d’objet avec ～たい :

À la forme en ～たい , la particule d’objet direct を (o) se transmute très souvent en particule de sujet réel が (ga) pour mettre l’accent phonétique et logique sur l’objet précis du désir.
— Exemple visuel : 私は車が買いたいです。
Décodage visuel : 私 (Je) + は (Thème) | 車 ( くるま - Voiture) + が (Focus sur l’objet du désir) | 買いたいです (Je veux acheter).

Analyse d’une intention complexe dans le texte :
来年、日本の会社で働くつもりです。

Décodage visuel analytique :
来年 (L’année prochaine) | 日本の会社で (Dans une entreprise japonaise / lieu de l’action active) | 働く (Travailler - Forme courte du dictionnaire) + つもりです (J’ai l’intention de).$kt$, $kt${"source":"manuel_pdf","course_number":38}$kt$::jsonb, 38),
  ('Japonais', 'vocabulary', $kt$Cours 39 · [COMPRÉHENSION] Les vœux de l’entretien d’embauche$kt$, $kt$Théorie de l’Écoute : Capturer la nuance de détermination contractuelle
Lors d’un échange professionnel ou d’une évaluation de vos projets pour l’horizon 2029, la distinction sémantique entre ～たいです (qui exprime un souhait, un rêve potentiellement irréel) et ～つもりです (qui indique un plan d’action arrêté, une intention ferme) est capitale. Votre oreille doit capter le mot つもり qui résonne en fin de phrase.

Script audio du laboratoire d’écoute (Un recruteur et un candidat à Tokyo) :
面接官 (Recruteur) : 来年 box 何をしますか。
(L’année prochaine, que ferez-vous ?)

応募者 (Candidat) : 私は来年、日本の会社で働くつもりです。
(J’ai l’intention ferme de travailler dans une entreprise japonaise l’année prochaine.)
面接官 (Recruteur) : そうですか。何が買いたいですか。
(Je vois. Qu’avez-vous envie d’acheter ?)
応募者 (Candidat) : 新しい車が買いたいですが、今はお金がありません。
(Je veux acheter une nouvelle voiture mais je n’ai pas de ressources financières actuellement / oùお金 [ おかね ] = argent).

Pitch Accent de la structure de désir (Norme de Tokyo)
— 買いたい ( かいたい ) : Schéma plat [L-H-H-H] → La voix s’élève sur i et se maintient : ka↗itai ↗.
— 働きたい ( はたらきたい ) : Schéma étendu [L-H-H-H-H-H] → ha↗tarakitai ↗.$kt$, $kt${"source":"manuel_pdf","course_number":39}$kt$::jsonb, 39),
  ('Japonais', 'alphabet', $kt$Cours 41 · [ÉCRIT] Les Kanji d’aptitude et la mécanique de la Forme Potentielle$kt$, $kt$Tracé et Graphie : L’écriture des compétences et des savoirs
Ces caractères sont essentiels pour structurer et rédiger un profil professionnel, un curriculum vitæ (Rirekisho) ou exprimer vos aptitudes techniques lors d’un entretien d’embauche.

Les 5 Kanji de compétences (À mémoriser) :
— 語 (langue / mot) : 14 traits. Clé de la parole ( 言 ) sur la partie gauche, idéogramme du chiffre cinq ( 五 ) et radical de la bouche ( 口 ) sur la partie droite.
Combinaison essentielle : 日本語 ( にほんご - Nihongo) = La langue japonaise.
— 英 (brillant / Angleterre) : 8 traits. Clé de l’herbe ( 艹 ) en partie supérieure, radical de l’excellence en partie basse.
Combinaison essentielle : 英語 ( えいご - Eigo) = La langue anglaise.
— 話 (parler / discussion) : 13 traits. Révision systématique pour l’automatisation et la fluidité des Okurigana.
Okurigana / Forme polie : 話します ( はなします - hanashimasu).
— 上手 (adroit / doué) : Association de deux Kanji simples : 上 (haut) + 手 (main). Lecture irrégulière combinée (Ateji) : 上手 ( じょうず - Jōzu) = Être doué / habile pour une activité.

— 下手 (maladroit / peu doué) : Association de deux Kanji simples : 下 (bas) + 手(main).
Lecture irrégulière combinée (Ateji) : 下手 ( へた - Heta) = Être peu doué / maladroit pour une activité.

Syntaxe : La construction de la Forme Potentielle (可能形 )
Pour exprimer la capacité physique, l’aptitude intellectuelle ou la possibilité matérielle d’accomplir une action (« pouvoir faire », « être capable de »), on modifie la morphologie du verbe selon son groupe d’appartenance :

Les verbes du Groupe 2 (Verbes réguliers en -e + masu ou exceptions) :
On substitue la désinence ～ます ( masu) par ～られます ( raremasu).
Note d’oralité : Le ”ra” est fréquemment omis dans le discours contemporain spontané ( ら抜き言葉 ), donnant la forme raccourcie ～れます ( remasu).
— 食べます (tabemasu) → 食べられます (taberaremasu → Pouvoir manger).
— 見ます (mimasu) → 見られます (miraremasu → Pouvoir voir / visionner).

Les verbes du Groupe 1 (Verbes consonantiques en -i + masu) :
La voyelle en -i qui précède immédiatement la terminaison masu bascule sur sa ligne correspondante en ～え (-e) et on ajoute la désinence ～ます .
— 話します (hanashimasu) → 話せます (hanasemasu → Pouvoir parler).
— 書きます (kakimasu) → 書けます (kakemasu → Pouvoir écrire).
— 読みます (yomimasu) → 読めます (yomemasu → Pouvoir lire).
— 買います (kaimasu) → 買えます (kaemasu → Pouvoir acheter).

Les verbes du Groupe 3 (Irréguliers) :
— します (shimasu) → できます (dekimasu → Pouvoir faire / Être capable de / Maîtriser).
— 来ます (kimasu) → 来られます (koraremasu → Pouvoir venir).
Règle de particule cruciale : Avec l’emploi de la forme potentielle, la particule d’objet direct を (o) se transforme systématiquement en particule de sujet réel が (ga), car le verbe n’exprime plus une action transitive directe mais un état de capacité.
— Exemple : 日本語を話します → 日本語が話せます。(Nihongo ga hanasemasu = Je peux parler japonais).$kt$, $kt${"source":"manuel_pdf","course_number":41}$kt$::jsonb, 41),
  ('Japonais', 'rule', $kt$Cours 42 · [LECTURE] Décodage de profils professionnels et de CV sans espaces$kt$, $kt$Théorie de la Lecture : Cartographier les verbes de capacité
Dans un document de candidature, un protocole d’évaluation ou un texte de présentation formelle, vos yeux doivent chercher de manière ciblée le saut harmonique vers la ligne des voyelles en～えます ou l’occurrence du verbe pivot できます afin d’identifier immédiatement les aptitudes validées du sujet.

Analyse visuelle d’un descriptif de compétences :
私は英語と日本語が読めます。

Découpage visuel analytique :
私 (Je) + は (Particule de thème).
英語と日本語 ( えいごとにほんご - Eigo to Nihongo = L’anglais et le japonais) + が (Particule de focus de capacité).
読めます ( よめます - Yomemasu = Peut lire) → Verbe du groupe 1 basculé sur la ligne des adoucissements en -e.
Sens global : Je suis capable de lire l’anglais et le japonais.$kt$, $kt${"source":"manuel_pdf","course_number":42}$kt$::jsonb, 42),
  ('Japonais', 'vocabulary', $kt$Cours 43 · [COMPRÉHENSION] L’entretien de recrutement à Tokyo$kt$, $kt$Théorie de l’Écoute : Capter le potentiel dans le flux oral de l’entretien
Lors d’un entretien d’embauche (Mentsetsu), les questions fusent sur vos savoir-faire opérationnels. Votre oreille doit repérer instantanément le passage du son de transition -i vers le son -e pour discriminer immédiatement l’énoncé d’une capacité technique validée d’une simple action générale ou habituelle.

Script audio du laboratoire d’écoute (Un recruteur et une candidate étrangère) :
面接官 (Recruteur) : マリーさん、日本語が話せますか。
(Marie, savez-vous parler japonais ?)
応募者 (Candidate) : はい、少し話せます。soshite 本も読めます。
(Oui, je peux le parler un peu. Et je peux également lire des livres.)
面接官 (Recruteur) : 漢字が書けますか。
(Avez-vous la capacité d’écrire les Kanji ?)
応募者 (Candidate) : 難しい漢字は書けませんが、毎日勉強しています。
(Je ne peux pas écrire les Kanji difficiles, mais j’étudie tous les jours / 難しい = difficile).
面接官 (Recruteur) : パソコンができますか。
(Savez-vous utiliser l’ordinateur ? / パソコン = PC).
応募者 (Candidate) : はい、できます。
(Oui, j’en suis tout à fait capable.)

Pitch Accent de la forme potentielle (Norme de Tokyo)
— 話せます ( はなせます ) : Schéma [L-H-H-L] → La voix s’élève sur na, se maintient sur se puis chute nettement sur la finale : ha↗nase↘ma-su.
— できます ( できます ) : Schéma [L-H-L-L] → L’accent monte sur ki puis retombe
immédiatement : de↗ki ↘ma-su.$kt$, $kt${"source":"manuel_pdf","course_number":43}$kt$::jsonb, 43),
  ('Japonais', 'alphabet', $kt$Cours 45 · [ÉCRIT] Les Kanji de condition et la mécanique de la forme en ～たら$kt$, $kt$Tracé et Graphie : L’écriture de la logique et des choix
L’organisation des caractères de ce cycle demande une attention particulière sur la géométrie des clés temporelles et des radicaux de flux (pépites, gouttes d’eau).

Les 5 Kanji clés du cycle (À mémoriser) :
— 万 (dix mille / absolu) : 3 traits. Révision systématique de son tracé et de ses lectures combinées selon le contexte syntaxique.
Combinaison essentielle : 万一 ( まんいち - man’ichi) = Si par hasard / en cas d’extrême urgence.
— 時 (temps / heure / moment) : 10 traits. Le radical du soleil ( 日 ) sur la partie gauche, l’idéogramme du temple ( 寺 ) sur la partie droite.
Lectures : じ (ji - comme dans 一時 ichiji = une heure) ou とき (toki = quand / au moment de).
— 雨 (pluie) : 8 traits. Représentation visuelle d’une ouverture de fenêtre sous un ciel chargé, laissant transparaître quatre gouttes d’eau qui tombent.
Lecture : あめ (ame).
— 金 (argent / métal / or) : 8 traits. Un toit protecteur abritant des pépites de métal précieux extraites sous la terre.
Lecture : かね (kane) Note : On emploie quasi systématiquement la forme polie préfixéeお金 ( おかね - okane = l’argent).
— 安 (paisible / bon marché) : 6 traits. Révision approfondie de son tracé équilibré et de ses Okurigana.
Okurigana / Forme adjectivale : 安い ( やすい - yasui).

Syntaxe : La construction de la forme conditionnelle ～たら ( tara)
Pour formuler une hypothèse, une condition logique ou une antériorité temporelle (« Si... alors... » ou « Quand j’aurai accompli X... »), la grammaire japonaise recourt à la désinence ～たら . Elle se construit de manière très régulière en prenant la forme au passé neutre (Futsuu-kei passé en た ou だ ) et en lui adjoignant simplement la particule ～ら :

Pour les verbes d’action (Flexion basée sur le passé neutre court) :
— 行きます (aller) → Passé neutre : 行った (itta) → 行ったら (ittara → si j’y vais / quand j’irai).
— 読みます (lire) → Passé neutre : 読んだ (yonda) → 読んだら (yondara → si je lis / quand j’aurai lu).
— 食べます (manger) → Passé neutre : 食べた (tabeta) → 食べたら (tabetara → si je mange / quand j’aurai mangé).
— します (faire) → Passé neutre : した (shita) → したら (shitara → si je fais / quand j’aurai fait).

Pour les adjectifs en -i (comme 高い , 安い ) :
On élide la voyelle -i finale de la racine adjectivale et on la substitue par le suffixe ～かったら ( kattara).
— 安い (bon marché) → 安かったら (yasukattara → si c’est bon marché).
— 高い (cher) → 高かったら (takakattara → si c’est onéreux).

Pour les noms, les adjectifs en -na et la copule です :
On accole la terminaison nominale et hypothétique ～だったら ( dattara) directement derrière le nom ou le radical.
— 学生です (être étudiant) → 学生だったら (gakusei dattara → si j’étais étudiant).
— 雨です (il pleut) → 雨だったら (ame dattara → s’il pleut / en cas de pluie).$kt$, $kt${"source":"manuel_pdf","course_number":45}$kt$::jsonb, 45),
  ('Japonais', 'rule', $kt$Cours 46 · [LECTURE] Décodage de scénarios hypothétiques et de choix logiques$kt$, $kt$Théorie de la Lecture : Cartographier la clause conditionnelle
Dans un énoncé en japonais natif dénué d’espaces, le suffixe たら fait office de charnière logique et de ligne de partage : tout ce qui précède représente la condition posée, et tout ce qui lui succède constitue la conséquence factuelle. Vos yeux doivent repérer cette balise en Hiragana, qui est très fréquemment annoncée en amont par l’adverbe optionnel もし (moshi → si par hasard) placé en tout début de proposition.

Analyse visuelle d’un texte projectif :
もしお金があったら、新しい車を買います。

Découpage visuel analytique :
もし (Si par hasard...) → Jalon adverbial d’annonce de la condition.
お金があったら ( おかねがあったら - Okane ga attara) → Clause conditionnelle active (Si j’ai / si possède de l’argent) + pivot TARA (verbe d’origine arimasu).

新しい車を買います ( あたらしいくるまをかいます - Atarashii kuruma o kaimasu) →
Conséquence logique finale (J’analyserai / j’achèterai une nouvelle voiture).$kt$, $kt${"source":"manuel_pdf","course_number":46}$kt$::jsonb, 46),
  ('Japonais', 'vocabulary', $kt$Cours 47 · [COMPRÉHENSION] Les dilemmes professionnels$kt$, $kt$Théorie de l’Écoute : Capter la bascule prosodique de l’hypothèse
À l’oral spontané, les locuteurs japonais accentuent de manière très nette la syllabe ta du suffixe たら en y appliquant une légère inflexion montante. Cela permet de suspendre musicalement le discours afin de maintenir l’attention de l’interlocuteur avant de délivrer la conséquence. Votre oreille doit traquer cette rupture de cadence rythmique.

Écoute active des contrastes conditionnels en contexte :
落ちたら (ochitara - si cela tombe / si cela échoue) ↔ できたら (dekitara - si c’est réalisable / si possible).
安かったら (yasukattara - si c’est bon marché).

Pitch Accent de la forme conditionnelle (Norme de Tokyo)
— 食べたら ( たべたら ) : Schéma descendant [H-L-L-L] → La voix s’élève sur la première syllabe puis chute lourdement : ta↗betara↘.
— 行ったら ( いったら ) : Schéma haut étendu [L-H-H-H] → La voix s’amorce en bas et monte sur le doublement consonantique : i ↗ttara↗.$kt$, $kt${"source":"manuel_pdf","course_number":47}$kt$::jsonb, 47),
  ('Japonais', 'alphabet', $kt$Cours 49 · [ÉCRIT] Les Kanji de l’esprit et la mécanique du discours indirect (～と思う , ～と言っていました )$kt$, $kt$Tracé et Graphie : L’écriture de la pensée et du rapport
L’organisation géométrique de ces caractères exige un respect minutieux de l’étagement des radicaux intellectuels (l’association du champ et du cœur) et des clés de codification légale ou littéraire.

Les 5 Kanji de l’intellect et de l’expression (À mémoriser) :
— 思 (penser / réfléchir) : 9 traits. Révision de son tracé d’équilibre associant le radical du champ ( 田 ) en partie supérieure et la clé du cœur ( 心 ) en partie basse. Okurigana / Forme polie : 思います ( おもいます - omoimasu).
— 言 (dire) : 7 traits. Révision et automatisation pour garantir la fluidité des Okurigana. Okurigana / Forme polie : 言います ( いいます - iimasu).
— 考 (penser / analyser logiquement) : 6 traits. Radical de la terre stylisé et traversé en partie supérieure, clé du crochet en partie basse.
Okurigana / Forme polie : 考えます ( かんがえます - kangaemasu).
— 文 (phrase / écrit / littérature) : 4 traits.
Lectures : ぶん (bun - comme dans 作文 sakubun = rédaction) ou もん (mon - comme dans 新聞 ).
— 法 (loi / méthode) : 8 traits. Clé sémantique de l’eau ( 氵 ) sur la partie gauche, radical du départ et de l’action sur la partie droite.
Combinaison essentielle : 文法 ( ぶんぽう - bunpō) = La grammaire.

Syntaxe : Le Discours Indirect et la Citation (～と思う / ～と言っていました )
Pour rapporter une opinion personnelle subjective (« Je pense que... ») ou restituer les propos tenus par une tierce personne (« Il/Elle a dit que... »), la grammaire japonaise emploie la particule de citation universelle と (to).
Règle d’or de niveau B2 : La proposition complète qui précède immédiatement la particuleと doit être obligatoirement conjuguée au style neutre court (Futsuu-kei), même si la phrase principale se ferme poliment en masu ou desu.

Exprimer son opinion personnelle : [Proposition au style neutre] と思います。
— Exemple avec adjectif : 日本の文法は難しいと思います。
(Nihon no bunpō wa muzukashii to omoimasu → Je pense que la grammaire japonaise est difficile).
— Exemple avec verbe : 友達は来年日本へ行くと思います。
(Tomodachi wa rainen Nihon e iku to omoimasu → Je pense que mon ami se rendra au Japon l’année prochaine).

Rapporter les propos d’un tiers : [Proposition au style neutre] と言っていました。
— Exemple : 社長は明日来ないと言っていました。
(Shachō wa ashita konai to itte imashita → Le directeur a dit qu’il ne viendrait pas demain / où 社長 = le président/directeur).$kt$, $kt${"source":"manuel_pdf","course_number":49}$kt$::jsonb, 49),
  ('Japonais', 'rule', $kt$Cours 50 · [LECTURE] Décodage de revues de presse et de comptes-rendus de réunions$kt$, $kt$Théorie de la Lecture : Isoler la frontière de la citation
Dans un compte-rendu d’activité, un article ou un e-mail professionnel rédigé au style continu, la particule と agit mécaniquement comme une fermeture de parenthèse logique. Vos yeux doivent appréhender l’ensemble du bloc en amont comme la parole rapportée (conjuguée en forme courte), et le bloc en aval comme l’action de déclaration.

Analyse visuelle d’un rapport de réunion :
田中さんは来月新しい車を買うと言っていました。

Découpage visuel analytique :
田中さん + は → Émetteur initial des propos rapportés.
[来月新しい車を買う ] → Citation au style neutre court (Qu’il achètera une nouvelle voiture le mois prochain ―où le verbe kaimasu bascule à la forme dictionnaire 買う ).
と (Balise de fin de citation) | 言っていました (Déclaration au passé poli → a dit / rapportait).$kt$, $kt${"source":"manuel_pdf","course_number":50}$kt$::jsonb, 50),
  ('Japonais', 'vocabulary', $kt$Cours 51 · [COMPRÉHENSION] Interception des rumeurs de bureau$kt$, $kt$Théorie de l’Écoute : Repérer le pivot de citation dans le flux oral
À l’oral professionnel rapide ou lors d’échanges en réunion, la particule de liaison と (to) fusionne phonétiquement avec l’initiale vocalique des verbes omoimasu ou itte imashita. Votre oreille doit s’habituer à intercepter les contractions rythmiques ～とます ( toimasu) ou l’assimilation familière très fréquente ～ったって ( ttatte → équivalant à to itte imashita).

Script audio du laboratoire d’écoute (Deux collègues échangeant sur les directives de la direction) :
A : 社長は来年の計画について何か言っていましたか。
(Le président a-t-il dit quelque chose au sujet du plan de l’année prochaine ? / 計画 = le plan, について = au sujet de).
B : ええ、2029 年までに新しい会社を作ると言っていました。
(Oui, il a dit qu’il créerait une nouvelle entreprise d’ici l’année 2029 / 作る [ つくる ] = fabriquer/créer).
A : そうですか。Stencil 私はそれは難しいと思います。
(Ah oui ? Moi, je pense que c’est difficile / それ = cela).$kt$, $kt${"source":"manuel_pdf","course_number":51}$kt$::jsonb, 51),
  ('Japonais', 'alphabet', $kt$Cours 53 · [ÉCRIT] Les Kanji de caractérisation et l’architecture de la proposition relative imbriquée$kt$, $kt$Tracé et Graphie : Les Kanji de description et de matérialité
Ces caractères permettent de définir, d’indexer et de qualifier précisément les objets, les composants d’étude et les environnements de travail.
Les 5 Kanji de caractérisation (À mémoriser) :

Syntaxe : L’architecture de la Proposition Relative Imbriquée (名詞修飾 )
En français, une proposition relative se place après le nom noyau qu’elle qualifie et s’introduit par un pronom relatif (« Le livre que j’ai acheté hier »). En japonais, la logique est rigoureusement
inverse : toute la proposition relative se place directement DEVANT le nom noyau, sans l’usage d’aucun pronom relatif intermédiaire.
Règle d’or absolue : Le verbe ou le prédicat de la proposition relative doit être obligatoirement conjugué au style neutre court (Futsuu-kei).

Structure de base : [Proposition relative au style neutre] + [Nom noyau qualifié]

Exemple avec verbe : 昨日買った本 ( きのうかったほん - Kinō katta hon) = Le livre que j’ai acheté hier (où 買った est le passé neutre court de kaimasu).

Règle de la particule du sujet secondaire (enchâssé) :
Si la proposition relative contient son propre sujet interne, la particule de sujet principaleは (wa) s’efface obligatoirement au profit de la particule de sujet secondaire が (ga) ou de sa variante stylistique génitive の (no).
— Exemple : 友達が作ったお茶 (Tomodachi ga tsukutta ocha = Le thé que mon ami a préparé).$kt$, $kt${"source":"manuel_pdf","course_number":53}$kt$::jsonb, 53),
  ('Japonais', 'rule', $kt$Cours 54 · [LECTURE] Décodage de structures descriptives imbriquées et denses$kt$, $kt$Théorie de la Lecture : Isoler le nom noyau
Dans une trame de texte japonaise native continue, l’absence de pronoms relatifs impose une gymnastique visuelle spécifique : vos yeux doivent identifier le tout premier nom substantif principal qui se trouve précédé par un verbe ou un adjectif au style neutre court. Ce verbe qualifie le nom, il ne ferme pas la phrase globale.

Analyse visuelle d’une phrase à imbrication dense :
これは私が働く会社です。

Découpage visuel analytique :
これ (Ceci) + は (Particule de thème principal) → Cadre global de l’énoncé.
[私が働く ] ( わたしがはたらく - Watashi ga hataraku) → Proposition relative courte au style neutre (Dans laquelle je travaille). Le が verrouille le sujet secondaire.
会社 ( かいしゃ - Kaisha = Entreprise) → Nom noyau principal qualifié par le bloc complet en amont.
です → Copule de clôture de la phrase principale.
Sens final : Ceci est l’entreprise dans laquelle je travaille.$kt$, $kt${"source":"manuel_pdf","course_number":54}$kt$::jsonb, 54),
  ('Japonais', 'vocabulary', $kt$Cours 55 · [COMPRÉHENSION] Laboratoire d’Écoute & Captation des qualifications enchâssées$kt$, $kt$Théorie de l’Écoute : Gérer l’attente structurelle du nom noyau
À l’oral standard de Tokyo, les propositions relatives modifient le rythme de phrase habituel. Le flux vocal s’écoule de manière continue et liée sur la phrase relative courte au style neutre, puis marque une micro-respiration subtile juste après le verbe court afin de poser l’accent tonique sur le nom qualifié. Votre oreille doit attendre ce substantif pivot pour assembler correctement le sens logique de la phrase.

Script audio du laboratoire d’écoute (Deux collègues identifiant un document égaré) :
A : すみません、昨日私が書いた文はどこにありますか。
(Excusez-moi, où se trouve le texte que j’ai écrit hier ? / どこ = où).
B : ああ、あの有名な先生が読んだ本の上にありますよ。
(Ah, il se trouve sur le livre qu’a lu ce professeur célèbre, je vous l’assure / あの = ce... là-bas,上 [ うえ ] = sur / au-dessus).
A : そうですか。ありがとうございました。
(Ah, d’accord. Merci beaucoup.)$kt$, $kt${"source":"manuel_pdf","course_number":55}$kt$::jsonb, 55),
  ('Japonais', 'alphabet', $kt$Cours 57 · [ÉCRIT] Les Kanji de déférence et la mécanique du Keigo (Sonkeigo / Kenjougo)$kt$, $kt$Tracé et Graphie : L’écriture du protocole et des affaires
Ces caractères sont les piliers indispensables de la correspondance écrite formelle, de la négociation et de la rédaction de documents administratifs ou contractuels au Japon.

Les 5 Kanji de déférence et d’affaires (À mémoriser) :
— 様 (Monsieur / Madame / Titre de respect absolu) : 14 traits. Clé de l’arbre (木 ) sur la partie gauche, radical du mouton stylisé en haut à droite, radical de l’eau en bas à droite.
Lecture : さま (sama - comme dans 田中様 Tanaka-sama).
— 申 (dire / rapporter de manière modeste) : 5 traits. Un rectangle central traversé par une ligne verticale médiane de haut en bas.
Okurigana / Forme polie : 申します ( もうします - mōshimasu).
— 召 (interpeller / consommer au registre honorifique) : 5 traits. Radical du katana en partie supérieure, radical de la bouche ( 口 ) en partie inférieure.
Okurigana / Forme polie : 召し上がります ( めしあがります - meshiagarimasu =
manger / boire [honorifique]).
— 員 (employé / membre) : 10 traits. Le conteneur ( 口 ) surmontant la clé sémantique de la monnaie et du coquillage ( 貝 ).
Combinaison essentielle : 社員 ( しゃいん - shain) = L’employé(e) d’une entreprise / d’une structure.
— 公 (public / officiel) : 4 traits. Idéogramme de l’équité et du domaine public.
Lecture : こう (kō).

Syntaxe : Les deux piliers du Keigo (敬語 )
En japonais professionnel, le style poli standard (Teineigo en masu) ne suffit plus à marquer la hiérarchie. On applique deux filtres de déférence stricts selon la personne qui réalise l’action :

Le Sonkeigo (尊敬語 - Langage de respect) :
Il s’utilise exclusivement pour surélever les actions accomplies par votre interlocuteur (un client, un supérieur hiérarchique, un auditeur externe).
— Manger / Boire : 食べます / 飲みます → 召し上がります (meshiagarimasu).
— Aller / Venir / Se trouver : 行きます / 来ます / います → いらっしゃいます
(irasshaimasu).
— Dire : 言います → おっしゃいます (osshaimasu).

Le Kenjougo (謙譲語 - Langage de modestie) :
Il s’utilise pour abaisser humblement vos propres actions ou celles des membres de votre groupe d’appartenance (vos collaborateurs, votre entreprise) face au client ou à l’autorité.
— S’appeler / Dire : 言います → 申します (mōshimasu).
— Aller / Venir : 行きます / 来ます → 参ります (mairimasu).
— Rencontrer : 会います → お目に掛かります (omenikakarimasu).$kt$, $kt${"source":"manuel_pdf","course_number":57}$kt$::jsonb, 57),
  ('Japonais', 'rule', $kt$Cours 58 · [LECTURE] Décodage de courriels d’affaires et de correspondances formelles$kt$, $kt$Théorie de la Lecture : Cartographier les flux de politesse verticale
Dans un courriel d’affaires japonais (Business メール ), l’absence de segmentations est largement compensée par la récurrence de formules de politesse figées. Vos yeux doivent repérer le suffixe honorifique 様 (sama) attaché au destinataire, et identifier immédiatement si les verbes de clôture relèvent du respect (Sonkeigo) ou de la modestie (Kenjougo).

Analyse visuelle d’une phrase d’affaires type :
田中様、私は明日そちらへ参ります。

Découpage visuel analytique :
田中様 ( たなかさま - Tanaka-sama) → Élévation absolue du client en tête de message.私 (Je) + は (Particule de thème).
明日そちらへ ( あしたそちらへ - Ashita sochira e = Demain de votre côté / vers chez vous).参ります ( まいります - Mairimasu = Je vais / je viens) → Verbe final au registre Kenjougo (modestie). L’ingénieur abaisse humblement son propre déplacement par déférence pour Tanakasama.$kt$, $kt${"source":"manuel_pdf","course_number":58}$kt$::jsonb, 58),
  ('Japonais', 'vocabulary', $kt$Cours 59 · [COMPRÉHENSION] Les codes de déférence de la réunion d’affaires$kt$, $kt$Théorie de l’Écoute : Repérer l’élévation et l’humilité dans le flux oral
Dans les réunions de projets ou négociations de l’écosystème corporatif de Tokyo, le débit demeure soutenu mais la morphologie des verbes change. Les structures honorifiques du premier groupe se terminant en る effectuent leur flexion passée de manière irrégulière en ～いました( imashita). Votre oreille doit traquer ces finales pour décoder l’organigramme des rôles.
— おッシュいます → おっしゃいました (osshaimashita = vous avez dit / vous vous êtes exprimé).
— いらっしゃいます → いらっしゃいました (irasshaimashita = vous êtes allé / venu / vous vous trouviez).

Script audio du laboratoire d’écoute (Négociation d’ingénierie) :
社員 (Ingénieur de votre équipe) : 田中様、来週の計画について何かおっしゃいましたか。
(Tanaka-sama, avez-vous dit quelque chose au sujet du plan de la semaine prochaine ?)
田中様 (Client) : ええ、来週会社にいらっしゃいますか。
(Oui, irez-vous à l’entreprise la semaine prochaine ?)
社員 (Ingénieur de votre équipe) : はい、来週月曜日に参ります。お目に掛かります。(Oui, je m’y rendrai humblement lundi prochain. J’aurai l’honneur de vous rencontrer.)$kt$, $kt${"source":"manuel_pdf","course_number":59}$kt$::jsonb, 59),
  ('Japonais', 'alphabet', $kt$Cours 61 · [ÉCRIT] Syntaxe avancée, synthèse des structures complexes et Okurigana$kt$, $kt$Rigueur de la Graphie : L’agencement structurel ultime
Al’atteinte d’un niveau d’autonomie avancé, l’écriture manuscrite ou numérique doit refléter l’équilibre structurel parfait entre les blocs porteurs de sens sémantique (Kanji) et les marqueurs fonctionnels ou morphologiques (Hiragana).

La règle de l’Okurigana complexe :
Les verbes honorifiques irréguliers exigent une attention orthographique stricte sur la délimitation de la partie conjuguée en Kana.
— Structure incorrecte : 言っしゃいます × (Erreur grave de radicalisation).
— Structure correcte : おっしゃいます (osshaimasu = vous dites) → Tout s’écrit en Hiragana pour cette racine honorifique pure.

La cascade syntaxique finale intermédiaire :
[Proposition relative courte] + [Nom noyau] は [Citation au style neutre] とおっしゃいました。$kt$, $kt${"source":"manuel_pdf","course_number":61}$kt$::jsonb, 61),
  ('Néerlandais', 'rule', $kt$Cours 1 · Clinique Syntactique (L’Inversion et la Négation Niet)$kt$, $kt$Théorie Grammaticale Fine
La règle de l’Inversion (Verbe en Position 2) : En néerlandais, le verbe conjugué occupe toujours la deuxième position dans une proposition principale. Si vous commencez la phrase par un complément (de temps, de lieu, de cause) ou par une proposition subordonnée, la Position 1 est prise. Le sujet doit donc immédiatement basculer après le verbe (Position 3).
— Structure incorrecte (Calque de l’anglais) : Volgende week de technicus zal het systeem testen.
— Structure correcte : Volgende week (Pos 1) zal (Pos 2 - Verbe) de technicus (Pos 3 - Sujet) het systeem testen.
Piège de la 2e personne du singulier (jij/je) : Lors de l’inversion avec le pronom sujet jij/je, le verbe perd son -t final.
— Exemple : Morgen loopt je... → M orgenloopjenaardef abriek.

La place de la négation NIET :
1. Négation globale de la phrase : Niet se place à la toute fin de la clause principale, mais se positionne devant le bloc verbal final (infinitif/participe) ou devant un complément introduit par une préposition.
— Exemples : We testen de sensoren vandaag niet. / We kunnen de sensoren vandaag niet testen.

Négation partielle d’un constituant : Niet se place juste devant l’élément précis qu’il
réfute (adjectif, adverbe, groupe nominal).
— Exemple : De fout ligt niet aan de software, maar aan de hardware.

2. Exercices d’application
Exercice 1 : Réécrivez les phrases suivantes de manière grammaticalement parfaite :
1. Gisteren de machineoperator heeft de parameters handmatig ingesteld.

2. We hebben het systeem wegens een kortsluiting gisteravond kunnen niet opstarten.

Cycle 1 Cours 2 (1 h 45) : Grand Laboratoire (Rapport d’Audit et Réunion
de Crise)

Objectif : Rédiger un rapport technique de synthèse d’incident d’automatisation et mener une réunion de crise fluide face à la direction d’usine.

1. Écrit : Het Syntheserapport (Rapport d’analyse d’incident)

2. Oral : Réunion de crise et gestion des objections
Mise en situation : Vous défendez votre système automatisé lors d’une réunion de crise. Le directeur de l’usine (de fabrieksmanager) vous reproche un manque d’anticipation. Vous démontrez que le cahier des charges d’origine contenait des tolérances électriques erronées.$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Néerlandais', 'rule', $kt$Cours 2 · Grand Laboratoire (Rapport d’Audit et Réunion de Crise)$kt$, $kt$Écrit : Het Syntheserapport (Rapport d’analyse d’incident)
Consigne de l’épreuve écrite

Rédigez une note d’analyse technique de 15 lignes en néerlandais soutenu. Vous résumez un incident d’automatisation sur une ligne de conditionnement.

Données à intégrer réglementaires :
— Des variations de tension (spanningsschommelingen) provoquent des arrêts d’urgence de l’automate (PLC-storingen).
— Les capteurs ne sont pas calibrés de manière optimale.
Contraintes syntaxiques (Bloc 1) :
— Amorcez au moins trois phrases par un complément complexe exigeant une inversion (Verbe en Position 2).
— Variez l’usage de la négation niet (implémentez à la fois une négation totale de la phrase et une négation partielle d’un constituant).

Votre rapport (Het Syntheserapport)

Oral : Réunion de crise et gestion des objections
Mise en situation

Le directeur de l’usine (de fabrieksmanager) vous reproche un manque flagrant d’anticipation suite aux arrêts répétés de la ligne. Vous devez démontrer scientifiquement que le cahier des charges d’origine contenait des tolérances électriques erronées et que votre système n’est pas en cause.

Aide au Laboratoire Modèles d’inversions attendues

Amorce par un complément de temps : Gisteravond hebben de herhaalde spanning-
sschommelingen een PLC-storing veroorzaakt.
Amorce par une cause / condition : Wegens een foutieve kalibratie van de sensoren werkt het systeem niet optimaal.
Négation partielle d’un constituant : De fout ligt niet aan onze PLC, maar aan de elektrische toleranties.$kt$, $kt${"source":"manuel_pdf","course_number":2}$kt$::jsonb, 2),
  ('Néerlandais', 'vocabulary', $kt$Cours 3 · Lexique de Terrain I (Composants, Matériel & Câblage)$kt$, $kt$Vocabulaire Technique Mécatronique Ciblée
Automatisme & Électronique :
— De PLC (Programmeerbare Logische Controller) : L’automate programmable
industriel (API). (Prononciation : [Pé-El-Cé]).
— De sensor (meervoud : sensoren) : Le capteur.
— De naderingssensor : Le capteur de proximité.
— De fotocel / optische sensor : Le capteur photoélectrique / la cellule optique.
— De actuator (meervoud : actuatoren) : L’actionneur.
— Het relais (meervoud : relais) : Le relais.
— De printplaat (PCB) : Le circuit imprimé.

Câblage & Connectique :
— De kabelboom : Le faisceau de câbles / le harnais de câblage.
— De bedrading : Le câblage / la filerie.
— De connector / de stekker : Le connecteur / la fiche.
— De klem / het klemmenblok : La borne / le bornier de raccordement.
— Aarden (werkwoord) / de aarding : Mettre à la terre / la mise à la terre.$kt$, $kt${"source":"manuel_pdf","course_number":3}$kt$::jsonb, 3),
  ('Néerlandais', 'rule', $kt$Cours 4 · Grand Laboratoire (Fiche d’Instructions et Guidage en Atelier)$kt$, $kt$Oral : Guidage technique en direct et support de terrain
Mise en situation : Un technicien junior est à l’atelier face au prototype. Les capteurs ne remontent aucun signal dans le logiciel. Vous devez le guider pas à pas par téléphone pour vérifier les connexions physiques, tester la continuité au bornier et valider l’alimentation.$kt$, $kt${"source":"manuel_pdf","course_number":4}$kt$::jsonb, 4),
  ('Néerlandais', 'rule', $kt$Cours 5 · Clinique Syntactique (Subordonnées complexes & Cascade verbale)$kt$, $kt$Théorie Grammaticale Fine
L’ordre rouge vs l’ordre vert en subordonnée (Bijzin) :
Dans une proposition subordonnée (introduite par omdat, als, dat, of...), tous les verbes migrent à la fin. Si l’on combine un verbe conjugué (auxiliaire) et un participe passé, deux ordres sont corrects :
— De rode volgorde (Ordre rouge) : Verbe conjugué + Participe passé.
Ex : ... omdat hij de machine heeft stopgezet. (Courant aux Pays-Bas, très fluide à l’oral).
— De groene volgorde (Ordre vert) : Participe passé + Verbe conjugué.
Ex : ... omdat hij de machine stopgezet heeft. (Courant en Belgique flamande, très utilisé à l’écrit formel).

La règle de l’IPP (Infinitivus-pro-participio) :
Lorsque l’on combine un auxiliaire (hebben/zijn) et un verbe modal (kunnen, moeten, willen...) au passé composé dans une subordonnée, le participe passé du verbe modal se transforme obligatoirement en infinitif. L’ordre devient alors fixe : le verbe conjugué se place devant les deux infinitifs.
— Structure incorrecte : ... omdat we de parameters niet aanpassen moeten hebben. ×
— Structure correcte : ... omdat we de parameters niet hebben moeten aanpassen. ✓$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Néerlandais', 'rule', $kt$Cours 6 · Grand Laboratoire (Spécification Technique et Explication Algorithmique)$kt$, $kt$Oral : Explication de la boucle de rétroaction PID devant un comité
Mise en situation : Vous présentez l’implémentation de la boucle de contrôle d’un servomoteur. Vous décrivez le traitement du signal de position envoyé par le codeur (de encoder) en continu vers le correcteur PID (de PID-regelaar) pour corriger l’erreur de trajectoire.$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Néerlandais', 'rule', $kt$Cours 7 · Clinique Syntactique (Les Nuances du Passif et la structure impersonnelle Er)$kt$, $kt$Théorie Grammaticale Fine
Le passif présent (Worden) vs passif parfait (Zijn) :
— Présent : De parameter wordt gewijzigd. (La valeur est modifiée / action en cours).
— Parfait : De parameter is gewijzigd. (La valeur a été modifiée / état résultant).

La structure impersonnelle avec ER au Passif :
En néerlandais, lorsqu’une phrase passive n’a pas de sujet réel défini (action générale), on utilise obligatoirement le pronom impersonnel er en position 1 (ou en position 3 après inversion) pour introduire l’action. C’est une structure essentielle pour rédiger des rapports techniques neutres.
— Structure active : Men controleert de sensoren. (On contrôle les capteurs).
— Structure passive B2/C1 : Er wordt gecontroleerd of de sensoren correct werken. (Il est contrôlé si... / On contrôle si...).
— Inversion avec ER : Vandaag wordt er gecontroleerd of... (Aujourd’hui, il est procédé au contrôle de...).$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Néerlandais', 'rule', $kt$Cours 8 · Grand Laboratoire (Notice d’Homologation et Exposé d’Architecture)$kt$, $kt$Oral : Exposé magistral sur l’architecture d’une chaîne automatisée
Mise en situation : Vous présentez l’architecture globale d’une nouvelle ligne de production devant un panel d’auditeurs et d’ingénieurs partenaires. Vous devez décrire le flux de production, la centralisation des données des capteurs et les protocoles de sécurité redondants.

BLOC 2 : PRÉCISION LEXICALE
DIAGNOSTICS DE MAINTENANCE
(CYCLES 5 À 8)$kt$, $kt${"source":"manuel_pdf","course_number":8}$kt$::jsonb, 8),
  ('Néerlandais', 'vocabulary', $kt$Cours 9 · Lexique de Terrain II (Mécanique, Outillage & Diagnostic de panne)$kt$, $kt$Vocabulaire Technique Mécatronique Ciblée
Génie Mécanique & Cinématique :
— Het tandwiel (meervoud : tandwielen) : L’engrenage / la roue dentée.
— Het lager (meervoud : lagers) : Le roulement.
— De kogellager : Le roulement à billes.
— De koppeling : L’accouplement / l’embrayage.
— De cilinder (pneumatische/hydraulische cilinder) : Le vérin (pneumatique/hydraulique).
— De aandrijfas : L’arbre de transmission / d’entraînement.

Outillage de précision & États de Pannes :
— De schuifmaat : Le pied à coulisse.
— De multimeter : Le multimètre.
— De storing : La panne / la perturbation du système.
— De kortsluiting : Le court-circuit.
— De slijtage : L’usure.
— Smeren (werkwoord) / het smeermiddel : Lubrifier / le lubrifiant.$kt$, $kt${"source":"manuel_pdf","course_number":9}$kt$::jsonb, 9),
  ('Néerlandais', 'rule', $kt$Cours 10 · Grand Laboratoire (Rapport de Panne et Dépannage d’Urgence)$kt$, $kt$Oral : Le dépannage d’urgence en direct avec l’atelier (Intervention de crise)
Mise en situation : La ligne de production principale est à l’arrêt. Un technicien d’astreinte est sur place devant la machine, sous pression. Vous menez le diagnostic à distance par téléphone. Vous devez lui faire tester la tension au multimètre, vérifier l’état du vérin pneumatique et inspecter les engrenages pour identifier si la panne est d’origine électrique ou mécanique.$kt$, $kt${"source":"manuel_pdf","course_number":10}$kt$::jsonb, 10),
  ('Néerlandais', 'conjugation', $kt$Cours 11 · Clinique Syntactique (Les Verbes à préposition fixe et Adverbes pronominaux)$kt$, $kt$Théorie Grammaticale Fine
Les prépositions fixes des verbes industriels (Vaste voorzetsels) :
Les erreurs de prépositions gâchent instantanément un profil fluide. Vous devez automatiser ces structures :
— Voldoen aan de eisen : Satisfaire / répondre aux exigences du cahier des charges.
— Twijfelen aan de betrouwbaarheid : Douter de la fiabilité d’un capteur.
— Bestaat uit drie modules : Se composer de trois sous-systèmes.
— Zich interesseren voor / Geïnteresseerd zijn in : S’intéresser à / être intéressé par.
— Bijdragen aan een oplossing : Contribuer à une solution.

La mécanique des Adverbes Pronominaux (Er/Daar/Waar + voorzetsel) :
En néerlandais de niveau avancé, on ne combine jamais une préposition et un pronom neutre comme het ou wat. On les transforme en adverbes fusionnés.
— Mettre l’accent dessus : Ik werk daarmee. (Je travaille avec cela / avec cet outil).
— Lier une idée (Relatif) : De PLC waarmee we de motoren aansturen... (L’automate avec lequel nous commandons les moteurs...).
— Structure incorrecte à éradiquer : De machine met wat we werken... × → De machine waarmee we werken... ✓$kt$, $kt${"source":"manuel_pdf","course_number":11}$kt$::jsonb, 11),
  ('Néerlandais', 'rule', $kt$Cours 12 · Grand Laboratoire (Appel d’Offres et Revue de Conception Exécutive)$kt$, $kt$Oral : La revue de conception exécutive face à un client exigeant
Mise en situation : Vous menez une revue de conception (ontwerpreview) stratégique devant l’équipe d’ingénierie d’un grand client industriel. Le client remet en question le choix de l’architecture de vos actionneurs et doute de la fiabilité de vos capteurs en milieu humide.$kt$, $kt${"source":"manuel_pdf","course_number":12}$kt$::jsonb, 12),
  ('Néerlandais', 'rule', $kt$Cours 13 · Clinique Lexicale (Traitement des Faux Amis et Choix des Mots Métrologiques)$kt$, $kt$Traitement des Interférences et Faux Amis
Chez les locuteurs polyglottes, les termes des grandeurs électriques et physiques se mélangent fréquemment. Voici la cartographie de précision à automatiser :

Concept Physique           Terme Néerlandais Correct         Calque Anglais/Allemand à Éviter La tension électrique      De spanning                       De voltage / de tensie × Le courant électrique      De stroom                         De current / de ampèrage × La puissance               Het vermogen                      De power / de kracht (Kracht = force mécanique) × La vitesse (de rotation)   Het toerental / de snelheid       De speed / de rotatie × Le couple mécanique        Het koppel / het draaimoment      Het torque ×
L’étalonnage / calibrage   De kalibratie / het ijken         De schaling ×

Nuance cruciale : Maken vs Doen.
Ne dites jamais een aanpassing maken (calque de to make an adjustment), utilisez exclusive-
ment : een aanpassing doorvoeren ou aanpassen. De même, on effectue des mesures avec
la structure : metingen verrichten ou meten.$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Néerlandais', 'rule', $kt$Cours 14 · Grand Laboratoire (Fiche de Métrologie et Arbitrage d’Architecture)$kt$, $kt$Oral : Arbitrage d’architecture technique et défense budgétaire
Mise en situation : Deux architectures mécatroniques s’affrontent pour le projet final. L’une privilégie la puissance et le couple au détriment de la consommation électrique, l’autre est plus économe mais plus complexe à programmer. Vous devez soutenir votre arbitrage technique et justifier vos choix de composants devant le directeur technique.

Focus éradication des fautes : Précision absolue des termes métrologiques à l’oral. Éradication complète des tics verbaux anglophones (power, torque).$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Néerlandais', 'conjugation', $kt$Cours 15 · Clinique du Style (Le Conditionnel, la gestion des risques et les registres de langue)$kt$, $kt$Théorie Grammaticale Fine
Le conditionnel de scénario de défaillance (Zouden / Hadden / Waren) :
Pour analyser les risques théoriques d’un système sans que la panne ne soit réelle, l’allemand ou l’anglais influencent souvent à tort la structure. En néerlandais, on utilise la structure fluide : ZOUDEN + Infinitif ou les formes de prétérit modifiées pour exprimer une hypothèse irréelle du passé.
— Hypothèse présente : Als de sensor zou falen, zou het systeem direct stilvallen. (Si le capteur venait à faillir, le système s’arrêterait immédiatement).
— Hypothèse passée irréelle : Als de technicus de smering had gecontroleerd, was de storing niet opgetreden.
(Si le technicien avait vérifié la lubrification, la panne ne serait pas survenue. Note : l’auxiliaire de optreden est zijn → was).

La gestion des registres (Atelier vs Boardroom) :
Un ingénieur expert doit savoir basculer instantanément de registre selon son public :
— Style d’atelier (Technicien) : Kijk eens naar die kabel, daar zit een breuk in. (Regarde ce câble, il y a une rupture dedans).
— Style de direction / brevet (Boardroom) : Er dient te worden opgemerkt dat de kabelbreuk de continuïteit van het signaal in het gedrang brengt.
(Il convient de noter que la rupture de câble compromet la continuité du signal).$kt$, $kt${"source":"manuel_pdf","course_number":15}$kt$::jsonb, 15),
  ('Néerlandais', 'rule', $kt$Cours 17 · Clinique Syntactique (Les Connecteurs d’argumentation avancés)$kt$, $kt$Théorie Grammaticale Fine
Le niveau C1 exige de structurer un argumentaire sans abuser des connecteurs basiques (maar, want, omdat). L’allemand ou le français poussent souvent à de mauvais calques de position. Voici la mécanique des connecteurs de haut niveau :

Les connecteurs de subordination (Rejet du verbe à la fin)

— Hoewel (Bien que) / Aangezien (Puisque / Étant donné que).
— Correcte constructie : Hoewel de trillingen binnen de tolerantiegrenzen blijven, moeten we de lagers controleren. (Bien que les vibrations restent dans les limites...).

Les adverbes de liaison (Inversion obligatoire en position 2)

— Desalniettemin / Nochtans (Néanmoins / Pourtant) / Daarentegen (Par contre / En revanche) / Dienovereenkomstig (Par conséquent).
— Correcte constructie : Het budget is beperkt. Desalniettemin (Pos 1) moeten (Pos 2 - Verbe) we (Pos 3 - Sujet) de componenten vervangen.

Le connecteur d’opposition neutre : Echter (Cependant / Toutefois)

— Règle de style purement néerlandaise : Echter ne se place presque jamais en tête de phrase à l’écrit soutenu. Il s’insère au milieu de la proposition, juste après le verbe conjugué ou le sujet.
— Foute constructie (Calque du français) : Echter, het systeem werkt niet.
— Correcte constructie : Het systeem werkt echter niet. / De resultaten zijn echter onbevredigend.$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Néerlandais', 'rule', $kt$Cours 18 · Grand Laboratoire (Note de Réfutation et Atelier de Contradiction Technique)$kt$, $kt$Écrit : De Weerleggingsnota (Note technique de contestation de données)
— Consigne : Rédigez une note de contestation de 15 à 20 lignes en néerlandais formel destinée à un fournisseur de moteurs électriques. Vous devez contester ses spécifications techniques en démontrant que le couple fourni à bas régime ne correspond pas à la fiche technique fournie, ce qui paralyse l’axe d’entraînement mécanique (de aandrijfas).
— Contraintes : Intégrez hoewel, daarentegen, et placez correctement l’adverbe echter au cur d’une proposition. Utilisez le lexique métrologique du Bloc 2.

Oral : La négociation d’ingénierie face au litige fournisseur
— Mise en situation : Vous êtes en visioconférence avec les ingénieurs d’un sous-traitant. Ils soutiennent que le problème vient de votre code d’automatisation et non de leur matériel. Vous devez réfuter leurs arguments un par un, de manière ferme et spontanée, en vous appuyant sur vos relevés de tension et de couple.
— Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Formulez les objections du fournisseur pour les détruire immédiatement (U beweert dat..., aangezien... Desalniettemin tonen onze metingen aan dat...).
— Focus éradication des fautes : Automatisme absolu de l’inversion après les adverbes de liaison. Gestion fluide du ton de la contradiction courtoise mais implacable.$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Néerlandais', 'conjugation', $kt$Cours 19 · Clinique Syntactique (Structures adjectivales denses et Gérondifs)$kt$, $kt$Théorie Grammaticale Fine
L’adjectif étendu et le participe présent pré-positionné (De uitbreiding van
het adjectief)

Le néerlandais formel et le langage d’ingénierie adorent condenser une proposition relative entière sous la forme d’un très long bloc adjectival placé devant le nom. C’est une structure difficile à improviser mais indispensable pour éradiquer les lourdeurs de style.
— Style courant (Structure relative) : De maatregelen die we moeten nemen, zijn duur.
— Style C1 compact (Adjectif étendu) : De te nemen maatregelen zijn duur.
— Structure complexe étendue : De door de hoofdingenieur goedgekeurde softwareversie. (La version logicielle approuvée par l’ingénieur en chef).
— Règle d’or : Le participe passé (goedgekeurde) se place à la fin du bloc adjectival, juste avant le nom qu’il qualifie. Tous les compléments d’agent ou d’objet s’intercalent au milieu.

L’usage du gérondif d’action (Al doende)

Pour exprimer la simultanéité d’un processus automatique ou d’une action humaine (en faisant X...), on utilise le participe présent précédé ou non de al.
Ex : Al metend ontdekte de technicus de kabelbreuk. (En mesurant, le technicien a découvert la rupture de câble).$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Néerlandais', 'rule', $kt$Cours 20 · Grand Laboratoire (Plan de Déploiement et Pitch de Synthèse Stratégique)$kt$, $kt$Écrit : Het Implementatieplan (Plan de déploiement d’une mise à jour de parc
machines)
— Consigne : Rédigez une note d’implémentation de 20 lignes détaillant la mise à niveau logicielle et matérielle d’un parc de 50 machines de découpe automatisées.
— Contraintes : Intégrez au moins trois structures adjectivales denses complexes (ex : de te implementeren softwareversie, de door de kwaliteitsdienst gecertificeerde sensoren). Utilisez le style de la nominalisation pour un rendu concis et exécutif.

Oral : Le briefing stratégique devant le comité d’investissement
— Mise en situation : Vous présentez le plan de déploiement technologique devant le comité de direction. Vous devez justifier le calendrier, la gestion des risques d’arrêt de production (de downtime) et l’impact sur l’efficacité globale des équipements (OEE).
— Consigne orale : Parlez à voix haute pendant 5 minutes en continu, sans aucun support visuel. Votre débit doit être régulier, dense et précis.
— Focus éradication des fautes : Intégrez naturellement des structures de gérondifs pour décrire les gains de temps (Al optimaliserend kunnen we de downtime beperken...). Sécurisez la prononciation des longs adjectifs fléchis sans bafouiller sur le -e final.$kt$, $kt${"source":"manuel_pdf","course_number":20}$kt$::jsonb, 20),
  ('Néerlandais', 'conjugation', $kt$Cours 21 · Clinique Syntactique (Le Discours indirect formel et la Concordance des temps)$kt$, $kt$Théorie Grammaticale Fine
Lorsque vous rapportez un audit, des faits d’atelier ou les directives d’une autorité, vous devez basculer la structure verbale. Si la phrase principale est au passé (De auditeur verklaarde dat...), les verbes de la subordonnée subissent une translation temporelle.

Le style indirect au passé (De indirecte rede)

— Présent Prétérit : Het systeem is onveilig. De auditeur verklaarde dat het systeem onveilig was.
— Passé Plus-que-parfait : We hebben de sensoren gekalibreerd. De technicus meldde dat ze de sensoren hadden gekalibreerd.

Ne répétez pas zeggen. Utilisez la nuance exacte.

Le choix des verbes de citation pour nuancer le propos

— Beweren : Prétendre / affirmer (sous-entend un doute ou une absence de preuve).
— Aantonen / Aantonen dat : Démontrer que / prouver que.
— Benadrukken : Mettre l’accent sur / insister sur.
— Vermelden : Mentionner / faire état de.$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Néerlandais', 'rule', $kt$Cours 22 · Grand Laboratoire (Rapport d’Audit Qualité et Débriefing d’Équipe)$kt$, $kt$Écrit : Het Auditverslag (Compte-rendu d’audit de conformité ISO 9001)
1. Consigne : Rédigez un rapport d’audit interne de 15 à 20 lignes synthétisant les conclusions d’un inspecteur qualité concernant la traçabilité des composants mécatroniques dans votre atelier.

Contraintes : Rédigez l’intégralité du corps du texte au discours indirect au passé. Variez
vos verbes de citation (benadrukken, beweren, vermelden). Veillez à la stricte application du rejet des blocs verbaux au plus-que-parfait.

2. Oral : Le débriefing technique et la transmission des directives d’audit
1. Mise en situation : Vous réunissez votre équipe de techniciens d’atelier pour leur restituer les conclusions de l’audit qualité. Vous devez leur expliquer ce que l’inspecteur a validé, ce qu’il a critiqué (le manque de rigueur sur l’étalonnage des capteurs) et leur transmettre les nouvelles directives obligatoires de traçabilité.
2. Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Votre ton doit être managérial, neutre et direct.

Focus éradication des fautes : Ne faites aucun glissement de temps à l’oral (De
inspecteur zei dat de aarding niet goed is... was). Maintenez la concordance des temps historique du début à la fin de votre débriefing.$kt$, $kt${"source":"manuel_pdf","course_number":22}$kt$::jsonb, 22),
  ('Néerlandais', 'rule', $kt$Cours 24 · Grand Laboratoire (Rapport d’Expertise Judiciaire et Pitch de Restitution de Sinistre)$kt$, $kt$Écrit : Het Schaderapport (Rapport d’expertise après rupture mécanique)
Consigne de l’épreuve écrite

Rédigez un rapport d’expertise judiciaire ou d’assurance de 20 lignes analysant la rupture de l’arbre d’entraînement principal d’une turbine automatisée.

Contraintes impératives (Grand Bilan Bloc 3) :
— Connecteurs concessifs avancés : Mobilisez l’ensemble des structures du bloc en intégrant obligatoirement desalniettemin et echter.
— Structures adjectivales denses : Intégrez deux structures adjectivales complexes prépositionnées (adjectifs étendus fléchis devant le nom) pour décrire l’historique et l’état de la pièce.
— Conclusions causales objectives : Formulez vos conclusions de manière scientifique en exploitant les structures te wijten aan et voortvloeien uit.

Votre rapport (Het Schaderapport)

Oral : Le pitch de restitution de sinistre technique devant le conseil d’adminis-
tration

Mise en situation

La rupture de l’arbre mécanique a paralysé l’usine pendant 48 heures, générant des pertes financières massives. Vous présentez vos conclusions d’expert devant le conseil d’administration et les représentants de la compagnie d’assurance.

Grille d’évaluation du Laboratoire
Critère d’évaluation                Barème    Indicateurs de réussite
Rapport écrit (Structures denses)     /6      Intégration correcte des deux adjectifs étendus prépositionnés.
Rapport écrit (Logique causale)       /4      Utilisation précise de te wijten aan / voortvloeien uit. Aisance orale & Débit                 /5      Fluidité absolue pendant 5 minutes, ton d’expert souverain.
Rigueur grammaticale orale            /5      Absence de fautes sur les flexions adjectivales et le style nominal.

Grille d’aide Exemples de structures attendues

Structure adjectivale dense (Exemple) : De door de externe technici vorig jaar
grondig gereviseerde turbine... (La turbine révisée en profondeur l’année dernière par les techniciens externes...)
Conclusion causale (Exemple) : De breuk is te wijten aan metaalmooeheid... (La
rupture est due à la fatigue du métal...).

BLOC 4 : MAÎTRISE QUASI-NATIVE &
ÉLIMINATION DÉFINITIVE DES
SCORIES (CYCLES 13 À 16)$kt$, $kt${"source":"manuel_pdf","course_number":24}$kt$::jsonb, 24),
  ('Néerlandais', 'rule', $kt$Cours 25 · Clinique Lexicale & Culturelle (Variations Pays-Bas vs Flandre L’espace DACH/Ned)$kt$, $kt$Théorie Linguistique Fine : Le marché de la mécatronique (Eindhoven vs Anvers)
La langue néerlandaise est pluricentrique. Si l’allemand officiel sert de référence globale, le néerlandais présente des variations subtiles mais capitales entre le jargon corporate de la région d’Eindhoven (Brainport high-tech) et le monde industriel des ports d’Anvers ou de Gand.

Les interférences de vocabulaire technique et administratif :
— Le logiciel / software : Aux Pays-Bas, on utilise massivement l’anglicisme software (prononcé à l’anglaise). En Flandre, le terme officiel et soutenu est programmatuur.
— L’usine / l’atelier : Aux Pays-Bas, on parlera souvent de de fabriek ou de plant. En Flandre, l’utilisation de de werkplaats ou het bedrijf est privilégiée pour l’atelier de terrain.
— Le bureau / la fonction : Un poste de chef de projet se dira projectmanager aux Pays-Bas, mais on entendra fréquemment projectleider ou diensthoofd en Belgique.
— Les tournures de courtoisie : Le pronom de vouvoiement u est systématique en
Flandre dans le milieu pro. Aux Pays-Bas, le tutoiement (je/jij) s’installe très vite, même avec la hiérarchie directe, sauf dans les rapports ultra-formels.$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Néerlandais', 'rule', $kt$Cours 26 · Grand Laboratoire (Note de Synthèse Régionale et Négociation d’Écosystème)$kt$, $kt$Écrit : De Regionale Aanpassingsnota (Note d’adaptation aux standards du mar-
ché)

Oral : La négociation inter-régionale (L’ingénieur face aux deux marchés)
Mise en situation : Vous menez une réunion commerciale cruciale. Durant la première moitié, vous vous adressez à un acheteur néerlandais direct, pragmatique et adepte du tutoiement collaboratif. Durant la seconde moitié, vous basculez face au directeur technique flamand, très attaché aux protocoles de courtoisie, au vouvoiement (u) et à un langage technique pur.$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Néerlandais', 'rule', $kt$Cours 27 · Clinique Syntactique (La Syntaxe de la Focalisation et Inversions Stylistiques)$kt$, $kt$Théorie Grammaticale Fine
Au niveau d’excellence (C1/C2), la phrase ne suit plus uniquement la structure linéaire Sujet-Verbe-Complément. Pour guider l’attention du lecteur sur une donnée critique, l’ingénieur doit savoir manipuler la focalisation :

L’inversion stylistique par l’adverbe restrictif :
Des adverbes comme slechts (seulement), pas (seulement/pas avant), nauwelijks (à peine) forcent une inversion dramatique de la phrase.

— Exemple standard : We hebben de noodstop pas na het incident geactiveerd.
— Exemple focalisé B2/C1 : Pas na het incident (Pos 1) hebben (Pos 2) we (Pos 3) de noodstop geactiveerd.
(Ce n’est qu’après l’incident que nous avons activé l’arrêt d’urgence).

La mise en relief par la structure inversée (Inversie als stijlfiguur) :
Pour souligner une relation de cause à effet immédiate entre deux événements d’atelier :
— Exemple : Instabiel was de spanning, waardoor de PLC crashte.
(Instable était la tension, ce qui a fait planter l’automate).$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Néerlandais', 'rule', $kt$Cours 28 · Grand Laboratoire (Le Manifeste de l’Innovation et le Pitch d’Influence)$kt$, $kt$Écrit : Het Innovatiemanifest (Le Manifeste d’architecture mécatronique disrup-
tive)

Oral : Le Pitch d’influence et d’éloquence devant les investisseurs (Venture Ca-
pitalists)
Mise en situation : Vous devez pitcher votre startup de robotique industrielle devant un fonds d’investment néerlandais à Rotterdam. Vous demandez un financement d’un million d’euros. Vous devez les captiver, prouver la viabilité technologique de votre système automatique et imposer votre leadership technique par une éloquence sans faille.$kt$, $kt${"source":"manuel_pdf","course_number":28}$kt$::jsonb, 28),
  ('Néerlandais', 'declension', $kt$Cours 29 · Clinique du Style (Chasse aux Scories Finales & Accords d’Adjectifs Complexes)$kt$, $kt$Théorie Grammaticale Chirurgicale : Les zones d’ombre du C1/C2
C’est ici que se joue l’éradication finale des scories. Nous passons au peigne fin deux pièges résiduels :

L’adjectif sans -e final (L’exception du nom neutre indéterminé) :
Vous savez qu’un adjectif prend généralement un -e (de grote machine). Mais l’adjectif reste strictement invariable (sans -e) si et seulement si le nom remplit simultanément trois critères : il est neutre (het-woord), au singulier, et précédé d’un article indéfini (een), d’un possessif (mijn, jouw), de geen, ou de rien du tout.
— Structure incorrecte : Het is een groote systeem. ×
— Structure correcte : Het is een groot systeem. (Car het systeem est neutre).
— Exemple complexe : Er is hoog vermogen nodig voor deze as.
(Une puissance élevée est nécessaire / het vermogen → pas de -e car aucun article n’est présent).

Les pluriels irréguliers des termes latins et scientifiques :
En ingénierie, certains mots d’origine scientifique conservent leur pluriel d’origine savante :
— Het criterium → de criteria (les critères).
— Het fenomeen → de fenomenen (les phénomènes).
— Het medium → de media.$kt$, $kt${"source":"manuel_pdf","course_number":29}$kt$::jsonb, 29),
  ('Néerlandais', 'rule', $kt$Cours 30 · Grand Laboratoire (Spécification de Brevet et Monologue Philosophique)$kt$, $kt$Oral : Le monologue de haute volée sur l’éthique de la robotique industrielle
Mise en situation : Vous êtes invité à donner une conférence de clôture lors d’un symposium international à l’Université de Technologie d’Eindhoven (TU/e). Votre sujet est abstrait et
philosophique : De ethiek van automatisering en de autonomie van de machine in de samenleving van morgen.$kt$, $kt${"source":"manuel_pdf","course_number":30}$kt$::jsonb, 30),
  ('Thaï', 'alphabet', $kt$Cours 1 · [ÉCRIT] Les consonnes moyennes et les voyelles de base$kt$, $kt$Tracé et Graphie : L’importance du petit cercle
En thaï, presque toutes les lettres commencent par un petit cercle. Le sens de rotation de ce cercle (horaire ou antihoraire) détermine l’identité de la lettre et sa classe. Le thaï s’écrit de gauche à droite, de manière continue, sans séparer les mots par des espaces (les espaces servent de ponctuation).

Les 7 consonnes de classe moyenne principales (À mémoriser) :
Pour insérer les caractères natifs, assurez-vous d’avoir configuré une police thaïe dans votre
préambule (ex : \newfontfamily\thaifont{Garuda}).

• ก (ko kaï) : Le son [K] (comme dans ”koala”). Note : C’est la seule lettre du système thaï sans cercle initial.

• จ (tcho tchan) : Le son [tch] ou [dj] doux.

• ด (do dek) : Le son [D].

• ต (to tao) : Le son [T] sec et non aspiré.

• บ (bo baïmaï) : Le son [B].

• ป (po pla) : Le son [P] sec et non aspiré.

• อ (o ang) : Consonne muette (elle sert de support graphique aux voyelles isolées) ou son
[Glottal].

Les premières voyelles longues :
En thaï, les voyelles ne suivent pas une logique linéaire : elles peuvent s’écrire devant, derrière, au-dessus ou au-dessous de la consonne qu’elles modifient.
• _า (sara aa) : Le son [aa] long. Se place toujours derrière la consonne.
Exemple : ก + _า = กา [kaa].

• เ_ (sara éé) : Le son [éé] long. Se place toujours devant la consonne.
Exemple : เ + ก = เก [kéé].$kt$, $kt${"source":"manuel_pdf","course_number":1}$kt$::jsonb, 1),
  ('Thaï', 'rule', $kt$Cours 2 · [LECTURE] Clinique de Lecture & Décodage de blocs syllabiques$kt$, $kt$Théorie de la Lecture : L’absence d’espaces
Le thaï n’utilise pas d’espaces entre les mots. Les espaces ne servent que pour marquer la fin d’une phrase, une liste ou une pause majeure dans le discours. Pour décoder un texte, il faut repérer visuellement les consonnes initiales qui portent les voyelles.

Analyse de formes proches et pièges visuels :
• Ne confondez pas ด et บ : Le ด (do dek) possède son cercle initial orienté vers l’intérieur (vers la droite), tandis que le บ (bo baïmaï) est une lettre plus large, formant un rectangle ouvert vers le haut.

• Ne confondez pas ต et ก : Le ต (to tao) présente une brisure/vague caractéristique sur le dessus de sa boucle, alors que le ก (ko kaï) a un dessus totalement lisse.

Règle de lecture de base : Consonne + Voyelle
• ตา → ต [T] + _า [aa] = Taa (Grand-père / œil).

• ดี → ด [D] + _ี [ii] (voyelle chapeau longue) = Dii (Bien / bon).

• ตาดา → S’écrit d’un seul bloc. Vous devez séparer mentalement : ตา (taa) | ดา (daa).$kt$, $kt${"source":"manuel_pdf","course_number":2}$kt$::jsonb, 2),
  ('Thaï', 'vocabulary', $kt$Cours 3 · [COMPRÉHENSION] Laboratoire d’Écoute & Les 3 premiers tons$kt$, $kt$Théorie de l’Écoute : La musique des tons
Le thaï possède 5 tons. Un même bloc de sons prononcé avec une courbe mélodique différente change totalement de sens. Avec les consonnes moyennes associées à des voyelles longues, les trois premières variations de base sont :

• Le ton moyen (Mid tone) : La voix reste plate, neutre et stable.
Exemple : กา [kaa] = corbeau.

• Le ton bas (Low tone) : La voix descend légèrement dans les graves, de manière posée (marqué par le signe _่).
Exemple : ก่า [kàa].

• Le ton tombant (Falling tone) : La voix monte brusquement puis redescend de façon tendue, comme un soupir ou un ordre (marqué par le signe _้).
Exemple : ก้า [kâa].

Les marqueurs oraux de la Politesse
Ces particules se placent systématiquement en toute fin de phrase pour adoucir le propos et marquer le respect envers l’interlocuteur :

• ครับ (Krap) : Utilisé exclusivement par les hommes. Se prononce avec un ton
moyen/haut net.

• ค่ะ (Ka) : Utilisé par les femmes pour affirmer, répondre par l’affirmative ou clore une phrase. Se prononce sur un ton bas descendant dans les graves.

• คะ (Kha) : Utilisé par les femmes pour poser une question ou interpeller quelqu’un. Se prononce sur un ton haut.$kt$, $kt${"source":"manuel_pdf","course_number":3}$kt$::jsonb, 3),
  ('Thaï', 'alphabet', $kt$Cours 5 · [ÉCRIT] Les consonnes hautes et l’impact sur le tracé$kt$, $kt$Tracé et Graphie : L’orientation des boucles
En thaï, la direction dans laquelle vous commencez le tracé du cercle initial change totalement l’identité de la lettre. Les consonnes de classe haute (High Class) modifient de façon intrinsèque le ton naturel des voyelles qui leur sont associées.

Les 7 consonnes de classe haute principales (À mémoriser) :
• ข (kho khaï) : Le son [Kh] aspiré (comme le ch allemand ou un [k] expiré). Attention à ne pas faire de boucle ou d’ondulation sur le dessus.

• ฉ (tcho tching) : Le son [Tch] fortement soufflé.

• ถ (to thung) : Le son [T] soufflé. Le cercle initial commence par le bas et monte vers l’intérieur de la lettre.

• ผ (pho pheung) : Le son [P] soufflé. La dentelure centrale remonte seulement à mihauteur.

• ฝ (fo fa) : Le son [F]. Identique graphiquement au ผ mais la ligne droite de fin monte beaucoup plus haut.

• ส (so sua) : Le son [S]. Ressemble à la structure du ก mais comporte une boucle en bas à gauche et un petit accent oblique en haut à droite.

• ห (ho hip) : Le son [H] aspiré ou lettre muette de modification de ton (outil grammatical de focalisation tonale).$kt$, $kt${"source":"manuel_pdf","course_number":5}$kt$::jsonb, 5),
  ('Thaï', 'rule', $kt$Cours 6 · [LECTURE] La syntaxe de la négation sans espaces$kt$, $kt$Théorie de la Lecture : Isoler la négation
Pour exprimer la négation (equivalent de « non » ou « ne... pas »), le système thaï exploite le mot ไม่ (maï - prononcé de manière tendue avec un ton tombant).

Règle syntaxique immuable :  (maï) + Verbe

• Le mot ไม่ se place toujours devant le verbe qu’il modifie.

• Voyelle pré-positionnée : Remarquez graphiquement que la voyelle ไ_ (sara maï-malai / son [aï]) s’écrit obligatoirement devant la consonne principale ม. Le signe de ton tombant (_้) se place quant à lui juste au-dessus de la consonne.

Analyse visuelle en contexte :

• Exemple d’assemblage : ไม่ดี → ไม่ (pas) + ดี (bon) = Maï dii (Ce n’est pas bon).

• Phrase complète sans espaces : ฉั นไม่ดีค่ะ → ฉั น (Je) | ไม่ (ne... pas) | ดี (être bon) | ค่ะ (politesse). À la lecture, vous devez utiliser le long trait vertical caractéristique de la voyelle ไ comme un jalon visuel pour isoler le début du bloc négatif.$kt$, $kt${"source":"manuel_pdf","course_number":6}$kt$::jsonb, 6),
  ('Thaï', 'vocabulary', $kt$Cours 7 · [COMPRÉHENSION] Les tons haut et montant et l’oreille Lakorn$kt$, $kt$Théorie de l’Écoute : Les deux derniers tons
Pour compléter votre spectre d’écoute, analysons les deux tons les plus expressifs et mélodramatiques des séries thaïlandaises :

• Le ton haut (High tone) : La voix monte nettement dans les aigus et reste perchée, traduisant souvent la surprise, l’intensité ou une interrogation.
Exemple : น้ า [náa] = tante.

• Le ton montant (Rising tone) : La voix commence dans un registre bas, descend
légèrement puis remonte de manière très mélodieuse vers les aigus.
Exemple : ผม [phǒm] = je (homme) / cheveux.

Écoute active : Scène de dialogue familial$kt$, $kt${"source":"manuel_pdf","course_number":7}$kt$::jsonb, 7),
  ('Thaï', 'alphabet', $kt$Cours 9 · [ÉCRIT] Les consonnes basses et les chiffres thaïs$kt$, $kt$Tracé et Graphie : La classe la plus volumineuse
La classe basse (Low Class) contient le plus grand nombre de consonnes du système thaï. Associée aux règles structurelles des cours précédents, sa maîtrise permet de compléter l’apprentissage des familles de caractères.

Les consonnes basses fondamentales (À mémoriser) :
• ค (kho khway) : Le son [Kh] aspiré. Attention cruciale au sens du tracé : le cercle initial commence vers l’extérieur de la lettre. Si le cercle est tracé vers l’intérieur, vous écrivez un ด (do dek).

• ม (mo ma) : Le son [M]. Possède une boucle fermée caractéristique en bas à gauche.

• น (no nou) : Le son [N]. Possède une boucle fermée en bas à droite.

• พ (pho phan) : Le son [P] soufflé. La dentelure centrale remonte jusqu’à la ligne supérieure de la lettre.

• ร (ro rua) : Le son [R] légèrement roulé.

• ล (lo ling) : Le son [L].

Les chiffres thaïs officiels (Graphie traditionnelle) :
Bien que la Thaïlande utilise massivement les chiffres arabes (1, 2, 3) au quotidien, dans l’administration et dans les médias, les chiffres traditionnels sont indispensables à savoir tracer :

๑ (1)     ๒ (2)     ๓ (3)     ๔ (4)     ๕ (5)
Note : Le chiffre ๕ (5) est identique graphiquement au ๔ (4) mais comporte une petite boucle fermée supplémentaire sur son sommet.$kt$, $kt${"source":"manuel_pdf","course_number":9}$kt$::jsonb, 9),
  ('Thaï', 'rule', $kt$Cours 10 · [LECTURE] Le système des classificateurs$kt$, $kt$Théorie de la Lecture : L’ordre obligatoire Quantité + Compteur
En thaï, il est impossible d’accoler directement un adjectif numéral derrière ou devant un nom. Il faut obligatoirement insérer un classificateur (mot compteur spécifique déterminé par la catégorie sémantique de l’objet).

La structure syntaxique de décompte : [Nom] + [Chiffre] + [Classificateur]
• คน (khon) : Le classificateur officiel pour les êtres humains.

• Exemple d’assemblage : เพื่อนสามคน → เพื่อน (ami) | สาม (3) | คน (compteur humain) = Pheuan saam khon (Trois amis).

Analyse visuelle sur le terrain :
Dans un texte fluide sans espaces, repérez en premier lieu le chiffre (qu’il soit écrit en caractères arabes ou traditionnels). Le bloc de caractères qui suit immédiatement ce chiffre correspond systématiquement au classificateur.$kt$, $kt${"source":"manuel_pdf","course_number":10}$kt$::jsonb, 10),
  ('Thaï', 'vocabulary', $kt$Cours 11 · [COMPRÉHENSION] Laboratoire d’Écoute & Immersion Street Food$kt$, $kt$Théorie de l’Écoute : Capter la structure financière
Lors des transactions commerciales, les prix sont énoncés de manière rapide. Pour ne pas saturer votre mémoire de travail, vous devez focaliser votre attention sur le mot interrogatif et la devise sous-jacente.

• เท่าไหร่ (thao-raï ?) = Combien ? (Ton bas + Ton moyen).

• บาท (baht) = Baht (Devise nationale / Ton bas).

Jargon d’écoute des chiffres de base à l’oreille (Chiffres sino-thaïs) :

หนึ่ ง (neung - 1)   สอง (song - 2)    ou สาม (saam - 3)   สี่ (sii - 4)   ห้า (haa - 5)   สิบ (sip - 10)   ร้อย (roy - 100

Exemple d’enchaînement auditif : สี่สิบบาท (sii-sip baht) = 40 Bahts.$kt$, $kt${"source":"manuel_pdf","course_number":11}$kt$::jsonb, 11),
  ('Thaï', 'alphabet', $kt$Cours 13 · [ÉCRIT] La particule de lieu Yoo et l’espace$kt$, $kt$Tracé et Graphie : L’écriture des voyelles verticales
En thaï, se situer dans l’espace ou indiquer la localisation d’un objet requiert l’utilisation d’un verbe pivot incontournable : อยู่ (yòo - Ton bas). C’est un caractère particulièrement formateur pour l’apprentissage de l’écriture car il exige d’empiler plusieurs éléments de manière verticale.

Analyse structurelle et tracé de อยู่ (yòo) :
• La consonne initiale de support est อ (muette).

• La consonne suivante, qui détermine la modification de classe, est ย (placée immédiatement après).

• La voyelle _ู (sara uu long) s’écrit obligatoirement au-dessous de la consonne ย.

• Le signe de ton bas _่ (mai ek) se place précisément au-dessus de cette même consonne ย.

Les indicateurs de position de base (À mémoriser) :

• ที่น่ี (thîi-nîi) : Ici (Ton tombant + Ton tombant).

• ที่นั่น (thîi-nân) : Là-bas (Ton tombant + Ton haut).$kt$, $kt${"source":"manuel_pdf","course_number":13}$kt$::jsonb, 13),
  ('Thaï', 'rule', $kt$Cours 14 · [LECTURE] Décodage d’itinéraires et de plans simplifiés$kt$, $kt$Théorie de la Lecture : La structure de localisation
Pour lire et comprendre instantanément où se trouve un personnage, repérez le point d’ancrage visuel อยู่ (yòo). La syntaxe thaïlandaise suit fidèlement la logique linéaire suivante :

[Sujet] + อยู่ + [Lieu / Position]

• Exemple visuel en contexte : อู่อยู่ท่ีน่ี → อู่ (Prénom Ou) | อยู่ (se trouve) | ที่น่ี (ici) = Oo yòo thîi-nîi (Ou est ici).

Le verbe de déplacement :

• ไป (paï ) : Aller / se déplacer (Ton moyen). Remarquez que la voyelle ไ_ s’écrit obligatoirement devant la consonne de base ป.

• Exemple d’association : ไปที่นั่น (paï thîi-nân) = Aller là-bas.$kt$, $kt${"source":"manuel_pdf","course_number":14}$kt$::jsonb, 14),
  ('Thaï', 'vocabulary', $kt$Cours 15 · [COMPRÉHENSION] Laboratoire d’Écoute & Négociation Tuk-tuk$kt$, $kt$Compréhension Orale : Scène de déplacement urbain
Dans l’environnement de Bangkok, les interactions avec les chauffeurs de taxi ou de Tuk-tuk sont constantes. Pour capter le fil de l’action, vous devez isoler les mots de direction et l’ordre d’arrêt.
Script audio du laboratoire d’écoute (Chauffeur et Passager) :$kt$, $kt${"source":"manuel_pdf","course_number":15}$kt$::jsonb, 15),
  ('Thaï', 'alphabet', $kt$Cours 17 · [ÉCRIT] Les voyelles complexes et les consonnes basses restantes$kt$, $kt$Tracé et Graphie : L’encapsulation de la consonne
En thaï, la structure des voyelles complexes bouscule la logique linéaire : certaines voyelles entourent complètement la consonne. Elles s’écrivent simultanément devant, derrière et au-dessus du caractère principal.

Les voyelles complexes fondamentales :
• เ_า (sara ao) : Le son [ao] (comme dans ”ciao”). Il est composé graphiquement de la voyelle เ (placée devant) et de la voyelle า (placée derrière).
Exemple : ก + เ_า = เกา [kao] (se gratter).

• เ_ะ (sara é) : Le son [é] bref et court. Composé de เ (devant) et de la particule de brièveté ะ (derrière).
• เ_ีะ (sara ia) : Le son [ia] court. Il encapsule littéralement la consonne sur trois côtés (devant, au-dessus et derrière).

La consonne du futur à tracer :
• จ (tcho tchan) : Déjà abordée dans la classe moyenne, elle s’associe à la voyelle courte _ะ pour former la particule pivot de l’avenir : จะ (ja = aller faire / marqueur du futur).$kt$, $kt${"source":"manuel_pdf","course_number":17}$kt$::jsonb, 17),
  ('Thaï', 'conjugation', $kt$Cours 18 · [LECTURE] Clinique de Lecture & Repérage du Futur$kt$, $kt$Théorie de la Lecture : Isoler le marqueur pré-verbal
Pour lire et décoder efficacement les projets, promesses ou intentions d’un personnage au sein d’un texte continu, vos yeux doivent chercher le repère graphique stable จะ (ja - Ton bas).

Règle syntaxique absolue :  (ja) + Verbe
Tout comme l’adverbe de négation, cette particule se place systématiquement juste devant le verbe d’action qu’elle modifie.

• Exemple visuel en contexte : ฉั นจะไปที่นั่น → ฉั น (Je) | จะ (futur) | ไป (aller) | ที่นั่น (là-bas) = Tchan ja paï thîi-nân (J’irai là-bas).

La combinaison complexe Négation + Futur :

ไม่ (maï ) + จะ (ja) + Verbe

Exemple : ไม่จะไป → Maï ja paï (Je n’irai pas). Lors de votre lecture synoptique, vos yeux doivent appréhender ce bloc pré-verbal imbriqué comme une seule et unique unité logique.$kt$, $kt${"source":"manuel_pdf","course_number":18}$kt$::jsonb, 18),
  ('Thaï', 'vocabulary', $kt$Cours 19 · [COMPRÉHENSION] Laboratoire d’Écoute & Le Rendez-vous du Week-end$kt$, $kt$Compréhension Orale : Scène de planification amoureuse
Dans l’univers des séries thaïlandaises, les protagonistes accordent une place centrale à l’organisation de leurs sorties et aux variations de la météo (la pluie tropicale soudaine constituant un ressort dramatique et romantique majeur).
Script audio du laboratoire d’écoute (Yuna et P’Shin) :$kt$, $kt${"source":"manuel_pdf","course_number":19}$kt$::jsonb, 19),
  ('Thaï', 'alphabet', $kt$Cours 21 · [ÉCRIT] Les syllabes mortes (Dead syllables) et les consonnes finales$kt$, $kt$Tracé, Graphie & Règles des tons : Les finales d’arrêt
En thaï, une syllabe se termine soit par un son continu (syllabe vivante), soit par un son bloqué (syllabe morte). Les syllabes mortes (Dead Syllables) forcent intrinsèquement la voix à adopter un ton bas ou tombant de manière automatique, sans qu’il soit nécessaire d’apposer graphiquement un signe de ton.

Les 3 sons de consonnes finales bloquées (Syllabes mortes) :
• Le son [K] : Porté en fin de mot par la consonne ก.
Exemple : รัก [rak] = aimer (Ton haut mécanique dû à la structure courte).

• Le son [T] : Porté en fin de mot par les consonnes ด ou ส.
Exemple : เปิ ด [peut] = ouvrir.
• Le son [P] : Porté en fin de mot par la consonne บ.
Exemple : ชอบ [tchop] = aimer / apprécier.

Le mot-clé du passé à tracer :

• ได้ (dâï - avoir pu / marqueur du passé factuel) : S’écrit avec la voyelle pré-positionnée ไ_, la consonne moyenne ด, et le signe de ton tombant _้.$kt$, $kt${"source":"manuel_pdf","course_number":21}$kt$::jsonb, 21),
  ('Thaï', 'conjugation', $kt$Cours 22 · [LECTURE] Clinique de Lecture & Le marquage du passé ( / )$kt$, $kt$Théorie de la Lecture : La double structure du passé
Le thaï n’ayant aucune conjugaison verbale, il utilise deux marqueurs lexicaux distincts pour situer une action dans le passé ou l’accompli :

La particule pré-verbale  (dâï) :
Se place juste devant le verbe pour indiquer que l’action ”a pu” être réalisée (passé factuel ou obtention d’une autorisation).

Structure : Sujet + ได้ + Verbe → ฉั นได้ไป (Tchan dâï paï = Je oui suis allée).

La particule de fin  (lǽæw) :
S’écrit avec la voyelle เ_ doublée (แ_ placée devant la consonne ล). Se positionne à la toute fin de la phrase pour indiquer que l’action est accomplie ou ”déjà” faite.

Structure : Sujet + Verbe (+ Objet) + แล้ว → ไปแล้ว (Paï lǽæw = C’est déjà fait / Je suis partie).$kt$, $kt${"source":"manuel_pdf","course_number":22}$kt$::jsonb, 22),
  ('Thaï', 'vocabulary', $kt$Cours 23 · [COMPRÉHENSION] Laboratoire d’Écoute & Le Flashback Dramatique$kt$, $kt$Compréhension Orale : Scène de révélations passées
Dans les Lakorns, les scènes de flashbacks ou les aveux sur les événements de la veille constituent des acmés dramatiques. Vous devez apprendre à repérer le แล้ว final qui tombe comme un couperet sémantique.
Script audio du laboratoire d’écoute (Shin et Ou) :$kt$, $kt${"source":"manuel_pdf","course_number":23}$kt$::jsonb, 23),
  ('Thaï', 'alphabet', $kt$Cours 25 · [ÉCRIT] Les symboles spéciaux et le raccourcissement des voyelles$kt$, $kt$Tracé et Graphie : Les modificateurs d’écriture
Le thaï emploie des symboles diacritiques spécifiques au-dessus des consonnes ou après les mots pour modifier la longueur d’une voyelle ou indiquer une répétition sans avoir à réécrire graphiquement le mot.

Les deux symboles indispensables du niveau intermédiaire :

• _็ (Mai taï-khu) : Ressemble à un petit chiffre 8 thaï (๘) miniature placé directement audessus de la consonne initiale. Son rôle est de raccourcir de manière drastique une voyelle longue en une voyelle ultra-courte.
Exemple capital : เป็ น (pen = être / savoir-faire). S’écrit เ + ป + _็ + น. La présence du signe raccourcit la durée de la voyelle.

• ๆ (Mai ya-mok) : Ressemble à un petit crochet vertical ondulé placé immédiatement après un mot, séparé par un espace léger. Il indique que le mot qui le précède doit être répété deux fois à l’oral pour insister ou exprimer un pluriel intensif.
Exemple : มาก ๆ (maak-maak) = Énormément / très très.$kt$, $kt${"source":"manuel_pdf","course_number":25}$kt$::jsonb, 25),
  ('Thaï', 'rule', $kt$Cours 26 · [LECTURE] Décodage du désir et de la capacité$kt$, $kt$Théorie de la Lecture : Isoler la trinité du potentiel
Pour lire et comprendre finement les aspirations d’un personnage, vos yeux doivent cartographier trois structures verbales qui se positionnent de manière différente dans l’énoncé :

Le désir :  (yàak) + Verbe
Signifie « vouloir faire ». Il se place toujours devant le verbe d’action qu’il qualifie.

• Exemple visuel : อยากไป → อยาก (vouloir) + ไป (aller) = Yàak paï (Vouloir aller).

La capacité acquise : Verbe +  (pen)
Signifie « savoir-faire » (une compétence apprise, comme nager, parler une langue, ou conduire). Se positionne généralement après l’objet ou le verbe d’action.

• Exemple visuel : พูดภาษาไทยเป็ น → พูด (parler) | ภาษาไทย (langue thaïe) | เป็ น (savoir-faire) = Phoot phasa thaï pen (Savoir parler thaï).

La possibilité matérielle : Verbe +  (dâï)
Signifie « pouvoir / être physiquement ou matériellement capable de ». Se place systématiquement en toute fin de phrase.

• Exemple visuel : ไปได้ → ไป (aller) + ได้ (pouvoir) = Paï dâï (Pouvoir y aller / C’est matériellement possible).$kt$, $kt${"source":"manuel_pdf","course_number":26}$kt$::jsonb, 26),
  ('Thaï', 'vocabulary', $kt$Cours 27 · [COMPRÉHENSION] Les nuances de la confession amoureuse (Jai)$kt$, $kt$Théorie de l’Écoute : Le mot-clé des sentiments (Jai)
En thaïlandais, la quasi-totalité des concepts émotionnels se construisent en adjoignant un adjectif ou un verbe autour de la racine pivot ใจ (jai - Ton moyen), qui signifie littéralement « le cœur » ou « l’esprit ». Dans les scènes dramatiques des séries, ces mots reviennent en boucle. Vous devez éduquer votre oreille à isoler cette syllabe.

Les associations de sentiments incontournables des séries :

• ดีใจ (dee-jaï ) : Heureux / content (littéralement : bon + cœur).

• เสียใจ (sia-jaï ) : Triste / désolé / affligé (littéralement : cassé/perdu + cœur).

• ตกใจ (tok-jaï ) : Choqué / surpris / saisi (littéralement : tomber + cœur).

• ใจดี (jaï-dii) : Gentil / généreux (littéralement : cœur + bon).$kt$, $kt${"source":"manuel_pdf","course_number":27}$kt$::jsonb, 27),
  ('Thaï', 'alphabet', $kt$Cours 29 · [ÉCRIT] Les abréviations, contractions orales et l’impact à l’écrit$kt$, $kt$Tracé, Graphie & Stylistique : L’oral transcrit
Dans l’univers des séries contemporaines (Lakorns), l’écriture des dialogues s’éloigne parfois du thaï académique pour calquer la prononciation rapide de la rue. Vous devez être capable de tracer et d’identifier ces raccourcis graphiques.

La mutation des pronoms à l’écrit familier :

• Le pronom ฉั น (tchan - je [femme]) se prononce presque toujours avec un ton haut très aigu à l’oral. Dans les scripts officiels ou les sous-titres thaïs, il reste écrit ฉั น mais est parfois contracté graphiquement en ชัน pour coller au débit de parole.

• Le mot เขา (khao - il/elle) se transforme phonétiquement à l’oral rapide en un ton haut perché, modifiant la courbe d’écoute habituelle.

Le symbole d’omission à tracer : ฯ (Bayan-noi)
Ce symbole se trace comme un petit crochet refermé sur lui-même. Il s’utilise pour abréger un mot trop long connu de tous.

• Exemple capital : กรุงเทพฯ (Krung Thep) = Nom abrégé officiel de la capitale, Bangkok.$kt$, $kt${"source":"manuel_pdf","course_number":29}$kt$::jsonb, 29),
  ('Thaï', 'declension', $kt$Cours 30 · [LECTURE] Le décodage des particules finales d’humeur$kt$, $kt$Théorie de la Lecture : Isoler les étiquettes d’humeur
En thaï de niveau courant, la fin d’une phrase ne se résume pas aux seuls marqueurs de politesse classiques. Elle accueille des particules finales (Sentence final particles) qui indiquent l’intention, la douceur, l’insistance ou l’ordre. Leurs silhouettes sont faciles à repérer car elles ferment l’énoncé.

Les trois particules finales clés des séries :
• นะ (na - Ton haut ou moyen) : Adoucit l’énoncé, demande l’accord, équivaut à « d’accord ? » ou « s’il te plaît ».
Exemple visuel : ไปนะ → ไป (aller) + นะ (s’il te plaît) = Paï na (On y va, s’il te plaît / d’accord ?).

• ซะ / ซิ (sa / si - Ton haut) : Marque une incitation forte, un ordre adouci, équivaut à « vas-y ! ».
Exemple visuel : กินซิ → กิน (manger) + ซิ (vas-y) = Kin si (Mange donc !).

• ละ / แล้ว (la / lǽæw) : Indique que la situation est actée, équivaut à « voilà, c’est comme ça ».$kt$, $kt${"source":"manuel_pdf","course_number":30}$kt$::jsonb, 30),
  ('Thaï', 'vocabulary', $kt$Cours 31 · [COMPRÉHENSION] Laboratoire d’Écoute & L’Argot des jeunes à Bangkok$kt$, $kt$Compréhension Orale : Scène de dispute amicale dans un café de Siam Square
Dans les séries contemporaines axées sur la jeunesse ou la vie urbaine à Bangkok, le débit s’accélère nettement. Les marqueurs formels disparaissent au profit d’un rythme syncopé.
Script audio du laboratoire d’écoute (Bright et Win) :$kt$, $kt${"source":"manuel_pdf","course_number":31}$kt$::jsonb, 31),
  ('Thaï', 'alphabet', $kt$Cours 33 · [ÉCRIT] Les connecteurs de cause et d’opposition$kt$, $kt$Tracé et Graphie : L’empilement des signes complexes
Pour lier deux propositions de manière fluide, vous devez tracer des mots de liaison qui comportent des voyelles pré-positionnées et des empilements de caractères complexes.

Le connecteur de cause : เพราะว่า (phŕ-wâa = parce que)
Analyse du tracé : C’est un mot composite. Il s’ouvre par la voyelle เ (placée devant), suivie des consonnes de base พ (classe basse) et ร (classe basse). Vient ensuite la voyelle courte _าะ (sara ao court). Le deuxième bloc s’ouvre par la consonne ว, surmontée du signe de ton tombant _้, et se clôt par la voyelle _า.

Le connecteur d’opposition : แต่ (tæ̀æ = mais)
Analyse du tracé : Il s’ouvre par la voyelle double แ_ (sara ææ long, placée obligatoirement devant la consonne), suivie de la consonne moyenne ต, surmontée du signe de ton bas _่ (mai ek).$kt$, $kt${"source":"manuel_pdf","course_number":33}$kt$::jsonb, 33),
  ('Thaï', 'rule', $kt$Cours 34 · [LECTURE] Décodage de structures argumentatives continues$kt$, $kt$Théorie de la Lecture : Cartographier les articulations logiques
Dans un paragraphe thaï compact, pour comprendre le raisonnement et les motivations des personnages, vos yeux doivent chercher les balises graphiques เพราะว่า (repérable par son ouverture en เ) et แต่ (repérable par sa double barre verticale แ).

La structure de la cause : [Proposition A] + เพราะว่า + [Proposition B / Raison]

Exemple visuel : ผมไม่ไปเพราะว่าผมเหนื่ อย → ผมไม่ไป (Je n’y vais pas) | เพราะว่า (parce que) | ผมเหนื่ อย (je suis fatigué) = Phom maï paï phŕ-wâa phom neuy (où เหนื่ อย = être fatigué).

La structure de l’opposition : [Proposition A] + แต่ + [Proposition B / Contraste]

Exemple visuel : ภาษาไทยยากแต่สนุก → ภาษาไทยยาก (La langue thaïe est difficile) | แต่ (mais) | สนุก (être amusant/drôle) = Phasa thaï yaak tæ̀æ sa-nuk.$kt$, $kt${"source":"manuel_pdf","course_number":34}$kt$::jsonb, 34),
  ('Thaï', 'vocabulary', $kt$Cours 35 · [COMPRÉHENSION] Laboratoire d’Écoute & L’Explication du Thriller$kt$, $kt$Compréhension Orale : Suivre une justification sous tension
Dans les scènes d’interrogatoire ou de révélations des thrillers thaïlandais, le débit s’accélère. Les personnages coupent très fréquemment la conjonction เพราะว่า en un simple เพราะ (phŕ) très court à l’oral. Vous devez y habituer votre oreille.
Script audio du laboratoire d’écoute (L’Inspecteur et le Témoin) :$kt$, $kt${"source":"manuel_pdf","course_number":35}$kt$::jsonb, 35),
  ('Thaï', 'alphabet', $kt$Cours 37 · [ÉCRIT] La structure de comparaison et du superlatif$kt$, $kt$Tracé et Graphie : Les marques de gradation
En thaïlandais, pour hiérarchiser des éléments ou exprimer un niveau d’excellence maximal, on utilise deux structures grammaticales fondamentales qui se positionnent systématiquement après l’adjectif qu’elles qualifient.

Le comparatif de supériorité : กว่า (kwàa = plus... que)
Analyse du tracé : S’ouvre par la consonne moyenne ก, suivie immédiatement de la consonne basse ว, surmontée du signe de ton bas _่ (mai ek), et se ferme par la voyelle _า.
Note de rigueur : Veillez à ce que le signe de ton bas soit bien positionné verticalement au-dessus du ว et non du ก.

Le superlatif absolu : ที่สุด (thîi-sùt = le plus / au maximum)
Analyse du tracé : C’est un mot composé de deux blocs graphiques distincts.

• Le premier est ที่ (thîi = consonne basse ท + signe de ton tombant _้ + voyelle _ี positionnée au-dessus).

• Le second bloc est สุด (sùt = consonne de classe haute ส + voyelle courte _ุ placée audessous + consonne finale d’arrêt ด).$kt$, $kt${"source":"manuel_pdf","course_number":37}$kt$::jsonb, 37),
  ('Thaï', 'rule', $kt$Cours 38 · [LECTURE] Décodage de structures comparatives et de rivalités$kt$, $kt$Théorie de la Lecture : Cartographier la gradation
En thaïlandais, l’adjectif est une racine lexicale invariable qui ne change jamais de forme (pas de déclinaison ou d’accord). Pour exprimer un degré d’intensité, on accole simplement les marqueurs directement derrière lui.

La structure comparative : [Entité A] + [Adjectif] + กว่า + [Entité B]

Exemple visuel : เขาดีกว่าผม → เขา (Il) | ดี (être bon) | กว่า (plus que) | ผม (moi) = Khao dii kwàa phom (Il est meilleur que moi).

La structure superlative : [Sujet] + [Adjectif] + ที่สุด

Exemple visuel : ภาษาไทยสนุกที่สุด → ภาษาไทย (La langue thaïe) | สนุก (être amusant) | ที่สุด (le plus) = Phasa thaï sa-nuk thîi-sùt (La langue thaïe est la plus amusante).$kt$, $kt${"source":"manuel_pdf","course_number":38}$kt$::jsonb, 38),
  ('Thaï', 'vocabulary', $kt$Cours 39 · [COMPRÉHENSION] Laboratoire d’Écoute & Les commérages de la comédie romantique$kt$, $kt$Compréhension Orale : Suivre les comparaisons de personnages
Dans les drames romantiques ou comédies thaïlandaises (Lakorns), les scènes d’évaluation esthétique, de jalousie ou les compliments absolus sont omniprésents. Votre oreille doit savoir isoler le son bref kwàa (ton bas sec).
Script audio du laboratoire d’écoute (Deux amies discutant d’un acteur de série) :$kt$, $kt${"source":"manuel_pdf","course_number":39}$kt$::jsonb, 39),
  ('Thaï', 'alphabet', $kt$Cours 41 · [ÉCRIT] La structure de l’action en cours (...)$kt$, $kt$Tracé et Graphie : L’encapsulation de l’action
Pour exprimer qu’une action est en train de se dérouler sous les yeux du locuteur au moment précis où l’on parle, la langue thaïe utilise une structure double et discontinue qui vient « encadrer » le verbe d’action.

Le marqueur de début : กําลัง (kam-lang = en train de / Ton moyen + Ton moyen)
Analyse du tracé : S’ouvre par la consonne moyenne ก, surmontée du signe de voyelle courte _ํ (sara am / représenté par un petit cercle supérieur), suivie de la consonne basse ล, surmontée du signe de voyelle _ั (mai han-akat) et close par la consonne finale nasale ง.

Le marqueur de fin : อยู่ (yòo = déjà abordé au cycle 4 / Ton bas)
Structure complète d’encadrement :

กําลัง + [Verbe d’action] + อยู่

Exemple écrit : กําลังไปอยู่ (kam-lang paï yòo = être en train d’aller).$kt$, $kt${"source":"manuel_pdf","course_number":41}$kt$::jsonb, 41),
  ('Thaï', 'conjugation', $kt$Cours 42 · [LECTURE] Décodage de l’aspect progressif et des flux d’actions$kt$, $kt$Théorie de la Lecture : Cartographier le présent continu
Dans un paragraphe thaï compact et non segmenté, pour identifier immédiatement l’action en cours d’un personnage, vos yeux doivent chercher en amont la balise de départ กําลัง et valider immédiatement sa fermeture par la présence de อยู่ à la fin du bloc verbal.

La structure repérable dans le texte : [Sujet] + กําลัง + [Verbe + Objet] + อยู่

Exemple visuel : ผมกําลังกินข้าวอยู่ครับ → ผม (Je) | กําลัง (en train de) | กินข้าว (manger du riz / un repas) | อยู่ครับ (particule de continuité + politesse) = Phom kam-lang kin kâao yòo krap.$kt$, $kt${"source":"manuel_pdf","course_number":42}$kt$::jsonb, 42),
  ('Thaï', 'vocabulary', $kt$Cours 43 · [COMPRÉHENSION] Laboratoire d’Écoute & L’Appel téléphonique de la série$kt$, $kt$Compréhension Orale : Intercepter les actions en cours au téléphone
Dans les Lakorns, les appels téléphoniques servent de pivots scénaristiques permanents (les personnages s’appellent continuellement pour se localiser ou synchroniser leurs actions). Votre oreille doit capter le กําลัง initial qui pose immédiatement le décor de l’action en cours.
Script audio du laboratoire d’écoute (P’Shin et Ou se coordonnant au téléphone) :$kt$, $kt${"source":"manuel_pdf","course_number":43}$kt$::jsonb, 43),
  ('Thaï', 'alphabet', $kt$Cours 45 · [ÉCRIT] Donner des ordres doux et des suggestions (..., )$kt$, $kt$Tracé et Graphie : L’écriture de la suggestion bienveillante
En thaïlandais, pour suggérer à un interlocuteur de tester ou d’expérimenter une action (comme goûter une spécialité culinaire ou regarder une série), on utilise des structures postverbales douces qui désarment la dureté de l’impératif strict.

La structure de l’essai : ลอง + [Verbe] + ดู (long... duu = essayer de / tester)
Analyse du tracé : Le mot ลอง (long = consonne basse ล + voyelle อ en fonction de support + consonne finale ง / Ton moyen). Le mot ดู (duu = consonne moyenne ด + voyelle verticale longue _ู positionnée au-dessous).

La particule d’incitation douce : สิ (si = vas-y / donc)
Analyse du tracé : S’ouvre par la consonne de classe haute ส, surmontée de la voyelle supérieure courte _ิ (sara i / représentée par un arc de cercle simple sans boucle).$kt$, $kt${"source":"manuel_pdf","course_number":45}$kt$::jsonb, 45),
  ('Thaï', 'rule', $kt$Cours 46 · [LECTURE] Décodage de consignes, conseils et invitations douces$kt$, $kt$Théorie de la Lecture : Identifier l’incitation amicale
Dans un bloc de texte thaï non segmenté, les marqueurs de suggestion ferment généralement le syntagme verbal. Vos yeux doivent cartographier le profil graphique descendant de ดู (avec sa voyelle basse) ou la silhouette haute de สิ pour décoder qu’il s’agit d’un conseil amical et non d’une injonction impérative.

La structure d’essai dans le texte : [Sujet] + ลอง + [Verbe + Objet] + ดู

Exemple visuel : คุณลองพูดภาษาไทยดูค่ะ → คุณ (vous) | ลอง (essayer) | พูดภาษาไทย (parler thaï) | ดูค่ะ (tester + politesse) = Khun long phoot phasa thaï duu kha (Essaie donc de parler thaï / Tente l’expérience).

La structure d’incitation immédiate : [Verbe] + สิ

Exemple visuel : ไปสิ → ไป (aller) + สิ (donc/vas-y) = Paï si (Vas-y ! / Allez, viens !).$kt$, $kt${"source":"manuel_pdf","course_number":46}$kt$::jsonb, 46),
  ('Thaï', 'vocabulary', $kt$Cours 47 · [COMPRÉHENSION] Laboratoire d’Écoute & Les conseils de l’ami proche$kt$, $kt$Compréhension Orale : Intercepter les suggestions amicales
Dans les Lakorns, les scènes de réconfort ou d’échange de conseils intimes regorgent de ces structures. Votre oreille doit apprendre à identifier le glissement du ดู final ou de la particule สิ qui vient adoucir la directivité de l’action.
Script audio du laboratoire d’écoute (Min conseillant Yuna au sujet d’un plat thaï) :$kt$, $kt${"source":"manuel_pdf","course_number":47}$kt$::jsonb, 47),
  ('Thaï', 'alphabet', $kt$Cours 49 · [ÉCRIT] La structure de l’hypothèse (...) et de la condition$kt$, $kt$Tracé et Graphie : L’écriture de la condition indéterminée
Pour poser un cadre hypothétique (« si... alors... »), la langue thaïe utilise un mot pivot indispensable à placer impérativement en tête de la proposition subordonnée : ถ้า (thâa = si).

Analyse du tracé de ถ้า (thâa) :
• Il s’ouvre graphiquement par la voyelle double แ_ (sara ææ long), qui s’écrit toujours devant la consonne qu’elle modifie.

• Vient ensuite la consonne de classe haute ถ (to thung). Le cercle initial commence par le bas et remonte vers l’intérieur de la lettre.

• Le signe de ton tombant _้ (mai tho) se place de manière équilibrée juste au-dessus de la consonne ถ.

Le corrélatif de conséquence : ก็ (ĝ = alors / aussi)
Pour marquer l’articulation du « alors », le thaï peut optionnellement ouvrir la seconde proposition (la principale) par le mot ก็. Ce mot s’écrit de manière compacte avec la consonne moyenne ก surmontée du signe Mai taï-khu (_็).$kt$, $kt${"source":"manuel_pdf","course_number":49}$kt$::jsonb, 49),
  ('Thaï', 'rule', $kt$Cours 50 · [LECTURE] Décodage de dilemmes et de choix de personnages$kt$, $kt$Théorie de la Lecture : Cartographier le scénario conditionnel
Dans un paragraphe thaï compact et non segmenté, pour comprendre les dilemmes ou les choix stratégiques des personnages, vos yeux doivent chercher en amorce l’ouverture graphique ถ surmontée de la double barre แ en début de phrase.

La structure type dans le texte : ถ้า + [Condition] + (ก็) + [Conséquence / Action future]

Exemple visuel : ถ้าผมมีเงินผมจะซื้อบ้านครับ → ถ้า (si) | ผมมีเงิน (j’ai de l’argent) | ผมจะซื้อบ้าน (j’achèterai une maison) | ครับ (particule de politesse) = Thâa phom mii ngern, phom ja seu baan krap (où เงิน = argent, et ซื้อบ้าน = acheter une maison).$kt$, $kt${"source":"manuel_pdf","course_number":50}$kt$::jsonb, 50),
  ('Thaï', 'vocabulary', $kt$Cours 51 · [COMPRÉHENSION] Laboratoire d’Écoute & Les dilemmes du suspense$kt$, $kt$Compréhension Orale : Suivre les théories de personnages
Dans les scènes d’explications des drames psychologiques ou thrillers thaïlandais, les personnages échafaudent constamment des théories ou font face à des choix cornéliens. Vous devez éduquer votre oreille à intercepter le ถ้า initial qui suspend temporairement la mélodie de la phrase.

Script audio du laboratoire d’écoute (Bright et Win analysant une situation com-
plexe) :

ไบรท์ (Bright) : ถ้าเราไม่ไปหาเขาตอนนี้ เขาจะเสียใจมาก ๆ นะครับ
(Si nous n’allons pas le voir maintenant, il sera vraiment très triste, d’accord ? / ตอนนี้ = maintenant, เสียใจ = être triste).

วิน (Win) : แต่ถ้าไปตอนนี้ วันนี้เราจะทํางานไม่ทันครับ
(Mais si on y va maintenant, nous ne finirons pas le travail à temps aujourd’hui / ไม่ทัน = pas à temps / en retard).

ไบรท์ (Bright) : ถ้าคุณช่วยผม เราก็จะทํางานทันครับ ไปกันเถอะนะ
(Si tu m’aides, alors nous finirons le travail à temps. Allons-y ensemble s’il te plaît / ช่วย = aider, ไปกันเถอะ = allons-y ensemble).$kt$, $kt${"source":"manuel_pdf","course_number":51}$kt$::jsonb, 51),
  ('Thaï', 'alphabet', $kt$Cours 53 · [ÉCRIT] Le style indirect et le discours rapporté$kt$, $kt$Tracé et Graphie : L’écriture de la complétive
Pour rapporter de manière fluide les propos, les pensées ou les déclarations d’une tierce personne (« Il a dit que... » / « Elle pense que... »), la syntaxe thaïe déploie une structure verbale double et indissociable : บอกว่า (bawk wâa).

Analyse du tracé de บอกว่า (bawk wâa) :
• Le premier bloc est le verbe dire : บอก (bawk - Ton bas). Il s’ouvre par la consonne moyenne บ, suivie de la consonne muette de support vocalique อ, et se ferme par la consonne moyenne finale d’arrêt ก.

• Le second bloc est la conjonction de subordination : ว่า (wâa - Ton tombant). Il s’ouvre par la consonne basse ว, surmontée du signe de ton bas _่ (mai ek) et se ferme par la voyelle _า.

Note réglementaire de ton : Une consonne de classe basse conjuguée avec un mai ek produit de manière automatique et mécanique un ton tombant accentué.$kt$, $kt${"source":"manuel_pdf","course_number":53}$kt$::jsonb, 53),
  ('Thaï', 'rule', $kt$Cours 54 · [LECTURE] Décodage de rumeurs, secrets et quiproquos continus$kt$, $kt$Théorie de la Lecture : Isoler le flux de l’information rapportée
En thaïlandais, la structure du style indirect est d’une grande simplicité puisqu’elle ne requiert aucune modification de temps verbal ni de pronom au sein de la proposition citée. Vos yeux doivent chercher la balise visuelle stable บอกว่า pour baliser le passage des paroles rapportées.

La structure type dans le texte : [Sujet A] + บอกว่า + [Propos rapportés substan-
tiels]

Exemple visuel : เพื่อนบอกว่าภาษาไทยสนุกมากค่ะ → เพื่อน (l’ami) | บอกว่า (a dit que) | ภาษาไทยสนุกมาก (la langue thaïe est très amusante) | ค่ะ (politesse) = Pheuan bawk wâa phasa thaï sa-nuk maak kha.$kt$, $kt${"source":"manuel_pdf","course_number":54}$kt$::jsonb, 54),
  ('Thaï', 'vocabulary', $kt$Cours 55 · [COMPRÉHENSION] Les secrets révélés du Lakorn$kt$, $kt$Compréhension Orale : Intercepter les rumeurs et les confidences
Dans les tournants scénariques majeurs des Lakorns, les malentendus et quiproquos reposent presque toujours sur ce qu’un personnage a rapporté au sujet d’un autre. À l’oral rapide, le mot ว่า (wâa) est très fortement accentué sur son ton tombant, ce qui vous procure un excellent jalon acoustique.
Script audio du laboratoire d’écoute (Min et Seo-yeon échangeant des confidences) :$kt$, $kt${"source":"manuel_pdf","course_number":55}$kt$::jsonb, 55),
  ('Thaï', 'alphabet', $kt$Cours 57 · [ÉCRIT] Les registres formels et l’écriture des marqueurs de respect$kt$, $kt$Tracé et Graphie : L’écriture des marques de gradation
En thaïlandais, pour modifier le registre d’une phrase (passer du langage de la rue au langage administratif, professionnel ou poli), on ne modifie pas la structure de la grammaire, mais on substitue les mots courants par des équivalents plus raffinés et soutenus.

Les mutations lexicales formelles à tracer (À mémoriser) :

• Manger : กิน (kin - courant) → รับประทาน (rap-pra-than - formel / écrit).
Analyse du tracé : รับ (consonne basse ร + voyelle courte _ั + consonne finale บ) | ประ (consonne moyenne ป + consonne basse ร + particule de brièveté _ะ) | ทาน (consonne basse ท + voyelle longue _า + consonne finale น).

• Le pronom de respect : ท่าน (than - Sa seigneurie / Vous de haute déférence / Ton tombant). S’écrit avec la consonne basse ท, surmontée du signe de ton bas _่ (mai ek), la voyelle _า, et la finale nasale น.

• Le préfixe honorifique/sacré : พระ (phra - sacré / royal / Ton haut). S’écrit avec la consonne basse พ + consonne basse ร + particule de brièveté _ะ.$kt$, $kt${"source":"manuel_pdf","course_number":57}$kt$::jsonb, 57),
  ('Thaï', 'rule', $kt$Cours 58 · [LECTURE] Décodage de textes administratifs et de scripts historiques$kt$, $kt$Théorie de la Lecture : Cartographier les strates sociales
Dans un texte thaï formel ou un résumé d’un épisode de série historique (Lakorn d’époque), la présence des marqueurs graphiques comme พระ (phra) ou ท่าน (than) vous indique instantanément que les personnages s’adressent à une autorité (royauté, moines bouddhistes, hauts fonctionnaires ou cadres dirigeants).

La structure de déférence dans le texte : [Titre / Pronom Honorifique] + [Verbe
Formel]

Exemple visuel : ท่านรับประทานอาหารค่ะ → ท่าน (Leur seigneurie / Vous) | รับประทาน (consommer) | อาหารค่ะ (nourriture + politesse) = Than rap-pra-than aa-han kha (Vous prenez votre repas [soutenu]).$kt$, $kt${"source":"manuel_pdf","course_number":58}$kt$::jsonb, 58),
  ('Thaï', 'vocabulary', $kt$Cours 59 · [COMPRÉHENSION] Les registres verticaux et le langage des séries historiques$kt$, $kt$Compréhension Orale : Intercepter les rapports de force et d’autorité
Dans les séries thaïes, la façon dont deux personnages s’adressent l’un à l’autre révèle immédiatement leur place dans la hiérarchie sociale ou leur niveau de conflit. L’oreille doit capter les pronoms spécifiques qui se substituent à คุณ (khun) ou ฉั น/ผม (tchan/phom).
Script audio du laboratoire d’écoute (Un employé s’adressant respectueusement à$kt$, $kt${"source":"manuel_pdf","course_number":59}$kt$::jsonb, 59),
  ('Thaï', 'alphabet', $kt$Cours 61 · [ÉCRIT] Syntaxe avancée, synthèse des structures complexes et révisions$kt$, $kt$Rigueur de la Graphie : L’empilement ultime
Au niveau d’autonomie intermédiaire, vous devez être capable de tracer des phrases longues et fluides sans commettre d’erreur d’étagement (alignement vertical de la consonne, de la voyelle basse/haute et du signe de ton).

Le piège de la superposition :

Rappelez-vous que sur une même consonne verticale, le signe de ton (ex : _้) se place toujours au-dessus de la voyelle supérieure (ex : _ี). Les éléments ne doivent jamais se chevaucher de manière illisible.

La règle de la cascade de fin de phrase :
L’écrit doit refléter exactement l’ordre oral des extensions et des étiquettes d’humeur :

[Verbe] + [Objet] + [Marqueur de passé : ] + [Particule d’humeur : ] +
[Politesse : /]

Exemple à tracer : กินข้าวแล้วนะคะ (kin-kâao-lǽæw-na-kha = J’ai déjà mangé, d’accord ?).$kt$, $kt${"source":"manuel_pdf","course_number":61}$kt$::jsonb, 61);

-- Ressources web et documents locaux (remplace les valeurs de 017/018, accents corrigés)
update public.language_recap_sections
set data = data || jsonb_build_object('web_resources', case language
    when 'Allemand' then jsonb_build_array(jsonb_build_object('type', 'audio', 'title', $kt$DW Deutschtrainer$kt$, 'url', 'https://learngerman.dw.com/en/deutschtrainer/c-56705009'), jsonb_build_object('type', 'video', 'title', $kt$DW Nicos Weg$kt$, 'url', 'https://learngerman.dw.com/en/nicos-weg/c-36519789'))
    when 'Espagnol' then jsonb_build_array(jsonb_build_object('type', 'document', 'title', $kt$Instituto Cervantes · ressources ELE$kt$, 'url', 'https://cvc.cervantes.es/ensenanza/'))
    when 'Italien' then jsonb_build_array(jsonb_build_object('type', 'video', 'title', $kt$Rai Scuola$kt$, 'url', 'https://www.raiscuola.rai.it/'))
    when 'Japonais' then jsonb_build_array(jsonb_build_object('type', 'video', 'title', $kt$Irodori · vidéo de présentation$kt$, 'url', 'https://youtu.be/q4HUrMsh2uY'), jsonb_build_object('type', 'document', 'title', $kt$Irodori · supports pédagogiques$kt$, 'url', 'https://www.irodori.jpf.go.jp/resources.html'))
    when 'Coréen' then jsonb_build_array(jsonb_build_object('type', 'link', 'title', $kt$Institut King Sejong$kt$, 'url', 'https://www.iksi.or.kr/'))
    when 'Néerlandais' then jsonb_build_array(jsonb_build_object('type', 'document', 'title', $kt$Naar Nederland · auto-apprentissage$kt$, 'url', 'https://www.naarnederland.nl/zelfstudiepakket'), jsonb_build_object('type', 'link', 'title', $kt$Naar Nederland · e-learning$kt$, 'url', 'https://elearning.naarnederland.nl/examen/registration/login.spring'))
    when 'Thaï' then jsonb_build_array(jsonb_build_object('type', 'link', 'title', $kt$Thai Language$kt$, 'url', 'https://www.thai-language.com/'))
  else '[]'::jsonb
end),
updated_at = now()
where section_type in ('alphabet', 'vocabulary', 'rule', 'declension', 'conjugation');

update public.language_recap_sections
set data = data || jsonb_build_object('local_documents', jsonb_build_array(
  jsonb_build_object('title', 'Alphabet.odt', 'url', '/documents/Alphabet.odt'),
  jsonb_build_object('title', 'Conjugaison.odt', 'url', '/documents/Conjugaison.odt')
)),
updated_at = now()
where section_type in ('alphabet', 'conjugation');

commit;

-- Contrôle : select language, section_type, count(*) from public.language_recap_sections group by 1, 2 order by 1, 2;
