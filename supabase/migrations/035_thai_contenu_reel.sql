-- Keltia : contenu réel des 64 cours de thaï (source : manuel Thailandais.pdf).
-- Cible uniquement la bibliothèque Plan & Plate (language_courses / language_exercises).
-- Ne touche PAS au planning (weekly_schedule_items).
-- Relançable sans risque : les cours sont mis à jour par (language, course_number),
-- les exercices du manuel sont recréés, les exercices ajoutés par les membres sont conservés.

begin;

-- 1) Cours : titre, objectif, théorie et exemples réels ; plus de « Semaine X » (hors planning)
insert into public.language_courses (language, course_number, title, summary, theory, examples, week_number)
values
  ('Thaï', 1, $kt$Cours 1 · [ÉCRIT] Les consonnes moyennes et les voyelles de base$kt$, $kt$Maîtriser le tracé, l’orientation et la mémorisation des 7 consonnes de classe moyenne principales et des premières voyelles longues.$kt$, $kt$Tracé et Graphie : L’importance du petit cercle
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
Exemple : เ + ก = เก [kéé].$kt$, $kt$Exemple : ก + _า = กา [kaa]. · Exemple : เ + ก = เก [kéé].$kt$, null),
  ('Thaï', 2, $kt$Cours 2 · [LECTURE] Clinique de Lecture & Décodage de blocs syllabiques$kt$, $kt$Identifier les frontières des mots, lire des syllabes simples de classe moyenne et s’affranchir visuellement des ressemblances entre caractères.$kt$, $kt$Théorie de la Lecture : L’absence d’espaces
Le thaï n’utilise pas d’espaces entre les mots. Les espaces ne servent que pour marquer la fin d’une phrase, une liste ou une pause majeure dans le discours. Pour décoder un texte, il faut repérer visuellement les consonnes initiales qui portent les voyelles.

Analyse de formes proches et pièges visuels :
• Ne confondez pas ด et บ : Le ด (do dek) possède son cercle initial orienté vers l’intérieur (vers la droite), tandis que le บ (bo baïmaï) est une lettre plus large, formant un rectangle ouvert vers le haut.

• Ne confondez pas ต et ก : Le ต (to tao) présente une brisure/vague caractéristique sur le dessus de sa boucle, alors que le ก (ko kaï) a un dessus totalement lisse.

Règle de lecture de base : Consonne + Voyelle
• ตา → ต [T] + _า [aa] = Taa (Grand-père / œil).

• ดี → ด [D] + _ี [ii] (voyelle chapeau longue) = Dii (Bien / bon).

• ตาดา → S’écrit d’un seul bloc. Vous devez séparer mentalement : ตา (taa) | ดา (daa).$kt$, $kt$$kt$, null),
  ('Thaï', 3, $kt$Cours 3 · [COMPRÉHENSION] Laboratoire d’Écoute & Les 3 premiers tons$kt$, $kt$Entraîner l’oreille à discriminer le ton moyen, le ton bas et le ton tombant, et repérer les formules de politesse fondamentales à l’oral.$kt$, $kt$Théorie de l’Écoute : La musique des tons
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

• คะ (Kha) : Utilisé par les femmes pour poser une question ou interpeller quelqu’un. Se prononce sur un ton haut.$kt$, $kt$Exemple : กา [kaa] = corbeau. · Exemple : ก่า [kàa]. · Exemple : ก้า [kâa].$kt$, null),
  ('Thaï', 4, $kt$Cours 4 · [EXPRESSION] Grand Atelier d’Introduction de Soi$kt$, $kt$Rédiger ses premières phrases en écriture thaïe selon la structure SVO et se présenter à voix haute de manière fluide avec l’intonation exacte des tons de politesse.$kt$, $kt$Syntaxe & Grammaire : La structure SVO
Le thaï utilise exactement le même ordre linéaire des mots que le français : Sujet + Verbe + Objet. Il n’y a aucune conjugaison ; les verbes sont des blocs lexicaux invariables.

Les pronoms personnels de base :

• ฉั น (tchan) : ”Je” pour les femmes (Ton haut).

• ผม (phom) : ”Je” pour les hommes (Ton montant).

• คุณ (khun) : ”Vous / Tu” (Ton moyen).

Le verbe d’identité :

• ชื่อ (tchuu) : S’appeler / porter le nom de (Ton tombant).

Structure d’assemblage :
→ ผม / ฉั น + ชื่อ + [Prénom] + ครับ / ค่ะ

Lexique de la Présentation
• สบายดีไหม (sa-baï-dii-maï ?) = Comment ça va ?

• สบายดี (sa-baï-dii) = Ça va bien.

• ขอบคุณ (khop-khun) = Merci.$kt$, $kt$$kt$, null),
  ('Thaï', 5, $kt$Cours 5 · [ÉCRIT] Les consonnes hautes et l’impact sur le tracé$kt$, $kt$Maîtriser le tracé et la reconnaissance des 7 consonnes de classe haute principales et comprendre l’impact visuel des boucles internes et externes.$kt$, $kt$Tracé et Graphie : L’orientation des boucles
En thaï, la direction dans laquelle vous commencez le tracé du cercle initial change totalement l’identité de la lettre. Les consonnes de classe haute (High Class) modifient de façon intrinsèque le ton naturel des voyelles qui leur sont associées.

Les 7 consonnes de classe haute principales (À mémoriser) :
• ข (kho khaï) : Le son [Kh] aspiré (comme le ch allemand ou un [k] expiré). Attention à ne pas faire de boucle ou d’ondulation sur le dessus.

• ฉ (tcho tching) : Le son [Tch] fortement soufflé.

• ถ (to thung) : Le son [T] soufflé. Le cercle initial commence par le bas et monte vers l’intérieur de la lettre.

• ผ (pho pheung) : Le son [P] soufflé. La dentelure centrale remonte seulement à mihauteur.

• ฝ (fo fa) : Le son [F]. Identique graphiquement au ผ mais la ligne droite de fin monte beaucoup plus haut.

• ส (so sua) : Le son [S]. Ressemble à la structure du ก mais comporte une boucle en bas à gauche et un petit accent oblique en haut à droite.

• ห (ho hip) : Le son [H] aspiré ou lettre muette de modification de ton (outil grammatical de focalisation tonale).$kt$, $kt$$kt$, null),
  ('Thaï', 6, $kt$Cours 6 · [LECTURE] La syntaxe de la négation sans espaces$kt$, $kt$Repérer visuellement l’adverbe de négation dans un bloc de texte thaï continu et lire des phrases négatives fluides.$kt$, $kt$Théorie de la Lecture : Isoler la négation
Pour exprimer la négation (equivalent de « non » ou « ne... pas »), le système thaï exploite le mot ไม่ (maï - prononcé de manière tendue avec un ton tombant).

Règle syntaxique immuable :  (maï) + Verbe

• Le mot ไม่ se place toujours devant le verbe qu’il modifie.

• Voyelle pré-positionnée : Remarquez graphiquement que la voyelle ไ_ (sara maï-malai / son [aï]) s’écrit obligatoirement devant la consonne principale ม. Le signe de ton tombant (_้) se place quant à lui juste au-dessus de la consonne.

Analyse visuelle en contexte :

• Exemple d’assemblage : ไม่ดี → ไม่ (pas) + ดี (bon) = Maï dii (Ce n’est pas bon).

• Phrase complète sans espaces : ฉั นไม่ดีค่ะ → ฉั น (Je) | ไม่ (ne... pas) | ดี (être bon) | ค่ะ (politesse). À la lecture, vous devez utiliser le long trait vertical caractéristique de la voyelle ไ comme un jalon visuel pour isoler le début du bloc négatif.$kt$, $kt$$kt$, null),
  ('Thaï', 7, $kt$Cours 7 · [COMPRÉHENSION] Les tons haut et montant et l’oreille Lakorn$kt$, $kt$Discriminer le ton haut et le ton montant à l’écoute et décoder l’écosystème des termes familiaux dans une scène de série.$kt$, $kt$Théorie de l’Écoute : Les deux derniers tons
Pour compléter votre spectre d’écoute, analysons les deux tons les plus expressifs et mélodramatiques des séries thaïlandaises :

• Le ton haut (High tone) : La voix monte nettement dans les aigus et reste perchée, traduisant souvent la surprise, l’intensité ou une interrogation.
Exemple : น้ า [náa] = tante.

• Le ton montant (Rising tone) : La voix commence dans un registre bas, descend
légèrement puis remonte de manière très mélodieuse vers les aigus.
Exemple : ผม [phǒm] = je (homme) / cheveux.

Écoute active : Scène de dialogue familial$kt$, $kt$Dans les Lakorns (séries télévisées), les termes de parenté sont omniprésents. Ils s’utilisent pour s’adresser à n’importe quel interlocuteur (même sans lien de parenté réel) afin de marquer le respect, la hiérarchie sociale ou la proximité affective. • แม่ (mæ̂æ) : Maman (Ton tombant). • พ่อ (pĥ) : Papa (Ton tombant). • พี่ (phîi) : Grand frère / grande sœur. Particulièrement fréquent pour s’adresser avec déférence à une personne légèrement plus âgée que soi.$kt$, null),
  ('Thaï', 8, $kt$Cours 8 · [EXPRESSION] Grand Atelier de la lignée familiale$kt$, $kt$Rédiger un descriptif de son entourage en caractères natifs et présenter sa famille oralement avec les dynamiques de tons appropriées.$kt$, $kt$Syntaxe : Poser une question avec
Pour transformer une proposition affirmative en question fermée (réponse par oui ou non), on ajoute simplement la particule interrogative ไหม (maï ? - prononcée avec un ton montant, ou haut à l’oral rapide) à la toute fin de la structure.

Structure : Sujet + Verbe + ไหม ?

Exemple : พี่สบายดีไหมคะ (Phii sa-baï-dii maï kha ?) = Est-ce que mon grand frère / ma grande sœur va bien ?

Lexique des relations de proximité
• แฟน (faen) = Petit(e)-ami(e) / conjoint(e) / partenaire.

• เพื่อน (pheuan) = Ami(e) (Ton tombant).

• รัก (rak) = Aimer (Ton haut).$kt$, $kt$Exemple : พี่สบายดีไหมคะ (Phii sa-baï-dii maï kha ?) = Est-ce que mon grand frère / ma grande sœur va bien ?$kt$, null),
  ('Thaï', 9, $kt$Cours 9 · [ÉCRIT] Les consonnes basses et les chiffres thaïs$kt$, $kt$Maîtriser le tracé des consonnes de classe basse les plus courantes et l’écriture des chiffres thaïs officiels.$kt$, $kt$Tracé et Graphie : La classe la plus volumineuse
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
Note : Le chiffre ๕ (5) est identique graphiquement au ๔ (4) mais comporte une petite boucle fermée supplémentaire sur son sommet.$kt$, $kt$$kt$, null),
  ('Thaï', 10, $kt$Cours 10 · [LECTURE] Le système des classificateurs$kt$, $kt$Repérer visuellement et lire les classificateurs numériques (mots compteurs) au sein d’un texte compact sans espaces.$kt$, $kt$Théorie de la Lecture : L’ordre obligatoire Quantité + Compteur
En thaï, il est impossible d’accoler directement un adjectif numéral derrière ou devant un nom. Il faut obligatoirement insérer un classificateur (mot compteur spécifique déterminé par la catégorie sémantique de l’objet).

La structure syntaxique de décompte : [Nom] + [Chiffre] + [Classificateur]
• คน (khon) : Le classificateur officiel pour les êtres humains.

• Exemple d’assemblage : เพื่อนสามคน → เพื่อน (ami) | สาม (3) | คน (compteur humain) = Pheuan saam khon (Trois amis).

Analyse visuelle sur le terrain :
Dans un texte fluide sans espaces, repérez en premier lieu le chiffre (qu’il soit écrit en caractères arabes ou traditionnels). Le bloc de caractères qui suit immédiatement ce chiffre correspond systématiquement au classificateur.$kt$, $kt$$kt$, null),
  ('Thaï', 11, $kt$Cours 11 · [COMPRÉHENSION] Laboratoire d’Écoute & Immersion Street Food$kt$, $kt$Entraîner l’oreille à capter les prix, les questions d’argent et les nombres à vitesse réelle dans l’environnement d’un marché de Bangkok.$kt$, $kt$Théorie de l’Écoute : Capter la structure financière
Lors des transactions commerciales, les prix sont énoncés de manière rapide. Pour ne pas saturer votre mémoire de travail, vous devez focaliser votre attention sur le mot interrogatif et la devise sous-jacente.

• เท่าไหร่ (thao-raï ?) = Combien ? (Ton bas + Ton moyen).

• บาท (baht) = Baht (Devise nationale / Ton bas).

Jargon d’écoute des chiffres de base à l’oreille (Chiffres sino-thaïs) :

หนึ่ ง (neung - 1)   สอง (song - 2)    ou สาม (saam - 3)   สี่ (sii - 4)   ห้า (haa - 5)   สิบ (sip - 10)   ร้อย (roy - 100

Exemple d’enchaînement auditif : สี่สิบบาท (sii-sip baht) = 40 Bahts.$kt$, $kt$Exemple d’enchaînement auditif : สี่สิบบาท (sii-sip baht) = 40 Bahts.$kt$, null),
  ('Thaï', 12, $kt$Cours 12 · [EXPRESSION] Grand Atelier d’achat sur le marché de Chatuchak$kt$, $kt$Rédiger un script de commande de nourriture en caractères thaïs et simuler oralement l’achat fluide de street food avec les formules d’amabilité requises.$kt$, $kt$Syntaxe & Grammaire : Demander un objet avec
Pour formuler une demande polie (commander un plat, solliciter l’addition), on ouvre impérativement la structure de la phrase par le verbe ขอ (kho - Ton montant), qui se traduit par « Je sollicite / S’il vous plaît, donnez-moi ».
Structure : ขอ + [Nom de l’objet] + [Quantité] + [Classificateur] + ครับ/ค่ะ

• อัน (an) : Classificateur générique pour les petits objets, les plats ou les articles indéterminés (Ton moyen).

Lexique de la Street Food
• นํ ้ า (naam) = Eau / liquide (Ton haut).
• กาแฟ (kaa-fae) = Café (Ton moyen).

• อร่อย (a-roy) = Délicieux / savoureux (Ton bas).$kt$, $kt$$kt$, null),
  ('Thaï', 13, $kt$Cours 13 · [ÉCRIT] La particule de lieu Yoo et l’espace$kt$, $kt$Maîtriser le tracé complexe du verbe d’existence spatiale Yoo (อย่)ู et des indicateurs de position de base.$kt$, $kt$Tracé et Graphie : L’écriture des voyelles verticales
En thaï, se situer dans l’espace ou indiquer la localisation d’un objet requiert l’utilisation d’un verbe pivot incontournable : อยู่ (yòo - Ton bas). C’est un caractère particulièrement formateur pour l’apprentissage de l’écriture car il exige d’empiler plusieurs éléments de manière verticale.

Analyse structurelle et tracé de อยู่ (yòo) :
• La consonne initiale de support est อ (muette).

• La consonne suivante, qui détermine la modification de classe, est ย (placée immédiatement après).

• La voyelle _ู (sara uu long) s’écrit obligatoirement au-dessous de la consonne ย.

• Le signe de ton bas _่ (mai ek) se place précisément au-dessus de cette même consonne ย.

Les indicateurs de position de base (À mémoriser) :

• ที่น่ี (thîi-nîi) : Ici (Ton tombant + Ton tombant).

• ที่นั่น (thîi-nân) : Là-bas (Ton tombant + Ton haut).$kt$, $kt$$kt$, null),
  ('Thaï', 14, $kt$Cours 14 · [LECTURE] Décodage d’itinéraires et de plans simplifiés$kt$, $kt$Repérer les indicateurs spatiaux dans un texte thaï continu et lire un itinéraire simple sans espaces de séparation.$kt$, $kt$Théorie de la Lecture : La structure de localisation
Pour lire et comprendre instantanément où se trouve un personnage, repérez le point d’ancrage visuel อยู่ (yòo). La syntaxe thaïlandaise suit fidèlement la logique linéaire suivante :

[Sujet] + อยู่ + [Lieu / Position]

• Exemple visuel en contexte : อู่อยู่ท่ีน่ี → อู่ (Prénom Ou) | อยู่ (se trouve) | ที่น่ี (ici) = Oo yòo thîi-nîi (Ou est ici).

Le verbe de déplacement :

• ไป (paï ) : Aller / se déplacer (Ton moyen). Remarquez que la voyelle ไ_ s’écrit obligatoirement devant la consonne de base ป.

• Exemple d’association : ไปที่นั่น (paï thîi-nân) = Aller là-bas.$kt$, $kt$$kt$, null),
  ('Thaï', 15, $kt$Cours 15 · [COMPRÉHENSION] Laboratoire d’Écoute & Négociation Tuk-tuk$kt$, $kt$Entraîner l’oreille à capter les directions cardinales, les ordres de déplacement et les annonces d’arrêt dans un dialogue de transport à vitesse réelle.$kt$, $kt$Compréhension Orale : Scène de déplacement urbain
Dans l’environnement de Bangkok, les interactions avec les chauffeurs de taxi ou de Tuk-tuk sont constantes. Pour capter le fil de l’action, vous devez isoler les mots de direction et l’ordre d’arrêt.
Script audio du laboratoire d’écoute (Chauffeur et Passager) :$kt$, $kt$ผู้โดยสาร (Passager) : ไปโรงพยาบาลครับ · คนขับ (Chauffeur) : ไปทางไหนครับ ? เลีย   ้ วซ้ายไหมครับ ? · ผู้โดยสาร (Passager) : ไม่ครับ ตรงไปครับ... แล้วก็จอดที่น่ี ครับ$kt$, null),
  ('Thaï', 16, $kt$Cours 16 · [EXPRESSION] Grand Bilan du Bloc 1 & Monologue de la Série$kt$, $kt$Rédiger une synthèse d’identité complète en caractères thaïs et soutenir un monologue oral continu de 3 minutes pour valider l’ensemble des acquis du Bloc 1.$kt$, $kt$Grand Atelier d’Expression Orale : Le Pitch du Personnage de Lakorn

Trame narrative obligatoire à verbaliser :
1. Salutations et identité : „Sawatdee ka/krap, tchan/phom tchuu [Votre Prénom] ka/krap.“
2. État d’esprit et entourage : Dites que vous allez bien (sa-baï-dii), que vous aimez votre ami (rak pheuan) mais que vous n’aimez pas une situation spécifique (maï rak).

Localisation et clôture : Indiquez que vous êtes ici (yòo thîi-nîi), et concluez par une
formule de remerciement polie (khop-khun ka/krap).
Focus éradication des fautes (Critères de validation) :
• Mélodie des tons : Respectez scrupuleusement la musique des tons. Le ton bas de อยู่ (yòo) et le ton tombant de ที่น่ี (thîi-nîi) doivent s’enchaîner sans aucune rupture ou hésitation de débit.
• Intégration des particules : Fusionnez les particules de politesse (ka / krap) de manière naturelle à la fin de vos énoncés, sans les détacher artificiellement de la phrase.

CHAPITRE 2

BLOC 2 : Temps, actions & fluide
spontanéité$kt$, $kt$$kt$, null),
  ('Thaï', 17, $kt$Cours 17 · [ÉCRIT] Les voyelles complexes et les consonnes basses restantes$kt$, $kt$Maîtriser le tracé des voyelles combinées (diphtongues) et des dernières consonnes basses indispensables pour écrire le futur.$kt$, $kt$Tracé et Graphie : L’encapsulation de la consonne
En thaï, la structure des voyelles complexes bouscule la logique linéaire : certaines voyelles entourent complètement la consonne. Elles s’écrivent simultanément devant, derrière et au-dessus du caractère principal.

Les voyelles complexes fondamentales :
• เ_า (sara ao) : Le son [ao] (comme dans ”ciao”). Il est composé graphiquement de la voyelle เ (placée devant) et de la voyelle า (placée derrière).
Exemple : ก + เ_า = เกา [kao] (se gratter).

• เ_ะ (sara é) : Le son [é] bref et court. Composé de เ (devant) et de la particule de brièveté ะ (derrière).
• เ_ีะ (sara ia) : Le son [ia] court. Il encapsule littéralement la consonne sur trois côtés (devant, au-dessus et derrière).

La consonne du futur à tracer :
• จ (tcho tchan) : Déjà abordée dans la classe moyenne, elle s’associe à la voyelle courte _ะ pour former la particule pivot de l’avenir : จะ (ja = aller faire / marqueur du futur).$kt$, $kt$Exemple : ก + เ_า = เกา [kao] (se gratter).$kt$, null),
  ('Thaï', 18, $kt$Cours 18 · [LECTURE] Clinique de Lecture & Repérage du Futur$kt$, $kt$Repérer instantanément l’auxiliaire du futur  dans un texte compact sans espaces et lire des phrases d’intentions fluides.$kt$, $kt$Théorie de la Lecture : Isoler le marqueur pré-verbal
Pour lire et décoder efficacement les projets, promesses ou intentions d’un personnage au sein d’un texte continu, vos yeux doivent chercher le repère graphique stable จะ (ja - Ton bas).

Règle syntaxique absolue :  (ja) + Verbe
Tout comme l’adverbe de négation, cette particule se place systématiquement juste devant le verbe d’action qu’elle modifie.

• Exemple visuel en contexte : ฉั นจะไปที่นั่น → ฉั น (Je) | จะ (futur) | ไป (aller) | ที่นั่น (là-bas) = Tchan ja paï thîi-nân (J’irai là-bas).

La combinaison complexe Négation + Futur :

ไม่ (maï ) + จะ (ja) + Verbe

Exemple : ไม่จะไป → Maï ja paï (Je n’irai pas). Lors de votre lecture synoptique, vos yeux doivent appréhender ce bloc pré-verbal imbriqué comme une seule et unique unité logique.$kt$, $kt$Exemple : ไม่จะไป → Maï ja paï (Je n’irai pas). Lors de votre lecture synoptique, vos yeux doivent appréhender ce bloc pré-verbal imbriqué comme une seule et unique unité logique.$kt$, null),
  ('Thaï', 19, $kt$Cours 19 · [COMPRÉHENSION] Laboratoire d’Écoute & Le Rendez-vous du Week-end$kt$, $kt$Entraîner l’oreille à capter la particule brève du futur  ainsi que le lexique temporel et météorologique à vitesse réelle dans un dialogue.$kt$, $kt$Compréhension Orale : Scène de planification amoureuse
Dans l’univers des séries thaïlandaises, les protagonistes accordent une place centrale à l’organisation de leurs sorties et aux variations de la météo (la pluie tropicale soudaine constituant un ressort dramatique et romantique majeur).
Script audio du laboratoire d’écoute (Yuna et P’Shin) :$kt$, $kt$พี่ชิน (P’Shin) : พรุ่งนี้คุณจะไปไหนครับ ? · ยูนา (Yuna) : ฉั นจะไปเที่ยวทะเลค่ะ แต่ว่าฝนจะตกไหมคะ · พี่ชิน (P’Shin) : ไม่ตกครับ วันเสาร์อากาศดีครับ$kt$, null),
  ('Thaï', 20, $kt$Cours 20 · [EXPRESSION] Grand Atelier de planification de voyage à Phuket$kt$, $kt$Rédiger un premier itinéraire futur en caractères thaïs et présenter oralement ses projets de voyage de manière continue, fluide et naturelle.$kt$, $kt$Syntaxe & Grammaire : Associer le temps et le futur
Pour structurer efficacement votre discours à l’oral, positionnez systématiquement le repère temporel absolu (ex : demain, la semaine prochaine) en toute première position de votre phrase. La particule de projection จะ demeure quant à elle soudée devant le verbe.

Structure : [Marqueur Temporel] + Sujet + จะ + Verbe + [Lieu]

Exemple : พรุ่งนี้ ฉันจะไปภูเก็ตค่ะ (Phrung-nii tchan ja paï Phoo-ket ka) = Demain, j’irai à Phuket.

Lexique de l’évasion et des transports
• ภูเก็ต (Phoo-ket) = Phuket (la célèbre île du sud).

• เครื่องบิน (khreuang-bin) = Avion (Ton de base complexe).

• ไปด้วยกัน (paï duay kan) = Aller ensemble.$kt$, $kt$Exemple : พรุ่งนี้ ฉันจะไปภูเก็ตค่ะ (Phrung-nii tchan ja paï Phoo-ket ka) = Demain, j’irai à Phuket.$kt$, null),
  ('Thaï', 21, $kt$Cours 21 · [ÉCRIT] Les syllabes mortes (Dead syllables) et les consonnes finales$kt$, $kt$Maîtriser l’écriture des consonnes en position finale et comprendre l’impact des syllabes mortes (Dead syllables) sur la modification automatique des tons.$kt$, $kt$Tracé, Graphie & Règles des tons : Les finales d’arrêt
En thaï, une syllabe se termine soit par un son continu (syllabe vivante), soit par un son bloqué (syllabe morte). Les syllabes mortes (Dead Syllables) forcent intrinsèquement la voix à adopter un ton bas ou tombant de manière automatique, sans qu’il soit nécessaire d’apposer graphiquement un signe de ton.

Les 3 sons de consonnes finales bloquées (Syllabes mortes) :
• Le son [K] : Porté en fin de mot par la consonne ก.
Exemple : รัก [rak] = aimer (Ton haut mécanique dû à la structure courte).

• Le son [T] : Porté en fin de mot par les consonnes ด ou ส.
Exemple : เปิ ด [peut] = ouvrir.
• Le son [P] : Porté en fin de mot par la consonne บ.
Exemple : ชอบ [tchop] = aimer / apprécier.

Le mot-clé du passé à tracer :

• ได้ (dâï - avoir pu / marqueur du passé factuel) : S’écrit avec la voyelle pré-positionnée ไ_, la consonne moyenne ด, et le signe de ton tombant _้.$kt$, $kt$Exemple : รัก [rak] = aimer (Ton haut mécanique dû à la structure courte). · Exemple : เปิ ด [peut] = ouvrir. · Exemple : ชอบ [tchop] = aimer / apprécier.$kt$, null),
  ('Thaï', 22, $kt$Cours 22 · [LECTURE] Clinique de Lecture & Le marquage du passé ( / )$kt$, $kt$Repérer visuellement les deux marqueurs du passé et de l’accompli (แล้ว et ได้) dans un bloc de texte compact sans espaces et lire des récits fluides.$kt$, $kt$Théorie de la Lecture : La double structure du passé
Le thaï n’ayant aucune conjugaison verbale, il utilise deux marqueurs lexicaux distincts pour situer une action dans le passé ou l’accompli :

La particule pré-verbale  (dâï) :
Se place juste devant le verbe pour indiquer que l’action ”a pu” être réalisée (passé factuel ou obtention d’une autorisation).

Structure : Sujet + ได้ + Verbe → ฉั นได้ไป (Tchan dâï paï = Je oui suis allée).

La particule de fin  (lǽæw) :
S’écrit avec la voyelle เ_ doublée (แ_ placée devant la consonne ล). Se positionne à la toute fin de la phrase pour indiquer que l’action est accomplie ou ”déjà” faite.

Structure : Sujet + Verbe (+ Objet) + แล้ว → ไปแล้ว (Paï lǽæw = C’est déjà fait / Je suis partie).$kt$, $kt$$kt$, null),
  ('Thaï', 23, $kt$Cours 23 · [COMPRÉHENSION] Laboratoire d’Écoute & Le Flashback Dramatique$kt$, $kt$Entraîner l’oreille à capter les particules du passé (dâï / lǽæw) sous un débit rapide et décoder une scène de souvenirs dans une série.$kt$, $kt$Compréhension Orale : Scène de révélations passées
Dans les Lakorns, les scènes de flashbacks ou les aveux sur les événements de la veille constituent des acmés dramatiques. Vous devez apprendre à repérer le แล้ว final qui tombe comme un couperet sémantique.
Script audio du laboratoire d’écoute (Shin et Ou) :$kt$, $kt$อู่ (Ou) : เมื่อวานนี้คุณได้ไปพบเขาไหมครับ ? · ชิน (Shin) : ผมไปแล้วครับ แต่ว่าเขาไม่อยู่ครับ · อู่ (Ou) : เขาไปไหนครับ ? · ชิน (Shin) : เขาไปภูเก็ตแล้วครับ$kt$, null),
  ('Thaï', 24, $kt$Cours 24 · [EXPRESSION] Grand Atelier des souvenirs de week-end$kt$, $kt$Rédiger le résumé d’une journée passée en caractères thaïs et raconter oralement son week-end de manière continue avec l’intonation des tons de l’accompli.$kt$, $kt$Syntaxe : Construire un récit au passé
Pour structurer une suite d’actions passées cohérente, positionnez le repère temporel historique (hier) en tête d’énoncé et fermez vos phrases clés par la particule แล้ว (lǽæw - Ton haut) pour rythmer votre narration.

Structure de base : เมื่อวานนี้ (Hier) + Sujet + Verbe + Objet + แล้ว

Lexique de la routine passée
• เมื่อวานนี้ (meua-waan-nii) = Hier.

• ดู (duu) = Regarder / voir (ex : ดูหนั ง [duu-nang] = regarder un film / une série).

• นอน (nn) = Dormir / se coucher.$kt$, $kt$$kt$, null),
  ('Thaï', 25, $kt$Cours 25 · [ÉCRIT] Les symboles spéciaux et le raccourcissement des voyelles$kt$, $kt$Maîtriser le tracé et l’usage des signes diacritiques de modification phonétique (Mai taï-khu et Mai ya-mok), essentiels pour nuancer l’expression des émotions.$kt$, $kt$Tracé et Graphie : Les modificateurs d’écriture
Le thaï emploie des symboles diacritiques spécifiques au-dessus des consonnes ou après les mots pour modifier la longueur d’une voyelle ou indiquer une répétition sans avoir à réécrire graphiquement le mot.

Les deux symboles indispensables du niveau intermédiaire :

• _็ (Mai taï-khu) : Ressemble à un petit chiffre 8 thaï (๘) miniature placé directement audessus de la consonne initiale. Son rôle est de raccourcir de manière drastique une voyelle longue en une voyelle ultra-courte.
Exemple capital : เป็ น (pen = être / savoir-faire). S’écrit เ + ป + _็ + น. La présence du signe raccourcit la durée de la voyelle.

• ๆ (Mai ya-mok) : Ressemble à un petit crochet vertical ondulé placé immédiatement après un mot, séparé par un espace léger. Il indique que le mot qui le précède doit être répété deux fois à l’oral pour insister ou exprimer un pluriel intensif.
Exemple : มาก ๆ (maak-maak) = Énormément / très très.$kt$, $kt$Exemple capital : เป็ น (pen = être / savoir-faire). S’écrit เ + ป + _็ + น. La présence du signe raccourcit la durée de la voyelle. · Exemple : มาก ๆ (maak-maak) = Énormément / très très.$kt$, null),
  ('Thaï', 26, $kt$Cours 26 · [LECTURE] Décodage du désir et de la capacité$kt$, $kt$Repérer visuellement et discriminer instantanément les structures de volonté (อยาก) et de potentiel (เป็ น / ได้) dans un bloc de texte sans espaces.$kt$, $kt$Théorie de la Lecture : Isoler la trinité du potentiel
Pour lire et comprendre finement les aspirations d’un personnage, vos yeux doivent cartographier trois structures verbales qui se positionnent de manière différente dans l’énoncé :

Le désir :  (yàak) + Verbe
Signifie « vouloir faire ». Il se place toujours devant le verbe d’action qu’il qualifie.

• Exemple visuel : อยากไป → อยาก (vouloir) + ไป (aller) = Yàak paï (Vouloir aller).

La capacité acquise : Verbe +  (pen)
Signifie « savoir-faire » (une compétence apprise, comme nager, parler une langue, ou conduire). Se positionne généralement après l’objet ou le verbe d’action.

• Exemple visuel : พูดภาษาไทยเป็ น → พูด (parler) | ภาษาไทย (langue thaïe) | เป็ น (savoir-faire) = Phoot phasa thaï pen (Savoir parler thaï).

La possibilité matérielle : Verbe +  (dâï)
Signifie « pouvoir / être physiquement ou matériellement capable de ». Se place systématiquement en toute fin de phrase.

• Exemple visuel : ไปได้ → ไป (aller) + ได้ (pouvoir) = Paï dâï (Pouvoir y aller / C’est matériellement possible).$kt$, $kt$$kt$, null),
  ('Thaï', 27, $kt$Cours 27 · [COMPRÉHENSION] Les nuances de la confession amoureuse (Jai)$kt$, $kt$Entraîner l’oreille à capter les mots composés basés sur la racine du cœur (ใจ / Jai) et décoder les variations d’intensité émotionnelle dans un dialogue.$kt$, $kt$Théorie de l’Écoute : Le mot-clé des sentiments (Jai)
En thaïlandais, la quasi-totalité des concepts émotionnels se construisent en adjoignant un adjectif ou un verbe autour de la racine pivot ใจ (jai - Ton moyen), qui signifie littéralement « le cœur » ou « l’esprit ». Dans les scènes dramatiques des séries, ces mots reviennent en boucle. Vous devez éduquer votre oreille à isoler cette syllabe.

Les associations de sentiments incontournables des séries :

• ดีใจ (dee-jaï ) : Heureux / content (littéralement : bon + cœur).

• เสียใจ (sia-jaï ) : Triste / désolé / affligé (littéralement : cassé/perdu + cœur).

• ตกใจ (tok-jaï ) : Choqué / surpris / saisi (littéralement : tomber + cœur).

• ใจดี (jaï-dii) : Gentil / généreux (littéralement : cœur + bon).$kt$, $kt$$kt$, null),
  ('Thaï', 28, $kt$Cours 28 · [EXPRESSION] Grand Atelier de la scène de confession d’un secret$kt$, $kt$Rédiger une lettre d’aveu de sentiments en caractères thaïs et interpréter une scène de dialogue émotionnel de manière fluide, cadencée et expressive.$kt$, $kt$Syntaxe & Grammaire : Combiner le Désir et le Passé
Pour atteindre une belle fluidité de discours à l’oral, vous devez être capable d’imbriquer vos intentions et vos repères aspectuels. Par exemple, pour exprimer la nuance « Je voulais te dire... » ou « J’ai envie de te dire depuis un moment », on utilise le passé de l’intention : อยาก (yàak) + Verbe + แล้ว (lǽæw).

Structure : Sujet + อยาก + Verbe + แล้ว

Exemple : ฉั นอยากบอกแล้วค่ะ (Tchan yàak bawk lǽæw kha) = Je voulais déjà te le dire / J’ai enfin envie de te le dire. (où บอก = dire / informer).

Lexique de la confession intime
• บอก (bawk) = Dire / exprimer / informer (Ton bas).

• ภาษาไทย (pha-sa-thaï ) = La langue thaïe.

• มาก ๆ (maak-maak) = Énormément / beaucoup (Ton bas).$kt$, $kt$Exemple : ฉั นอยากบอกแล้วค่ะ (Tchan yàak bawk lǽæw kha) = Je voulais déjà te le dire / J’ai enfin envie de te le dire. (où บอก = dire / informer).$kt$, null),
  ('Thaï', 29, $kt$Cours 29 · [ÉCRIT] Les abréviations, contractions orales et l’impact à l’écrit$kt$, $kt$Maîtriser le tracé des voyelles courtes résiduelles et comprendre les modifications graphiques induites par les contractions familières à l’oral des séries.$kt$, $kt$Tracé, Graphie & Stylistique : L’oral transcrit
Dans l’univers des séries contemporaines (Lakorns), l’écriture des dialogues s’éloigne parfois du thaï académique pour calquer la prononciation rapide de la rue. Vous devez être capable de tracer et d’identifier ces raccourcis graphiques.

La mutation des pronoms à l’écrit familier :

• Le pronom ฉั น (tchan - je [femme]) se prononce presque toujours avec un ton haut très aigu à l’oral. Dans les scripts officiels ou les sous-titres thaïs, il reste écrit ฉั น mais est parfois contracté graphiquement en ชัน pour coller au débit de parole.

• Le mot เขา (khao - il/elle) se transforme phonétiquement à l’oral rapide en un ton haut perché, modifiant la courbe d’écoute habituelle.

Le symbole d’omission à tracer : ฯ (Bayan-noi)
Ce symbole se trace comme un petit crochet refermé sur lui-même. Il s’utilise pour abréger un mot trop long connu de tous.

• Exemple capital : กรุงเทพฯ (Krung Thep) = Nom abrégé officiel de la capitale, Bangkok.$kt$, $kt$$kt$, null),
  ('Thaï', 30, $kt$Cours 30 · [LECTURE] Le décodage des particules finales d’humeur$kt$, $kt$Repérer visuellement, isoler et lire les particules finales de nuance et d’insistance (นะ, ซะ, ละ) à la fin d’un bloc de texte sans espaces.$kt$, $kt$Théorie de la Lecture : Isoler les étiquettes d’humeur
En thaï de niveau courant, la fin d’une phrase ne se résume pas aux seuls marqueurs de politesse classiques. Elle accueille des particules finales (Sentence final particles) qui indiquent l’intention, la douceur, l’insistance ou l’ordre. Leurs silhouettes sont faciles à repérer car elles ferment l’énoncé.

Les trois particules finales clés des séries :
• นะ (na - Ton haut ou moyen) : Adoucit l’énoncé, demande l’accord, équivaut à « d’accord ? » ou « s’il te plaît ».
Exemple visuel : ไปนะ → ไป (aller) + นะ (s’il te plaît) = Paï na (On y va, s’il te plaît / d’accord ?).

• ซะ / ซิ (sa / si - Ton haut) : Marque une incitation forte, un ordre adouci, équivaut à « vas-y ! ».
Exemple visuel : กินซิ → กิน (manger) + ซิ (vas-y) = Kin si (Mange donc !).

• ละ / แล้ว (la / lǽæw) : Indique que la situation est actée, équivaut à « voilà, c’est comme ça ».$kt$, $kt$Exemple visuel : ไปนะ → ไป (aller) + นะ (s’il te plaît) = Paï na (On y va, s’il te plaît / d’accord ?). · Exemple visuel : กินซิ → กิน (manger) + ซิ (vas-y) = Kin si (Mange donc !).$kt$, null),
  ('Thaï', 31, $kt$Cours 31 · [COMPRÉHENSION] Laboratoire d’Écoute & L’Argot des jeunes à Bangkok$kt$, $kt$Entraîner l’oreille à capter les expressions familières des adolescents, les coupures de mots et les particules d’insistance à vitesse réelle.$kt$, $kt$Compréhension Orale : Scène de dispute amicale dans un café de Siam Square
Dans les séries contemporaines axées sur la jeunesse ou la vie urbaine à Bangkok, le débit s’accélère nettement. Les marqueurs formels disparaissent au profit d’un rythme syncopé.
Script audio du laboratoire d’écoute (Bright et Win) :$kt$, $kt$ไบรท์ (Bright) : ไปเที่ยวกันไหมนะ ? · วิน (Win) : ไม่ไปซะ ! พรุ่งนี้มีเรียนเยอะมาก ๆ · ไบรท์ (Bright) : ไปเถอะนะ ทําไมใจร้ายจัง · วิน (Win) : เออ ๆ ไปก็ได้$kt$, null),
  ('Thaï', 32, $kt$Cours 32 · [EXPRESSION] Grand Atelier du dialogue familier de série$kt$, $kt$Rédiger un script de dialogue familier en caractères thaïs compacts et interpréter oralement une scène d’interaction rapide avec les bonnes variations de tons.$kt$, $kt$Syntaxe & Grammaire : Le placement des étiquettes d’humeur
Pour s’exprimer de manière authentique à l’oral, rappelez-vous que la structure de la phrase thaïlandaise empile ses extensions en toute fin d’énoncé. L’ordre des mots en clôture de phrase suit la logique suivante :

[Sujet] + [Verbe] + [Objet] + [Particule d’humeur : //] + [Particule de
politesse : /]

Exemple combiné : ไปเที่ยวกันเถอะนะคะ (Paï thiao kan theuat na kha) = Allons nous promener ensemble, s’il vous plaît !

Lexique de l’insistance familière
• จัง (djang) = Tellement / vraiment.

• ใจดีจัง (jaï-dii djang) = Tellement gentil !

• กัน (kan) = Ensemble / l’un avec l’autre.$kt$, $kt$Exemple combiné : ไปเที่ยวกันเถอะนะคะ (Paï thiao kan theuat na kha) = Allons nous promener ensemble, s’il vous plaît !$kt$, null),
  ('Thaï', 33, $kt$Cours 33 · [ÉCRIT] Les connecteurs de cause et d’opposition$kt$, $kt$Maîtriser le tracé, l’alignement et la calligraphie des deux connecteurs logiques pivots du niveau intermédiaire.$kt$, $kt$Tracé et Graphie : L’empilement des signes complexes
Pour lier deux propositions de manière fluide, vous devez tracer des mots de liaison qui comportent des voyelles pré-positionnées et des empilements de caractères complexes.

Le connecteur de cause : เพราะว่า (phŕ-wâa = parce que)
Analyse du tracé : C’est un mot composite. Il s’ouvre par la voyelle เ (placée devant), suivie des consonnes de base พ (classe basse) et ร (classe basse). Vient ensuite la voyelle courte _าะ (sara ao court). Le deuxième bloc s’ouvre par la consonne ว, surmontée du signe de ton tombant _้, et se clôt par la voyelle _า.

Le connecteur d’opposition : แต่ (tæ̀æ = mais)
Analyse du tracé : Il s’ouvre par la voyelle double แ_ (sara ææ long, placée obligatoirement devant la consonne), suivie de la consonne moyenne ต, surmontée du signe de ton bas _่ (mai ek).$kt$, $kt$$kt$, null),
  ('Thaï', 34, $kt$Cours 34 · [LECTURE] Décodage de structures argumentatives continues$kt$, $kt$Repérer visuellement les pivots เพราะว่า et แต่ au cœur d’un texte thaï sans espaces et lire des justifications fluides.$kt$, $kt$Théorie de la Lecture : Cartographier les articulations logiques
Dans un paragraphe thaï compact, pour comprendre le raisonnement et les motivations des personnages, vos yeux doivent chercher les balises graphiques เพราะว่า (repérable par son ouverture en เ) et แต่ (repérable par sa double barre verticale แ).

La structure de la cause : [Proposition A] + เพราะว่า + [Proposition B / Raison]

Exemple visuel : ผมไม่ไปเพราะว่าผมเหนื่ อย → ผมไม่ไป (Je n’y vais pas) | เพราะว่า (parce que) | ผมเหนื่ อย (je suis fatigué) = Phom maï paï phŕ-wâa phom neuy (où เหนื่ อย = être fatigué).

La structure de l’opposition : [Proposition A] + แต่ + [Proposition B / Contraste]

Exemple visuel : ภาษาไทยยากแต่สนุก → ภาษาไทยยาก (La langue thaïe est difficile) | แต่ (mais) | สนุก (être amusant/drôle) = Phasa thaï yaak tæ̀æ sa-nuk.$kt$, $kt$Exemple visuel : ผมไม่ไปเพราะว่าผมเหนื่ อย → ผมไม่ไป (Je n’y vais pas) | เพราะว่า (parce que) | ผมเหนื่ อย (je suis fatigué) = Phom maï paï phŕ-wâa phom neuy (où เหนื่ อย = être fatigué). · Exemple visuel : ภาษาไทยยากแต่สนุก → ภาษาไทยยาก (La langue thaïe est difficile) | แต่ (mais) | สนุก (être amusant/drôle) = Phasa thaï yaak tæ̀æ sa-nuk.$kt$, null),
  ('Thaï', 35, $kt$Cours 35 · [COMPRÉHENSION] Laboratoire d’Écoute & L’Explication du Thriller$kt$, $kt$Entraîner l’oreille à capter les liaisons causales rapides et décoder des dialogues de confrontations ou d’explications dans une série à suspense.$kt$, $kt$Compréhension Orale : Suivre une justification sous tension
Dans les scènes d’interrogatoire ou de révélations des thrillers thaïlandais, le débit s’accélère. Les personnages coupent très fréquemment la conjonction เพราะว่า en un simple เพราะ (phŕ) très court à l’oral. Vous devez y habituer votre oreille.
Script audio du laboratoire d’écoute (L’Inspecteur et le Témoin) :$kt$, $kt$ตํารวจ (Inspecteur) : ทําไมคุณไม่บอกตํารวจครับ ? · พยาน (Témoin) : เพราะว่าผมกลัวครับ เขาใจร้ายมาก ๆ · ตํารวจ (Inspecteur) : ผมอยากช่วยคุณ แต่คุณต้องบอกความจริงครับ$kt$, null),
  ('Thaï', 36, $kt$Cours 36 · [EXPRESSION] Grand Atelier de la confrontation technique ou amicale$kt$, $kt$Rédiger une note de justification complexe en caractères thaïs et soutenir oralement une argumentation contradictoire continue pendant 3 minutes face à un interlocuteur.$kt$, $kt$Syntaxe & Grammaire : Structurer son argumentation
Pour atteindre un débit convaincant à l’oral, vous devez être capable de lier vos arguments de manière logique : poser une intention ou une action, y opposer une contrainte avec แต่, puis légitimer votre situation à l’aide de เพราะว่า.

Structure cible intermédiaire : [Action] + แต่ + [Problème] + เพราะว่า + [Raison]

Lexique de la justification
• เหนื่อย (neuy) = Être fatigué (Ton bas).

• งาน (ngaan) = Le travail / la tâche professionnelle (Ton moyen).

• เยอะ (yeua) = Beaucoup / énorme quantité (Ton bas).

• ทําไม (tham-maï ) = Pourquoi (Ton moyen).$kt$, $kt$$kt$, null),
  ('Thaï', 37, $kt$Cours 37 · [ÉCRIT] La structure de comparaison et du superlatif$kt$, $kt$Maîtriser le tracé, l’orientation et la calligraphie des marqueurs de supériorité et d’absolu en caractères thaïs.$kt$, $kt$Tracé et Graphie : Les marques de gradation
En thaïlandais, pour hiérarchiser des éléments ou exprimer un niveau d’excellence maximal, on utilise deux structures grammaticales fondamentales qui se positionnent systématiquement après l’adjectif qu’elles qualifient.

Le comparatif de supériorité : กว่า (kwàa = plus... que)
Analyse du tracé : S’ouvre par la consonne moyenne ก, suivie immédiatement de la consonne basse ว, surmontée du signe de ton bas _่ (mai ek), et se ferme par la voyelle _า.
Note de rigueur : Veillez à ce que le signe de ton bas soit bien positionné verticalement au-dessus du ว et non du ก.

Le superlatif absolu : ที่สุด (thîi-sùt = le plus / au maximum)
Analyse du tracé : C’est un mot composé de deux blocs graphiques distincts.

• Le premier est ที่ (thîi = consonne basse ท + signe de ton tombant _้ + voyelle _ี positionnée au-dessus).

• Le second bloc est สุด (sùt = consonne de classe haute ส + voyelle courte _ุ placée audessous + consonne finale d’arrêt ด).$kt$, $kt$$kt$, null),
  ('Thaï', 38, $kt$Cours 38 · [LECTURE] Décodage de structures comparatives et de rivalités$kt$, $kt$Repérer visuellement les marqueurs กว่า et ที่สุด dans un texte thaï continu et lire des évaluations fluides sans espaces.$kt$, $kt$Théorie de la Lecture : Cartographier la gradation
En thaïlandais, l’adjectif est une racine lexicale invariable qui ne change jamais de forme (pas de déclinaison ou d’accord). Pour exprimer un degré d’intensité, on accole simplement les marqueurs directement derrière lui.

La structure comparative : [Entité A] + [Adjectif] + กว่า + [Entité B]

Exemple visuel : เขาดีกว่าผม → เขา (Il) | ดี (être bon) | กว่า (plus que) | ผม (moi) = Khao dii kwàa phom (Il est meilleur que moi).

La structure superlative : [Sujet] + [Adjectif] + ที่สุด

Exemple visuel : ภาษาไทยสนุกที่สุด → ภาษาไทย (La langue thaïe) | สนุก (être amusant) | ที่สุด (le plus) = Phasa thaï sa-nuk thîi-sùt (La langue thaïe est la plus amusante).$kt$, $kt$Exemple visuel : เขาดีกว่าผม → เขา (Il) | ดี (être bon) | กว่า (plus que) | ผม (moi) = Khao dii kwàa phom (Il est meilleur que moi). · Exemple visuel : ภาษาไทยสนุกที่สุด → ภาษาไทย (La langue thaïe) | สนุก (être amusant) | ที่สุด (le plus) = Phasa thaï sa-nuk thîi-sùt (La langue thaïe est la plus amusante).$kt$, null),
  ('Thaï', 39, $kt$Cours 39 · [COMPRÉHENSION] Laboratoire d’Écoute & Les commérages de la comédie romantique$kt$, $kt$Entraîner l’oreille à capter les modificateurs de degré (kwàa / thîi-sùt) sous un débit de conversation rapide et décoder les rivalités dans une scène de série.$kt$, $kt$Compréhension Orale : Suivre les comparaisons de personnages
Dans les drames romantiques ou comédies thaïlandaises (Lakorns), les scènes d’évaluation esthétique, de jalousie ou les compliments absolus sont omniprésents. Votre oreille doit savoir isoler le son bref kwàa (ton bas sec).
Script audio du laboratoire d’écoute (Deux amies discutant d’un acteur de série) :$kt$, $kt$มิน (Min) : พี่ชินหล่อมากเลยนะคะ · ยูนา (Yuna) : ใช่ค่ะ แต่ว่าผมคิดว่าพี่ไบรท์หล่อกว่าพี่ชินค่ะ · มิน (Min) : ไม่จริงค่ะ ! สําหรับฉั น พี่ชินหล่อที่สุดในโลกค่ะ$kt$, null),
  ('Thaï', 40, $kt$Cours 40 · [EXPRESSION] Grand Atelier d’évaluation et de critique de série$kt$, $kt$Rédiger une critique comparative en caractères thaïs et soutenir oralement une évaluation fluide et nuancée de vos préférences en continu pendant 3 minutes.$kt$, $kt$Syntaxe & Grammaire : Structurer une critique nuancée
Pour atteindre vos objectifs d’aisance et de fluidité, vous devez être capable d’articuler un jugement de goût complexe en combinant une relation de comparaison et une affirmation superlative au sein d’un même flux verbal continu.

Structure cible : [Sujet A] + [Adjectif] + กว่า + [Sujet B] + แต่ + [Sujet C] +
[Adjectif] + ที่สุด

Lexique de la critique et du goût
• หล่อ (l̀) = Être beau (pour un homme / Ton bas).

• สวย (suay) = Être belle (pour une femme, un objet ou un paysage / Ton montant).

• แพง (phaeng) = Être cher (prix / Ton moyen).

• ยาก (yâak) = Être difficile (Ton tombant).$kt$, $kt$$kt$, null),
  ('Thaï', 41, $kt$Cours 41 · [ÉCRIT] La structure de l’action en cours (...)$kt$, $kt$Maîtriser le tracé, l’alignement et l’insertion de l’encapsulation progressive กําลัง...อยู่ (être en train de) en caractères thaïs.$kt$, $kt$Tracé et Graphie : L’encapsulation de l’action
Pour exprimer qu’une action est en train de se dérouler sous les yeux du locuteur au moment précis où l’on parle, la langue thaïe utilise une structure double et discontinue qui vient « encadrer » le verbe d’action.

Le marqueur de début : กําลัง (kam-lang = en train de / Ton moyen + Ton moyen)
Analyse du tracé : S’ouvre par la consonne moyenne ก, surmontée du signe de voyelle courte _ํ (sara am / représenté par un petit cercle supérieur), suivie de la consonne basse ล, surmontée du signe de voyelle _ั (mai han-akat) et close par la consonne finale nasale ง.

Le marqueur de fin : อยู่ (yòo = déjà abordé au cycle 4 / Ton bas)
Structure complète d’encadrement :

กําลัง + [Verbe d’action] + อยู่

Exemple écrit : กําลังไปอยู่ (kam-lang paï yòo = être en train d’aller).$kt$, $kt$Exemple écrit : กําลังไปอยู่ (kam-lang paï yòo = être en train d’aller).$kt$, null),
  ('Thaï', 42, $kt$Cours 42 · [LECTURE] Décodage de l’aspect progressif et des flux d’actions$kt$, $kt$Repérer visuellement l’encadrement กําลัง...อยู่ au cœur d’un texte thaï continu et lire des descriptions d’actions en temps réel sans espaces.$kt$, $kt$Théorie de la Lecture : Cartographier le présent continu
Dans un paragraphe thaï compact et non segmenté, pour identifier immédiatement l’action en cours d’un personnage, vos yeux doivent chercher en amont la balise de départ กําลัง et valider immédiatement sa fermeture par la présence de อยู่ à la fin du bloc verbal.

La structure repérable dans le texte : [Sujet] + กําลัง + [Verbe + Objet] + อยู่

Exemple visuel : ผมกําลังกินข้าวอยู่ครับ → ผม (Je) | กําลัง (en train de) | กินข้าว (manger du riz / un repas) | อยู่ครับ (particule de continuité + politesse) = Phom kam-lang kin kâao yòo krap.$kt$, $kt$Exemple visuel : ผมกําลังกินข้าวอยู่ครับ → ผม (Je) | กําลัง (en train de) | กินข้าว (manger du riz / un repas) | อยู่ครับ (particule de continuité + politesse) = Phom kam-lang kin kâao yòo krap.$kt$, null),
  ('Thaï', 43, $kt$Cours 43 · [COMPRÉHENSION] Laboratoire d’Écoute & L’Appel téléphonique de la série$kt$, $kt$Entraîner l’oreille à capter la structure kam-lang... yòo sous un débit téléphonique rapide et décoder la gestion d’actions en direct dans un dialogue.$kt$, $kt$Compréhension Orale : Intercepter les actions en cours au téléphone
Dans les Lakorns, les appels téléphoniques servent de pivots scénaristiques permanents (les personnages s’appellent continuellement pour se localiser ou synchroniser leurs actions). Votre oreille doit capter le กําลัง initial qui pose immédiatement le décor de l’action en cours.
Script audio du laboratoire d’écoute (P’Shin et Ou se coordonnant au téléphone) :$kt$, $kt$ชิน (Shin) : ฮัลโหลครับ อู่ครับ ตอนนี้คุณทําอะไรอยู่ครับ ? · อู่ (Ou) : สวัสดีครับพี่ชิน ผมกําลังทํางานอยู่ครับ · ชิน (Shin) : ผมกําลังไปหาคุณอยู่ครับ อีกสิบนาทีพบกันนะครับ$kt$, null),
  ('Thaï', 44, $kt$Cours 44 · [EXPRESSION] Grand Atelier de la gestion d’urgence au téléphone$kt$, $kt$Rédiger un script d’appel téléphonique formel ou amical en caractères thaïs compacts et simuler une conversation orale fluide en continu pendant 2 minutes et 30 secondes.$kt$, $kt$Syntaxe & Grammaire : Articuler l’action et la contrainte
Pour atteindre une belle spontanéité à l’oral, vous devez être capable de combiner le présent continu, un connecteur logique du bloc précédent (แต่ ou เพราะว่า), et une projection future claire.

Structure cible : ตอนนี้ + Sujet + กําลัง + [Action] + อยู่ + แต่ + จะ + [Action future]

Lexique de la communication en direct
• ตอนนี้ (ton-nii) = Maintenant / actuellement (Ton moyen + Ton haut).

• ทํางาน (tham-ngaan) = Travailler (Ton moyen + Ton moyen).

• เรียน (rian) = Étudier / apprendre (Ton moyen).

• คุยโทรศัพท์ (khouy thoo-ra-sap) = Parler au téléphone (Ton moyen + Ton moyen + Ton moyen + Ton haut).$kt$, $kt$$kt$, null),
  ('Thaï', 45, $kt$Cours 45 · [ÉCRIT] Donner des ordres doux et des suggestions (..., )$kt$, $kt$Maîtriser le tracé, l’alignement et la calligraphie des particules d’incitation et d’essai (ลอง...ดู et สิ).$kt$, $kt$Tracé et Graphie : L’écriture de la suggestion bienveillante
En thaïlandais, pour suggérer à un interlocuteur de tester ou d’expérimenter une action (comme goûter une spécialité culinaire ou regarder une série), on utilise des structures postverbales douces qui désarment la dureté de l’impératif strict.

La structure de l’essai : ลอง + [Verbe] + ดู (long... duu = essayer de / tester)
Analyse du tracé : Le mot ลอง (long = consonne basse ล + voyelle อ en fonction de support + consonne finale ง / Ton moyen). Le mot ดู (duu = consonne moyenne ด + voyelle verticale longue _ู positionnée au-dessous).

La particule d’incitation douce : สิ (si = vas-y / donc)
Analyse du tracé : S’ouvre par la consonne de classe haute ส, surmontée de la voyelle supérieure courte _ิ (sara i / représentée par un arc de cercle simple sans boucle).$kt$, $kt$$kt$, null),
  ('Thaï', 46, $kt$Cours 46 · [LECTURE] Décodage de consignes, conseils et invitations douces$kt$, $kt$Repérer visuellement les marqueurs ลอง...ดู et สิ dans un bloc de texte thaï continu et lire des suggestions fluides sans espaces.$kt$, $kt$Théorie de la Lecture : Identifier l’incitation amicale
Dans un bloc de texte thaï non segmenté, les marqueurs de suggestion ferment généralement le syntagme verbal. Vos yeux doivent cartographier le profil graphique descendant de ดู (avec sa voyelle basse) ou la silhouette haute de สิ pour décoder qu’il s’agit d’un conseil amical et non d’une injonction impérative.

La structure d’essai dans le texte : [Sujet] + ลอง + [Verbe + Objet] + ดู

Exemple visuel : คุณลองพูดภาษาไทยดูค่ะ → คุณ (vous) | ลอง (essayer) | พูดภาษาไทย (parler thaï) | ดูค่ะ (tester + politesse) = Khun long phoot phasa thaï duu kha (Essaie donc de parler thaï / Tente l’expérience).

La structure d’incitation immédiate : [Verbe] + สิ

Exemple visuel : ไปสิ → ไป (aller) + สิ (donc/vas-y) = Paï si (Vas-y ! / Allez, viens !).$kt$, $kt$Exemple visuel : คุณลองพูดภาษาไทยดูค่ะ → คุณ (vous) | ลอง (essayer) | พูดภาษาไทย (parler thaï) | ดูค่ะ (tester + politesse) = Khun long phoot phasa thaï duu kha (Essaie donc de parler thaï / Tente l’expérience). · Exemple visuel : ไปสิ → ไป (aller) + สิ (donc/vas-y) = Paï si (Vas-y ! / Allez, viens !).$kt$, null),
  ('Thaï', 47, $kt$Cours 47 · [COMPRÉHENSION] Laboratoire d’Écoute & Les conseils de l’ami proche$kt$, $kt$Entraîner l’oreille à capter les nuances d’adoucissement impératif (long... duu, si, na) sous un débit de conversation naturel de série.$kt$, $kt$Compréhension Orale : Intercepter les suggestions amicales
Dans les Lakorns, les scènes de réconfort ou d’échange de conseils intimes regorgent de ces structures. Votre oreille doit apprendre à identifier le glissement du ดู final ou de la particule สิ qui vient adoucir la directivité de l’action.
Script audio du laboratoire d’écoute (Min conseillant Yuna au sujet d’un plat thaï) :$kt$, $kt$มิน (Min) : ส้มตําอันนี้อร่อยไหมคะ ? · ยูนา (Yuna) : อร่อยมากค่ะ เผ็ดแต่ดีท่ีสุดค่ะ ลองกินดูสิคะ · มิน (Min) : กินแล้วค่ะ เผ็ดจริง ๆ !$kt$, null),
  ('Thaï', 48, $kt$Cours 48 · [EXPRESSION] Grand Atelier de Recommandation Culturelle (Bilan Bloc 4)$kt$, $kt$Rédiger une note de recommandation de voyage en caractères thaïs et soutenir oralement un plaidoyer amical de 3 minutes pour valider l’ensemble du Bloc 4.$kt$, $kt$Grand Atelier d’Expression Orale : Le briefing d’immersion du guide ami

Trame orale obligatoire à verbaliser :
• Introduction et goût : „Mueang thaï sa-nuk thîi-sùt...“ (La Thaïlande est la plus amusante). Recommandez chaudement un plat ou une destination.

• Comparaison et Cause : Expliquez rationnellement pourquoi cette option est supérieure à une autre („...dii kwàa phŕ-wâa...“).

• Action et Invitation finale : Indiquez que vous êtes actuellement en train de préparer activement votre propre voyage (ตอนนี้ ผม/ฉั นกําลังเตรียมตัวอยู่ → ton-nii phom/tchan kam-lang triam-tua yòo) et invitez-le chaleureusement à tenter l’expérience : „Long paï thiao duu si ka/krap !“

Focus éradication des fautes (Critères de validation) :

• Assurez-vous que l’intonation haute et vive de l’incitation สิ (si) s’articule de manière parfaitement fluide et naturelle avec la particule de politesse consécutive.

• Éliminez tout blanc rythmique ou hésitation lors de l’enchaînement des connecteurs logiques complexes. Vos phrases doivent s’inscrire dans une ligne mélodique continue.

CHAPITRE 4

BLOC 4 : Vers l’autonomie nuancé &
objectif B1$kt$, $kt$$kt$, null),
  ('Thaï', 49, $kt$Cours 49 · [ÉCRIT] La structure de l’hypothèse (...) et de la condition$kt$, $kt$Maîtriser le tracé, la graphie et l’alignement du connecteur de condition Thâa (ถ้า) et structurer des scénarios hypothétiques complexes.$kt$, $kt$Tracé et Graphie : L’écriture de la condition indéterminée
Pour poser un cadre hypothétique (« si... alors... »), la langue thaïe utilise un mot pivot indispensable à placer impérativement en tête de la proposition subordonnée : ถ้า (thâa = si).

Analyse du tracé de ถ้า (thâa) :
• Il s’ouvre graphiquement par la voyelle double แ_ (sara ææ long), qui s’écrit toujours devant la consonne qu’elle modifie.

• Vient ensuite la consonne de classe haute ถ (to thung). Le cercle initial commence par le bas et remonte vers l’intérieur de la lettre.

• Le signe de ton tombant _้ (mai tho) se place de manière équilibrée juste au-dessus de la consonne ถ.

Le corrélatif de conséquence : ก็ (ĝ = alors / aussi)
Pour marquer l’articulation du « alors », le thaï peut optionnellement ouvrir la seconde proposition (la principale) par le mot ก็. Ce mot s’écrit de manière compacte avec la consonne moyenne ก surmontée du signe Mai taï-khu (_็).$kt$, $kt$$kt$, null),
  ('Thaï', 50, $kt$Cours 50 · [LECTURE] Décodage de dilemmes et de choix de personnages$kt$, $kt$Repérer visuellement la balise conditionnelle ถ้า au sein d’un texte thaï continu et lire des scénarios d’hypothèses fluides sans espaces.$kt$, $kt$Théorie de la Lecture : Cartographier le scénario conditionnel
Dans un paragraphe thaï compact et non segmenté, pour comprendre les dilemmes ou les choix stratégiques des personnages, vos yeux doivent chercher en amorce l’ouverture graphique ถ surmontée de la double barre แ en début de phrase.

La structure type dans le texte : ถ้า + [Condition] + (ก็) + [Conséquence / Action future]

Exemple visuel : ถ้าผมมีเงินผมจะซื้อบ้านครับ → ถ้า (si) | ผมมีเงิน (j’ai de l’argent) | ผมจะซื้อบ้าน (j’achèterai une maison) | ครับ (particule de politesse) = Thâa phom mii ngern, phom ja seu baan krap (où เงิน = argent, et ซื้อบ้าน = acheter une maison).$kt$, $kt$Exemple visuel : ถ้าผมมีเงินผมจะซื้อบ้านครับ → ถ้า (si) | ผมมีเงิน (j’ai de l’argent) | ผมจะซื้อบ้าน (j’achèterai une maison) | ครับ (particule de politesse) = Thâa phom mii ngern, phom ja seu baan krap (où เงิน = argent, et ซื้อบ้าน = acheter une maison).$kt$, null),
  ('Thaï', 51, $kt$Cours 51 · [COMPRÉHENSION] Laboratoire d’Écoute & Les dilemmes du suspense$kt$, $kt$Entraîner l’oreille à capter la structure conditionnelle thâa... ĝ sous un débit rapide et décoder les théories des personnages dans une série à suspense.$kt$, $kt$Compréhension Orale : Suivre les théories de personnages
Dans les scènes d’explications des drames psychologiques ou thrillers thaïlandais, les personnages échafaudent constamment des théories ou font face à des choix cornéliens. Vous devez éduquer votre oreille à intercepter le ถ้า initial qui suspend temporairement la mélodie de la phrase.

Script audio du laboratoire d’écoute (Bright et Win analysant une situation com-
plexe) :

ไบรท์ (Bright) : ถ้าเราไม่ไปหาเขาตอนนี้ เขาจะเสียใจมาก ๆ นะครับ
(Si nous n’allons pas le voir maintenant, il sera vraiment très triste, d’accord ? / ตอนนี้ = maintenant, เสียใจ = être triste).

วิน (Win) : แต่ถ้าไปตอนนี้ วันนี้เราจะทํางานไม่ทันครับ
(Mais si on y va maintenant, nous ne finirons pas le travail à temps aujourd’hui / ไม่ทัน = pas à temps / en retard).

ไบรท์ (Bright) : ถ้าคุณช่วยผม เราก็จะทํางานทันครับ ไปกันเถอะนะ
(Si tu m’aides, alors nous finirons le travail à temps. Allons-y ensemble s’il te plaît / ช่วย = aider, ไปกันเถอะ = allons-y ensemble).$kt$, $kt$$kt$, null),
  ('Thaï', 52, $kt$Cours 52 · [EXPRESSION] Grand Atelier du monologue des rêves impossibles$kt$, $kt$Rédiger un manifeste d’ambitions futures sous forme hypothétique en caractères thaïs et soutenir oralement une présentation de ses rêves d’avenir de manière fluide pendant 3 minutes.$kt$, $kt$Syntaxe & Grammaire : Articuler l’hypothèse et la projection B1
Pour asseoir votre fluidité et votre confiance, vous devez être capable d’enchaîner une hypothèse d’envergure, d’y adosser une conséquence au futur avec la particule จะ, et d’insérer des compléments de degré absolu (ที่สุด).

Structure cible : ถ้า + [Condition complexe] + Sujet + ก็จะ + [Action future] +
ที่สุด + เพราะว่า + [Motivation]

Lexique de la projection abstraite
• เก่ง (keng) = Être doué / compétent / maîtriser une compétence ou une langue (Ton bas).

• เมืองไทย (meuang-thaï ) = La Thaïlande (appellation familière et chaleureuse / Ton moyen + Ton moyen).

• มีเงิน (mii-ngern) = Avoir de l’argent (Ton moyen + Ton moyen).$kt$, $kt$$kt$, null),
  ('Thaï', 53, $kt$Cours 53 · [ÉCRIT] Le style indirect et le discours rapporté$kt$, $kt$Maîtriser le tracé, l’alignement et la calligraphie de la structure du discours rapporté Bawk wâa (บอกว่า) en caractères thaïs.$kt$, $kt$Tracé et Graphie : L’écriture de la complétive
Pour rapporter de manière fluide les propos, les pensées ou les déclarations d’une tierce personne (« Il a dit que... » / « Elle pense que... »), la syntaxe thaïe déploie une structure verbale double et indissociable : บอกว่า (bawk wâa).

Analyse du tracé de บอกว่า (bawk wâa) :
• Le premier bloc est le verbe dire : บอก (bawk - Ton bas). Il s’ouvre par la consonne moyenne บ, suivie de la consonne muette de support vocalique อ, et se ferme par la consonne moyenne finale d’arrêt ก.

• Le second bloc est la conjonction de subordination : ว่า (wâa - Ton tombant). Il s’ouvre par la consonne basse ว, surmontée du signe de ton bas _่ (mai ek) et se ferme par la voyelle _า.

Note réglementaire de ton : Une consonne de classe basse conjuguée avec un mai ek produit de manière automatique et mécanique un ton tombant accentué.$kt$, $kt$$kt$, null),
  ('Thaï', 54, $kt$Cours 54 · [LECTURE] Décodage de rumeurs, secrets et quiproquos continus$kt$, $kt$Repérer visuellement l’indicateur de discours rapporté บอกว่า au cœur d’un texte continu sans espaces et lire des rapports d’informations fluides.$kt$, $kt$Théorie de la Lecture : Isoler le flux de l’information rapportée
En thaïlandais, la structure du style indirect est d’une grande simplicité puisqu’elle ne requiert aucune modification de temps verbal ni de pronom au sein de la proposition citée. Vos yeux doivent chercher la balise visuelle stable บอกว่า pour baliser le passage des paroles rapportées.

La structure type dans le texte : [Sujet A] + บอกว่า + [Propos rapportés substan-
tiels]

Exemple visuel : เพื่อนบอกว่าภาษาไทยสนุกมากค่ะ → เพื่อน (l’ami) | บอกว่า (a dit que) | ภาษาไทยสนุกมาก (la langue thaïe est très amusante) | ค่ะ (politesse) = Pheuan bawk wâa phasa thaï sa-nuk maak kha.$kt$, $kt$Exemple visuel : เพื่อนบอกว่าภาษาไทยสนุกมากค่ะ → เพื่อน (l’ami) | บอกว่า (a dit que) | ภาษาไทยสนุกมาก (la langue thaïe est très amusante) | ค่ะ (politesse) = Pheuan bawk wâa phasa thaï sa-nuk maak kha.$kt$, null),
  ('Thaï', 55, $kt$Cours 55 · [COMPRÉHENSION] Les secrets révélés du Lakorn$kt$, $kt$Entraîner l’oreille à capter la structure bawk wâa sous un débit de conversation rapide et décoder les révélations de secrets dans une série.$kt$, $kt$Compréhension Orale : Intercepter les rumeurs et les confidences
Dans les tournants scénariques majeurs des Lakorns, les malentendus et quiproquos reposent presque toujours sur ce qu’un personnage a rapporté au sujet d’un autre. À l’oral rapide, le mot ว่า (wâa) est très fortement accentué sur son ton tombant, ce qui vous procure un excellent jalon acoustique.
Script audio du laboratoire d’écoute (Min et Seo-yeon échangeant des confidences) :$kt$, $kt$มิน (Min) : แฟนของคุณบอกว่าอะไรคะ ? · ซอยอน (Seo-yeon) : เขาบอกว่าเขาจะไปภูเก็ตพรุ่งนี้ค่ะ แต่ฉันคิดว่าเขาโกหกค่ะ · มิน (Min) : จริงเหรอคะ ? ชินบอกว่าเขาอยู่ท่ีน่ี นะครับ$kt$, null),
  ('Thaï', 56, $kt$Cours 56 · [EXPRESSION] Grand Atelier du compterendu des rumeurs de l’épisode$kt$, $kt$Rédiger un résumé d’intrigue dramatique en caractères thaïs et présenter oralement un compte-rendu d’informations continues de 2 minutes et 30 secondes.$kt$, $kt$Syntaxe & Grammaire : Imbriquer l’Hypothèse et le Discours Rapporté
Pour parfaire votre aisance oratoire, vous allez croiser les acquis du cycle conditionnel précédent et le style indirect au sein d’un même flux discursif structuré.

Structure cible : [Sujet A] + บอกว่า + [Infos] + แต่ + [Sujet B] + บอกว่า + [Infos contraires]

Lexique du décodage de l’intrigue
• บอกว่า (bawk wâa) = Dire que / déclarer que (Ton bas + Ton tombant).

• โกหก (koo-hok) = Mentir (Ton moyen + Ton bas).

• ความจริง (khwam-tching) = La vérité (Ton moyen + Ton moyen).

• คิดว่า (khit wâa) = Penser que / estimer que (Ton haut + Ton tombant).$kt$, $kt$$kt$, null),
  ('Thaï', 57, $kt$Cours 57 · [ÉCRIT] Les registres formels et l’écriture des marqueurs de respect$kt$, $kt$Maîtriser le tracé et la graphie des pronoms et verbes formels et comprendre l’organisation visuelle des termes de déférence écrite.$kt$, $kt$Tracé et Graphie : L’écriture des marques de gradation
En thaïlandais, pour modifier le registre d’une phrase (passer du langage de la rue au langage administratif, professionnel ou poli), on ne modifie pas la structure de la grammaire, mais on substitue les mots courants par des équivalents plus raffinés et soutenus.

Les mutations lexicales formelles à tracer (À mémoriser) :

• Manger : กิน (kin - courant) → รับประทาน (rap-pra-than - formel / écrit).
Analyse du tracé : รับ (consonne basse ร + voyelle courte _ั + consonne finale บ) | ประ (consonne moyenne ป + consonne basse ร + particule de brièveté _ะ) | ทาน (consonne basse ท + voyelle longue _า + consonne finale น).

• Le pronom de respect : ท่าน (than - Sa seigneurie / Vous de haute déférence / Ton tombant). S’écrit avec la consonne basse ท, surmontée du signe de ton bas _่ (mai ek), la voyelle _า, et la finale nasale น.

• Le préfixe honorifique/sacré : พระ (phra - sacré / royal / Ton haut). S’écrit avec la consonne basse พ + consonne basse ร + particule de brièveté _ะ.$kt$, $kt$$kt$, null),
  ('Thaï', 58, $kt$Cours 58 · [LECTURE] Décodage de textes administratifs et de scripts historiques$kt$, $kt$Repérer visuellement et isoler le vocabulaire soutenu et les préfixes sacrés au cœur d’un texte continu sans espaces.$kt$, $kt$Théorie de la Lecture : Cartographier les strates sociales
Dans un texte thaï formel ou un résumé d’un épisode de série historique (Lakorn d’époque), la présence des marqueurs graphiques comme พระ (phra) ou ท่าน (than) vous indique instantanément que les personnages s’adressent à une autorité (royauté, moines bouddhistes, hauts fonctionnaires ou cadres dirigeants).

La structure de déférence dans le texte : [Titre / Pronom Honorifique] + [Verbe
Formel]

Exemple visuel : ท่านรับประทานอาหารค่ะ → ท่าน (Leur seigneurie / Vous) | รับประทาน (consommer) | อาหารค่ะ (nourriture + politesse) = Than rap-pra-than aa-han kha (Vous prenez votre repas [soutenu]).$kt$, $kt$Exemple visuel : ท่านรับประทานอาหารค่ะ → ท่าน (Leur seigneurie / Vous) | รับประทาน (consommer) | อาหารค่ะ (nourriture + politesse) = Than rap-pra-than aa-han kha (Vous prenez votre repas [soutenu]).$kt$, null),
  ('Thaï', 59, $kt$Cours 59 · [COMPRÉHENSION] Les registres verticaux et le langage des séries historiques$kt$, $kt$Entraîner l’oreille à capter les variations de registres (familier, poli, officiel) et décoder les marques de respect ou d’arrogance des personnages à l’écran.$kt$, $kt$Compréhension Orale : Intercepter les rapports de force et d’autorité
Dans les séries thaïes, la façon dont deux personnages s’adressent l’un à l’autre révèle immédiatement leur place dans la hiérarchie sociale ou leur niveau de conflit. L’oreille doit capter les pronoms spécifiques qui se substituent à คุณ (khun) ou ฉั น/ผม (tchan/phom).
Script audio du laboratoire d’écoute (Un employé s’adressant respectueusement à$kt$, $kt$ผู้จัดการ (Directeur) : ผมจะไปประชุมครับ คุณเตรียมข้อมูลแล้วหรือยัง ?$kt$, null),
  ('Thaï', 60, $kt$Cours 60 · [EXPRESSION] Grand Atelier de l’audience formelle avec la hiérarchie$kt$, $kt$Rédiger une demande polie au registre écrit formel en caractères thaïs et simuler une interaction orale fluide et respectueuse face à un supérieur.$kt$, $kt$Syntaxe & Grammaire : La cascade de politesse exécutive
Pour atteindre une aisance quasi-native à l’oral, vous devez être capable de mener une conversation de bureau ou de projet avec un ton mesuré. Utilisez le pronom de respect ท่าน (than) pour votre interlocuteur, le verbe soutenu รับประทาน (rap-pra-than) ou ทํางาน (tham-ngaan) à la place de l’argot d’atelier, et fermez vos phrases par une particule de politesse parfaitement modulée.

Structure cible : ท่าน + [Action formelle] + ใช่ไหมครับ/คะ + เพราะว่า +
[Justification respectueuse]

Lexique du protocole professionnel
• ข้อมูล (khôo-moon) = Les données / les informations de projet (Ton tombant + Ton moyen).

• ประชุม (pra-chum) = Se réunir / assister à une réunion (Ton bas + Ton moyen).

• สวัสดีครับท่าน (sa-wat-dee krap than) = Mes hommages, Monsieur (formule d’accueil de la hiérarchie).$kt$, $kt$$kt$, null),
  ('Thaï', 61, $kt$Cours 61 · [ÉCRIT] Syntaxe avancée, synthèse des structures complexes et révisions$kt$, $kt$Maîtriser l’agencement graphique final des structures imbriquées (Hypothèse + Discours rapporté + Particules d’humeur) et éliminer définitivement les erreurs d’étagement des caractères.$kt$, $kt$Rigueur de la Graphie : L’empilement ultime
Au niveau d’autonomie intermédiaire, vous devez être capable de tracer des phrases longues et fluides sans commettre d’erreur d’étagement (alignement vertical de la consonne, de la voyelle basse/haute et du signe de ton).

Le piège de la superposition :

Rappelez-vous que sur une même consonne verticale, le signe de ton (ex : _้) se place toujours au-dessus de la voyelle supérieure (ex : _ี). Les éléments ne doivent jamais se chevaucher de manière illisible.

La règle de la cascade de fin de phrase :
L’écrit doit refléter exactement l’ordre oral des extensions et des étiquettes d’humeur :

[Verbe] + [Objet] + [Marqueur de passé : ] + [Particule d’humeur : ] +
[Politesse : /]

Exemple à tracer : กินข้าวแล้วนะคะ (kin-kâao-lǽæw-na-kha = J’ai déjà mangé, d’accord ?).$kt$, $kt$Exemple à tracer : กินข้าวแล้วนะคะ (kin-kâao-lǽæw-na-kha = J’ai déjà mangé, d’accord ?).$kt$, null),
  ('Thaï', 62, $kt$Cours 62 · [LECTURE] Grand Bilan de Lecture continu et décodage d’un synopsis$kt$, $kt$Valider sa capacité à lire à haute voix, découper mentalement et comprendre un synopsis complet de série thaïlandaise sans aucun repère d’espacement.$kt$, $kt$Épreuve de Lecture de Synthèse$kt$, $kt$“ถ้าคุณอยากพูดภาษาไทยเก่งที่สุดคุณต้องเรียนทุกวันครับเพื่อนของผมบอกว่าภาษาไทยยากแต่สนุกจ$kt$, null),
  ('Thaï', 63, $kt$Cours 63 · [COMPRÉHENSION] L’Examen d’Écoute du dernier épisode$kt$, $kt$Valider son oreille face à un flux audio de vitesse réelle de série (Lakorn) et extraire les informations clés d’une résolution d’intrigue.$kt$, $kt$Laboratoire d’Écoute : Script du dénouement de la série
Écoutez attentivement ce dialogue final entre P’Shin et Yuna au sommet d’une tour à Bangkok :
(Yuna, si tu dis que tu m’aimes, alors je serai le plus heureux au monde.)$kt$, $kt$พี่ชิน (P’Shin) : ยูนาครับ ถ้าคุณบอกว่ารักผม ผมก็จะมีความสุขที่สุดในโลกครับ · ยูนา (Yuna) : ตอนนี้ฉันกําลังร้องไห้อยู่เพราะว่าดีใจมาก ๆ ค่ะ... ฉั นรักคุณนะคะ · พี่ชิน (P’Shin) : พรุ่งนี้เราจะไปเที่ยวภูเก็ตด้วยกันนะซะ !$kt$, null),
  ('Thaï', 64, $kt$Cours 64 · [EXPRESSION] Grand Bilan Final Oral & Archivage LaTeX$kt$, $kt$Soutenir une performance oratoire autonome de 3 minutes intégrant toutes les structures complexes du cursus, et valider la structure complète du document LaTeX pour le thaï.$kt$, $kt$Grand Atelier d’Expression Orale : La scène finale (3 minutes)

• Intégration naturelle d’une hypothèse conditionnelle (ถ้า - thâa).

• Justification fluide par une structure de cause (เพราะว่า - phŕ-wâa).

• Utilisation en situation d’une action en cours au présent continu (กําลัง...อยู่ - kam-lang... yòo).

• Formule de gradation absolue au superlatif (ที่สุด - thîi-sùt).

• Utilisation expressive de particules d’humeur finales de clôture (นะ / คะ / ครับ).

¡Felicidades ! Has terminado con éxito le cursus de tailandés.$kt$, $kt$$kt$, null)
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
  and c.language = 'Thaï'
  and e.origin <> 'member';

-- les exercices des membres passent après ceux du manuel (position + 1000, une seule fois)
update public.language_exercises e
set position = e.position + 1000
from public.language_courses c
where e.course_id = c.id
  and c.language = 'Thaï'
  and e.origin = 'member'
  and e.position < 1000;

-- 3) Nouveaux exercices du manuel
insert into public.language_exercises
  (course_id, position, prompt, answer, expected_answer, accepted_answers, explanation, exercise_type, origin)
select c.id, x.pos, x.prompt, x.expected, x.expected, x.accepted, x.explanation, 'written', 'manual'
from (values
  (1, 1, $kt$(Calligraphie) Prenez une feuille de papier quadrillée. Tracez 5 fois chaque caractère ci-dessus en veillant impérativement à commencer votre geste par le petit cercle initial (pour les lettres qui en possèdent un). Entraînez-vous ensuite à assembler et écrire les deux mots suivants : ตา (taaf) : l’œil / le grand-père maternel.$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (1, 2, $kt$(Calligraphie) Prenez une feuille de papier quadrillée. Tracez 5 fois chaque caractère ci-dessus en veillant impérativement à commencer votre geste par le petit cercle initial (pour les lettres qui en possèdent un). Entraînez-vous ensuite à assembler et écrire les deux mots suivants : กา (kaa) : le corbeau / la bouilloire. Aide à la mémorisation graphique Conseil de l’expert : Ne confondez pas ด (do dek) et ต (to tao). Ils partagent exactement la même base, mais le ต possède une brisure/ondulation sur le dessus de sa boucle. Visualisez le ต (to tao = la tortue) comme la carapace ondulée de l’animal pour vous en souvenir !$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (2, 1, $kt$Lisez à voix haute les blocs suivants et découpez-les par des barres verticales pour isoler les mots : กาดี (Le corbeau est bon) →                       /$kt$, $kt$กา$kt$, array[$kt$กา$kt$]::text[], $kt$กา (kaa) | ดี (dii).$kt$),
  (2, 2, $kt$Lisez à voix haute les blocs suivants et découpez-les par des barres verticales pour isoler les mots : ตาดาดี (Le grand-père Da est bon) →                       /                   /$kt$, $kt$ตา$kt$, array[$kt$ตา$kt$]::text[], $kt$ตา (taa) | ดา (daa) | ดี (dii).$kt$),
  (3, 1, $kt$(dii - plat, sans courbe mélodique) → Ton$kt$, $kt$Moyen$kt$, array[$kt$Moyen$kt$]::text[], $kt$Moyen (Mid tone)$kt$),
  (3, 2, $kt$(ka - descendant de manière marquée dans les graves) → Ton$kt$, $kt$Bas$kt$, array[$kt$Bas$kt$]::text[], $kt$Bas (Low tone)$kt$),
  (4, 1, $kt$Tâche écrite (Production) : Tracez en caractères thaïs votre propre phrase de présentation complète (veillez à choisir le bon pronom de départ et la bonne particule finale selon votre genre). • Exemple écrit pour une femme : ฉั นชื่อ[Votre Prénom]ค่ะ Note critique : N’insérez aucun espace entre le pronom, le verbe, le nom propre et la particule de politesse ! Tâche orale (Immersion) : Imaginez que vous entrez dans une scène de vie quotidienne. Vous rencontrez un interlo- cuteur. Joignez vos deux mains devant votre poitrine en forme de bouton de lotus (le geste traditionnel du Wai), inclinez légèrement la tête et dites à voix haute de manière parfaitement continue : „Sawatdee ka/krap, tchan/phom tchuu [Votre Prénom] ka/krap.“ Veillez à ce que le ka final des femmes descende bien de manière posée dans les graves (ton bas) et que le krap des hommes soit bref et net. Répétez l’exercice 5 fois à voix haute pour fluidifier l’enchaînement.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (5, 1, $kt$(Calligraphie) Prenez votre cahier d’écriture. Tracez 5 fois chaque caractère ci-dessus. Entraînez-vous attentivement à différencier le tracé du ข (assez étroit et linéaire) de celui du ส (muni de son crochet final en haut à droite).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (6, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute : คุณไม่มา (Tu ne viens pas / มา [maa] = venir) →                     /              /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : คุณ (khun) | ไม่ (maï ) | มา (maa).$kt$),
  (7, 1, $kt$(tchan - aigu, percutant et perché) → Ton$kt$, $kt$Haut$kt$, array[$kt$Haut$kt$]::text[], $kt$Haut (High tone)$kt$),
  (7, 2, $kt$(phom - descend puis remonte de manière curviligne) → Ton$kt$, $kt$Montant$kt$, array[$kt$Montant$kt$]::text[], $kt$Montant (Rising tone)$kt$),
  (8, 1, $kt$Je n’aime pas (Verbe : รัก).$kt$, $kt$ฉั นไม่รัก$kt$, array[$kt$ฉั นไม่รัก$kt$]::text[], $kt$ฉั นไม่รัก (pour une femme) / ผมไม่รัก (pour un homme).$kt$),
  (8, 2, $kt$Mon ami va bien. Espace d’écriture 1. 2.$kt$, $kt$เพื่อนสบายดี Tâche orale$kt$, array[$kt$เพื่อนสบายดี Tâche orale$kt$]::text[], $kt$เพื่อนสบายดี Tâche orale (Jeu de rôle de série) : Imaginez une scène de dialogue intense où vous devez exprimer vos sentiments à votre partenaire ou évoquer votre maman. Regardez droit devant vous, adoptez une posture posée et prononcez à voix haute avec fluidité et assurance : 1. „Tchan/Phom rak mæ̂æ ka/krap.“ (J’aime maman). 2. „Khun rak faen maï kha/krap ?“ (Aimes-tu ton/ta petit(e) ami(e) ?). Conseil de fluidité pro : Ne marquez aucune césure ou temps d’arrêt entre la négation ไม่ (maï ) et le verbe. Le bloc négatif ไม่รัก (maï-rak) doit être articulé d’un seul élan, en faisant monter brusquement la voix sur le ton haut de rak. Répétez l’exercice jusqu’à ce que la transition ton tombant → ton haut soit fluide.$kt$),
  (9, 1, $kt$(Calligraphie) Tracez 5 fois chaque consonne basse ci-dessus dans votre cahier. Tracez ensuite trois fois la suite numérique traditionnelle complète : ๑ ๒ ๓ ๔ ๕.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (10, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute en identifiant le mot compteur : แฟนสองคน (Deux petits-amis... configuration classique de série dramatique ! / สอง [song] = 2) →                    /                  /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : แฟน (faen - conjoint/partenaire) | สอง (song - deux) | คน (khon - compteur de personnes).$kt$),
  (11, 1, $kt$„Saam-sip-haa baht ka.“ →                          Bahts.$kt$, $kt$35 Bahts$kt$, array[$kt$35 Bahts$kt$]::text[], $kt$35 Bahts (Structure : 3 - 10 - 5).$kt$),
  (11, 2, $kt$„Neung-roy baht krap.“ →                          Bahts.$kt$, $kt$100 Bahts$kt$, array[$kt$100 Bahts$kt$]::text[], $kt$100 Bahts.$kt$),
  (12, 1, $kt$Tâche écrite (Production) : Rédigez votre commande en caractères thaïs, de manière continue et sans aucun espace : demandez deux tasses de café. • Vocabulaire spécifique : แก้ว (kaew = verre / tasse / récipient / ton tombant). Espace d’écriture de la commande$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (13, 1, $kt$(Calligraphie) Prenez votre feuille d’écriture. Tracez 10 fois le mot อยู่ de manière proportionnée, en alignant verticalement la voyelle inférieure et le signe de ton supérieur. Tracez ensuite 5 fois le bloc de localisation complet : อยู่ท่ีน่ี (Se trouver ici).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (14, 1, $kt$Découpez le bloc de lecture suivant par des barres verticales et lisez-le à voix haute : คุณไปที่นั่น (Tu vas là-bas) →                  /                    /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : คุณ (khun) | ไป (paï ) | ที่นั่น (thîi-nân).$kt$),
  (15, 1, $kt$(trong-paï) →$kt$, $kt$Tout droit$kt$, array[$kt$Tout droit$kt$]::text[], $kt$Tout droit$kt$),
  (15, 2, $kt$(dj̀t) →$kt$, $kt$Arrêter / S’arrêter$kt$, array[$kt$Arrêter / S’arrêter$kt$, $kt$Arrêter S’arrêter$kt$, $kt$Arrêter$kt$, $kt$S’arrêter$kt$]::text[], $kt$Arrêter / S’arrêter$kt$),
  (16, 1, $kt$Consigne : Rédigez un paragraphe de 5 à 6 lignes en caractères thaïs, entièrement connecté sans espaces. Vous devez vous présenter (prénom, nationalité), dire comment vous allez, présenter un ami ou un membre fictif de votre entourage, et indiquer où vous vous trouvez actuellement (en utilisant la structure อยู่ท่ีน่ี ). Contraintes de graphie : Mobilisez correctement les consonnes de classe moyenne, haute et basse étudiées au cours du bloc. Placez scrupuleusement les voyelles et les signes de tons au bon étage (au-dessus ou au-dessous de la ligne principale). Votre production écrite (Bilan Bloc 1)$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (16, 2, $kt$Consigne (Performance chronométrée) : Imaginez que vous passez une audition ou que vous vous adressez directement à la caméra pour introduire votre personnage dans une série thaïlandaise. Sans regarder vos notes, effectuez le geste traditionnel du Wai (mains jointes devant la poitrine), et prenez la parole à voix haute de manière fluide pendant 3 minutes complètes en continu.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (17, 1, $kt$(Calligraphie) Prenez votre cahier d’écriture. Tracez 10 fois le mot จะ (ja) en veillant rigoureusement à ce que la voyelle courte ะ soit exactement de la même hauteur que la consonne จ. Tracez ensuite 5 fois le mot complexe suivant : เฝ้ า (fao - garder / consonne de classe haute ฝ + voyelle เ_า + signe de ton tombant _้).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (18, 1, $kt$Découpez le bloc de lecture suivant par des barres verticales et lisez-le à voix haute : คุณจะมาที่น่ีไหมคะ (Est-ce que vous viendrez ici ? / มา = venir) →               / /              /            /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : คุณ (khun) | จะ (ja) | มา (maa) | ที่น่ี (thîi-nîi) | ไหมคะ (maï kha ?).$kt$),
  (19, 1, $kt$(phrung-nii) → □ Hier      □ Demain      □ Aujourd’hui$kt$, $kt$Demain$kt$, array[$kt$Demain$kt$]::text[], $kt$Demain (Courbe mélodique : Ton bas + Ton haut).$kt$),
  (19, 2, $kt$(ja-paï) → □ Je suis allé    □ Je vais        □ J’irai$kt$, $kt$J’irai$kt$, array[$kt$J’irai$kt$]::text[], $kt$J’irai (Association indissociable du marqueur du futur et du verbe d’action).$kt$),
  (20, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts, sans insérer d’espaces, l’énoncé suivant : ”Demain j’irai à la mer. Nous irons ensemble.” • Aide lexicale : เรา (rao = nous / Ton moyen). Script d’itinéraire futur$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ้ ั นจะไปทะเลเราจะไปด้วยกันค่ะ พรุ่งนีฉ (pour une femme) / ้ มจะไปทะเลเราจะไปด้วยกันครับ (pour un homme). พรุ่งนีผ Tâche orale (Monologue de série) : Incarnez votre personnage et annoncez vos projets de vacances au héros de la série. Fixez l’interlocuteur du regard, souriez et énoncez votre monologue à voix haute de manière continue pendant 2 minutes : „Phrung-nii phom/tchan ja paï Phoo-ket krap/ka. Phrung-nii aakart ja dii mak !“ (Demain j’irai à Phuket. Demain le temps sera excellent !) Conseil de fluidité pro : La particule จะ (ja) possède une voyelle intrinsèquement courte. Elle doit être prononcée de manière extrêmement brève et légère, sans aucune accentuation tonale lourde. Glissez rapidement dessus afin de reporter toute l’insistance oratoire sur le verbe d’action qui lui succède immédiatement : articulez จะไป comme un unique bloc rythmique bondissant : [ja-PAÏ]. Répétez l’exercice pour perfectionner l’enchaînement.$kt$),
  (21, 1, $kt$(Calligraphie) Tracez 10 fois le mot ได้ (dâï ). Tracez ensuite 5 fois le mot ชอบ (tchop) en veillant méticuleusement à ce que la consonne initiale ช (classe basse) soit bien proportionnée par rapport au บ final.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (22, 1, $kt$Découpez le texte continu par des barres verticales et lisez-le à voix haute : ฉั นกินข้าวแล้วค่ะ (J’ai déjà mangé / กิน [kin] = manger, ข้าว [kâao] = riz/repas) → /             /               /              /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ฉั น (tchan) | กิน (kin) | ข้าว (kâao) | แล้ว (lǽæw) | ค่ะ (ka).$kt$),
  (23, 1, $kt$„Tchan ja paï...“ → Action au$kt$, $kt$Futur$kt$, array[$kt$Futur$kt$]::text[], $kt$Futur (Caractérisé par la présence de la particule ja).$kt$),
  (23, 2, $kt$„Tchan paï lǽæw...“ → Action au$kt$, $kt$Passé / Accompli$kt$, array[$kt$Passé / Accompli$kt$, $kt$Passé Accompli$kt$, $kt$Passé$kt$, $kt$Accompli$kt$]::text[], $kt$Passé / Accompli (Caractérisé par la présence de la particule finale lǽæw).$kt$),
  (24, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces vos souvenirs d’hier : ”Hier j’ai regardé une série. J’ai déjà mangé du riz.” Script narratif au passé$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ้ ั นดูหนั งฉั นกินข้าวแล้วค่ะ เมื่อวานนีฉ (pour une femme) / ้ มดูหนั งผมกินข้าวแล้วครับ (pour un homme). เมื่อวานนีผ Tâche orale (Monologue rétrospectif) : Imaginez que vous racontez votre week-end à un interlocuteur. Prenez la parole à voix haute de manière parfaitement continue pendant 2 minutes et 30 secondes : „Meua-waan-nii phom/tchan dâï paï thiao lǽæw krap/ka. A-roy mak !“ (Hier, je suis allé me promener. C’était délicieux !) Conseil de fluidité pro : Le mot แล้ว (lǽæw) culmine sur un ton haut très expressif. À l’oral, faites-le claquer nettement en fin de proposition pour scander l’accomplissement total de l’action, puis marquez une micro-pause respiratoire. Ne segmentez pas le bloc syntaxique กินข้าวแล้ว (kin-kâao-lǽæw), énoncez-le d’un seul mouvement mélodique ascendant. Répétez ce monologue jusqu’à éliminer toute hésitation.$kt$),
  (25, 1, $kt$(Calligraphie) Prenez votre feuille de papier. Tracez 10 fois le verbe เป็ น (pen) en plaçant le signe Mai taï-khu exactement au-dessus de la consonne ป. Tracez ensuite 5 fois l’expression intensifiée suivante : ดี ๆ (dii-dii = très bien / avec soin).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (26, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute en isolant le désir et la capacité acquise : ฉั นอยากพูดเป็ นค่ะ (Je veux savoir parler [dit par une femme]) →                 / /               /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ฉั น (tchan - je) | อยาก (yàak - vouloir) | พูด (phoot - parler) | เป็ นค่ะ (pen kha - savoirfaire + particule de politesse).$kt$),
  (27, 1, $kt$„Tchan sia-chaï mak mak ka.“ → Je suis très$kt$, $kt$Traced / Désolée / Triste$kt$, array[$kt$Traced / Désolée / Triste$kt$, $kt$Traced Désolée Triste$kt$, $kt$Traced$kt$, $kt$Désolée$kt$, $kt$Triste$kt$]::text[], $kt$Traced / Désolée / Triste (Porté par sia-chaï ; mak-mak traduisant l’intensité ”énormément”).$kt$),
  (27, 2, $kt$„Phom dee-chaï krap.“ → Je suis$kt$, $kt$Heureux / Content$kt$, array[$kt$Heureux / Content$kt$, $kt$Heureux Content$kt$, $kt$Heureux$kt$, $kt$Content$kt$]::text[], $kt$Heureux / Content (Porté par dee-jaï ).$kt$),
  (28, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces votre confession d’apprentissage : ”Je veux parler thaï. Je sais parler un peu.” • Aide lexicale : นิ ดหน่ อย (nit-noy = un petit peu / Ton bas + Ton bas). Script écrit de la confession$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ฉั นอยากพูดภาษาไทยฉั นพูดเป็ นนิดหน่ อยค่ะ (pour une femme) / ผมอยากพูดภาษาไทยผมพูดเป็ นนิดหน่ อยครับ (pour un homme). Tâche orale (La scène clé du Lakorn) : Incarnez le personnage principal de la série. Face à votre interlocuteur, prenez une grande inspiration, mettez de l’émotion dans votre voix, et prononcez ce monologue à voix haute de manière fluide et continue pendant 2 minutes et 30 secondes : „Khun jaï-dii mak krap/ka. Phom/Tchan dee-chaï mak mak... Phom/Tchan yàak bawk wa phom/tchan rak khun krap/ka.“ (Vous êtes très gentil(le). Je suis tellement heureux(se)... Je voulais vous dire que je vous aime.) Conseil de fluidité pro (2029) : Le redoublement intensif du mot mak (มาก ๆ → maakmaak) doit être réalisé sur un ton bas glissé, rapide, presque comme un écho naturel. Ne marquez aucune coupure entre la volonté อยาก (yàak) et le verbe บอก (bawk). Le bloc verbal อยากบอก (yàak-bawk) doit être expulsé dans un seul flux d’air continu en maintenant les deux tons bas stables. Répétez jusqu’à obtenir un débit parfait.$kt$),
  (29, 1, $kt$(Calligraphie) Tracez 10 fois le mot abrégé de la capitale : กรุงเทพฯ. Veillez à ce que le symbole ฯ soit tracé à la même échelle que les consonnes de base, juste après la consonne finale พ.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (30, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute en isolant la particule d’humeur et celle de politesse : รักนะค่ะ (Je t’aime, d’accord ?) →                 /         / Note de rigueur linguistique À l’écrit correct, après une particule au ton haut comme นะ, les femmes utilisent la particule de politesse haute คะ (kha) pour harmoniser le flux mélodique. La structure exacte est donc : รักนะคะ (rak na kha). Découpage : รัก (rak - aimer) | นะ (na - adoucissement) | คะ (kha - politesse).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (31, 1, $kt$(djang) → □ Un peu       □ Tellement / Vraiment      □ Jamais$kt$, $kt$Tellement / Vraiment$kt$, array[$kt$Tellement / Vraiment$kt$, $kt$Tellement Vraiment$kt$, $kt$Tellement$kt$, $kt$Vraiment$kt$]::text[], $kt$Tellement / Vraiment (Exemple : Dii djang ! = C’est tellement bien !).$kt$),
  (31, 2, $kt$(theuat-na) → □ Une interdiction       □ Une supplication douce    □ Un prix$kt$, $kt$Une supplication douce$kt$, array[$kt$Une supplication douce$kt$]::text[], $kt$Une supplication douce (Équivaut à l’expression : ”Allez, s’il te plaît...”).$kt$),
  (32, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces un échange de deux répliques courtes : ”A : Je t’aime tellement s’il te plaît. B : Je t’aime aussi.” • Aide lexicale : เหมือนกัน (meuan-kan = pareillement / aussi). Script de dialogue familier Réplique A : Réplique B :$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : A : รักคุณจังเลยนะคะ (pour une femme) / รักคุณจังเลยนะครับ (pour un homme). B : รักเหมือนกันครับ (homme) / รักเหมือนกันค่ะ (femme). Tâche orale (La performance du Bloc 3) : Placez-vous face à votre miroir. Adoptez un ton de conversation de la vie courante, rapide, dynamique et nuancé. Prononcez ce monologue à voix haute de manière continue pendant 3 minutes complètes (chronométré) : „Khun jaï-dii djang leuy ka/krap ! Paï thiao kan theuat na... Phrung-nii ja paï thiao thalee lǽæw. Paï na ka/krap !“ (Vous êtes vraiment tellement gentil ! Allons nous promener ensemble s’il vous plaît... Demain nous irons déjà nous promener à la mer. On y va, d’accord ?) Conseil de fluidité pro : Les particules comme จัง (djang) ou l’expression เถอะนะ (theuat-na) ne doivent pas créer de saccade ou de rupture dans votre flux de parole. À l’oral, la voix doit monter de manière fluide et mélodieuse sur les particules finales pour transmettre l’émotion. Entraînez-vous à lier le bloc ใจดีจัง d’un seul élan : [ใจดีจัง - jaï-dii-DJANG]. Répétez ce grand exercice jusqu’à ce que votre débit oral soit parfaitement unifié. CHAPITRE 3 BLOC 3 : Synthaxe connective & structures intermédiaires$kt$),
  (33, 1, $kt$(Calligraphie) Prenez votre feuille d’écriture. Tracez 10 fois le mot แต่ (tæ̀æ) en veillant scrupuleusement à la symétrie des deux boucles de la voyelle แ. Tracez ensuite 5 fois le bloc de cause entier : เพราะว่า (phŕ-wâa).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (34, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute : อยากไปแต่ไม่มีเวลาค่ะ (Je veux y aller mais je n’ai pas le temps / ไม่มีเวลา [maï mii we-laa] = ne pas avoir de temps) →             /               /             /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : อยากไป (yàak paï - vouloir aller) | แต่ (tæ̀æ - mais) | ไม่มีเวลา (maï mii we-laa - pas avoir de temps) | ค่ะ (kha - politesse).$kt$),
  (35, 1, $kt$„... phŕ-wâa phom klua krap...“ → □ Opposition      □ Cause$kt$, $kt$Cause$kt$, array[$kt$Cause$kt$]::text[], $kt$Cause (parce que)$kt$),
  (35, 2, $kt$„... tæ̀æ khun t̂ng bawk...“ → □ Opposition     □ Cause$kt$, $kt$Opposition$kt$, array[$kt$Opposition$kt$]::text[], $kt$Opposition (mais)$kt$),
  (36, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces votre justification : ”Je veux me reposer mais j’ai du travail parce que le travail est abondant.” • Aide lexicale : พักผ่อน (phak-phon = se reposer / relâcher la pression / Ton bas + Ton bas). Script d’argumentation écrite$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : อยากพักผ่อนแต่มีงานเพราะว่างานเยอะค่ะ (pour une femme) / อยากพักผ่อนแต่มีงานเพราะว่างานเยอะครับ (pour un homme). Tâche orale (La confrontation dramatique) : Imaginez que vous faites face à votre supérieur ou à un ami dans une scène clé de série. Vous devez expliquer de manière ferme pourquoi vous ne pouvez pas participer à un projet ou à une sortie. Prenez la parole à voix haute pendant 3 minutes complètes en continu : „Tchan/Phom yàak paï thiao mak ka/krap tæ̀æ paï maï dâï... Phŕ-wâa phrung-nii mii ngaan yeua mak mak. Sia-chaï djang ka/krap.“ (Je veux vraiment aller me promener, mais je ne peux pas y aller... Parce que demain j’ai énormément de travail. Je suis tellement désolé(e).) Conseil de fluidité pro : Pour donner une impression d’assurance absolue, ne marquez pas de pause artificielle avant เพราะว่า (phŕ-wâa). Le bloc complet tæ̀æ-paï-maï-dâï-phŕ-wâa doit sortir dans un flux verbal tendu et unifié. Faites claquer le ton tombant de แต่ (tæ̀æ) puis enchaînez directement. Répétez l’exercice jusqu’à ce que l’articulation soit fluide.$kt$),
  (37, 1, $kt$(Calligraphie) Prenez votre feuille de papier. Tracez 10 fois le mot กว่า (kwàa) en veillant à l’alignement du signe de ton. Tracez ensuite 5 fois le bloc de gradation absolue complet : ที่สุด (thîi-sùt).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (38, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute : ้ วยที่สุดค่ะ (Cette personne est la plus belle / คนนี้ [khon-nii] = cette personne, สวย คนนีส [suay] = être belle) →                      /                    /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : คนนี้ (khon-nii - cette personne) | สวย (suay - être belle) | ที่สุดค่ะ (thîi-sùt kha - le plus + particule de politesse).$kt$),
  (39, 1, $kt$„... l̀ kwàa...“ → □ Superlatif (Le plus)        □ Comparatif (Plus que)$kt$, $kt$Comparatif$kt$, array[$kt$Comparatif$kt$]::text[], $kt$Comparatif (Plus beau que / supériorité relative).$kt$),
  (39, 2, $kt$„... l̀ thîi-sùt...“ → □ Superlatif (Le plus)     □ Comparatif (Plus que)$kt$, $kt$Superlatif$kt$, array[$kt$Superlatif$kt$]::text[], $kt$Superlatif (Le plus beau / supériorité absolue).$kt$),
  (40, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces votre évaluation : ”Le café est plus cher que l’eau, mais ce plat est le plus délicieux.” • Aide lexicale : จานนี้ (tchan-nii = ce plat / Ton moyen + Ton haut). Script de critique comparative$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ้ ร่อยที่สุดค่ะ กาแฟแพงกว่านํ ้ าแต่จานนีอ (pour une femme) / ้ ร่อยที่สุดครับ (pour un homme). กาแฟแพงกว่านํ ้ าแต่จานนีอ Tâche orale (La critique de la série face caméra) : Imaginez que vous partagez votre avis sur l’apprentissage des langues et sur vos préférences culturelles lors d’un vlog. Prenez la parole à voix haute de manière fluide et rythmée pendant 3 minutes complètes en continu : „Phasa thaï yaak kwàa phasa farang-set tæ̀æ sa-nuk thîi-sùt krap/ka ! Tchan/Phom yàak phoot phasa thaï haï keng thîi-sùt phŕ-wâa rak meuang thaï mak mak krap/ka.“ (La langue thaïe est plus difficile que la langue française, mais elle est la plus amusante ! Je veux parler thaï le mieux possible parce que j’aime énormément la Thaïlande / ให้เก่ง = de manière douée, เมืองไทย = le pays thaï). Conseil de fluidité pro : Le marqueur กว่า (kwàa) se prononce très brièvement avec un ton bas sec et marqué. Ne marquez aucune césure oratoire avant ou après. Le bloc complet phaengkwàa-naam doit être émis comme une seule et unique unité mélodique. De même, faites glisser le groupe terminal ที่สุด (thîi-sùt) en unifiant organiquement les deux tons (tombant + bas) pour sceller votre phrase. Répétez l’exercice jusqu’à parfaite automatisation.$kt$),
  (41, 1, $kt$(Calligraphie) Prenez votre feuille de papier. Tracez 10 fois le mot de départ กําลัง (kam-lang). Rédigez ensuite 5 fois le bloc d’action progressive complet : กําลังเรียนอยู่ (kam-lang rian yòo = être en train d’étudier / où เรียน = étudier).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (42, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute : คุณกําลังทําอะไรอยู่คะ (Qu’êtes-vous en train de faire ? / ทํา [tham] = faire, อะไร [a-raï] = quoi) →               /              /               /              /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : คุณ (khun - vous) | กําลัง (kam-lang - en train de) | ทํา (tham - faire) | อะไร (a-raï - quoi) | อยู่คะ (yòo kha - aspect continu + particule de politesse interrogative).$kt$),
  (43, 1, $kt$„Phom tham-ngaan lǽæw krap.“ → Action au$kt$, $kt$Passé / Accompli$kt$, array[$kt$Passé / Accompli$kt$, $kt$Passé Accompli$kt$, $kt$Passé$kt$, $kt$Accompli$kt$]::text[], $kt$Passé / Accompli (Marqué par lǽæw → ”J’ai déjà travaillé”).$kt$),
  (43, 2, $kt$„Phom kam-lang tham-ngaan yòo krap.“ → Action au$kt$, $kt$Présent continu$kt$, array[$kt$Présent continu$kt$]::text[], $kt$Présent continu (Marqué par kam-lang... yòo → ”Je suis en train de travailler”).$kt$),
  (44, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces votre dialogue en direct : ”Maintenant je suis en train d’apprendre le thaï, mais demain j’irai travailler.” Script d’urgence téléphonique$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ้ ั นกําลังเรียนภาษาไทยอยู่แต่พรุ่งนีจ้ ะไปทํางานค่ะ ตอนนีฉ (pour une femme) / ้ มกําลังเรียนภาษาไทยอยู่แต่พรุ่งนีจ้ ะไปทํางานครับ (pour un homme). ตอนนีผ Tâche orale (La simulation d’appel de série) : Prenez votre téléphone en main. Imaginez que vous répondez à l’appel d’un personnage de série. Adoptez une diction téléphonique thaïlandaise typique (légèrement plus haute dans les aigus, chantante et très polie). Prenez la parole à voix haute pendant 2 minutes et 30 secondes en continu : „Han-lo ka/krap. Ton-nii tchan/phom kam-lang khouy thoo-ra-sap yòo ka/krap... Phrung-nii tchan/phom ja paï ha khun phŕ-wâa khit-theung mak mak ka/krap.“ (Allo. En ce moment je suis en train de parler au téléphone... Demain j’irai te voir parce que tu me manques énormément / où คิดถึง [khit-theung] = penser à / manquer à quelqu’un). Conseil de fluidité pro (2029) : Le bloc verbal กําลัง...อยู่ doit couler de source. À l’oral, ne détachez jamais le verbe de ses marqueurs de soutien. Le groupe complet กําลังเรียนอยู่ (kam-lang-rian-yòo) doit être articulé dans un seul flux rythmique continu. Soignez également la prononciation du mot temporel ตอนนี้ (ton-nii) en faisant monter proprement et distinctement la voix sur la deuxième syllabe au ton haut. Répétez l’exercice jusqu’à parfaite maîtrise.$kt$),
  (45, 1, $kt$(Calligraphie) Prenez votre feuille de papier. Tracez 10 fois la particule สิ (si) en veillant scrupuleusement à la netteté de l’arc de cercle de la voyelle supérieure. Rédigez ensuite 5 fois le bloc d’essai complet : ลองกินดู (long kin duu = essaie de goûter/manger).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (46, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute : ้ ิคะ (Essaie de regarder ce film ! / เรื่องนี้ [reuang-nii] = ce classificateur de ลองดูหนั งเรื่องนีส film/histoire) →               /              /               /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ลองดู (long-duu - essayer de voir) | หนั ง (nang - film/série) | เรื่องนี้ (reuang-nii - cette histoire/ce film) | สิคะ (si kha - incitation + politesse).$kt$),
  (47, 1, $kt$„Kin si !“ → □ Un ordre strict       □ Une invitation amicale à manger$kt$, $kt$Une invitation amicale à manger$kt$, array[$kt$Une invitation amicale à manger$kt$]::text[], $kt$Une invitation amicale à manger (Mange donc ! / Goute !).$kt$),
  (47, 2, $kt$„Long kin duu.“ → □ Une interdiction         □ Une suggestion de goûter$kt$, $kt$Une suggestion de goûter$kt$, array[$kt$Une suggestion de goûter$kt$]::text[], $kt$Une suggestion de goûter (Essaie de manger pour tester/voir).$kt$),
  (48, 1, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes en caractères thaïs compacts et sans espaces. Vous devez conseiller à un ami de voyager dans un lieu spécifique de Thaïlande (ex : Phuket, Bangkok) ou de goûter un plat traditionnel. Contraintes de niveau intermédiaire obligatoire : Vous devez impérativement intégrer au sein de votre texte : un connecteur de cause (เพราะว่า) ou d’opposition (แต่), une structure de comparaison (กว่า) ou de superlatif (ที่สุด), une action en cours d’accomplissement (กําลัง...อย่)ู , et clore obligatoirement par une suggestion d’essai (ลอง...ดูสิ). Votre production écrite de synthèse (Bilan Bloc 4)$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (48, 2, $kt$Consigne (Performance chronométrée) : Imaginez que vous coachez un ami qui s’apprête à partir pour la première fois en Thaïlande. Sans regarder vos notes, prenez la parole à voix haute de manière enthousiaste, fluide et convaincante pendant exactement 3 minutes en continu.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (49, 1, $kt$(Calligraphie) Prenez votre feuille de papier. Tracez 10 fois le mot ถ้า (thâa). Veillez à ce que le signe de ton tombant soit positionné de manière parfaitement centrée sur la consonne ถ. Rédigez ensuite 5 fois le bloc : ถ้ามีเวลา (thâa mii we-laa = si j’ai du temps).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (50, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute : ถ้าฝนตกฉั นจะอยู่บ้านค่ะ (S’il pleut, je resterai à la maison / ฝนตก = la pluie tombe, อยู่บ้าน = être à la maison) →               /                /            /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ถ้า (thâa - si) | ฝนตก (fon-tok - il pleut) | ฉั นจะอยู่บ้าน (tchan ja yòo baan - je resterai à la maison) | ค่ะ (ka - politesse).$kt$),
  (51, 1, $kt$„Phŕ-wâa fon tok...“ → Énoncé de$kt$, $kt$Cause$kt$, array[$kt$Cause$kt$]::text[], $kt$Cause (Parce qu’il pleut / fait établi).$kt$),
  (51, 2, $kt$„Thâa fon tok...“ → Énoncé d’$kt$, $kt$Hypothèse / Condition$kt$, array[$kt$Hypothèse / Condition$kt$, $kt$Hypothèse Condition$kt$, $kt$Hypothèse$kt$, $kt$Condition$kt$]::text[], $kt$Hypothèse / Condition (S’il pleut / cadre incertain).$kt$),
  (52, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces votre scénario idéal : ”Si j’apprends le thaï tous les jours, je parlerai très bien en 2029 parce que j’aime la Thaïlande.” • Aide lexicale : ทุกวัน (thuk-wan = tous les jours), ในปี (nai pii = en l’an). Script de manifeste hypothétique$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ถ้าเรียนภาษาไทยทุกวันจะพูดเก่งมากในปี 2029เพราะว่ารักเมืองไทยค่ะ (pour une femme) / ถ้าเรียนภาษาไทยทุกวันจะพูดเก่งมากในปี 2029เพราะว่ารักเมืองไทยครับ (pour un homme). Tâche orale (Le monologue oratoire du héros) : Imaginez que vous confiez vos ambitions d’avenir à un ami proche dans une scène clé de série. Sans regarder vos notes, prenez la parole à voix haute de manière posée, mélodieuse et continue pendant 3 minutes complètes (chronométré) : „Thâa phom/tchan mii we-laa thuk wan, phom/tchan ja rian phasa thaï... Thâa rian thuk wan, phom/tchan ĝ ja phhoot keng thîi-sùt nai pii 2029 krap/ka ! Phŕ-wâa yàak paï yòo meuang thaï mak mak... Khun long rian duu si krap/ka !“ (Si j’ai du temps tous les jours, j’étudierai la langue thaïe... Si j’étudie tous les jours, alors je parlerai le mieux possible d’ici l’année 2029 ! Parce que je veux énormément aller vivre en Thaïlande... Essaie donc d’apprendre pour voir !) Conseil de fluidité pro : La structure conditionnelle introduite par ถ้า (thâa) impose une courbe mélodique ascendante et suspendue. À l’oral, la voix doit monter de manière flottante sur le mot ถ้า et sur les derniers mots de la proposition conditionnelle (qui matérialisent la virgule virtuelle). Marquez une micro-respiration à cet endroit avant de redescendre calmement sur le bloc de conséquence introduit par ก็ (ĝ). Ne hachez pas l’enchaînement thâa-rian-thukwan, énoncez-le d’un seul élan. Répétez l’exercice jusqu’à ce que la bascule soit parfaitement instinctive.$kt$),
  (53, 1, $kt$(Calligraphie) Prenez votre cahier d’écriture. Tracez 10 fois le bloc complétif complet บอกว่า (bawk wâa) de manière fluide et connectée. Rédigez ensuite 5 fois le groupe pronominal : เขาบอกว่า (khao bawk wâa = il/elle a dit que).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (54, 1, $kt$Découpez le bloc de lecture suivant par des barres verticales et lisez-le à voix haute : เขาบอกว่าไม่อยากไปทํางานวันนีค ้ รับ (Il a dit qu’il ne voulait pas aller travailler aujourd’hui) →             /             /               /              /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : เขา (khao - il) | บอกว่า (bawk wâa - a dit que) | ไม่อยากไป (maï yàak paï - pas vouloir aller) | วันนี้ → วันนี้ → ทํางานวันนี้ (tham-ngaan wan-nii - travailler aujourd’hui) | ครับ (krap - politesse).$kt$),
  (55, 1, $kt$„Phom ja paï Phoo-ket krap.“ → Style$kt$, $kt$Style Direct$kt$, array[$kt$Style Direct$kt$]::text[], $kt$Style Direct (Expression immédiate : ”J’irai à Phuket”).$kt$),
  (55, 2, $kt$„Khao bawk wâa ja paï Phoo-ket krap.“ → Style$kt$, $kt$Style Indirect$kt$, array[$kt$Style Indirect$kt$]::text[], $kt$Style Indirect (Discours rapporté : ”Il a dit qu’il irait à Phuket”).$kt$),
  (56, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces votre compte-rendu de rumeurs d’intrigue : ”Le professeur a dit que le thaï était difficile, mais mon ami a dit que c’était très amusant.” • Aide lexicale : อาจารย์ (aa-tchan = professeur / enseignant / Ton moyen + Ton moyen). Script de revue d’intrigue$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : อาจารย์บอกว่าภาษาไทยยากแต่เพื่อนบอกว่าสนุกมากค่ะ (pour une femme) / อาจารย์บอกว่าภาษาไทยยากแต่เพื่อนบอกว่าสนุกมากครับ (pour un homme). Tâche orale (Le résumé de l’intrigue face caméra) : Imaginez que vous résumez le dernier épisode d’un Lakorn sur vos réseaux sociaux pour vos abonnés. Prenez la parole à voix haute de manière dynamique, fluide et rythmée pendant 2 minutes et 30 secondes en continu : „Ton-nii mii khwam-lap mak mak ka/krap... P’Shin bawk wâa rak Yuna mak tæ̀æ Yuna khit wâa khao koo-hok... Thâa khao bawk wâa sa-baï-dii, phom/tchan ĝ ja dee-chaï mak ka/krap.“ (En ce moment, il y a un très grand secret... P’Shin a dit qu’il aimait énormément Yuna, mais Yuna pense qu’il ment... S’il dit qu’il va bien, alors je serai très heureux/se / où ความลับ [khwam-lap] = un secret). Conseil de fluidité pro : Le bloc verbal บอกว่า (bawk wâa) ne doit souffrir d’aucun temps d’arrêt ou hachure. Énoncez-le d’un seul élan articulatoire net : [bawk-WÂA], en appuyant fermement sur le ton tombant de wâa, puis enchaînez immédiatement sur la suite de l’énoncé rapporté sans marquer de pause artificielle. Répétez ce grand exercice jusqu’à ce que la transition soit fluide et spontanée.$kt$),
  (57, 1, $kt$(Calligraphie) Prenez votre feuille de papier. Tracez 10 fois le mot ท่าน (than) en veillant à la bonne hauteur du signe de ton bas. Tracez ensuite 5 fois le bloc formel complet : รับประทานอาหาร (rap-pra-than aa-han = prendre un repas / où อาหาร = nourriture).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (58, 1, $kt$Découpez le bloc suivant par des barres verticales et lisez-le à voix haute : พระราชวังอยู่ท่ีน่ีครับ (Le palais royal se trouve ici / พระราชวัง [phra-rat-cha-wang] = palais royal) →                     /                       /$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : พระราชวัง (phra-rat-cha-wang - palais royal) | อยู่ (yòo - se trouve) | ที่น่ี ครับ (thîi-nîi krap - ici + politesse).$kt$),
  (59, 1, $kt$(khun) → Relation$kt$, $kt$Neutre / Polie courante$kt$, array[$kt$Neutre / Polie courante$kt$, $kt$Neutre Polie courante$kt$, $kt$Neutre$kt$, $kt$Polie courante$kt$]::text[], $kt$Neutre / Polie courante (S’utilise au quotidien entre pairs).$kt$),
  (59, 2, $kt$(than) → Relation$kt$, $kt$Haute Déférence / Respect supérieur$kt$, array[$kt$Haute Déférence / Respect supérieur$kt$, $kt$Haute Déférence Respect supérieur$kt$, $kt$Haute Déférence$kt$, $kt$Respect supérieur$kt$]::text[], $kt$Haute Déférence / Respect supérieur (S’adresse à la hiérarchie ou à un aîné).$kt$),
  (60, 1, $kt$Tâche écrite (Production) : Rédigez en caractères thaïs compacts sans espaces votre message respectueux : ”Monsieur, avez-vous déjà fini la réunion ? Parce que j’ai les données du projet.” • Aide lexicale : เสร็จแล้ว (set lǽæw = déjà fini / Ton bas + Ton haut). Script de message formel de bureau$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ท่านประชุมเสร็จแล้วหรือยังคะเพราะว่าฉั นมีข้อมูลค่ะ (pour une femme) / ท่านประชุมเสร็จแล้วหรือยังครับcauseผมมีข้อมูลครับ (pour un homme). Tâche orale (L’entretien formel du Lakorn d’affaires) : Imaginez que vous êtes reçu dans le grand bureau du président de votre entreprise à Bangkok. Tenez-vous bien droit(e), adoptez un ton posé, posément cadencé et d’une fluidité irréprochable. Prenez la parole à voix haute pendant 2 minutes et 30 secondes en continu : „Sawatdee ka/krap than... Phom/Tchan dee-chai mak thîi dâï phop than wan-nii ka/krap. Ton-nii phom/tchan kam-lang triam khôo-moon yòo ka/krap. Thâa than mii we-laa, phom/tchan ja bawk khwam-tching krap/ka.“ (Mes hommages, Monsieur le Directeur... Je suis très heureux(se) de vous rencontrer aujourd’hui. En ce moment, je suis en train de préparer les données de projet. Si vous avez le temps, je vous exposerai la vérité / où พบ [phop] = rencontrer / voir).$kt$),
  (61, 1, $kt$(Calligraphie) Rédigez le bloc complexe suivant en caractères thaïs continus sans espaces en veillant à la superposition stricte des signes : ”Si le professeur dit qu’il pleut, je ne viendrai pas.” Espace de calligraphie complexe$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ถ้าอาจารย์บอกว่าฝนตกฉั นจะไม่มาค่ะ$kt$),
  (62, 1, $kt$Répondez par Vrai ou Faux d’après le texte ci-dessus : L’ami de l’auteur de ce texte pense que la langue thaïe est difficile mais très amusante.$kt$, $kt$Vrai$kt$, array[$kt$Vrai$kt$]::text[], $kt$Vrai (Texte : เพื่อนของผมบอกว่าภาษาไทยยากแต่สนุกจังเลย).$kt$),
  (62, 2, $kt$Répondez par Vrai ou Faux d’après le texte ci-dessus : L’auteur a l’intention d’aller voyager en Thaïlande en l’an 2029.$kt$, $kt$Vrai$kt$, array[$kt$Vrai$kt$]::text[], $kt$Vrai (Texte : และจะไปเที่ยวเมืองไทยในปี ๒๐๒๙ครับ — Notez l’utilisation des chiffres thaïs officiels traditionnels : ๒๐๒๙ = 2029).$kt$),
  (62, 3, $kt$Consigne : Lisez le texte continu suivant, identifiez mentalement les barres de séparation des mots et analysez sa structure sémantique :$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (63, 1, $kt$Répondez à la question suivante d’après le script audio : Pour quelle raison Yuna est-elle en train de pleurer actuellement ? →$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : เพราะว่าดีใจมาก ๆ ค่ะ (Parce qu’elle est extrêmement heureuse / contente).$kt$),
  (64, 1, $kt$Consigne (Performance chronométrée finale) : Détachez-vous complètement de vos notes. Enregistrez-vous. Vous devez simuler le monologue de clôture final de votre personnage dans la série. Parlez à voix haute de manière parfaitement continue, fluide et rythmée pendant 3 minutes complètes. Critères de validation B1 impératifs :$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$)
) as x(course_number, pos, prompt, expected, accepted, explanation)
join public.language_courses c
  on c.language = 'Thaï' and c.course_number = x.course_number;

commit;

-- Contrôle (à lancer après) : doit afficher 64 cours et 86 exercices du manuel
-- select count(*) from public.language_courses where language = 'Thaï';
-- select count(*) from public.language_exercises e join public.language_courses c on c.id = e.course_id
--   where c.language = 'Thaï' and e.origin = 'manual';
