-- Keltia : contenu réel des 32 cours d'espagnol (source : manuel Espagnol.pdf).
-- Cible uniquement la bibliothèque Plan & Plate (language_courses / language_exercises).
-- Ne touche PAS au planning (weekly_schedule_items).
-- Relançable sans risque : les cours sont mis à jour par (language, course_number),
-- les exercices du manuel sont recréés, les exercices ajoutés par les membres sont conservés.

begin;

-- 1) Cours : titre, objectif, théorie et exemples réels ; plus de « Semaine X » (hors planning)
insert into public.language_courses (language, course_number, title, summary, theory, examples, week_number)
values
  ('Espagnol', 1, $kt$Cours 1 · Salutations, présentations et alphabet$kt$, $kt$Savoir saluer, se présenter brièvement et maîtriser les règles de prononciation de base.$kt$, $kt$Lecture
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
— Ressource audio : Écoutez la prononciation exacte sur Forvo ou SpanishDict.$kt$, $kt$Mateo : ¡Hola ! Buenos días. ¿Cómo te llamas ? · Elena : ¡Hola ! Me llamo Elena. ¿Y tú ? · Mateo : Yo soy Mateo. ¿Qué tal estás ? · Elena : Muy bien, gracias. ¿Y tú ? · Mateo : Regular, estoy un poco cansado. ¿Cómo se escribe tu apellido ? · Elena : Mi apellido es García. Se escribe con ce y con acento en la i.$kt$, null),
  ('Espagnol', 2, $kt$Cours 2 · L’identité et les chiffres$kt$, $kt$Exprimer sa nationalité, sa profession, donner son âge et utiliser les chiffres de 0 à 30.$kt$, $kt$Grammaire & Conjugaison : Ser vs Tener
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
20 Venezolano / Venezolana vénézuélien(ne) Empresario / Empresaria chef d’entreprise$kt$, $kt$“¡Hola a todos ! Me llamo Alejandro. Soy colombiano y soy ingeniero. Vivo en Madrid y tengo 28 (veintiocho) años. Mi número de teléfono es el 612 345 789.”$kt$, null),
  ('Espagnol', 3, $kt$Cours 3 · Description physique et psychologique$kt$, $kt$Décrire l’apparence physique et le caractère d’une personne, avec l’accord des adjectifs en genre et en nombre.$kt$, $kt$Grammaire : L’accord de genre et de nombre
En espagnol, la règle générale pour accorder les adjectifs est simple :
— Masculin en -o → Féminin en -a (alto/alta).
— Invariable en genre (se termine par -e ou une consonne) : inteligente, joven.
— Pluriel : +s après une voyelle (altos), +es après une consonne (azul → azules).

Vocabulaire : Banque d’adjectifs de description
Physique

Alto/Bajo (Grand/Petit), Delgado/Gordo (Mince/Gros), Guapo/Feo (Beau/Laid), Joven/Viejo (Jeune/Vieux), Fuerte/Débil (Fort/Faible), Castaño/Rubio/Moreno/Pelirrojo (Châtain/Blond/Brun/Roux)

Caractère

Simpático/Antipático (Sympatique/Antipatique), Inteligente (Intelligent), Tímido/Extrovertido (Timide/Extraverti), Trabajador/Trabajadora (Travailleur), Perezoso/Perezosa (Paresseux), Alegre/Triste (Joyeux/Triste), Amable (Aimable, gentil),
Paciente/Impaciente (Patient/Impatient)$kt$, $kt$“Mi amigo Luis es alto y tiene el pelo corto y negro. Es un chico muy simpático y alegre. · Su hermana Sofía es baja, tiene los ojos azules y es un poco tímida.”$kt$, null),
  ('Espagnol', 4, $kt$Cours 4 · La famille et l’entourage$kt$, $kt$Présenter les membres de sa famille, utiliser les adjectifs possessifs et introduire les goûts simples.$kt$, $kt$Grammaire : Les Possessifs & le verbe Gustar
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
— Viajar : Voyager$kt$, $kt$“En mi familia somos cuatro personas : mi padre, mi madre, mi hermano mayor y yo. Mi hermano se llama Javier y tiene 20 años. A mi madre le gusta mucho leer y a mi padre le gusta cocinar los fines de semana.”$kt$, null),
  ('Espagnol', 5, $kt$Cours 5 · Le temps qui passe (L’heure, l’agenda et le climat)$kt$, $kt$Demander et dire l’heure, nommer les jours/mois et parler de la météo.$kt$, $kt$Grammaire & Conjugaison : Exprimer l’heure et le temps
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
Audio de référence : Écoutez les jours et les heures énoncés distinctement sur SpanishDict Hours.$kt$, $kt$Sofía : Carlos, ¿qué hora es ? ¿Tienes hora ? · Carlos : Sí, son las tres y media. ¿Por qué ? · Sofía : Porque mi clase de español es a las cuatro menos cuarto. ¡Voy tarde ! · Carlos : No te preocupes. Mañana es sábado y no hay clases. Además, hoy hace muy buen tiempo, podemos caminar. · Sofía : Es verdad, hace sol. Pero en noviembre siempre llueve beaucoup en Madrid.$kt$, null),
  ('Espagnol', 6, $kt$Cours 6 · La routine quotidienne$kt$, $kt$Utiliser les verbes pronominaux et réguliers pour décrire une journée type.$kt$, $kt$Grammaire : Les verbes réguliers et pronominaux
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
— Volver (o → ue) = Rentrer, revenir$kt$, $kt$"Todos los días me despierto a las siete de la mañana. Me levanto, me ducho y desayuno un café con tostadas. Salgo de casa a las ocho. Trabajo de nueve a cinco. Por la tarde, vuelvo a casa y me acuesto a las once de la noche."$kt$, null),
  ('Espagnol', 7, $kt$Cours 7 · Les loisirs, invitations et verbes à changements$kt$, $kt$Parler de ses passe-temps et maîtriser les verbes à diphtongue et affaiblissement (Querer, Soler, Jugar).$kt$, $kt$Grammaire : Les verbes à modifications radicales (Diphtongues)
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
— Quedar con amigos = Donner rendez-vous / voir des amis$kt$, $kt$Lucas : María, ¿qué quieres hacer este fin de semana ? · María : Yo suelo jugar al tenis los sábados, pero este sábado prefiero ir al cine. ¿Te apetece ? · Lucas : ¡Claro ! Yo también puedo ir. ¿A qué hora quedamos ?$kt$, null),
  ('Espagnol', 8, $kt$Cours 8 · Bilan du Module 1$kt$, $kt$Évaluer et valider l’ensemble des compétences acquises (Cours 1 à 7).$kt$, $kt$Lecture
Lisez ce texte d’un correspondant espagnol.$kt$, $kt$"¡Hola ! Me llamo Javier Ortega, soy médico y tengo treinta y dos años. Soy de Sevilla, pero vivo y trabajo en Madrid. Mi rutina es muy simple : me levanto a las seis y media de la mañana, me ducho, desayuno y voy al hospital. Trabajo muchas horas. Los fines de semana me gusta descansar. Si hace buen tiempo, suelo jugar al fútbol con mis amigos o visito a mis abuelos. No me gusta nada el frío."$kt$, null),
  ('Espagnol', 9, $kt$Cours 9 · La ville, les déplacements et l’orientation$kt$, $kt$Demander son chemin, indiquer une direction, localiser des lieux et maîtriser la distinction cruciale entre Estar et Hay.$kt$, $kt$Grammaire & Conjugaison : L’existence (Hay) vs La localisation (Estar)
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
— En la esquina : Au coin / À l’angle de la rue$kt$, $kt$Turista : ¡Disculpe, señor ! ¿Sabe si hay una farmacia cerca de aquí ? · Local : Sí, claro. Mira, la farmacia más cercana está al final de esta calle, justo al lado del supermercado. · Turista : ¿Se puede ir a pie o está muy lejos ? · Local : Está bastante cerca, a unos cinco minutos. Tienes que cruzar la avenida, girar a la derecha en la esquina y seguir todo recto. · Turista : Excelente, muchas gracias por su ayuda. · Local : De nada, ¡buen viaje !$kt$, null),
  ('Espagnol', 10, $kt$Cours 10 · Au restaurant et faire les courses$kt$, $kt$Commander à manger, exprimer ses besoins et obligations complexes (Tener que / Hay que), et maîtriser le vocabulaire gastronomique.$kt$, $kt$Grammaire : L’obligation personnelle (Tener que) vs impersonnelle (Hay que)
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
— Bebidas (Boissons) : El vino tinto/blanco (le vin rouge/blanc), la cerveza (la bière), el café, el zumo de naranja (le jus d’orange).$kt$, $kt$Camarero : Buenas tardes, ¿qué desean tomar de primer plato ? · Cliente : Para mí, de primero tengo que probar el gazpacho, y de segundo plato quiero el pescado del día. · Camarero : Excelente. ¿Y para beber ? · Cliente : Agua mineral sin gas, por favor. ¿Hay que pedir el postre ahora o después ? · Camarero : Como prefiera, puede pedirlo después. · [Al final de la comida] : ¡Camarero, la cuenta, por favor !$kt$, null),
  ('Espagnol', 11, $kt$Cours 11 · Les achats, les vêtements et la comparaison$kt$, $kt$Acheter des vêtements, donner son avis sur un produit, utiliser les démonstratifs (este, ese, aquel) et exprimer des comparaisons.$kt$, $kt$Grammaire & Conjugaison : Les Démonstratifs & La Comparaison
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

— La talla (La taille), el precio (Le prix), caro / barato (Cher / Bon marché), cómodo / incómodo (Confortable / Inconfortable).$kt$, $kt$"En esta tienda de ropa, este vestido rojo es más caro que esa falda azul. Sin embargo, los pantalones negros son tan cómodos como los vaqueros. Creo que voy a comprar estos zapatos porque son mejores que aquellos."$kt$, null),
  ('Espagnol', 12, $kt$Cours 12 · Le logement et l’espace habitable$kt$, $kt$Décrire en détail sa maison ou son appartement, situer précisément des objets dans l’espace avec des prépositions avancées.$kt$, $kt$Grammaire : Les prépositions et locutions de lieu
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
— El sofá (Le canapé), la mesa (La table), la silla (La chaise), la cama (Le lit), el armario (L’armoire), la lámpara (La lampe), el espejo (Le miroir).$kt$, $kt$"Vivo en un piso amplio y muy luminoso en el centro de Madrid. Tiene un salón grande, una cocina totalmente equipada, dos dormitorios y un quarto de baño. Mi lugar favorito es el salón, donde mi sofá está entre la ventana y la estantería de libros. Encima de la mesa siempre hay flores frescas."$kt$, null),
  ('Espagnol', 13, $kt$Cours 13 · Parler du passé proche (Le Passé Composé / Pretérito Perfecto)$kt$, $kt$Évoquer des actions passées qui ont encore un lien avec le présent ou qui se déroulent dans une unité de temps non terminée (aujourd’hui, cette semaine).$kt$, $kt$Grammaire & Conjugaison : Le Pretérito Perfecto
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
— Organizar los documentos = Organiser les documents$kt$, $kt$Lucía : Hola Carlos, ¿qué has hecho esta mañana ? · Carlos : Hola. Hoy he tenido mucho trabajo. He escrito tres correos electrónicos, he hablado con mi jefe y he comido una ensalada rápida. ¿Y tú ? · Lucía : Yo he ido al gimnasio y esta semana he estudiado mucho español porque tengo un examen.$kt$, null),
  ('Espagnol', 14, $kt$Cours 14 · Raconter un souvenir d’enfance (L’Imparfait / Pretérito Imperfecto)$kt$, $kt$Décrire des habitudes passées, des souvenirs d’enfance, des paysages ou des états d’esprit dans le passé.$kt$, $kt$Grammaire & Conjugaison : L’Imparfait
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
— Los juguetes / Los dibujos animados = Les jouets / Les dessins animés$kt$, $kt$"Cuando era niño, vivía en un pueblo muy pequeño cerca del mar. Todos los veranos, mis amigos y yo jugábamos al fútbol en la playa y nadábamos por la tarde. Nosotros éramos muy felices."$kt$, null),
  ('Espagnol', 15, $kt$Cours 15 · Exprimer la douleur et la santé$kt$, $kt$Décrire des symptômes physiques, utiliser la structure du verbe Doler, et interagir avec un professionnel de la santé.$kt$, $kt$Grammaire & Conjugaison : Le verbe Doler (Faire mal)
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
— guardar cama (rester au lit).$kt$, $kt$Médico : Buenas tardes, ¿qué le pasa ? ¿Dónde le duele ? · Paciente : Buenas tardes, doctor. Me duele mucho la cabeza y tengo fiebre desde anoche. · También me duelen los ojos. · Médico : Está bien, tiene una infección leve. Tiene que tomar este medicamento dos veces al día y descansar mucho.$kt$, null),
  ('Espagnol', 16, $kt$Cours 16 · Bilan du Module 2$kt$, $kt$Valider l’autonomie dans la vie quotidienne et la maîtrise des deux premiers temps du passé (Perfecto et Imperfecto).$kt$, $kt$Lecture
Lisez cet extrait du journal de bord d’un voyageur.$kt$, $kt$"Esta semana ha sido increíble. El lunes visité el centro histórico y comí platos típicos excelentes. El apartamento donde me estoy quedando es pequeño pero está muy cerca de los museos. Ayer me dolió un poco la espalda de tanto caminar, pero hoy ya estoy mejor. Cuando era más joven, no me gustaba tanto viajar, pero ahora me encanta descubrir nuevas ciudades y hablar con la gente local."$kt$, null),
  ('Espagnol', 17, $kt$Cours 17 · Raconter une action ponctuelle (Le Passé Simple Régulier / Pretérito Indefinido)$kt$, $kt$Raconter une action passée, datée et complètement terminée, sans lien direct avec le présent.$kt$, $kt$Grammaire & Conjugaison : Le Pretérito Indefinido Régulier
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
— El recuerdo / La postal : Le souvenir (objet) / La carte postale$kt$, $kt$Sofía : Hola Diego, ¿qué tal el viaje ? ¿Cuándo llegaste a Madrid ? · Diego : ¡Hola ! Llegué el pasado lunes. El martes visité el Museo del Prado y comí una paella increíble en el centro. · Sofía : ¡Qué bien ! ¿Y compraste muchas cosas ? · Diego : Sí, escribí unas postales para mi familia y compré algunos recuerdos. El viaje terminó ayer, ¡pero me encantó !$kt$, null),
  ('Espagnol', 18, $kt$Cours 18 · Maîtriser les irrégularités majeures du Passé Simple$kt$, $kt$Conjuguer et utiliser les verbes irréguliers les plus fréquents au Pretérito Indefinido.$kt$, $kt$Grammaire & Conjugaison : Les Irréguliers du Pretérito Indefinido
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
— Estar de vacaciones : Être en vacances$kt$, $kt$"El sábado pasado fue un día muy intenso. Mis hermanos y yo fuimos a la montaña. Allí hicimos una excursión muy larga. Por la tarde, yo le dije a mi hermano que tenía hambre. Él puso la comida sobre la mesa y todos tuvimos un momento muy agradable."$kt$, null),
  ('Espagnol', 19, $kt$Cours 19 · Alterner les temps du passé (Imparfait vs Passé Simple)$kt$, $kt$Choisir correctement entre le décor/l’habitude (Imperfecto) et l’action soudaine/déclenchante (Indefinido) au sein d’un même récit.$kt$, $kt$Grammaire : La règle de l’alternance
— Pretérito Imperfecto (L’arrière-plan) : On l’utilise pour décrire le décor, la situation en cours, l’état d’esprit, le temps qu’il faisait. C’est l’action qui durait dans le temps (Ex : Yo leía = Je lisais).
— Pretérito Indefinido (L’action de premier plan) : On l’utilise pour l’événement soudain, l’action qui interrompt la situation ou qui fait avancer l’histoire (Ex : El teléfono sonó = Le téléphone a sonné).

Vocabulaire Enrichi : Connecteurs de rupture et de narration
— De repente / De pronto = Soudain / Tout à coup
— Mientras = Pendant que / Tandis que
— Entonces / Luego = Alors / Ensuite
— Al final = Finalement / À la fin$kt$, $kt$"Ayer a las ocho de la tarde, hacía un tiempo magnífico y el sol brillaba. Yo estaba tranquilamente en mi habitación y leía un libro de aventuras. De repente, el teléfono sonó y mi amigo me dijo que se compró un coche nuevo."$kt$, null),
  ('Espagnol', 20, $kt$Cours 20 · Projets et avenir (Le Futur et le Futur Proche)$kt$, $kt$Exprimer des projets d’avenir, faire des prédictions et utiliser la structure Ir a + Infinitif.$kt$, $kt$Grammaire & Conjugaison : Le Futur Proche et le Futur de l’Indicatif
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
— Mudarse de casa = Déménager$kt$, $kt$Mateo : ¿Qué vas a hacer el próximo año, Elena ? · Elena : El próximo año voy a estudiar en el extranjero. Viviré en Buenos Aires, aprenderé mucho sobre su cultura y trabajaré a tiempo parcial. ¿Y tú ? · Mateo : Yo me quedaré aquí, buscaré un nuevo empleo y compraré un piso si tengo suficiente dinero.$kt$, null),
  ('Espagnol', 21, $kt$Cours 21 · Donner des ordres et des conseils (L’Impératif Affirmatif)$kt$, $kt$Maîtriser l’impératif affirmatif régulier et irrégulier pour donner des instructions, des directions ou des conseils professionnels.$kt$, $kt$Grammaire & Conjugaison : L’Impératif
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
— Firmar un documento = Signer un document$kt$, $kt$Jefe (a Carlos) : Carlos, pasa a mi despacho, por favor. Escucha con atención : habla hoy mismo con el cliente y escribe el informe antes de las cinco. · Jefe (al becario) : Juan, usted lea este contrato con calma y firme aquí abajo, por favor.$kt$, null),
  ('Espagnol', 22, $kt$Cours 22 · Le monde du travail, l’entreprise et le CV$kt$, $kt$Parler de ses compétences professionnelles, décrire son parcours et comprendre les termes d’une offre d’emploi ou d’un CV.$kt$, $kt$Grammaire : Exprimer la durée et la continuité
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
— Las habilidades / Las competencias = Les compétences, les atouts$kt$, $kt$« Mi nombre es Sofía y busco un empleo en el sector tecnológico. Tengo una licenciatura en Informática y tres años de experiencia laboral como desarrolladora de software. En mi último puesto, trabajé en equipo, gestioné proyectos complejos y mejoré mis habilidades técnicas. Hablo español e inglés con fluidez. »$kt$, null),
  ('Espagnol', 23, $kt$Cours 23 · Téléphone et communication formelle$kt$, $kt$Passer un appel professionnel, prendre un rendez-vous et utiliser les formules de politesse de base à l’écrit et à l’oral.$kt$, $kt$Grammaire : Le Conditionnel de Courtoisie
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
— Atentamente / Un cordial saludo (Veuillez agréer... / Cordialement – Fin de mail)$kt$, $kt$Secretaria : ¡Buenas tardes ! Empresa TechSolutions, ¿en qué puedo ayudarle ? · Cliente : Buenas tardes. Querría hablar con el señor Martínez, por favor. · Secretaria : Un momento, por favor. Lo siento, el señor Martínez está en una reunión. · ¿Quiere dejar un mensaje ? · Cliente : Sí, por favor. Dígale que llamó el señor Gómez. Volveré a llamar más tarde. · Gracias, un saludo cordial.$kt$, null),
  ('Espagnol', 24, $kt$Cours 24 · Bilan du Module 3$kt$, $kt$Évaluer et consolider l’autonomie dans les contextes formels et narratifs complexes.$kt$, $kt$Lecture
Offre d’emploi fictive dans un journal de Madrid.$kt$, $kt$« Empresa líder en turismo busca un administrativo para su oficina central. Requisitos : Licenciatura en administración o turismo, experiencia laboral mínima de dos años y nivel alto de español. Funciones : Responder al teléfono, redactar correos formales a clientes internacionales y organizar la agenda del equipo. Se ofrece contrato indefinido y sueldo competitivo. Interesados, envíen su CV antes del viernes. »$kt$, null),
  ('Espagnol', 25, $kt$Cours 25 · Exprimer l’hypothèse et la condition (Le Conditionnel Présent)$kt$, $kt$Imaginer des situations hypothétiques, exprimer des désirs réalisables ou irréalisables et formuler des suppositions.$kt$, $kt$Grammaire & Conjugaison : Le Conditionnel Présent
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
— Hacer realidad un sueño = Réaliser un rêve$kt$, $kt$Elena : Si tuviera más tiempo libre, viajaría por toda América Latina. ¿Qué harías tú con un millón de euros ? · Mateo : ¡Qué buena pregunta ! Yo compraría una casa grande frente al mar y abriría un restaurante propio. Además, ayudaría a mi familia y viajaría contigo.$kt$, null),
  ('Espagnol', 26, $kt$Cours 26 · Introduction au Subjonctif Présent (Souhait et Désir)$kt$, $kt$Comprendre la formation du subjonctif présent et l’utiliser pour exprimer un souhait, une volonté ou un désir avec la structure Querer/Esperar que.$kt$, $kt$Grammaire & Conjugaison
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
— Tener la esperanza de que... = Avoir l’espoir que...$kt$, $kt$Madre : Hijo, quiero que estudies para el examen de mañana. Espero que saques una buena nota. · Hijo : Sí, mamá. Yo también espero que el examen sea fácil y que nosotros terminemos temprano para poder salir con mis amigos.$kt$, null),
  ('Espagnol', 27, $kt$Cours 27 · Exprimer l’opinion, la certitude et le doute$kt$, $kt$Maîtriser la bascule Indicatif / Subjonctif selon que l’on exprime une certitude ou un doute/négation.$kt$, $kt$Grammaire : La bascule Indicatif / Subjonctif
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
— No cabe duda de que... (+ indicatif) = Il ne fait aucun doute que...$kt$, $kt$« Creo que el cambio climático es el mayor problema de nuestro siglo. Sin embargo, no creo que los gobiernos hagan lo suficiente para resolverlo. Es evidente que necesitamos cambiar nuestros hábitos, pero dudo que sea un process rápido. »$kt$, null),
  ('Espagnol', 28, $kt$Cours 28 · Les connecteurs logiques et l’argumentation$kt$, $kt$Structurer un discours complexe, lier des idées opposées ou consécutives pour mener un débat écrit ou oral.$kt$, $kt$Grammaire : Les familles de connecteurs
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
— En conclusión (En conclusion)$kt$, $kt$"Aprender un segundo idioma es fundamental en el mundo globalizado. Por un lado, abre muchas puertas profesionales ; por otro lado, nos permite entender otras culturas. Sin embargo, requiere mucha constancia. Por lo tanto, hay que estudiar un poco todos los días, aunque a veces sea difícil encontrar tiempo."$kt$, null),
  ('Espagnol', 29, $kt$Cours 29 · Les médias, la technologie et l’actualité$kt$, $kt$Suivre les actualités, donner son point de vue sur les réseaux sociaux et l’évolution des médias en utilisant l’indicatif et le subjonctif de manière fluide.$kt$, $kt$Grammaire : Les tournures affectives impersonnelles (Es + Adjectif + Que)
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
— Descargar una aplicación = Télécharger une application$kt$, $kt$"Hoy en día, la mayoría de las personas se informan a través de las redes sociales en lugar de leer el periódico en papel. Por un lado, esto permite un acceso inmediato a la actualidad ; por otro lado, aumenta el riesgo de leer noticias falsas (bulos). Es preocupante que muchos jóvenes no comprueben la veracidad de la información antes de compartirla."$kt$, null),
  ('Espagnol', 30, $kt$Cours 30 · L’environnement, l’écologie et l’avenir de la planète$kt$, $kt$Exprimer des craintes, des espoirs et des solutions pour la protection de l’environnement en utilisant le futur et le subjonctif.$kt$, $kt$Grammaire : Exprimer la peur et le regret au subjonctif
Lorsque le sujet principal exprime un sentiment de peur ou une crainte vis-à-vis d’une autre action, la subordonnée se met systématiquement au subjonctif.

Temer que... / Tener miedo de que... + SUBJONCTIF

— Ejemplo : Tengo miedo de que el planeta sufra daños irreversibles. (J’ai peur que la planète souffre de dommages irréversibles).
— Ejemplo : Los ecologistas temen que los recursos se agoten pronto. (Les écologistes craignent que les ressources ne s’épuisent bientôt).

Vocabulaire Enrichi : Écologie et Développement durable
— El reciclaje / Reciclar = Le recyclage / Recycler
— Cuidar la naturaleza = Prendre soin de la nature
— Los residuos / La contaminación = Les déchets / La pollution
— La escasez de agua = La pénurie d’eau
— La fauna y la flora = La faune et la flore$kt$, $kt$Sofía : Me preocupa mucho el calentamiento global. Si no tomamos medidas urgentes, el cambio climático destruirá muchos ecosistemas. · Mateo : Estoy de acuerdo. Para mí, es fundamental que los países reduzcan las emisiones de CO2 y fomenten el uso de energías renovables. Espero que las futuras generaciones puedan vivir en un planeta limpio.$kt$, null),
  ('Espagnol', 31, $kt$Cours 31 · Variations culturelles et expressions idiomatiques$kt$, $kt$Comprendre les principales nuances de vocabulaire entre l’Espagne et l’Amérique latine, et maîtriser quelques métaphores courantes.$kt$, $kt$Grammaire & Vocabulaire : Espagne vs Amérique Latine
Concept Espagne Amérique Latine
La voiture El coche El carro / El auto
L’ordinateur El ordenador La computadora
Le téléphone portable El móvil El celular
Le jus de fruits El zumo El jugo
Les pommes de terre Las patatas Las papas$kt$, $kt$« Cuando viajas por el mundo hispanohablante, descubres una riqueza cultural enorme. Por ejemplo, en España dices ordenador o coche, mientras que en muchos países de América Latina se dice computadora o carro / auto. A pesar de estas variaciones, todos nos entendemos a la perfección. »$kt$, null),
  ('Espagnol', 32, $kt$Cours 32 · Grand Bilan Final (Niveau A2/B1 validé)$kt$, $kt$Consolider l’ensemble des connaissances grammaticales, lexicales et culturelles des 32 cours.$kt$, $kt$$kt$, $kt$"Aprender español ha sido un viaje maravilloso. Empecé desde cero, aprendiendo a saludar y a deletrear mi nombre. Con el tiempo, aprendí a describir mi rutina, a hablar de mis recuerdos de infancia y a moverme de forma autónoma por la ciudad. Hoy ya puedo expresar mis opiniones sobre el medio ambiente o las tecnologías, debatir con conectores lógicos y usar el subjuntivo para hablar de mis deseos. En el futuro, continuaré practicando para alcanzar la fluidez total."$kt$, null)
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
  and c.language = 'Espagnol'
  and e.origin <> 'member';

