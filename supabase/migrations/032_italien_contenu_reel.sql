-- Keltia : contenu réel des 32 cours de italien (source : manuel Italien.pdf).
-- Cible uniquement la bibliothèque Plan & Plate (language_courses / language_exercises).
-- Ne touche PAS au planning (weekly_schedule_items).
-- Relançable sans risque : les cours sont mis à jour par (language, course_number),
-- les exercices du manuel sont recréés, les exercices ajoutés par les membres sont conservés.

begin;

-- 1) Cours : titre, objectif, théorie et exemples réels ; plus de « Semaine X » (hors planning)
insert into public.language_courses (language, course_number, title, summary, theory, examples, week_number)
values
  ('Italien', 1, $kt$Cours 1 · Salutations, présentations et alphabet$kt$, $kt$Savoir saluer, se présenter brièvement et maîtriser les règles de prononciation de base.$kt$, $kt$Compréhension & Lecture
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

— Ressource audio : Écoutez la prononciation exacte sur Forvo ou WordReference.$kt$, $kt$Mateo : Ciao ! Buongiorno. Come ti chiami ? · Elena : Ciao ! Mi chiamo Elena. E tu ? · Mateo : Io sono Mateo. Come stai ? · Elena : Molto bene, grazie. E tu ? · Mateo : Così così, sono un po’ stanco. Come se scrive il tuo cognome ? · Elena : Il my cognome è García. Si scrive con la ci e con l’accento sulla i.$kt$, null),
  ('Italien', 2, $kt$Cours 2 · L’identité et les chiffres$kt$, $kt$Exprimer sa nationalité, sa profession, donner son âge et utiliser les chiffres de 0 à 30.$kt$, $kt$Compréhension & Lecture

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

N          Nazionalità             traduction              Professioni                  traduction 1              Francese             français(e)       Avvocato / Avvocatessa               avocat(e) 2       Spagnolo / Spagnola         espagnol(e)                Medico                       médecin 3      Messicano / Messicana        mexicain(e)       Infermiere / Infermiera       infirmier / infirmière 4      Argentino / Argentina        argentin(e)      Professore / Professoressa          professeur(e) 5    Colombiano / Colombiana      colombien(ne)       Studente / Studentessa              étudiant(e) 6          Cileno / Cilena          chilien(ne)               Ingegnere                  ingénieur(e) 7      Peruviano / Peruviana       péruvien(ne)              Architetto                    architecte 8           Statunitense           américain(e)       Cameriere / Cameriera           serveur / serveuse 9             Canadese             canadien(ne)           Cuoco / Cuoca             cuisinier / cuisinière 10              Inglese              anglais(e)       Commesso / Commessa            vendeur / vendeuse 11       Tedesco / Tedesca         allemand(e)       Informatico / Informatica        informaticien(ne) 12       Italiano / Italiana         italien(ne)             Giornalista                  journaliste 13           Portoghese            portugais(e)                Artista                       artiste 14               Belga                  belge                 Musicista                  musicien(ne) 15       Svizzero / Svizzera            suisse      Parrucchiere / Parrucchiera      coiffeur / coiffeuse 16   Marocchino / Marocchina       marocain(e)                 Autista             chauffeur / conductrice 17              Cinese                chinois(e)       Poliziotto / Poliziotta        policier / policière 18           Giapponese             japonais(e)               Pompiere                      pompier 19       Cubano / Cubana              cubain(e)        Impiegato / Impiegata      employé(e) administratif 20   Venezuelano / Venezuelana   vénézuélien(ne)   Imprenditore / Imprenditrice        chef d’entreprise$kt$, $kt$“Ciao a tutti ! Mi chiamo Alejandro. Sono colombiano e sono ingegnere. Vivo a Milano e ho 28 (ventotto) anni. Il mio numero di telefono è 612 345 789.”$kt$, null),
  ('Italien', 3, $kt$Cours 3 · Description physique et psychologique$kt$, $kt$Description physique et psychologique$kt$, $kt$Compréhension & Lecture

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
gro/Pigra (Paresseux), Allegro/Triste (Joyeux/Triste), Gentile (Aimable, gentil), Paziente/Impaziente (Patient/Impatient)$kt$, $kt$“Il mio amico Luis è alto e ha i capelli corti e neri. È un ragazzo molto simpatico e allegro. Sua sorella Sofia è bassa, ha gli occhi azzurri ed è un po’ timida.”$kt$, null),
  ('Italien', 4, $kt$Cours 4 · La famille et l’entourage$kt$, $kt$Présenter les membres de sa famille, utiliser les adjectifs possessifs et introduire les goûts simples.$kt$, $kt$Compréhension & Lecture

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
— Viaggiare : Voyager$kt$, $kt$“Nella mia famiglia siamo quattro persone : mio padre, mia madre, mio fratello maggiore e io. Mio fratello si chiama Javier e ha 20 anni. A mia madre piace molto leggere e a mio padre piace cucinare nei fine settimana.”$kt$, null),
  ('Italien', 5, $kt$Cours 5 · Le temps qui passe (L’heure, l’agenda et le climat)$kt$, $kt$Demander et dire l’heure, nommer les jours/mois et parler de la météo.$kt$, $kt$Compréhension & Lecture

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
Audio de référence : Écoutez les jours et les heures énoncés distinctement sur WordReference Hours.$kt$, $kt$Sofía : Carlos, che ora è ? Hai l’ora ? · Carlos : Sì, sono le tre e mezza. Perché ? · Sofía : Perché la mia lezione di italiano è alle quattro meno un quarto. Sono in ritardo ! · Carlos : Non ti preoccupare. Domani è sabato e non ci sono lezioni. Inoltre, oggi fa un tempo bellissimo, possiamo camminare. · Sofía : È vero, c’è il sole. Però a novembre piove sempre molto a Milano.$kt$, null),
  ('Italien', 6, $kt$Cours 6 · La routine quotidienne$kt$, $kt$Utiliser les verbes pronominaux et réguliers pour décrire une journée type.$kt$, $kt$Compréhension & Lecture

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
— Tornare = Rentrer, revenir$kt$, $kt$"Tutti i giorni mi sveglio alle sette di mattina. Mi alzo, mi faccio la doccia e faccio colazione con un caffè e dei toast. Esco di casa alle otto. Lavoro dalle nove alle cinque. Di sera, torno a casa e mi metto a letto alle undici di notte."$kt$, null),
  ('Italien', 7, $kt$Cours 7 · Les loisirs, invitations et verbes irréguliers$kt$, $kt$Parler de ses passe-temps et maîtriser les verbes irréguliers (Volere, Potere, Solere).$kt$, $kt$Compréhension & Lecture

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
— Incontrarsi con gli amici = Voir / retrouver des amis$kt$, $kt$Lucas : María, che cosa vuoi fare questo fine settimana ? · María : Di solito gioco a tennis il sabato, ma questo sabato preferisco andare al cinema. Ti va ? · Lucas : Certo ! Posso venire anch’io. A che ora ci vediamo ?$kt$, null),
  ('Italien', 8, $kt$Cours 8 · Bilan du Module 1$kt$, $kt$Évaluer et valider l’ensemble des compétences acquises (Cours 1 à 7).$kt$, $kt$Compréhension Écrite & Lecture Générale
Lisez ce texte d’un correspondant italien :

Expression Écrite Personnelle
Rédigez un paragraphe de 6 à 8 lignes pour vous présenter complètement. Incluez : votre nom, âge, nationalité, profession, description physique rapide, un élément de votre routine et une activité que vous aimez faire le week-end.$kt$, $kt$"Ciao ! Mi chiamo Javier Ortega, sono medico e ho trentadue anni. Sono di Siviglia, ma vivo e lavoro a Milano. La mia routine è molto semplice : mi sveglio alle sei e mezza di mattina, mi faccio la doccia, faccio colazione e vado in ospedale. Lavoro molte ore. Nei fine settimana mi piace riposare. Se c’è il sole, di solito gioco a calcio con i miei amici o vado a trovare i miei nonni. Non mi piace per nulla il freddo."$kt$, null),
  ('Italien', 9, $kt$Cours 9 · La ville, les déplacements et l’orientation$kt$, $kt$Demander son chemin, indiquer une direction, localiser des lieux et maîtriser la distinction entre l’existence (*C’è/Ci sono*) et la localisation précise.$kt$, $kt$Compréhension & Lecture

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
— All’angolo : Au coin / À l’angle de la rue$kt$, $kt$Turista : Mi scusi, signore ! Sa se c’è una farmacia qui vicino ? · Local : Sì, certo. Senta, la farmacia più vicina è alla fine di questa strada, proprio accanto al supermercato. · Turista : Si può andare a piedi o è molto lontano ? · Local : È abbastanza vicina, a circa cinque minuti. Deve attraversare il viale, girare a destra all’angolo e proseguire sempre dritto. · Turista : Eccellente, grazie mille per il suo aiuto. · Local : Di nulla, buon viaggio !$kt$, null),
  ('Italien', 10, $kt$Cours 10 · Au restaurant et faire les courses$kt$, $kt$Commander à manger, exprimer ses besoins et obligations complexes (Dovere / Bisogna), et maîtriser le vocabulaire gastronomique.$kt$, $kt$Compréhension & Lecture
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
— Bevande (Boissons) : Il vino rosso/bianco (le vin rouge/blanc), la birra (la bière), il caffè, il succo d’arancia (le jus d’orange).$kt$, $kt$Cameriere : Buon pomeriggio, che cosa desiderate come primo piatto ? · Cliente : Per me, come primo devo provare il gazpacho, e come secondo piatto voglio il pesce del giorno. · Cameriere : Eccellente. E da bere ? · Cliente : Acqua minerale naturale, per favore. Bisogna ordinare il dolce adesso o dopo ? · Cameriere : Come preferisce, può ordinarlo più tardi.$kt$, null),
  ('Italien', 11, $kt$Cours 11 · Les achats, les vêtements et la comparaison$kt$, $kt$Acheter des vêtements, donner son avis sur un produit, utiliser les démonstratifs (questo, quello) et exprimer des comparaisons.$kt$, $kt$Compréhension & Lecture

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

— La taglia (La taille), il prezzo (Le prix), caro / economico (Cher / Bon marché), comodo / scomodo (Confortable / Inconfortable).$kt$, $kt$"In questo negozio di abbigliamento, questo vestito rosso è più caro di quella gonna blu. Tuttavia, i pantaloni neri sono comodi quanto i jeans. Credo che comprerò queste scarpe perché sono migliori di quelle."$kt$, null),
  ('Italien', 12, $kt$Cours 12 · Le logement et l’espace habitable$kt$, $kt$Décrire en détail sa maison ou son appartement, situer précisément des objets dans l’espace avec des prépositions avancées.$kt$, $kt$Compréhension & Lecture

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
— Il divano (Le canapé), il tavolo (La table), la sedia (La chaise), il letto (Le lit), l’armadio (L’armoire), la lampada (La lampe), lo specchio (Le miroir).$kt$, $kt$"Vivo in un appartamento ampio e molto luminoso nel centro di Milano. Ha un salone grande, una cucina completamente attrezzata, due camere da letto e un bagno. Il mio posto preferito è il salone, dove il mio divano è tra la finestra e la libreria. Sopra il tavolo ci sono sempre fiori freschi."$kt$, null),
  ('Italien', 13, $kt$Cours 13 · Parler du passé proche (Le Passé Composé / Passato Prossimo)$kt$, $kt$Évoquer des actions passées qui ont encore un lien avec le présent ou qui se déroulent dans une unité de temps non terminée (aujourd’hui, cette semaine).$kt$, $kt$Compréhension & Lecture

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
— Organizzare i documenti = Organiser les documents$kt$, $kt$Lucía : Ciao Carlos, che cosa hai fatto stamattina ? · Carlos : Ciao. Oggi ho avuto molto lavoro. Ho scritto tre e-mail, ho parlato con il mio capo e ho mangiato un’insalata veloce. E tu ? · Lucía : Io sono andata in palestra e questa settimana ho studiato molto l’italiano perché ho un esame.$kt$, null),
  ('Italien', 14, $kt$Cours 14 · Raconter un souvenir d’enfance (L’Imparfait / Imperfetto)$kt$, $kt$Décrire des habitudes passées, des souvenirs d’enfance, des paysages ou des états d’esprit dans le passé.$kt$, $kt$Compréhension & Lecture

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
— I giocattoli / I cartoni animati = Les jouets / Les dessins animés$kt$, $kt$"Quando ero bambino, vivevo in un paese molto piccolo vicino al mare. Tutte le estati, i miei amici e io giocavamo a calcio sulla spiaggia e nuotavamo il pomeriggio. Noi eravamo molto felici."$kt$, null),
  ('Italien', 15, $kt$Cours 15 · Exprimer la douleur et la santé$kt$, $kt$Décrire des symptômes physiques, utiliser la structure pour exprimer la douleur (Fare male), et interagir avec un professionnel de la santé.$kt$, $kt$Compréhension & Lecture

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
— stare a letto (rester au lit).$kt$, $kt$Medico : Buon pomeriggio, che cosa succede ? Dove Le fa male ? · Paciente : Buon pomeriggio, dottore. Mi fa molto male la testa e ho la febbre da ieri sera. Mi fanno male anche gli occhi. · Medico : Va bene, ha una leggera infezione. Deve prendere questo medicinale due volte al giorno e riposare molto.$kt$, null),
  ('Italien', 16, $kt$Cours 16 · Bilan du Module 2$kt$, $kt$Valider l’autonomie dans la vie quotidienne et la maîtrise des deux premiers temps du passé (Passato Prossimo et Imperfetto).$kt$, $kt$Compréhension Écrite & Lecture
Lisez cet extrait du journal de bord d’un voyageur :

Expression Écrite
Rédigez une lettre amicale (6 à 8 lignes) à un ami pour lui raconter ce que vous avez fait cette semaine (passé composé) et décrivez brièvement le logement où vous habitez actuellement.$kt$, $kt$"Questa settimana è stata incredibile. Lunedì ho visitato il centro storico e ho mangiato ottimi piatti tipici. L’appartamento in cui alloggio è piccolo ma è vicinissimo ai musei. Ieri mi ha fatto un po’ male la schiena per aver camminato tanto, ma oggi va già meglio. Quando ero più giovane non mi piaceva molto viaggiare, ma ora adoro scoprire nuove città e parlare con la gente del posto."$kt$, null),
  ('Italien', 17, $kt$Cours 17 · Raconter une action ponctuelle (Le Passé Simple Régulier / Passato Remoto)$kt$, $kt$Raconter une action passée, datée et complètement terminée, sans lien direct avec le présent.$kt$, $kt$Compréhension & Lecture

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
— Il souvenir / La cartolina : Le souvenir (objet) / La carte postale$kt$, $kt$Sofía : Ciao Diego, com’è andato il viaggio ? Quando sei arrivato a Milano ? · Diego : Ciao ! Arrivai lunedì scorso. Martedì visitai la Pinacoteca di Brera e mangiai un’incredibile cotoletta in centro. · Sofía : Che bello ! E hai comprato molte cose ? · Diego : Sì, scrissi delle cartoline per la mia famiglia e comprai alcuni souvenir. Il viaggio è finito ieri, ma mi è piaciuto moltissimo !$kt$, null),
  ('Italien', 18, $kt$Cours 18 · Maîtriser les irrégularités majeures du Passé Simple$kt$, $kt$Conjuguer et utiliser les verbes irréguliers les plus fréquents au Passato Remoto.$kt$, $kt$Compréhension & Lecture

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
— Essere in vacanza : Être en vacances$kt$, $kt$"Sabato scorso fu una giornata molto intensa. I miei fratelli e io andammo in montagna. Lì facemmo una lunghissima escursione. Di sera, dissi a mio fratello che avevo fame. Egli mise il cibo sul tavolo e passammo tutti un momento molto piacevole."$kt$, null),
  ('Italien', 19, $kt$Cours 19 · Alterner les temps du passé (Imparfait vs Passé Simple)$kt$, $kt$Choisir correctement entre le décor/l’habitude (Imperfetto) et l’action soudaine/déclenchante (Passato Remoto / Passato Prossimo) au sein d’un même récit.$kt$, $kt$Compréhension & Lecture

Grammaire : La règle de l’alternance
— Imperfetto (L’arrière-plan) : On l’utilise pour décrire le décor, la situation en cours, l’état d’esprit, le temps qu’il faisait. C’est l’action qui durait dans le temps (Ex : Io leggevo = Je lisais).
— Passato Remoto / Passato Prossimo (L’action de premier plan) : On l’utilise
pour l’événement soudain, l’action qui interrompt la situation ou qui fait avancer l’histoire
(Ex : Il telefono suonò / ha suonato = Le téléphone a sonné).

Vocabulaire Enrichi : Connecteurs de rupture et de narration
— All’improvviso / Di colpo = Soudain / Tout à coup
— Mentre = Pendant que / Tandis que
— Allora / Poi / In seguito = Alors / Ensuite
— Alla fine = Finalement / À la fin$kt$, $kt$"Ieri alle otto di sera, faceva un tempo magnifico e il sol splendeva. Io me ne stavo tranquillamente nella mia stanza e leggevo un libro di avventure. All’improvviso, il telefono suonò e il mio amico mi disse che aveva comprato una macchina nuova."$kt$, null),
  ('Italien', 20, $kt$Cours 20 · Projets et avenir (Le Futur et le Futur Proche)$kt$, $kt$Exprimer des projets d’avenir, faire des prédictions et utiliser la structure du futur proche.$kt$, $kt$Compréhension & Lecture

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
— Traslocare = Déménager$kt$, $kt$Mateo : Che cosa hai intenzione di fare l’anno prossimo, Elena ? · Elena : L’anno prossimo sto per andare a studiare all’estero. Vivrò a Buenos Aires, imparerò molto sulla loro cultura e lavorerò a tempo parziale. E tu ? · Mateo : Io rimarrò qui, cercherò un nuovo impiego e comprerò un appartamento se avrò abbastanza soldi.$kt$, null),
  ('Italien', 21, $kt$Cours 21 · Donner des ordres et des conseils (L’Impératif Affirmatif)$kt$, $kt$Maîtriser l’impératif affirmatif régulier et irrégulier pour donner des instructions, des directions ou des conseils professionnels.$kt$, $kt$Compréhension & Lecture

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
— Firmare un documento = Signer un document$kt$, $kt$Jefe (a Carlos) : Carlos, vieni nel mio ufficio, per favor. Ascolta con attenzione : parla oggi stesso con il cliente e scrivi la relazione prima delle cinque. Jefe (al becario) : Juan, Lei legga questo contratto con calma e firmi qui sotto, per favore.$kt$, null),
  ('Italien', 22, $kt$Cours 22 · Le monde du travail, l’entreprise et le CV$kt$, $kt$Parler de ses compétences professionnelles, décrire son parcours et comprendre les termes d’une offre d’emploi ou d’un CV.$kt$, $kt$Compréhension & Lecture

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
— Cordiali saluti / Distinti saluti (Veuillez agréer... / Cordialement – Fin de mail)$kt$, $kt$ń Il mio nome è Sofia e cerco un impiego nel settore tecnologico. Ho una laurea in Informatica e tre anni di esperienza lavorativa come sviluppatrice di software. Nel mio ultimo ruolo, ho lavorato in squadra, ho gestito progetti complessi e ho miglioré le mie competenze tecniche. Parlo italiano e inglese fluentemente. ż$kt$, null),
  ('Italien', 23, $kt$Cours 23 · Téléphone et communication formelle$kt$, $kt$Passer un appel professionnel, prendre un rendez-vous et utiliser les formules de politesse de base à l’écrit et à l’oral.$kt$, $kt$Compréhension & Lecture

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
— Cordiali saluti / Distinti saluti (Veuillez agréer... / Cordialement – Fin de mail)$kt$, $kt$Segretaria : Buon pomeriggio ! Azienda TechSolutions, come posso aiutarLa ? · Cliente : Buon pomeriggio. Vorrei parlare con il signor Martínez, per favore. · Segretaria : Un momento, per favore. Mi dispiace, il signor Martínez è in una riunione. Vuole lasciare un messaggio ? · Cliente : Sì, per favore. Gli dica che ha chiamato il signor Gómez. Richiamerò più tardi. Grazie, un cordiale saluto.$kt$, null),
  ('Italien', 24, $kt$Cours 24 · Bilan du Module 3$kt$, $kt$Évaluer et consolider l’autonomie dans les contextes formels et narratifs complexes.$kt$, $kt$Compréhension Écrite & Lecture
Offre d’emploi fictive dans un journal de Milan :
ń Azienda leader nel turismo cerca un impiegato amministrativo per la sua sede cen-

Expression Écrite Professionnelle
Rédigez un court e-mail professionnel (5 à 7 lignes) pour postuler à cette offre d’emploi. Commencez par une formule formelle (Gentile Direttore...), mentionnez vos compétences, utilisez la structure avec la préposition Da pour parler de votre expérience, et terminez par une formule de salutation polie.$kt$, $kt$trale. Requisiti : Laurea en economia o turismo, esperienza lavorativa minima di due anni e livello alto di italiano. Mansioni : Rispondere al telefono, redigere e-mail formali a clienti internazionali e organizzare l’agenda del team. Si offre contratto a tempo indeterminato e stipendio competitivo. Gli interessati possono inviare il proprio CV entro venerdì. ż$kt$, null),
  ('Italien', 25, $kt$Cours 25 · Exprimer l’hypothèse et la condition (Le Conditionnel Présent)$kt$, $kt$Imaginer des situations hypothétiques, exprimer des désirs réalisables ou irréalisables et formuler des suppositions.$kt$, $kt$Compréhension & Lecture

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
— Realizzare un sogno = Réaliser un rêve$kt$, $kt$Elena : Se avessi più tempo libero, viaggerei per tutta l’America Latina. Che cosa faresti tu con un milione di euro ? · Mateo : Che bella domanda ! Io comprerei una casa grande di fronte al mare e aprirei un ristorante mio. Inoltre, aiuterei la mia famiglia e viaggerei con te.$kt$, null),
  ('Italien', 26, $kt$Cours 26 · Introduction au Subjonctif Présent (Souhait et Désir)$kt$, $kt$Comprendre la formation du subjonctif présent et l’utiliser pour exprimer un souhait, une volonté ou un désir avec la structure Volere/Sperare che.$kt$, $kt$Compréhension & Lecture

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
— Avere la speranza che... = Avoir l’espoir que...$kt$, $kt$Madre : Figlio mio, voglio che tu studi per l’esame di domani. Spero che tu prenda un buon voto. · Hijo : Sì, mamma. Anche io spero che l’esame sia facile e che noi finiamo presto per poter uscire con i miei amici.$kt$, null),
  ('Italien', 27, $kt$Cours 27 · Exprimer l’opinion, la certitude et le doute$kt$, $kt$Maîtriser la bascule Indicatif / Subjonctif selon que l’on exprime une certitude ou un doute/négation.$kt$, $kt$Compréhension & Lecture

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
— Non c’è dubbio che... (+ indicatif) = Il ne fait aucun doute que...$kt$, $kt$ń Credo que il cambiamento climatico sia il più grande problema del nostro secolo. Tuttavia, non credo che i governi facciano abbastanza per risolverlo. È evidente che dobbiamo cambiare le nostre abitudini, ma dubito che sia un processo rapido. ż$kt$, null),
  ('Italien', 28, $kt$Cours 28 · Les connecteurs logiques et l’argumentation$kt$, $kt$Structurer un discours complexe, lier des idées opposées ou consécutives pour mener un débat écrit ou oral.$kt$, $kt$Compréhension & Lecture

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
— In conclusione (En conclusion)$kt$, $kt$"Imparare una seconda lingua è fondamentale nel mondo globalizzato. Da un lato, apre molte porte professionali ; dall’altro, ci permette di capire altre culture. Tuttavia, richiede molta costanza. Pertanto, bisogna studiare un po’ tutti i giorni, anche se a volte è difficile trovare il tempo."$kt$, null),
  ('Italien', 29, $kt$Cours 29 · Les médias, la technologie et l’actualité$kt$, $kt$Suivre les actualités, donner son point de vue sur les réseaux sociaux et l’évolution des médias en utilisant l’indicatif et le subjonctif de manière fluide.$kt$, $kt$Compréhension & Lecture

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
— Scaricare un’applicazione = Télécharger une application$kt$, $kt$"Al giorno d’oggi, la maggior parte delle persone si informa attraverso i social network invece di leggere il giornale cartaceo. Da un lato, questo permette un accesso immediato all’attualità ; dall’altro, aumenta il rischio di leggere notizie false (bufale). È preoccupante che molti giovani non verifichino la veridicità dell’informazione prima di condividerla."$kt$, null),
  ('Italien', 30, $kt$Cours 30 · L’environnement, l’écologie et l’avenir de la planète$kt$, $kt$Exprimer des craintes, des espoirs et des solutions pour la protection de l’environnement en utilisant le futur et le subjonctif.$kt$, $kt$Compréhension & Lecture

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
— La fauna e la flora = La faune et la flore$kt$, $kt$Sofía : Mi preoccupa molto il riscaldamento globale. Se non prendiamo misure urgenti, il cambiamento climatico distruggerà molti ecosistemi. · Mateo : Sono d’accordo. Per me, è fondamentale che i paesi riducano le emissioni di CO2 e promuovano l’uso di energie rinnovabili. Spero che le future generazioni possano vivere in un pianeta pulito.$kt$, null),
  ('Italien', 31, $kt$Cours 31 · Variations régionales et expressions idiomatiques$kt$, $kt$Comprendre les principales nuances de vocabulaire ou d’usage en Italie, et maîtriser quelques expressions idiomatiques courantes.$kt$, $kt$Compréhension & Lecture

Grammaire & Vocabulaire : Exemples de nuances d’usage en Italie
Concept                   Terme courant / Variante             Précision régionale / Contexte Le torchon                Il canovaccio / Lo strofinaccio       Variantes Nord / Centre-Sud Le cintre                 La gruccia / L’appendiabiti          Terme quotidien vs formel Le watermelon             L’anguria / Il cocomero              Usage majoritaire au Nord vs Centre-Sud La brioche / Croissant    Il cornetto / La brioche             Usage au Sud/Centre vs Nord Le petit déjeuner         La colazione / La prima colazione    Usage standard vs administratif

Expressions Idiomatiques Courantes (Modismi)
— Essere un gioco da ragazzi = Être un jeu d’enfant (très facile). (Esempio : L’italiano è un gioco da ragazzi !)
— Avere la testa tra le nuvole = Être dans les nuages / être distrait.
— Essere matto come un cavallo = Être complètement fou/folle.
— Mancare (a qualcuno) = Manquer à quelqu’un. (Esempio : Mi manchi = Tu me
manques).$kt$, $kt$ń Quando viaggi per l’Italia, scopri una ricchezza culturale e linguistica enorme. Sebbene l’italiano standard sia compreso ovunque, noterai parole diverse da nord a sud per oggetti quotidiani o abitudini culinarie. Nonostante queste varianti regionali, tutti ci capiamo alla perfezione. ż$kt$, null),
  ('Italien', 32, $kt$Cours 32 · Grand Bilan Final (Niveau A2/B1 validé)$kt$, $kt$Consolider l’ensemble des connaissances grammaticales, lexicales et culturelles des 32 cours.$kt$, $kt$Synthèse Écrite Générale (Texte de réflexion)
"Imparare l’italiano è stato un viaggio meraviglioso. Ho iniziato da zero, imparando a salutare e a fare lo spelling del mio nome. Con il tempo, ho imparato a descrivere la mia routine, a parlare dei miei ricordi d’infanzia e a muovermi in modo autonomo per la città. Oggi posso

già esprimere le mie opinioni sull’ambiente o sulle tecnologie, discutere usando connettori logici e usare il congiuntivo per parlare dei miei desideri. In futuro, continuerò a fare pratica per raggiungere una fluidità totale."

Grand Test Final de Syntaxe
Corrigez ou complétez les phrases suivantes en mobilisant vos compétences accumulées :
1. Ieri io                         (vedere - passato remoto irregolare) Javier al mercato.
2. Non credo che oggi                            (piovere - congiuntivo presente) a Milano.
3. Se avessi soldi, io                          (comprare - condizionale) un biglietto aereo.$kt$, $kt$$kt$, null)
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
  and c.language = 'Italien'
  and e.origin <> 'member';