-- les exercices des membres passent après ceux du manuel (position + 1000, une seule fois)
update public.language_exercises e
set position = e.position + 1000
from public.language_courses c
where e.course_id = c.id
  and c.language = 'Espagnol'
  and e.origin = 'member'
  and e.position < 1000;

-- 3) Nouveaux exercices du manuel
insert into public.language_exercises
  (course_id, position, prompt, answer, expected_answer, accepted_answers, explanation, exercise_type, origin)
select c.id, x.pos, x.prompt, x.expected, x.expected, x.accepted, x.explanation, 'written', 'manual'
from (values
  (1, 1, $kt$Complétez avec la forme correcte de ser ou llamarse : Yo ____ Mateo.$kt$, $kt$soy$kt$, array[$kt$soy$kt$, $kt$me llamo$kt$]::text[], $kt$Phrase complète : Yo soy Mateo. · Également accepté : me llamo$kt$),
  (1, 2, $kt$Complétez avec la forme correcte de ser ou llamarse : ¿Cómo te ____ tú ?$kt$, $kt$llamas$kt$, array[$kt$llamas$kt$]::text[], $kt$Phrase complète : ¿Cómo te llamas tú ?$kt$),
  (1, 3, $kt$Complétez avec la forme correcte de ser ou llamarse : Ella ____ Elena.$kt$, $kt$se llama$kt$, array[$kt$se llama$kt$, $kt$es$kt$]::text[], $kt$Phrase complète : Ella se llama Elena. · Également accepté : es$kt$),
  (1, 4, $kt$(Expression écrite) Rédigez un mini-dialogue de 4 lignes où vous saluez quelqu’un, donnez votre prénom et demandez comment il/elle va$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ¡Hola ! Me llamo Carlos. ¿Qué tal ? –> ¡Hola Carlos ! Yo soy Ana. Estoy muy bien, gracias.$kt$),
  (2, 1, $kt$Choisissez entre ser et tener : Mi hermano ____ 25 años.$kt$, $kt$tiene$kt$, array[$kt$tiene$kt$]::text[], $kt$Phrase complète : Mi hermano tiene 25 años.$kt$),
  (2, 2, $kt$Choisissez entre ser et tener : Yo ____ francés, no soy español.$kt$, $kt$soy$kt$, array[$kt$soy$kt$]::text[], $kt$Phrase complète : Yo soy francés, no soy español.$kt$),
  (2, 3, $kt$Choisissez entre ser et tener : ¿Tú ____ coche (une voiture) ?$kt$, $kt$tienes$kt$, array[$kt$tienes$kt$]::text[], $kt$Phrase complète : ¿Tú tienes coche (une voiture) ?$kt$),
  (2, 4, $kt$Écrivez en toutes lettres les chiffres suivants : 5, 12, 24, 15$kt$, $kt$$kt$, '{}'::text[], $kt$Exemple de réponse : cinco, doce, veinticuatro, quince.$kt$),
  (3, 1, $kt$Accordez l’adjectif entre parenthèses : Las chicas son ____ (inteligente).$kt$, $kt$inteligentes$kt$, array[$kt$inteligentes$kt$]::text[], $kt$Phrase complète : Las chicas son inteligentes.$kt$),
  (3, 2, $kt$Accordez l’adjectif entre parenthèses : María es una mujer ____ (alto).$kt$, $kt$alta$kt$, array[$kt$alta$kt$]::text[], $kt$Phrase complète : María es una mujer alta.$kt$),
  (3, 3, $kt$Accordez l’adjectif entre parenthèses : Mis ojos son ____ (verdes).$kt$, $kt$verdes$kt$, array[$kt$verdes$kt$]::text[], $kt$Phrase complète : Mis ojos son verdes.$kt$),
  (3, 4, $kt$Faites une description de vous-même en trois phrases (taille, cheveux/yeux, et un trait de caractère)$kt$, $kt$$kt$, '{}'::text[], $kt$Exemple de réponse : Soy un hombre bajo. Tengo los ojos marrones y el pelo castaño. Soy una persona muy tranquila.$kt$),
  (4, 1, $kt$Remplissez les espaces vides : A mí ____ gusta viajar.$kt$, $kt$me$kt$, array[$kt$me$kt$]::text[], $kt$Phrase complète : A mí me gusta viajar.$kt$),
  (4, 2, $kt$Remplissez les espaces vides : Juan vive con ____ madre. (sa)$kt$, $kt$su$kt$, array[$kt$su$kt$]::text[], $kt$Phrase complète : Juan vive con su madre. (sa)$kt$),
  (4, 3, $kt$Remplissez les espaces vides : ¿A ti te ____ el fútbol ?$kt$, $kt$gusta$kt$, array[$kt$gusta$kt$]::text[], $kt$Phrase complète : ¿A ti te gusta el fútbol ?$kt$),
  (4, 4, $kt$Remplissez les espaces vides : A nosotros ____ gustan los libros.$kt$, $kt$nos$kt$, array[$kt$nos$kt$]::text[], $kt$Phrase complète : A nosotros nos gustan los libros.$kt$),
  (4, 5, $kt$Écrivez deux phrases en espagnol : l’une pour exprimer ce que vous aimez faire, et l’autre pour présenter un membre de votre famille (lien de parenté et prénom)$kt$, $kt$$kt$, '{}'::text[], $kt$Exemple de réponse : Me gusta escuchar música. Mi hermana se llama Clara.$kt$),
  (5, 1, $kt$Écrivez l’heure en toutes lettres : 14 :15 → Son las ____ .$kt$, $kt$dos y cuarto$kt$, array[$kt$dos y cuarto$kt$]::text[], $kt$Phrase complète : 14 :15 → Son las dos y cuarto .$kt$),
  (5, 2, $kt$Écrivez l’heure en toutes lettres : 01 :30 → Es la ____ .$kt$, $kt$una y media$kt$, array[$kt$una y media$kt$]::text[], $kt$Phrase complète : 01 :30 → Es la una y media .$kt$),
  (5, 3, $kt$Écrivez l’heure en toutes lettres : 18 :45 → Son las ____ .$kt$, $kt$siete menos cuarto$kt$, array[$kt$siete menos cuarto$kt$]::text[], $kt$Phrase complète : 18 :45 → Son las siete menos cuarto .$kt$),
  (5, 4, $kt$Traduisez « Aujourd’hui il fait froid et il pleut. »$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Hoy hace frío y llueve.$kt$),
  (6, 1, $kt$Conjuguez au présent : Nosotros ____ (vivir) en Barcelona.$kt$, $kt$vivimos$kt$, array[$kt$vivimos$kt$]::text[], $kt$Phrase complète : Nosotros vivimos en Barcelona.$kt$),
  (6, 2, $kt$Conjuguez au présent : Tú ____ (levantarse) muy temprano.$kt$, $kt$te levantas$kt$, array[$kt$te levantas$kt$]::text[], $kt$Phrase complète : Tú te levantas muy temprano.$kt$),
  (6, 3, $kt$Conjuguez au présent : Ellos ____ (comer) una manzana.$kt$, $kt$comen$kt$, array[$kt$comen$kt$]::text[], $kt$Phrase complète : Ellos comen una manzana.$kt$),
  (7, 1, $kt$Conjuguez les verbes entre parenthèses (attention aux diphtongues !) : Yo no ____ (poder) venir mañana.$kt$, $kt$puedo$kt$, array[$kt$puedo$kt$]::text[], $kt$Phrase complète : Yo no puedo venir mañana.$kt$),
  (7, 2, $kt$Conjuguez les verbes entre parenthèses (attention aux diphtongues !) : ¿Qué ____ (querer) vosotros ?$kt$, $kt$queréis$kt$, array[$kt$queréis$kt$]::text[], $kt$Phrase complète : ¿Qué queréis vosotros ? · Pas de diphtongue à vosotros !$kt$),
  (7, 3, $kt$Conjuguez les verbes entre parenthèses (attention aux diphtongues !) : Mis amigos ____ (soler) leer por la noche.$kt$, $kt$suelen$kt$, array[$kt$suelen$kt$]::text[], $kt$Phrase complète : Mis amigos suelen leer por la noche.$kt$),
  (8, 1, $kt$D’après le texte : ¿A qué se dedica Javier y cuántos años tiene ?$kt$, $kt$$kt$, '{}'::text[], $kt$Réponse modèle : Javier es médico y tiene 32 años.$kt$),
  (8, 2, $kt$D’après le texte : ¿A qué hora empieza su rutina por la mañana ?$kt$, $kt$$kt$, '{}'::text[], $kt$Réponse modèle : Se despierta / levanta a las seis y media de la mañana.$kt$),
  (8, 3, $kt$D’après le texte : ¿Qué suele hacer los fines de semana si hace sol ?$kt$, $kt$$kt$, '{}'::text[], $kt$Réponse modèle : Suele jugar al fútbol con sus amigos o visitar a sus abuelos.$kt$),
  (8, 4, $kt$Rédigez un paragraphe de 6 à 8 lignes pour vous présenter complètement. Incluez : votre nom, âge, nationalité, profession, description physique rapide, un élément de votre routine et une activité que vous aimez faire le week-end.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (9, 1, $kt$Remplissez les espaces par Hay ou la forme correcte de Estar : ¿Dónde ____ la catedral de Sevilla ?$kt$, $kt$está$kt$, array[$kt$está$kt$]::text[], $kt$Phrase complète : ¿Dónde está la catedral de Sevilla ? · Lieu précis$kt$),
  (9, 2, $kt$Remplissez les espaces par Hay ou la forme correcte de Estar : En esta calle ____ muchos restaurantes tradicionales.$kt$, $kt$hay$kt$, array[$kt$hay$kt$]::text[], $kt$Phrase complète : En esta calle hay muchos restaurantes tradicionales. · Indéterminé/pluriel$kt$),
  (9, 3, $kt$Remplissez les espaces par Hay ou la forme correcte de Estar : Mis llaves (mes clés) ____ encima de la mesa.$kt$, $kt$están$kt$, array[$kt$están$kt$]::text[], $kt$Phrase complète : Mis llaves están encima de la mesa. · Objets précis au pluriel$kt$),
  (9, 4, $kt$Traduisez en espagnol "Pour aller à la gare, traversez la place et tournez à gauche."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Para ir a la estación, cruce la plaza y gire a la izquierda.$kt$),
  (10, 1, $kt$Choisissez entre Tener que (conjugué) et Hay que : Para aprender español, ____ estudiar todos los días. (il faut)$kt$, $kt$hay que$kt$, array[$kt$hay que$kt$]::text[], $kt$Phrase complète : Para aprender español, hay que estudiar todos los días. (il faut)$kt$),
  (10, 2, $kt$Choisissez entre Tener que (conjugué) et Hay que : Mañana ____ levantarme a las 6 :00 para ir al mercado. (je dois)$kt$, $kt$tengo que$kt$, array[$kt$tengo que$kt$]::text[], $kt$Phrase complète : Mañana tengo que levantarme a las 6 :00 para ir al mercado. (je dois)$kt$),
  (10, 3, $kt$Choisissez entre Tener que (conjugué) et Hay que : Vosotros ____ pagar la cuenta antes de salir.$kt$, $kt$tenéis que$kt$, array[$kt$tenéis que$kt$]::text[], $kt$Phrase complète : Vosotros tenéis que pagar la cuenta antes de salir.$kt$),
  (10, 4, $kt$Rédigez une phrase pour commander un plat de viande avec un verre de vin rouge$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Para mí, quiero la carne de ternera y un vaso de vino tinto, por favor.$kt$),
  (11, 1, $kt$Complétez avec la structure de comparaison demandée : Este coche es ____ (plus rapide que) ese autobús.$kt$, $kt$más rápido que$kt$, array[$kt$más rápido que$kt$]::text[], $kt$Phrase complète : Este coche es más rápido que ese autobús.$kt$),
  (11, 2, $kt$Complétez avec la structure de comparaison demandée : Mi camiseta es ____ (aussi jolie que) la tuya.$kt$, $kt$tan bonita como$kt$, array[$kt$tan bonita como$kt$]::text[], $kt$Phrase complète : Mi camiseta es tan bonita como la tuya.$kt$),
  (11, 3, $kt$Complétez avec la structure de comparaison demandée : El invierno es ____ (pire que) el verano.$kt$, $kt$peor que$kt$, array[$kt$peor que$kt$]::text[], $kt$Phrase complète : El invierno es peor que el verano.$kt$),
  (11, 4, $kt$Traduisez « Ces chaussures (proches) sont moins chères que ces bottes (éloignées). »$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Estos zapatos son menos caros que esas botas.$kt$),
  (12, 1, $kt$Complétez les phrases en utilisant les prépositions de lieu adaptées au contexte : El coche está ____ (dans) el garaje.$kt$, $kt$en$kt$, array[$kt$en$kt$]::text[], $kt$Phrase complète : El coche está en el garaje.$kt$),
  (12, 2, $kt$Complétez les phrases en utilisant les prépositions de lieu adaptées au contexte : Los libros están ____ (sur) la mesa del salón.$kt$, $kt$encima de$kt$, array[$kt$encima de$kt$, $kt$en$kt$]::text[], $kt$Phrase complète : Los libros están encima de la mesa del salón. · Également accepté : en$kt$),
  (12, 3, $kt$Complétez les phrases en utilisant les prépositions de lieu adaptées au contexte : El baño está ____ (à côté de) mi habitación.$kt$, $kt$al lado de$kt$, array[$kt$al lado de$kt$]::text[], $kt$Phrase complète : El baño está al lado de mi habitación.$kt$),
  (12, 4, $kt$Décrivez en 3 phrases simples votre propre pièce préférée et la position de deux meubles à l’intérieur$kt$, $kt$$kt$, '{}'::text[], $kt$Exemple de réponse : Mi habitación favorita es el dormitorio. Mi cama está entre el armario y la ventana. Encima de la cama hay una lámpara azul.$kt$),
  (13, 1, $kt$Conjuguez au Pretérito Perfecto : Esta semana, nosotros ____ (viajar) a Barcelona.$kt$, $kt$hemos viajado$kt$, array[$kt$hemos viajado$kt$]::text[], $kt$Phrase complète : Esta semana, nosotros hemos viajado a Barcelona.$kt$),
  (13, 2, $kt$Conjuguez au Pretérito Perfecto : ¿Tú ____ (ver) la nueva película de Almodóvar ?$kt$, $kt$has visto$kt$, array[$kt$has visto$kt$]::text[], $kt$Phrase complète : ¿Tú has visto la nueva película de Almodóvar ?$kt$),
  (13, 3, $kt$Conjuguez au Pretérito Perfecto : Yo todavía no ____ (escribir) el informe.$kt$, $kt$he escrito$kt$, array[$kt$he escrito$kt$]::text[], $kt$Phrase complète : Yo todavía no he escrito el informe.$kt$),
  (14, 1, $kt$Conjuguez à l’imparfait : De niña, María ____ (ser) muy tímida.$kt$, $kt$era$kt$, array[$kt$era$kt$]::text[], $kt$Phrase complète : De niña, María era muy tímida.$kt$),
  (14, 2, $kt$Conjuguez à l’imparfait : Mis padres ____ (ir) todos los años a Galicia.$kt$, $kt$iban$kt$, array[$kt$iban$kt$]::text[], $kt$Phrase complète : Mis padres iban todos los años a Galicia.$kt$),
  (14, 3, $kt$Conjuguez à l’imparfait : Nosotros ____ (tener) un perro grande.$kt$, $kt$teníamos$kt$, array[$kt$teníamos$kt$]::text[], $kt$Phrase complète : Nosotros teníamos un perro grande.$kt$),
  (15, 1, $kt$Choisissez entre duele et duelen : A Juan le ____ el estómago después de comer.$kt$, $kt$duele$kt$, array[$kt$duele$kt$]::text[], $kt$Phrase complète : A Juan le duele el estómago después de comer.$kt$),
  (15, 2, $kt$Choisissez entre duele et duelen : A mí me ____ las piernas por correr tanto.$kt$, $kt$duelen$kt$, array[$kt$duelen$kt$]::text[], $kt$Phrase complète : A mí me duelen las piernas por correr tanto.$kt$),
  (15, 3, $kt$Traduisez "J’ai mal à la gorge et j’ai de la fièvre."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Me duele la garganta y tengo fiebre.$kt$),
  (16, 1, $kt$Complétez le texte avec le temps du passé qui convient (Pretérito Perfecto ou Imperfecto) : "Hoy yo ____ (levantarse) a las 8 :00. Mientras ____ (hacer) el café, me acordé de que cuando ____ (ser) niño, siempre ____ (tomar) leche caliente por las mañanas."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : he levantado (action d’aujourd’hui) / hacía (action en cours en arrière-plan) / era (enfance) / tomaba (habitude passée).$kt$),
  (16, 2, $kt$Rédigez une lettre amicale (6 à 8 lignes) à un ami pour lui raconter ce que vous avez fait cette semaine (passé composé) et décrivez brièvement le logement où vous habitez actuellement.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (17, 1, $kt$Conjuguez les verbes au Pretérito Indefinido : El año pasado, yo ____ (trabajar) en Barcelona.$kt$, $kt$trabajé$kt$, array[$kt$trabajé$kt$]::text[], $kt$Phrase complète : El año pasado, yo trabajé en Barcelona.$kt$),
  (17, 2, $kt$Conjuguez les verbes au Pretérito Indefinido : ¿Tú ____ (aprender) mucho en el curso ?$kt$, $kt$aprendiste$kt$, array[$kt$aprendiste$kt$]::text[], $kt$Phrase complète : ¿Tú aprendiste mucho en el curso ?$kt$),
  (17, 3, $kt$Conjuguez les verbes au Pretérito Indefinido : Mis amigos ____ (decidir) salir de fiesta anoche.$kt$, $kt$decidieron$kt$, array[$kt$decidieron$kt$]::text[], $kt$Phrase complète : Mis amigos decidieron salir de fiesta anoche.$kt$),
  (18, 1, $kt$Complétez avec le verbe irrégulier demandé au passé simple : El fin de semana pasado yo ____ (aller) a la playa.$kt$, $kt$fui$kt$, array[$kt$fui$kt$]::text[], $kt$Phrase complète : El fin de semana pasado yo fui a la playa.$kt$),
  (18, 2, $kt$Complétez avec le verbe irrégulier demandé au passé simple : Ellos no ____ (faire) las tareas ayer.$kt$, $kt$hicieron$kt$, array[$kt$hicieron$kt$]::text[], $kt$Phrase complète : Ellos no hicieron las tareas ayer.$kt$),
  (18, 3, $kt$Complétez avec le verbe irrégulier demandé au passé simple : Nosotros ____ (avoir) que salir temprano.$kt$, $kt$tuvimos$kt$, array[$kt$tuvimos$kt$]::text[], $kt$Phrase complète : Nosotros tuvimos que salir temprano.$kt$),
  (19, 1, $kt$Choisissez entre l’imparfait et le passé simple : Mientras yo ____ (cocinar), mi amigo ____ (llegar) a casa.$kt$, $kt$$kt$, '{}'::text[], $kt$Réponses attendues : cocinaba (action longue) / llegó (action soudaine)$kt$),
  (19, 2, $kt$Choisissez entre l’imparfait et le passé simple : ____ (Ser) las diez de la noche cuando ____ (empezar) a llover.$kt$, $kt$$kt$, '{}'::text[], $kt$Réponses attendues : Eran (l’heure s’exprime toujours à l’imparfait) / empezó (action ponctuelle)$kt$),
  (20, 1, $kt$Conjuguez au futur simple : Mañana nosotros ____ (viajar) a París.$kt$, $kt$viajaremos$kt$, array[$kt$viajaremos$kt$]::text[], $kt$Phrase complète : Mañana nosotros viajaremos a París.$kt$),
  (20, 2, $kt$Conjuguez au futur simple : Creo que tú ____ (encontrar) un buen trabajo.$kt$, $kt$encontrarás$kt$, array[$kt$encontrarás$kt$]::text[], $kt$Phrase complète : Creo que tú encontrarás un buen trabajo.$kt$),
  (20, 3, $kt$Transformez la phrase au futur proche (Ir a + infinitif ) : « Yo estudio español » → Yo ____$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Yo voy a estudiar español.$kt$),
  (21, 1, $kt$Transformez ces verbes à l’impératif (personne Tú) : (Tú - Hacer) ____ los deberes.$kt$, $kt$Haz$kt$, array[$kt$Haz$kt$]::text[], $kt$Phrase complète : Haz los deberes.$kt$),
  (21, 2, $kt$Transformez ces verbes à l’impératif (personne Tú) : (Tú - Comer) ____ la manzana.$kt$, $kt$Come$kt$, array[$kt$Come$kt$]::text[], $kt$Phrase complète : Come la manzana.$kt$),
  (21, 3, $kt$Transformez ces verbes à l’impératif (personne Tú) : (Tú - Tener) ____ paciencia.$kt$, $kt$Ten$kt$, array[$kt$Ten$kt$]::text[], $kt$Phrase complète : Ten paciencia.$kt$),
  (21, 4, $kt$Donnez le même ordre en passant du tutoiement (Tú) au vouvoiement de politesse (Usted) : « Pasa a mi oficina » → « Usted ____ a mi oficina »$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Pase$kt$),
  (22, 1, $kt$Remplissez l’espace en traduisant « depuis » par la structure demandée : Estudio español ____ (depuis) seis meses.$kt$, $kt$desde hace$kt$, array[$kt$desde hace$kt$]::text[], $kt$Phrase complète : Estudio español desde hace seis meses.$kt$),
  (22, 2, $kt$Remplissez l’espace en traduisant « depuis » par la structure demandée : Yo ____ (Llevar + durée + gérondif du verbe vivir) dos años viviendo en Madrid.$kt$, $kt$llevo$kt$, array[$kt$llevo$kt$]::text[], $kt$Phrase complète : Yo llevo dos años viviendo en Madrid.$kt$),
  (23, 1, $kt$Traduisez la phrase suivante en espagnol formel en utilisant le conditionnel de politesse : "Je voudrais prendre un rendez-vous avec le médecin."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Querría pedir una cita con el médico.$kt$),
  (24, 1, $kt$Verdadero ou Falso ? La empresa busca un ingeniero de software.$kt$, $kt$Falso$kt$, array[$kt$Falso$kt$]::text[], $kt$Busca un administrativo.$kt$),
  (24, 2, $kt$Verdadero ou Falso ? Es obligatorio tener al menos dos años de experiencia laboral.$kt$, $kt$Verdadero$kt$, array[$kt$Verdadero$kt$, $kt$Verdadera$kt$]::text[], $kt$Experiencia mínima de dos años.$kt$),
  (24, 3, $kt$Verdadero ou Falso ? El contrato que ofrecen es por un tiempo limitado.$kt$, $kt$Falso$kt$, array[$kt$Falso$kt$]::text[], $kt$Ofrece contrato indefinido/CDI.$kt$),
  (24, 4, $kt$Rédigez un court e-mail professionnel (5 à 7 lignes) pour postuler à cette offre d’emploi. Commencez par une formule formelle (Estimado director...), mentionnez vos compétences, utilisez la structure Desde hace ou Llevar + gérondif pour parler de votre expérience, et terminez par une formule de salutation polie.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (25, 1, $kt$Conjuguez au conditionnel présent : Si yo pudiera, ____ (hacer) un viaje al espacio.$kt$, $kt$haría$kt$, array[$kt$haría$kt$]::text[], $kt$Phrase complète : Si yo pudiera, haría un viaje al espacio.$kt$),
  (25, 2, $kt$Conjuguez au conditionnel présent : ¿Vosotros ____ (vivir) en otro país ?$kt$, $kt$viviríais$kt$, array[$kt$viviríais$kt$]::text[], $kt$Phrase complète : ¿Vosotros viviríais en otro país ?$kt$),
  (25, 3, $kt$Conjuguez au conditionnel présent : Ella ____ (tener) que estudiar más para aprobar.$kt$, $kt$tendría$kt$, array[$kt$tendría$kt$]::text[], $kt$Phrase complète : Ella tendría que estudiar más para aprobar.$kt$),
  (26, 1, $kt$Conjuguez les verbes au subjonctif présent : Mi jefe quiere que yo ____ (escribir) un informe hoy.$kt$, $kt$escriba$kt$, array[$kt$escriba$kt$]::text[], $kt$Phrase complète : Mi jefe quiere que yo escriba un informe hoy.$kt$),
  (26, 2, $kt$Conjuguez les verbes au subjonctif présent : Espero que vosotros ____ (comer) bien en el restaurante.$kt$, $kt$comáis$kt$, array[$kt$comáis$kt$]::text[], $kt$Phrase complète : Espero que vosotros comáis bien en el restaurante.$kt$),
  (26, 3, $kt$Conjuguez les verbes au subjonctif présent : Ojalá mañana ____ (hacer) buen tiempo.$kt$, $kt$haga$kt$, array[$kt$haga$kt$]::text[], $kt$Phrase complète : Ojalá mañana haga buen tiempo. · Irrégulier basé sur la 1re personne "hago"$kt$),
  (27, 1, $kt$Choisissez entre le présent de l’indicatif et le subjonctif : Es verdad que la situación ____ (ser) difícil.$kt$, $kt$es$kt$, array[$kt$es$kt$]::text[], $kt$Phrase complète : Es verdad que la situación es difícil. · Affirmatif/certitude$kt$),
  (27, 2, $kt$Choisissez entre le présent de l’indicatif et le subjonctif : No creo que ella ____ (venir) a la fiesta.$kt$, $kt$venga$kt$, array[$kt$venga$kt$]::text[], $kt$Phrase complète : No creo que ella venga a la fiesta. · Négation de creo que$kt$),
  (27, 3, $kt$Choisissez entre le présent de l’indicatif et le subjonctif : Dudo mucho que ellos ____ (saber) la verdad.$kt$, $kt$sepan$kt$, array[$kt$sepan$kt$]::text[], $kt$Phrase complète : Dudo mucho que ellos sepan la verdad. · Expression du doute$kt$),
  (28, 1, $kt$Complétez le texte court avec les connecteurs suivants : porque, sin embargo, además. "Me encanta vivir en Madrid ____ es una ciudad con mucha vida cultural. ____ , tiene unos parques maravillosos para pasear. ____ , en verano hace demasiado calor."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : porque / Además / Sin embargo$kt$),
  (29, 1, $kt$Conjuguez au mode approprié (Indicatif ou Subjonctif) : Es verdad que internet ____ (tener) muchas ventajas.$kt$, $kt$tiene$kt$, array[$kt$tiene$kt$]::text[], $kt$Phrase complète : Es verdad que internet tiene muchas ventajas. · Certitude$kt$),
  (29, 2, $kt$Conjuguez au mode approprié (Indicatif ou Subjonctif) : Es necesario que los usuarios ____ (ser) prudentes en la red.$kt$, $kt$sean$kt$, array[$kt$sean$kt$]::text[], $kt$Phrase complète : Es necesario que los usuarios sean prudentes en la red. · Nécessité/jugement$kt$),
  (29, 3, $kt$Conjuguez au mode approprié (Indicatif ou Subjonctif) : Es una lástima que muchas personas no ____ (leer) libros.$kt$, $kt$lean$kt$, array[$kt$lean$kt$]::text[], $kt$Phrase complète : Es una lástima que muchas personas no lean libros. · Sentiment/regret$kt$),
  (30, 1, $kt$Traduisez la phrase suivante en espagnol "J’ai peur que la pollution augmente dans le futur."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Tengo miedo de que la contaminación aumente en el futuro.$kt$),
  (31, 1, $kt$Associez l’expression à sa signification : No me escuchas, siempre estás... ____ A. como una cabra.$kt$, $kt$B$kt$, array[$kt$B$kt$]::text[], $kt$Phrase complète : No me escuchas, siempre estás... B A. como una cabra.$kt$),
  (31, 2, $kt$Associez l’expression à sa signification : Este examen fue... ____ B. en las nubes.$kt$, $kt$C$kt$, array[$kt$C$kt$]::text[], $kt$Phrase complète : Este examen fue... C B. en las nubes.$kt$),
  (31, 3, $kt$Associez l’expression à sa signification : Tu tío hace cosas rarísimas, está... ____ C. pan comido.$kt$, $kt$A$kt$, array[$kt$A$kt$]::text[], $kt$Phrase complète : Tu tío hace cosas rarísimas, está... A C. pan comido.$kt$),
  (31, 4, $kt$— Ser pan comido = Être un jeu d’enfant (très facile). (Ejemplo : ¡El español es pan comido !) — Estar en las nubes = Être dans les nuages / être distrait. — Estar como una cabra = Être complètement fou/folle. — Echar de menos (a alguien) = Manquer à quelqu’un / Regretter l’absence de. (Ejemplo : Te echo de menos = Tu me manques).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (32, 1, $kt$Corrigez ou complétez les phrases suivantes en mobilisant vos compétences accumulées : Ayer yo ____ (ver - passé simple irrégulier) a Juan en el mercado.$kt$, $kt$vi$kt$, array[$kt$vi$kt$]::text[], $kt$Phrase complète : Ayer yo vi a Juan en el mercado.$kt$),
  (32, 2, $kt$Corrigez ou complétez les phrases suivantes en mobilisant vos compétences accumulées : No creo que hoy ____ (llover - subjonctif présent) en Madrid.$kt$, $kt$llueva$kt$, array[$kt$llueva$kt$]::text[], $kt$Phrase complète : No creo que hoy llueva en Madrid.$kt$),
  (32, 3, $kt$Corrigez ou complétez les phrases suivantes en mobilisant vos compétences accumulées : Si tuviera dinero, yo ____ (comprar - conditionnel) un billete de avión.$kt$, $kt$compraría$kt$, array[$kt$compraría$kt$]::text[], $kt$Phrase complète : Si tuviera dinero, yo compraría un billete de avión.$kt$)

) as x(course_number, pos, prompt, expected, accepted, explanation)
join public.language_courses c
  on c.language = 'Espagnol' and c.course_number = x.course_number;

commit;

-- Contrôle (à lancer après) : doit afficher 32 cours et 101 exercices du manuel
-- select count(*) from public.language_courses where language = 'Espagnol';
-- select count(*) from public.language_exercises e join public.language_courses c on c.id = e.course_id
--   where c.language = 'Espagnol' and e.origin = 'manual';