-- les exercices des membres passent après ceux du manuel (position + 1000, une seule fois)
update public.language_exercises e
set position = e.position + 1000
from public.language_courses c
where e.course_id = c.id
  and c.language = 'Italien'
  and e.origin = 'member'
  and e.position < 1000;

-- 3) Nouveaux exercices du manuel
insert into public.language_exercises
  (course_id, position, prompt, answer, expected_answer, accepted_answers, explanation, exercise_type, origin)
select c.id, x.pos, x.prompt, x.expected, x.expected, x.accepted, x.explanation, 'written', 'manual'
from (values
  (1, 1, $kt$Complétez avec la forme correcte de essere ou chiamarsi : Io __________ Mateo.$kt$, $kt$sono / mi chiamo$kt$, array[$kt$sono / mi chiamo$kt$, $kt$sono mi chiamo$kt$, $kt$sono$kt$, $kt$mi chiamo$kt$]::text[], $kt$sono / mi chiamo$kt$),
  (1, 2, $kt$Complétez avec la forme correcte de essere ou chiamarsi : Come ti __________ tu ?$kt$, $kt$chiami$kt$, array[$kt$chiami$kt$]::text[], $kt$chiami$kt$),
  (1, 3, $kt$Complétez avec la forme correcte de essere ou chiamarsi : Lei __________ Elena.$kt$, $kt$si chiama / è$kt$, array[$kt$si chiama / è$kt$, $kt$si chiama è$kt$, $kt$si chiama$kt$, $kt$è$kt$]::text[], $kt$si chiama / è$kt$),
  (1, 4, $kt$(Expression écrite) Rédigez un mini-dialogue de 4 lignes où vous saluez quelqu’un, donnez votre prénom et demandez comment il/elle va.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Ciao ! Mi chiamo Carlos. Come va ? –> Ciao Carlos ! Io sono Ana. Sto molto bene, grazie.$kt$),
  (2, 1, $kt$Choisissez entre essere et avere : Mio fratello __________ 25 anni.$kt$, $kt$ha$kt$, array[$kt$ha$kt$]::text[], $kt$ha$kt$),
  (2, 2, $kt$Choisissez entre essere et avere : Io __________ francese, non sono spagnolo.$kt$, $kt$sono$kt$, array[$kt$sono$kt$]::text[], $kt$sono$kt$),
  (2, 3, $kt$Choisissez entre essere et avere : Tu __________ la macchina (une voiture) ?$kt$, $kt$hai$kt$, array[$kt$hai$kt$]::text[], $kt$hai$kt$),
  (2, 4, $kt$(Compréhension/Écrit) Écrivez en toutes lettres les chiffres suivants : 5, 12, 24, 15.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : cinque, dodici, ventiquattro, quindici.$kt$),
  (3, 1, $kt$Accordez l’adjectif entre parenthèses : Le ragazze sono __________ (intelligente).$kt$, $kt$intelligenti$kt$, array[$kt$intelligenti$kt$]::text[], $kt$intelligenti$kt$),
  (3, 2, $kt$Accordez l’adjectif entre parenthèses : Maria è una donna __________ (alto).$kt$, $kt$alta$kt$, array[$kt$alta$kt$]::text[], $kt$alta$kt$),
  (3, 3, $kt$Accordez l’adjectif entre parenthèses : I miei occhi sono __________ (verde).$kt$, $kt$verdi$kt$, array[$kt$verdi$kt$]::text[], $kt$verdi$kt$),
  (3, 4, $kt$(Expression) Faites une description de vous-même en trois phrases (taille, cheveux/yeux, et un trait de caractère).$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Sono un uomo basso. Ho gli occhi marroni e i capelli castani. Sono una persona molto tranquilla.$kt$),
  (4, 1, $kt$(Possessifs & Piacere) Remplissez les espaces vides. A me __________ piace viaggiare.$kt$, $kt$mi$kt$, array[$kt$mi$kt$]::text[], $kt$mi$kt$),
  (4, 2, $kt$(Possessifs & Piacere) Remplissez les espaces vides. Juan vive con __________ madre. (sa)$kt$, $kt$sua$kt$, array[$kt$sua$kt$]::text[], $kt$sua$kt$),
  (4, 3, $kt$(Possessifs & Piacere) Remplissez les espaces vides. A te __________ piace il calcio ?$kt$, $kt$piace$kt$, array[$kt$piace$kt$]::text[], $kt$piace$kt$),
  (4, 4, $kt$(Possessifs & Piacere) Remplissez les espaces vides. A noi __________ piacciono i libri.$kt$, $kt$ci$kt$, array[$kt$ci$kt$]::text[], $kt$ci$kt$),
  (4, 5, $kt$(Expression) Écrivez deux phrases en italien : l’une pour exprimer ce que vous aimez faire, et l’autre pour présenter un membre de votre famille (lien de parenté et prénom).$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Mi piace ascoltare musica. Mio fratello si chiama Carlo.$kt$),
  (5, 1, $kt$Écrivez l’heure en toutes lettres. 14 :15 → Sono le                             .$kt$, $kt$due e un quarto$kt$, array[$kt$due e un quarto$kt$]::text[], $kt$due e un quarto$kt$),
  (5, 2, $kt$Écrivez l’heure en toutes lettres. 01 :30 → È l’                        .$kt$, $kt$una e mezza$kt$, array[$kt$una e mezza$kt$]::text[], $kt$una e mezza$kt$),
  (5, 3, $kt$Écrivez l’heure en toutes lettres. 18 :45 → Sono le                             .$kt$, $kt$sette meno un quarto$kt$, array[$kt$sette meno un quarto$kt$]::text[], $kt$sette meno un quarto$kt$),
  (5, 4, $kt$Traduisez ń Aujourd’hui il fait froid et il pleut. ż$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Oggi fa freddo e piove.$kt$),
  (6, 1, $kt$Conjuguez au présent. Noi                          (vivere) a Milano.$kt$, $kt$viviamo$kt$, array[$kt$viviamo$kt$]::text[], $kt$viviamo$kt$),
  (6, 2, $kt$Conjuguez au présent. Tu                          (alzarsi) molto presto.$kt$, $kt$ti alzi$kt$, array[$kt$ti alzi$kt$]::text[], $kt$ti alzi$kt$),
  (6, 3, $kt$Conjuguez au présent. Loro                          (mangiare) una mela.$kt$, $kt$mangiano$kt$, array[$kt$mangiano$kt$]::text[], $kt$mangiano$kt$),
  (7, 1, $kt$Conjuguez les verbes entre parenthèses (attention aux irrégularités !). Io non                         (potere) venire domani.$kt$, $kt$posso$kt$, array[$kt$posso$kt$]::text[], $kt$posso$kt$),
  (7, 2, $kt$Conjuguez les verbes entre parenthèses (attention aux irrégularités !). Che cosa                          (volere) voi ?$kt$, $kt$volete$kt$, array[$kt$volete$kt$]::text[], $kt$volete (forme régulière à voi)$kt$),
  (7, 3, $kt$Conjuguez les verbes entre parenthèses (attention aux irrégularités !). I miei amici                         (solere) leggere la sera.$kt$, $kt$sogliono / di solito leggono$kt$, array[$kt$sogliono / di solito leggono$kt$, $kt$sogliono di solito leggono$kt$, $kt$sogliono$kt$, $kt$di solito leggono$kt$]::text[], $kt$sogliono / di solito leggono$kt$),
  (8, 1, $kt$Che lavoro fa Javier e quanti anni ha ?$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (8, 2, $kt$A che ora inizia la sua routine la mattina ?$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (8, 3, $kt$Che cosa fa di solito nei fine settimana se c’è il sole ?$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (9, 1, $kt$Remplissez les espaces par c’è, ci sono ou la forme correcte de essere. Dove                   la cattedrale di Siviglia ?$kt$, $kt$è$kt$, array[$kt$è$kt$]::text[], $kt$è (lieu précis)$kt$),
  (9, 2, $kt$Remplissez les espaces par c’è, ci sono ou la forme correcte de essere. In questa strada                   molti ristoranti tradizionali.$kt$, $kt$ci sono$kt$, array[$kt$ci sono$kt$]::text[], $kt$ci sono (indéterminé/pluriel)$kt$),
  (9, 3, $kt$Remplissez les espaces par c’è, ci sono ou la forme correcte de essere. Le mie chiavi                   sopra il tavolo.$kt$, $kt$sono$kt$, array[$kt$sono$kt$]::text[], $kt$sono (objets précis au pluriel)$kt$),
  (9, 4, $kt$Traduisez en italien "Pour aller à la gare, traversez la place et tournez à gauche."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Per andare alla stazione, attraversi la piazza e giri a sinistra.$kt$),
  (10, 1, $kt$Choisissez entre Dovere (conjugué) et Bisogna. Per imparare l’italiano,                     studiare tutti i giorni. (il faut)$kt$, $kt$bisogna$kt$, array[$kt$bisogna$kt$]::text[], $kt$bisogna$kt$),
  (10, 2, $kt$Choisissez entre Dovere (conjugué) et Bisogna. Domani                     alzarmi alle 6 :00 per andare al mercato. (je dois)$kt$, $kt$devo$kt$, array[$kt$devo$kt$]::text[], $kt$devo$kt$),
  (10, 3, $kt$Choisissez entre Dovere (conjugué) et Bisogna. Voi                    pagare il conto prima di uscire.$kt$, $kt$dovete$kt$, array[$kt$dovete$kt$]::text[], $kt$dovete$kt$),
  (10, 4, $kt$Rédigez une phrase Rédigez une phrase pour commander un plat de viande avec un verre de vin rouge.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Per me, vorrei il manzo e un bicchiere di vino rosso, per favore.$kt$),
  (11, 1, $kt$Complétez avec la structure de comparaison demandée. Questa macchina è                         (plus rapide que) quel autobus.$kt$, $kt$più veloce di$kt$, array[$kt$più veloce di$kt$]::text[], $kt$più veloce di$kt$),
  (11, 2, $kt$Complétez avec la structure de comparaison demandée. La mia maglietta è                        (aussi jolie que) la tua.$kt$, $kt$bella come$kt$, array[$kt$bella come$kt$]::text[], $kt$bella come (ou bella quanto)$kt$),
  (11, 3, $kt$Complétez avec la structure de comparaison demandée. L’inverno è                       (pire que) l’estate.$kt$, $kt$peggiore de l’$kt$, array[$kt$peggiore de l’$kt$]::text[], $kt$peggiore de l’ (ou peggiore rispetto all’)$kt$),
  (11, 4, $kt$Traduisez ń Ces chaussures (proches) sont moins chères que ces bottes (éloignées). ż$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Queste scarpe sono meno care de quei stivali.$kt$),
  (12, 1, $kt$Complétez les phrases en utilisant les prépositions de lieu adaptées au contexte. Macchina è                          (dans) il garage.$kt$, $kt$nel$kt$, array[$kt$nel$kt$]::text[], $kt$nel$kt$),
  (12, 2, $kt$Complétez les phrases en utilisant les prépositions de lieu adaptées au contexte. I libri sono                        (sur) il tavolo del salone.$kt$, $kt$sul$kt$, array[$kt$sul$kt$]::text[], $kt$sul (ou ’sopra il’)$kt$),
  (12, 3, $kt$Complétez les phrases en utilisant les prépositions de lieu adaptées au contexte. Il bagno è                         (à côté de) mia stanza.$kt$, $kt$accanto alla$kt$, array[$kt$accanto alla$kt$]::text[], $kt$accanto alla$kt$),
  (12, 4, $kt$(Expression) Décrivez en 3 phrases simples votre propre pièce préférée et la position de deux meubles à l’intérieur.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : La mia stanza preferita è la camera da letto. Il mio letto è tra l’armadio e la finestra. Sopra il letto c’è una lampada blu.$kt$),
  (13, 1, $kt$Conjuguez au Passato Prossimo (attention aux choix de l’auxiliaire et aux accords) : Questa settimana, noi                            (viaggiare) a Milano.$kt$, $kt$abbiamo viaggiato$kt$, array[$kt$abbiamo viaggiato$kt$]::text[], $kt$abbiamo viaggiato$kt$),
  (13, 2, $kt$Conjuguez au Passato Prossimo (attention aux choix de l’auxiliaire et aux accords) : Tu                         (vedere) il nuovo film di Almodóvar ?$kt$, $kt$hai visto$kt$, array[$kt$hai visto$kt$]::text[], $kt$hai visto$kt$),
  (13, 3, $kt$Conjuguez au Passato Prossimo (attention aux choix de l’auxiliaire et aux accords) : Io non ho ancora                            (scrivere) la relazione.$kt$, $kt$scritto$kt$, array[$kt$scritto$kt$]::text[], $kt$scritto$kt$),
  (14, 1, $kt$Conjuguez à l’imparfait. Da bambina, Maria                           (essere) molto timida.$kt$, $kt$era$kt$, array[$kt$era$kt$]::text[], $kt$era$kt$),
  (14, 2, $kt$Conjuguez à l’imparfait. I miei genitori                       (andare) tutti gli anni in vacanza.$kt$, $kt$andavano$kt$, array[$kt$andavano$kt$]::text[], $kt$andavano$kt$),
  (14, 3, $kt$Conjuguez à l’imparfait. Noi                        (avere) un cane grande.$kt$, $kt$avevamo$kt$, array[$kt$avevamo$kt$]::text[], $kt$avevamo$kt$),
  (15, 1, $kt$Choisissez entre fa male et fanno male. A Juan                      lo stomaco dopo aver mangiato.$kt$, $kt$fa male$kt$, array[$kt$fa male$kt$]::text[], $kt$fa male$kt$),
  (15, 2, $kt$Choisissez entre fa male et fanno male. A me                      le gambe per aver corso così tanto.$kt$, $kt$fanno male$kt$, array[$kt$fanno male$kt$]::text[], $kt$fanno male$kt$),
  (15, 3, $kt$Traduisez "J’ai mal à la gorge et j’ai de la fièvre."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Mi fa male la gola e ho la febbre.$kt$),
  (16, 1, $kt$Complétez le texte avec le temps du passé qui convient (Passato Prossimo ou Imperfetto) : "Oggi mi                     (alzarsi) alle 8 :00. Mentre                (fare) il caffè, mi sono ricordato che quando                       (essere) bambino,                 (prendere) sempre il latte caldo la mattina."$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (17, 1, $kt$Conjuguez les verbes au Passato Remoto. L’anno scorso, io                            (lavorare) a Milano.$kt$, $kt$lavorai$kt$, array[$kt$lavorai$kt$]::text[], $kt$lavorai$kt$),
  (17, 2, $kt$Conjuguez les verbes au Passato Remoto. Tu                          (imparare) molto durante il corso ?$kt$, $kt$imparasti$kt$, array[$kt$imparasti$kt$]::text[], $kt$imparasti$kt$),
  (17, 3, $kt$Conjuguez les verbes au Passato Remoto. I miei amici                         (decidere) di uscire a fare festa ieri sera.$kt$, $kt$decisero$kt$, array[$kt$decisero$kt$]::text[], $kt$decisero$kt$),
  (18, 1, $kt$Complétez avec le verbe irrégulier demandé au passé simple. Il fine settimana scorso io                          (aller) in spiaggia.$kt$, $kt$andai$kt$, array[$kt$andai$kt$]::text[], $kt$andai$kt$),
  (18, 2, $kt$Complétez avec le verbe irrégulier demandé au passé simple. Loro non                          (faire) i compiti ieri.$kt$, $kt$fecero$kt$, array[$kt$fecero$kt$]::text[], $kt$fecero$kt$),
  (18, 3, $kt$Complétez avec le verbe irrégulier demandé au passé simple. Noi                          (avoir) che uscire presto.$kt$, $kt$avemmo$kt$, array[$kt$avemmo$kt$]::text[], $kt$avemmo (ou dovemmo pour "dû")$kt$),
  (19, 1, $kt$Choisissez entre l’imparfait et le passé composé/simple. Mentre yo                          (cucinare), il mio amico                          (arrivare) a casa.$kt$, $kt$cucinavo$kt$, array[$kt$cucinavo$kt$]::text[], $kt$cucinavo (action longue) / arrivò (ou è arrivato, action soudaine)$kt$),
  (19, 2, $kt$Choisissez entre l’imparfait et le passé composé/simple. (Essere) le dieci di sera quando                           (cominciare) a piovere.$kt$, $kt$Erano$kt$, array[$kt$Erano$kt$]::text[], $kt$Erano (l’heure s’exprime toujours à l’imparfait) / cominciò (ou ha cominciato, action ponctuelle)$kt$),
  (20, 1, $kt$Conjuguez au futur simple. Domani noi                           (viaggiare) a Parigi.$kt$, $kt$viaggeremo$kt$, array[$kt$viaggeremo$kt$]::text[], $kt$viaggeremo$kt$),
  (20, 2, $kt$Conjuguez au futur simple. Credo que tu                             (trovare) un buon lavoro.$kt$, $kt$troverai$kt$, array[$kt$troverai$kt$]::text[], $kt$troverai$kt$),
  (20, 3, $kt$Transformez la phrase au futur proche (Stare per + infinitif ) : ń Io studio l’italiano ż → Io                                  .$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Io sto per studiare l’italiano.$kt$),
  (21, 1, $kt$Transformez ces verbes à l’impératif (personne Tu). (Tu - Fare)                        i compiti.$kt$, $kt$Fai$kt$, array[$kt$Fai$kt$]::text[], $kt$Fai (ou Fa’)$kt$),
  (21, 2, $kt$Transformez ces verbes à l’impératif (personne Tu). (Tu - Mangiare)                         la mela.$kt$, $kt$Mangia$kt$, array[$kt$Mangia$kt$]::text[], $kt$Mangia$kt$),
  (21, 3, $kt$Transformez ces verbes à l’impératif (personne Tu). (Tu - Avere)                         pazienza.$kt$, $kt$Abbi$kt$, array[$kt$Abbi$kt$]::text[], $kt$Abbi$kt$),
  (21, 4, $kt$Donnez le même ordre en passant du tutoiement (Tu) au vouvoiement de politesse (Lei) : ń Vieni nel mio ufficio ż → ń Lei                          nel mio ufficio ż.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Venga$kt$),
  (22, 1, $kt$Traduisez la phrase suivante en italien formel en utilisant le conditionnel de politesse : "Je voudrais prendre un rendez-vous avec le médecin."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Vorrei prendere un appuntamento con il medico.$kt$),
  (23, 1, $kt$Traduisez la phrase suivante en italien formel en utilisant le conditionnel de politesse : "Je voudrais prendre un rendez-vous avec le médecin."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Vorrei prendere un appuntamento con il medico.$kt$),
  (24, 1, $kt$La empresa busca un ingegnere informatico.$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (24, 2, $kt$È obbligatorio avere almeno due anni di esperienza lavorativa.$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (24, 3, $kt$Il contratto offerto è a tempo limitato.$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (25, 1, $kt$Conjuguez au conditionnel présent. Se potessi,                         (fare) un viaggio nello spazio.$kt$, $kt$farei$kt$, array[$kt$farei$kt$]::text[], $kt$farei$kt$),
  (25, 2, $kt$Conjuguez au conditionnel présent. Voi                          (vivere) in un altro paese ?$kt$, $kt$vivreste$kt$, array[$kt$vivreste$kt$]::text[], $kt$vivreste$kt$),
  (25, 3, $kt$Conjuguez au conditionnel présent. Lei                         (dovere) studiare di più per superare l’esame.$kt$, $kt$dovrebbe$kt$, array[$kt$dovrebbe$kt$]::text[], $kt$dovrebbe$kt$),
  (26, 1, $kt$Conjuguez les verbes au subjonctif présent. Il mio capo vuole che io                           (scrivere) una relazione oggi.$kt$, $kt$scriva$kt$, array[$kt$scriva$kt$]::text[], $kt$scriva$kt$),
  (26, 2, $kt$Conjuguez les verbes au subjonctif présent. Spero che voi                          (mangiare) bene al ristorante.$kt$, $kt$mangiate$kt$, array[$kt$mangiate$kt$]::text[], $kt$mangiate (indicatif et subjonctif sont identiques à voi)$kt$),
  (26, 3, $kt$Conjuguez les verbes au subjonctif présent. Magari domani                            (fare) bel tempo.$kt$, $kt$faccia$kt$, array[$kt$faccia$kt$]::text[], $kt$faccia (irrégulier)$kt$),
  (27, 1, $kt$Choisissez entre le présent de l’indicatif et le subjonctif. È vero che la situazione                           (essere) difficile.$kt$, $kt$è$kt$, array[$kt$è$kt$]::text[], $kt$è (certitude absolue)$kt$),
  (27, 2, $kt$Choisissez entre le présent de l’indicatif et le subjonctif. Non credo que lei                            (venire) alla festa.$kt$, $kt$venga$kt$, array[$kt$venga$kt$]::text[], $kt$venga (négation)$kt$),
  (27, 3, $kt$Choisissez entre le présent de l’indicatif et le subjonctif. Dubito molto che loro                            (sapere) la verità.$kt$, $kt$sappiano$kt$, array[$kt$sappiano$kt$]::text[], $kt$sappiano (expression du doute)$kt$),
  (28, 1, $kt$Complétez le texte court avec les connecteurs suivants : perché, tuttavia, inoltre. "Mi piace molto vivere a Milano                      è una città con molta vita culturale.            , ha dei parchi meravigliosi per passeggiare.                      , in estate fa troppo caldo."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : perché / Inoltre / Tuttavia$kt$),
  (29, 1, $kt$Conjuguez au mode approprié (Indicatif ou Subjonctif). È vero che internet                          (avere) molti vantaggi.$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (29, 2, $kt$Conjuguez au mode approprié (Indicatif ou Subjonctif). È necessario che gli utenti                          (essere) prudenti in rete.$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (29, 3, $kt$Conjuguez au mode approprié (Indicatif ou Subjonctif). È un peccato che molte persone non                            (leggere) libri. E xercice 1 : 1. ha (certitude absolue) | 2. siano (necessità/giudizio) | 3. leggano (rimpianto/sentimento)$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (30, 1, $kt$Traduisez la phrase suivante en italien "J’ai peur que la pollution augmente dans le futur."$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Ho paura che l’inquinamento aumenti in futuro.$kt$),
  (31, 1, $kt$Thématique adéquation. Associez l’expression à sa signification. Non mi ascolti, hai sempre...                                    A. matto come un cavallo.$kt$, $kt$B$kt$, array[$kt$B$kt$]::text[], $kt$B$kt$),
  (31, 2, $kt$Thématique adéquation. Associez l’expression à sa signification. Questo esame è stato...                                             B. la testa tra le nuvole.$kt$, $kt$C$kt$, array[$kt$C$kt$]::text[], $kt$C$kt$),
  (31, 3, $kt$Thématique adéquation. Associez l’expression à sa signification. Tuo zio fa cose stranissime, è...                                    C. un gioco da ragazzi.$kt$, $kt$A$kt$, array[$kt$A$kt$]::text[], $kt$A$kt$)
) as x(course_number, pos, prompt, expected, accepted, explanation)
join public.language_courses c
  on c.language = 'Italien' and c.course_number = x.course_number;

commit;

-- Contrôle (à lancer après) : doit afficher 32 cours et 93 exercices du manuel
-- select count(*) from public.language_courses where language = 'Italien';
-- select count(*) from public.language_exercises e join public.language_courses c on c.id = e.course_id
--   where c.language = 'Italien' and e.origin = 'manual';
