-- Keltia : contenu réel des 64 cours de japonais (source : manuel Japonais.pdf).
-- Cible uniquement la bibliothèque Plan & Plate (language_courses / language_exercises).
-- Ne touche PAS au planning (weekly_schedule_items).
-- Relançable sans risque : les cours sont mis à jour par (language, course_number),
-- les exercices du manuel sont recréés, les exercices ajoutés par les membres sont conservés.

begin;

-- 1) Cours : titre, objectif, théorie et exemples réels ; plus de « Semaine X » (hors planning)
insert into public.language_courses (language, course_number, title, summary, theory, examples, week_number)
values
  ('Japonais', 1, $kt$Cours 1 · [ÉCRIT] Les Kanji fondamentaux et la structure d’identité$kt$, $kt$Maîtriser le tracé, le sens et l’ordre des traits des 5 premiers Kanji de base et comprendre l’architecture de la structure d’affirmation neutre-polie.$kt$, $kt$Tracé et Graphie : L’ordre des traits et l’équilibre
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
Note phonétique : Le ”u” final est totalement assourdi/muet, on articule un net [dess].$kt$, $kt$$kt$, null),
  ('Japonais', 2, $kt$Cours 2 · [LECTURE] Clinique de Lecture & Décodage de textes continus$kt$, $kt$Repérer visuellement les articulations grammaticales, isoler la particule de thèmeは et lire un texte combinant Kanji et Kana sans espaces.$kt$, $kt$Théorie de la Lecture : L’absence d’espaces
Le japonais s’écrit de manière continue, sans aucune segmentation par des espaces. Pour décoder efficacement une phrase, vos yeux doivent cartographier l’alternance des blocs de carac-
tères : les Kanji portent le sens sémantique lourd (noms, racines verbales), tandis que les Hiragana servent pour les outils grammaticaux (particules) et les flexions.

Analyse visuelle d’une phrase type :
私は学生です。

Découpage mental analytique :
私 (Kanji : Nom = Je) | は (Hiragana : Particule de thème [wa]) | 学生 (Kanji : Nom = Étudiant) | です (Hiragana : Copule verbale être).

La particule interrogative か (ka) :
Elle se positionne à la toute fin de la phrase, immédiatement après la copule, et fait office de point d’interrogation (le point d’interrogation graphique n’étant pas utilisé en japonais traditionnel).
— Exemple : 学生ですか。 (Gakusei desu ka ? = Êtes-vous étudiant ?).$kt$, $kt$$kt$, null),
  ('Japonais', 3, $kt$Cours 3 · [COMPRÉHENSION] Laboratoire de Pitch Accent & Nuances finales$kt$, $kt$Entraîner l’oreille à capter la hauteur tonale (Pitch Accent) standard de Tokyo et discriminer les particules d’humeur ね et よ .$kt$, $kt$Théorie de l’Écoute : Le Pitch Accent standard (Tokyo)
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
Exemple : 私は日本人ですよ。 (Watashi wa Nihonjin desu yo. = Je suis Japonais, je vous l’assure !).$kt$, $kt$Exemple : 学生ですね。 (Gakusei desu ne. = Vous êtes étudiant, n’est-ce pas ?). · Exemple : 私は日本人ですよ。 (Watashi wa Nihonjin desu yo. = Je suis Japonais, je vous l’assure !).$kt$, null),
  ('Japonais', 4, $kt$Cours 4 · [EXPRESSION] Grand Atelier de Présentation Officielle$kt$, $kt$Rédiger son premier texte d’identité en mariant harmonieusement Kanji et Kana, et soutenir une présentation orale fluide en respectant les codes rituels de politesse.$kt$, $kt$Syntaxe & Lexique de la rencontre
Pour saluer de manière professionnelle et respectueuse lors d’une première rencontre (Jikoshoukai), l’ordre protocolaire des énoncés est immuable :
1. はじめまして (Hajimemashite) : Enchanté(e) (S’utilise exclusivement la toute première fois).
2. 私は [Nom] です (Watashi wa ... desu) : Je m’appelle [Nom] / Je suis [Nom].
3. よろしくおねがいします (Yoroshiku onegai shimasu) : Soyez bienveillant à mon égard / Je m’en remets à votre entière bonté.$kt$, $kt$$kt$, null),
  ('Japonais', 5, $kt$Cours 5 · [ÉCRIT] Les Kanji d’action et la particule d’objet direct$kt$, $kt$Maîtriser le tracé et les lectures des Kanji d’action fondamentaux, et assimiler la structure transitive avec la particule を (o).$kt$, $kt$Tracé et Graphie : L’équilibre des radicaux verbaux
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
d’eau).$kt$, $kt$Exemple : 私はお茶を飲みます。 (Watashi wa ocha o nomimasu → Je bois du thé).$kt$, null),
  ('Japonais', 6, $kt$Cours 6 · [LECTURE] Décodage de la routine quotidienne et des verbes transitifs$kt$, $kt$Repérer visuellement l’Okurigana pour isoler les verbes, identifier la particule をet lire des descriptions de routine sans espaces.$kt$, $kt$Théorie de la Lecture : Capter la frontière de l’Objet
Dans un texte continu et non segmenté, la particule de cas を agit comme une balise visuelle
majeure : tout ce qui se trouve immédiatement avant elle constitue l’objet direct, et ce qui se trouve immédiatement après (généralement un bloc Kanji suivi d’Hiragana) représente l’action verbale.

Analyse visuelle d’un énoncé complet :
私は本を読みます。

Décodage mécanique structurel :
私 (Je) + は (Particule de thème) → Cadre initial de la proposition.
本 ( ほん - Hon = Livre) + を (Particule d’objet).
読みます ( よみます - Yomimasu = Lis/lit) → Bloc verbal final.$kt$, $kt$$kt$, null),
  ('Japonais', 7, $kt$Cours 7 · [COMPRÉHENSION] L’invitation en ～ま せんか et l’intonation polie$kt$, $kt$Entraîner l’oreille à capter la nuance d’invitation polie, repérer la particule de lieu で et maîtriser le Pitch Accent des structures verbales.$kt$, $kt$Théorie de l’Écoute : L’invitation indirecte adoucie
En japonais, pour proposer poliment une activité ou une sortie à quelqu’un (« Et si on faisait cela ensemble ? »), on utilise la forme négative interrogative : ～ませんか ( masenka). C’est une tournure stylistique essentielle pour éviter la directivité et adoucir la proposition.
— Structure type entendue : [Objet] を 読みませんか。 (... o yomimasen ka ? → Si on lisait... ?)

La particule de lieu de l’action で (de) :
Elle s’accola derrière un nom de lieu pour indiquer l’endroit précis où se déroule une action active.
— Exemple : レストランで食べます。 (Resutoran de tabemasu → Manger au restaurant).

Pitch Accent des Verbes (Norme de Tokyo)
— 食べます ( たべます ) : Schéma [L-H-L-L] → La voix monte sur be puis redescend de
manière stable : ta↗be↘ma-su.
— 飲みます ( のみます ) : Schéma [L-H-L-L] → La voix monte sur mi puis redescend : no↗mi ↘ma-su.$kt$, $kt$$kt$, null),
  ('Japonais', 8, $kt$Cours 8 · [EXPRESSION] Grand Atelier de la proposition de sortie amicale$kt$, $kt$Rédiger un court paragraphe de planification en combinant Kanji et Kana, et simuler oralement une invitation et sa validation sans hésitation syntaxique.$kt$, $kt$Syntaxe & Outils de liaison discursive
Pour lier vos phrases lors d’une prise de parole continue et structurer votre discours de manière fluide, utilisez les outils suivants :
— そして (soshite) : Connecteur de coordination → ”Et / De plus / Par ailleurs”. Se place en tête de la seconde proposition.
— 一緒に行きましょう (Issho ni ikimashō) : Formule de validation active → ”Allons-y ensemble !”.$kt$, $kt$$kt$, null),
  ('Japonais', 9, $kt$Cours 9 · [ÉCRIT] Les Kanji de lieu, les Chiffres et les structures d’existence$kt$, $kt$Maîtriser le tracé et les lectures des Kanji de l’espace, et assimiler l’écriture des structures d’existence statique ( あります / います ).$kt$, $kt$Tracé et Graphie : L’écriture des repères spatiaux
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

Exemple : 駅に学生がいます。 (Eki ni gakusei ga imasu → Il y a des étudiants à la gare).$kt$, $kt$Exemple : 駅に学生がいます。 (Eki ni gakusei ga imasu → Il y a des étudiants à la gare).$kt$, null),
  ('Japonais', 10, $kt$Cours 10 · [LECTURE] Clinique de Lecture & Décodage de repères spatiaux$kt$, $kt$Identifier les frontières de localisation, discriminer les rôles syntaxiques des particules に (ni) et が (ga), et lire des descriptions d’écosystèmes géographiques sans espaces.$kt$, $kt$Théorie de la Lecture : Isoler le cadre d’existence
Dans un paragraphe continu, la particule に marque l’ancrage spatial (Où se situe l’action ?) et la particule が introduit le sujet réel existant (Qui ou quoi s’y trouve ?). Le bloc verbal final valide mécaniquement s’il s’agit d’un objet ou d’un être vivant.

Analyse visuelle d’une phrase de structure :
かばんの中に本があります。                     (Note : かばん = sac)

Découpage visuel analytique :
かばんの中 (l’intérieur du sac) + に (balise de lieu d’ancrage) | 本 (livre) + が (particule de sujet réel) | あります (verbe d’existence inanimée).
Lecture fluide : Kaban no naka ni hon ga arimasu.$kt$, $kt$$kt$, null),
  ('Japonais', 11, $kt$Cours 11 · [COMPRÉHENSION] La grande gymnastique des chiffres et le système des Man$kt$, $kt$Entraîner l’oreille à capter les montants monétaires en yens à vitesse réelle et surmonter le piège structurel du comptage par unités de dix mille (Man).$kt$, $kt$Théorie de l’Écoute : Le système numérique japonais en base 10 000
Le français segmente ses grands nombres par milliers (1 000, puis 10 000 = dix milliers). Le système japonais, quant à lui, change d’unité de compte toutes les quatre décimales (base de 10 000). Pour acquérir une fluidité totale, votre oreille doit cesser de procéder à des conversions mentales et appréhender le mot  万  ( まん - man) comme une unité comptable pure.

Unités de base de la métrologie monétaire :
— 百 ( ひゃく - hyaku) = 100
— 千 ( せん - sen) = 1 000
— 万 ( まん - man) = 10 000
Exemple 1 : 50 000 yens s’écoute 五万円 ( ごまんえん - go-man en) → 5 unités de dix mille yens.
Exemple 2 : 15 000 yens s’écoute 一万五千円 ( いちまんごせんえん - ichi-man go-sen en) → 1 unité de dix mille + 5 milliers de yens.$kt$, $kt$Exemple 1 : 50 000 yens s’écoute 五万円 ( ごまんえん - go-man en) → 5 unités de dix mille yens. · Exemple 2 : 15 000 yens s’écoute 一万五千円 ( いちまんごせんえん - ichi-man go-sen en) → 1 unité de dix mille + 5 milliers de yens.$kt$, null),
  ('Japonais', 12, $kt$Cours 12 · [EXPRESSION] Grand Atelier de commande au restaurant japonais$kt$, $kt$Rédiger une demande de prix et de localisation en caractères mixtes, et simuler oralement une commande de repas complète de manière fluide et autonome.$kt$, $kt$Syntaxe & Lexique de la commande commerciale
Pour commander un article, un plat ou une boisson de manière naturelle et polie, la structure requise est :
[Nom de l’objet / du plat] をください (o kudasai) = Donnez-moi [X], s’il vous plaît.
— いくらですか (Ikura desu ka) : Combien cela coûte-t-il ?
— Compteurs génériques d’objets ou de plats : 一つ ( ひとつ - hitotsu = un), 二つ( ふたつ - futatsu = deux).$kt$, $kt$$kt$, null),
  ('Japonais', 13, $kt$Cours 13 · [ÉCRIT] Les Kanji temporels et la conjugaison du passé poli$kt$, $kt$L’écriture de la temporalité$kt$, $kt$Tracé et Graphie : L’écriture de la temporalité
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
— Exemple : 学生です (est étudiant) → 学生でした (était étudiant).$kt$, $kt$$kt$, null),
  ('Japonais', 14, $kt$Cours 14 · [LECTURE] Décodage de récits rétrospectifs et journaux de bord$kt$, $kt$Cartographier la chronologie sans espaces$kt$, $kt$Théorie de la Lecture : Cartographier la chronologie sans espaces
Dans un texte mixte continu, vos yeux doivent immédiatement chercher la désinence à quatre caractères Hiragana ました ou でした qui ferme la proposition pour identifier que l’action est passée.

Analyse visuelle d’un énoncé historique

私は先月日本に行きました。
Décodage et découpage mental :
1. 私 (Je) + は (Particule de thème) → Délimitation du cadre.
2. 先月 (せんげつ – Le mois dernier) → Point d’ancrage temporel passé.
3. 日本 (にほん – Japon) + に (Particule de destination/direction).
4. 行きました (いきました – Suis allé) → Bloc verbal final d’action au passé.$kt$, $kt$$kt$, null),
  ('Japonais', 15, $kt$Cours 15 · [COMPRÉHENSION] Laboratoire d’Écoute & Dictée de repères temporels$kt$, $kt$Capturer les marqueurs de fin de phrase$kt$, $kt$Théorie de l’Écoute : Capturer les marqueurs de fin de phrase
À l’oral rapide à vitesse réelle, la distinction entre le présent et le passé se joue sur les dernières syllabes de l’unité verbale. Votre oreille doit rester active jusqu’au point final de la phrase.
— 読みます (yomimasu – présent) ↔ 読みました (yomimashita – passé).
— 読みません (yomimasen – négatif) ↔ 読みませんでした (yomimasen deshita – passé négatif).$kt$, $kt$$kt$, null),
  ('Japonais', 16, $kt$Cours 16 · [EXPRESSION] Grand Bilan du Bloc 1 & Exposé Narratif Continu$kt$, $kt$[EXPRESSION] Grand Bilan du Bloc 1 & Exposé Narratif Continu$kt$, $kt$Grand Atelier d’Expression Orale : La soutenance de fin de bloc

Règle d’or de fluidité : Le bloc 読みました doit sortir d’un seul élan articulatoire lié : [yomimashita], la voix redescendant proprement sur la dernière syllabe sans hachure rythmique.

CHAPITRE 2

BLOC 2 : La forme en ～て ( te) & les
structures connectives$kt$, $kt$$kt$, null),
  ('Japonais', 17, $kt$Cours 17 · [ÉCRIT] Les Kanji de mouvement et la mécanique de la forme en ～て$kt$, $kt$Maîtriser le tracé et les lectures des Kanji de déplacement fondamentaux, et assimiler les règles de modification phonétique de la forme en ～て .$kt$, $kt$Tracé et Graphie : Les Kanji de déplacement
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
Transformations : します (shimasu - faire) → して (shite) ; 来ます (kimasu) → 来て(kite).$kt$, $kt$Exemple : 食べます (tabemasu) → 食べて (tabete). · Exemples : 買います (kaimasu - acheter) → 買って (katte) ; 帰ります → 帰って(kaette). · Exemple : 読みます (yomimasu) → 読んで (yonde).$kt$, null),
  ('Japonais', 18, $kt$Cours 18 · [LECTURE] Décodage de la succession d’actions complexes$kt$, $kt$Repérer visuellement la forme en ～て au cœur d’une phrase continue, identifier les blocs d’actions successives et lire un texte fluide combinant Kanji et Kana.$kt$, $kt$Théorie de la Lecture : Identifier le pivot de la phrase
Dans un texte japonais brut dénué d’espaces, la désinence en ～て ou ～んで fait office de virgule syntaxique et dynamique. Vos yeux doivent repérer cette rupture harmonique pour ordonner correctement la chronologie des événements.

Analyse visuelle d’un énoncé fluide :
私は本を読んでお茶を飲みます。

Découpage mécanique et fonctionnel :
私 + は → Cadre thématique de la phrase.
本を読んで ( ほんをよんで - Hon o yonde) → Première action (Lire un livre) + pivot connecteur.
お茶を飲みます ( おちゃをのみます - Ocha o nomimasu) → Seconde action finale (Boire du thé).
Sens global : Je lis un livre, puis je bois du thé.$kt$, $kt$$kt$, null),
  ('Japonais', 19, $kt$Cours 19 · [COMPRÉHENSION] Laboratoire d’Écoute & Captation des liaisons orales$kt$, $kt$Entraîner l’oreille à capter le petit tsu ( tte) et les finales nasales ( nde) à vitesse réelle dans une description de déplacement.$kt$, $kt$Théorie de l’Écoute : Isoler le doublement de consonne
À l’oral rapide, le principal piège pour un locuteur francophone consiste à rater l’occlusion marquée par le petit tsu ( っ ), qui matérialise un micro-silence suivi du doublement de la consonne suivante. Si vous confondez la prononciation de kate ( かて ) et celle de katte ( 買って ), le sens de l’énoncé s’effondre. Votre oreille doit traquer le blocage bref du flux d’air juste avant l’émission de la syllabe te.

Écoute active des contrastes phonétiques :
よんで (yonde - en lisant) ↔ いって (itte - en allant / en disant).
たべて (tabete - en mangeant) ↔ かえって (kaette - en rentrant).

Pitch Accent de la connexion (Norme de Tokyo)
— 食べて ( たべて ) : Schéma [H-L-L] → L’accent culmine sur la première syllabe puis
chute : ta↗be↘te.
— 行って ( いって ) : Schéma [L-H-H] → La voix s’amorce en bas et monte sur le double-
ment : i ↗tte↗.$kt$, $kt$$kt$, null),
  ('Japonais', 20, $kt$Cours 20 · [EXPRESSION] Grand Atelier d’Enchaînement Chronologique Spontané$kt$, $kt$Rédiger une description de routine fluide en éliminant les lourdeurs stylistiques, et soutenir une présentation orale de sa journée de 2 minutes en continu sans support visuel.$kt$, $kt$Syntaxe & Particules de déplacement directionnel
Pour enrichir vos phrases complexes de déplacement, nous intégrons la particule de direction de mouvement へ (e - s’écrit avec le caractère Kana he へ mais se prononce [é]) ou la particule de but localisé に (ni) :

Structure cible : [Sujet] は [Lieu A] へ 行って、[Objet] を 食べて、[Lieu B] へ 帰ります。$kt$, $kt$$kt$, null),
  ('Japonais', 21, $kt$Cours 21 · [ÉCRIT] Les Kanji de communication et l’aspect progressif (～ています )$kt$, $kt$Maîtriser le tracé et les lectures des Kanji liés aux médias et aux sens, et assimiler l’architecture de la structure de l’action en cours (～ています ).$kt$, $kt$Tracé et Graphie : L’écriture de la communication et des sens
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
— Forme passée progressive : 読んでいました (yonde imashita → J’étais en train de lire).$kt$, $kt$Exemple : 私は新聞を読んでいます。 (Watashi wa shinbun o yonde imasu → Je suis en train de lire le journal).$kt$, null),
  ('Japonais', 22, $kt$Cours 22 · [LECTURE] Décodage de descriptions d’actions en temps réel$kt$, $kt$Repérer visuellement l’indicateur progressif ～ています au cœur d’un texte continu et lire des descriptions de scènes sans espaces.$kt$, $kt$Théorie de la Lecture : Cartographier l’aspect en cours
Dans une phrase japonaise native exempte de repères d’espacement, vos yeux doivent traquer la balise grammaticale en Hiragana ています (ou ses variantes) qui verrouille le bloc verbal final. Elle vous indique instantanément que l’action s’inscrit dans un présent continu.

Analyse visuelle d’un énoncé descriptif :
友達は電話で話しています。                    (where で = particule de moyen / instrument)

Découpage visuel analytique :
友達 ( ともだち - Tomodachi = Ami) + は (Particule de thème).
電話 ( でんわ - Denwa = Téléphone) + で (Particule de moyen → au téléphone / par le biais du téléphone).
話しています ( はなしています - Hanashite imasu = Est en train de parler) → Bloc verbal final.
Lecture globale brute : Tomodachi wa denwa de hanashite imasu.$kt$, $kt$$kt$, null),
  ('Japonais', 23, $kt$Cours 23 · [COMPRÉHENSION] Laboratoire d’Écoute & Les appels téléphoniques en direct$kt$, $kt$Entraîner l’oreille à capter la structure progressive te imasu sous un débit de conversation naturel et décoder des actions simultanées.$kt$, $kt$Théorie de l’Écoute : Capter le flux des contractions orales du présent continu
À l’oral quotidien, la forme progressive officielle ～ています subit très fréquemment une
synérèse : le i initial s’élide pour donner la contraction rythmique rapide ～てます ( temasu). Votre oreille doit s’habituer à intercepter ce raccourci phonétique sans bloquer votre mémoire de travail.

Écoute active des contrastes (Formel vs Oral familier) :
はなしています (hanashite imasu)            →    はなしてます (hanashitemasu).みています (mite imasu)               →    みてます (mitemasu).

Pitch Accent du présent continu (Norme de Tokyo)
— 見ています ( みています ) : Schéma [L-H-L-L-L] → La voix s’élève sur te puis redescend de manière monocorde : mi ↗te↘i-ma-su.
— 話しています ( はなしています ) : Schéma [L-H-H-H-L-L] → Le plateau de hauteur reste stable sur les syllabes centrales : ha↗na-shi-te-i ↘ma-su.$kt$, $kt$$kt$, null),
  ('Japonais', 24, $kt$Cours 24 · [EXPRESSION] Grand Atelier de la gestion d’urgence au téléphone$kt$, $kt$Rédiger un script d’appel professionnel ou amical en caractères mixtes, et simuler une conversation orale fluide en décrivant ses actions en direct pendant 2 minutes et 30 secondes.$kt$, $kt$Syntaxe & Stratégie de la communication oratoire
Pour initier et mener un échange téléphonique de manière naturelle, le protocole japonais exige d’ouvrir l’énoncé par des formules idiomatiques dédiées :
— もしもし (Moshimoshi) : Interjection rituelle → ”Allo” (Exclusivement réservée à l’usage téléphonique).
— 今、   ～ています (Ima, te imasu) : ”En ce moment précis, je suis en train de faire [X]”.

Structure cible : もしもし。[Nom] です。今、[Objet] を [Verbe en ～て ] います。あなたは、何をしていますか。$kt$, $kt$$kt$, null),
  ('Japonais', 25, $kt$Cours 25 · [ÉCRIT] Les Kanji d’action publique et les structures réglementaires$kt$, $kt$Maîtriser le tracé et les lectures des Kanji de l’espace public et de l’autorité, et assimiler l’architecture de la permission (～てもいいです ) et de l’interdiction (～てはいけません ).$kt$, $kt$Tracé et Graphie : L’écriture des mouvements réglementés
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
Exemple : ここで車を止めてはいけません。 (Koko de kuruma o tomete wa ikemasen → Il ne faut pas garer / arrêter sa voiture ici).$kt$, $kt$Exemple : ここに入ってもいいです。 (Koko ni haitte mo ii desu → Vous pouvez entrer ici). · Exemple : ここで車を止めてはいけません。 (Koko de kuruma o tomete wa ikemasen → Il ne faut pas garer / arrêter sa voiture ici).$kt$, null),
  ('Japonais', 26, $kt$Cours 26 · [LECTURE] Décodage de règlements intérieurs et consignes de sécurité$kt$, $kt$Repérer visuellement les marqueurs て mo いいです et てはいけません dans un texte continu et lire des consignes de sécurité sans espaces.$kt$, $kt$Théorie de la Lecture : Identifier le cadre normatif
Dans un texte réglementaire, un protocole d’atelier ou une notice de sécurité, vos yeux doivent cibler en toute priorité les blocs Hiragana terminaux もいいです (autorisation) ou はいけません (interdiction) afin de capter instantanément le statut légal ou normatif d’une action.

Analyse visuelle d’un panneau de consigne :
駅の門の前に車を止めてはいけません。

Découpage visuel analytique :
駅の門の前 ( えきのもんのまえ - Eki no mon no mae = Devant le portail de la gare) + に(Particule de lieu d’ancrage).
車 ( くるま - Kuruma = Voiture) + を (Particule d’objet direct).
止めてはいけません ( とめてはいけません - Tomete wa ikemasen = Il est interdit d’arrêter / de garer) → Bloc d’interdiction finale.$kt$, $kt$$kt$, null),
  ('Japonais', 27, $kt$Cours 27 · [COMPRÉHENSION] Laboratoire d’Écoute & Les consignes de l’espace partagé$kt$, $kt$Entraîner l’oreille à capter la nuance d’interdiction stricte te wa ikemasen sous un débit rapide et décoder les requêtes d’autorisation.$kt$, $kt$Théorie de l’Écoute : Capter la restriction à l’oral spontané
À l’oral quotidien ou familier, la structure d’interdiction officielle ～てはいけません subit une contraction morphologique très fréquente : le segment ～ては ( te wa) se transmute en ～ちゃ ( cha) et le segment ～では ( de wa) devient ～じゃ ( ja), généralement associés au couperet restrictif dame.

Écoute active des glissements et contractions (Formel vs Familier oral) :
とめてはいけません (tomete wa ikemasen) → とめちゃダメ (tomecha dame).
はいってもいいですか (haitte mo ii desu ka) → はいっていい？ (haitte ii ?).

Pitch Accent des structures (Norme de Tokyo)
— 入ってもいいです ( はいってもいいです ) : Schéma plat étendu [L-H-H-H-H-H-H-H] → La voix s’élève sur i et se maintient de manière monocorde : ha↗itte mo ii desu.

— 止めてはいけません ( とめてはいけません ) : Schéma [L-H-L-L-L-L-L-L-L] →
L’accent monte sur me puis descend lourdement sur toute la fin de la structure : to↗me↘te wa ikemasen.$kt$, $kt$$kt$, null),
  ('Japonais', 28, $kt$Cours 28 · [EXPRESSION] Grand Atelier de rédaction et briefing des consignes d’atelier$kt$, $kt$Rédiger un mémo de règles de vie en caractères mixtes, et soutenir un briefing de sécurité de 2 minutes et 30 secondes de manière fluide, directive et sans notes.$kt$, $kt$Syntaxe & Stratégie de mise en relief des directives
Pour délivrer des consignes d’une clarté irréprochable à l’oral, ouvrez votre structure par le repère de lieu marqué par la particule で (lieu où s’accomplit l’action active), énoncez l’interdiction, puis introduisez l’alternative à l’aide du connecteur d’opposition.

Structure cible : [Lieu] で [Objet] を [Verbe en ～て ] はいけません。しかし、[Verbe en ～て ] もいいです。

Note : しかし (shikashi) = Cependant / toutefois / mais.$kt$, $kt$$kt$, null),
  ('Japonais', 29, $kt$Cours 29 · [ÉCRIT] Les Kanji d’état et l’articulation logique (～から , ～が )$kt$, $kt$Maîtriser le tracé et les lectures des Kanji d’état fondamentaux, et assimiler l’agencement syntaxique de la cause (～から ) et de l’opposition (～が ).$kt$, $kt$Tracé et Graphie : L’écriture des caractéristiques et des états
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
— Exemple : この駅は古いですが、大きいです。 (Kono eki wa furui desu ga, ookii desu → Cette gare est ancienne, mais elle est grande).$kt$, $kt$$kt$, null),
  ('Japonais', 30, $kt$Cours 30 · [LECTURE] Décodage de structures causales et d’argumentations urbaines$kt$, $kt$Repérer visuellement les pivots から et が au cœur d’un texte continu et lire des argumentations complexes sans espaces.$kt$, $kt$Théorie de la Lecture : Cartographier les articulations du discours
Dans un paragraphe continu non segmenté, les particules から et が font office de véritables charnières logiques. Vos yeux doivent repérer ces balises en Hiragana (systématiquement suivies d’une virgule graphique dans l’écriture soignée) pour isoler les articulations de la pensée.

Analyse visuelle d’un texte argumentatif :
日本の電車は便利ですが、安くありません。

Découpage visuel analytique :
日本の電車は便利です (Nihon no densha wa benri desu = Le train japonais est pratique / 便利 = pratique) + が (Pivot d’opposition sémantique → Mais...).
安くありません (Yasukumarisen = Il n’est pas bon marché) → Conclusion contrastée négative.$kt$, $kt$$kt$, null),
  ('Japonais', 31, $kt$Cours 31 · [COMPRÉHENSION] Le grand débat sur la vie à Tokyo$kt$, $kt$Entraîner l’oreille à capter les liaisons logiques kara et ga sous un débit de conversation rapide et extraire de manière autonome les nuances de goût.$kt$, $kt$Compréhension Orale : Intercepter les motivations et les contrastes
Dans les discussions du quotidien comme dans les réunions professionnelles, les locuteurs japonais nuancent constamment leur position. Ils terminent parfois volontairement leurs phrases par la particule が ... laissée en suspens afin de marquer une hésitation polie ou une nuance sous-entendue. Votre oreille doit également capter la hauteur tonale stable du kara pour valider la structure justificative.
Script audio du laboratoire d’écoute (Deux collègues débattant du coût de la vie à Tokyo) :$kt$, $kt$A : 東京の生活はどうですか。 · B : 東京はとても便利ですが、物価が高いですね。 · A : レストランも高いですか。 · B : ええ、古いレストランは安いですが、新しいレストランは高いですから、行きません。(Oui, les anciens restaurants sont bon marché, mais comme les nouveaux établissements sont chers, je n’y vais pas).$kt$, null),
  ('Japonais', 32, $kt$Cours 32 · [EXPRESSION] Grand Laboratoire de Débat Argumenté écrit et oral$kt$, $kt$Rédiger un essai comparatif en caractères mixtes, et soutenir oralement une argumentation fluide et nuancée sur un cadre de vie en continu pendant 3 minutes pour valider l’ensemble du Bloc 1.$kt$, $kt$Syntaxe & Stratégie d’Argumentation de Niveau Intermédiaire
Pour ancrer définitivement votre aisance oratoire, vous devez être capable d’imbriquer de manière fluide la cause, l’opposition et les formes de présent continu ou de permission étudiées tout au long du Bloc 1 au sein d’une seule et même tirade.

Structure d’enchaînement cible : [Sujet] は [État A] ですから [Action]. しかし、[État B] ですが [Action B].$kt$, $kt$$kt$, null),
  ('Japonais', 33, $kt$Cours 33 · [ÉCRIT] Les Kanji d’activité et la mécanique des formes neutres (Forme en ～う / ～ない )$kt$, $kt$Maîtriser le tracé et les lectures des Kanji d’action quotidienne avancés, et assimiler les règles de passage systématique du style poli au style neutre (forme dictionnaire et forme en ない ).$kt$, $kt$Tracé et Graphie : Les Kanji d’expression et d’activité
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
— 来ます (kimasu) → 来る (kuru) / 来ません → 来ない (konai).$kt$, $kt$Exemple : 食べます (tabemasu) → 食べる (taberu). · Exemple : 食べません (tabemaisen) → 食べない (tabenai). · Exemples : 書きます → 書く (kaku) ; 読みます → 読む (numu) ; 言います → 言う (iu). · Exemples : 書きます → 書かない (kakanai) ; 言います → 言わない (iwanai).$kt$, null),
  ('Japonais', 34, $kt$Cours 34 · [LECTURE] Décodage de dialogues informels et de récits familiers$kt$, $kt$Repérer visuellement les formes neutres courtes au cœur d’un texte continu, identifier le basculement de registre et lire des échanges fluides sans espaces.$kt$, $kt$Théorie de la Lecture : Capter la rupture du style poli
Dans les écrits de style informel, les correspondances privées ou les dialogues de mangas, les propositions ne se ferment plus par les repères classiques desu ou masu. Vos yeux doivent s’habituer à voir des phrases se clore de façon abrupte directement par une forme dictionnaire, par un adjectif racine ou par la négation courte ない .

Analyse visuelle d’un énoncé informel :
私は明日、本を書く。                   (where 明日 = demain)

Découpage mécanique structurel :
私 + は → Cadre thématique.
明 st / 明日 ( あした - Ashita) → Repère temporel futur.
本 + を ( ほんを - Hon o) → Complément d’objet direct.
書く ( かく - Kaku) → Verbe à la forme du dictionnaire. La phrase se ferme sans copule de
politesse : le style est neutre.
Sens global : Demain, je vais écrire un livre (style familier).$kt$, $kt$$kt$, null),
  ('Japonais', 35, $kt$Cours 35 · [COMPRÉHENSION] Laboratoire de Pitch Accent & Nuances orales du style familier$kt$, $kt$Entraîner l’oreille à capter la chute des voyelles finales, identifier le Pitch Accent des formes neutres et décoder des conversations familières à vitesse réelle.$kt$, $kt$Théorie de l’Écoute : La suppression des particules et les intonations
À l’oral familier de la vie quotidienne, les locuteurs japonais élident très souvent les particules de cas grammaticales telles que は (wa), を (o), ou へ (e). L’intonation et l’ordre des mots suffisent à lever toute ambiguïté. De plus, les interrogations ne se ferment plus par la balise ka mais par une simple inflexion montante sur la voyelle finale du verbe neutre.

Écoute active des contrastes de registres (Poli vs Familier oral) :
— Style Poli : Nani o shimasu ka. → Style Familier : Nani suru ? ↗ (Tu fais quoi ?).
— Style Poli : Gohan o tabemasu ka. → Style Familier : Gohan taberu ? ↗ (Tu manges ?).

Pitch Accent des formes courtes (Norme de Tokyo)
— 食べる ( たべる ) : Schéma [H-L-L] → L’accent s’amorce en haut sur la première syllabe
puis chute : ta↗beru↘.
— 書かない ( かかない ) : Schéma [L-H-L-L] → La voix monte sur la deuxième syllabe
puis redescend : ka↗ka↘nai.$kt$, $kt$$kt$, null),
  ('Japonais', 36, $kt$Cours 36 · [EXPRESSION] Grand Atelier de Gymnastique Inter-Registres$kt$, $kt$Rédiger un court dialogue amical en caractères mixtes, et simuler oralement une bascule instantanée d’un registre formel de bureau à une discussion de rue décontractée.$kt$, $kt$Syntaxe Particules conversationnelles familières
À l’oral informel, pour adoucir le caractère abrupt d’une question ou d’une affirmation à la forme courte, de nouvelles étiquettes de fin de phrase font leur apparition :
— の (no) : Se positionne en clôture d’une phrase neutre avec une inflexion montante pour poser une question de manière douce et nuancée. Exemple : 何を食べるの？ (Nani o taberu no ? → Qu’est-ce que tu manges ?).
— うん (un) / うーん (uun) : Équivalents familiers et indispensables de はい (Oui) et いいえ (Non).$kt$, $kt$$kt$, null),
  ('Japonais', 37, $kt$Cours 37 · [ÉCRIT] Les Kanji de projet et la mécanique du désir (～たい ) et de l’intention (～つもり )$kt$, $kt$Maîtriser le tracé et les lectures des Kanji de planification, et assimiler l’architecture morphologique du désir (～たいです ) et de l’intention (～つもりです ).$kt$, $kt$Tracé et Graphie : Les Kanji de projection et d’avenir
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
— Forme négative : 行かないつもりです (ikanai tsumori desu → J’ai l’intention de ne pas y aller).$kt$, $kt$$kt$, null),
  ('Japonais', 38, $kt$Cours 38 · [LECTURE] Clinique de Lecture & Décodage d’ambitions futures$kt$, $kt$Repérer visuellement les suffixes ～たい et ～つもり au cœur d’un texte continu et lire des lettres d’intention professionnelles sans espaces.$kt$, $kt$Théorie de la Lecture : Isoler le moteur de l’action
Dans un paragraphe continu et non segmenté, les structures de projection ferment la proposition principale. Vos yeux doivent repérer les caractères Hiragana たい (généralement suivis de desu) ou le nom pivot autonome つもり pour identifier immédiatement s’il s’agit d’un souhait ou d’une décision ferme planifiée.

La bascule de la particule d’objet avec ～たい :

À la forme en ～たい , la particule d’objet direct を (o) se transmute très souvent en particule de sujet réel が (ga) pour mettre l’accent phonétique et logique sur l’objet précis du désir.
— Exemple visuel : 私は車が買いたいです。
Décodage visuel : 私 (Je) + は (Thème) | 車 ( くるま - Voiture) + が (Focus sur l’objet du désir) | 買いたいです (Je veux acheter).

Analyse d’une intention complexe dans le texte :
来年、日本の会社で働くつもりです。

Décodage visuel analytique :
来年 (L’année prochaine) | 日本の会社で (Dans une entreprise japonaise / lieu de l’action active) | 働く (Travailler - Forme courte du dictionnaire) + つもりです (J’ai l’intention de).$kt$, $kt$$kt$, null),
  ('Japonais', 39, $kt$Cours 39 · [COMPRÉHENSION] Les vœux de l’entretien d’embauche$kt$, $kt$Entraîner l’oreille à capter la nuance d’intensité entre tai et tsumori sous un débit de parole soutenu, et assimiler le Pitch Accent des adjectifs de désir.$kt$, $kt$Théorie de l’Écoute : Capturer la nuance de détermination contractuelle
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
— 働きたい ( はたらきたい ) : Schéma étendu [L-H-H-H-H-H] → ha↗tarakitai ↗.$kt$, $kt$$kt$, null),
  ('Japonais', 40, $kt$Cours 40 · [EXPRESSION] Grand Atelier du plan de carrière « Horizon 2029 »$kt$, $kt$Rédiger sa feuille de route professionnelle en caractères mixtes, et soutenir oralement une présentation de ses ambitions à voix haute pendant 3 minutes complètes en continu.$kt$, $kt$Syntaxe & Articulation des projets à long terme
Pour structurer un discours d’avenir percutant et professionnel, positionnez le repère temporel absolu (l’année précise) en tête d’énoncé, formulez vos intentions, puis articulez vos souhaits en y adossant la cause logique en ～から étudiée au cycle 8.

Structure cible : [Année] に [Lieu] で働くつもりです。日本が大好きですから、[Objet]を買いたいです。$kt$, $kt$$kt$, null),
  ('Japonais', 41, $kt$Cours 41 · [ÉCRIT] Les Kanji d’aptitude et la mécanique de la Forme Potentielle$kt$, $kt$Maîtriser le tracé et les lectures des Kanji liés aux compétences et aux langues, et assimiler les règles de modification morphologique de la Forme Potentielle.$kt$, $kt$Tracé et Graphie : L’écriture des compétences et des savoirs
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
— Exemple : 日本語を話します → 日本語が話せます。(Nihongo ga hanasemasu = Je peux parler japonais).$kt$, $kt$$kt$, null),
  ('Japonais', 42, $kt$Cours 42 · [LECTURE] Décodage de profils professionnels et de CV sans espaces$kt$, $kt$Repérer visuellement les verbes à la forme potentielle au cœur d’un texte continu, valider la présence de la particule が et lire des évaluations de compétences.$kt$, $kt$Théorie de la Lecture : Cartographier les verbes de capacité
Dans un document de candidature, un protocole d’évaluation ou un texte de présentation formelle, vos yeux doivent chercher de manière ciblée le saut harmonique vers la ligne des voyelles en～えます ou l’occurrence du verbe pivot できます afin d’identifier immédiatement les aptitudes validées du sujet.

Analyse visuelle d’un descriptif de compétences :
私は英語と日本語が読めます。

Découpage visuel analytique :
私 (Je) + は (Particule de thème).
英語と日本語 ( えいごとにほんご - Eigo to Nihongo = L’anglais et le japonais) + が (Particule de focus de capacité).
読めます ( よめます - Yomemasu = Peut lire) → Verbe du groupe 1 basculé sur la ligne des adoucissements en -e.
Sens global : Je suis capable de lire l’anglais et le japonais.$kt$, $kt$$kt$, null),
  ('Japonais', 43, $kt$Cours 43 · [COMPRÉHENSION] L’entretien de recrutement à Tokyo$kt$, $kt$Entraîner l’oreille à capter les mutations de la forme potentielle sous un débit soutenu et décoder les validations d’aptitudes lors d’un entretien d’embauche.$kt$, $kt$Théorie de l’Écoute : Capter le potentiel dans le flux oral de l’entretien
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
immédiatement : de↗ki ↘ma-su.$kt$, $kt$$kt$, null),
  ('Japonais', 44, $kt$Cours 44 · [EXPRESSION] Grand Atelier du Pitch de Compétences face au recruteur$kt$, $kt$Rédiger un résumé d’aptitudes techniques et linguistiques en caractères mixtes, et simuler oralement une soutenance de ses compétences de 2 minutes et 30 secondes de manière fluide et convaincante.$kt$, $kt$Syntaxe Articulation du potentiel professionnel
Pour valoriser au mieux votre profil technique de manière fluide, articulez vos capacités positives en ～ます et vos limites d’apprentissage temporaires en ～ません en les articulant harmonieusement à l’aide du connecteur d’opposition が (mais) étudié en détail au bloc précédent.

Structure d’enchaînement cible : 私は日本語が話せますが、漢字は書けません。しかし、パソコンができます。$kt$, $kt$$kt$, null),
  ('Japonais', 45, $kt$Cours 45 · [ÉCRIT] Les Kanji de condition et la mécanique de la forme en ～たら$kt$, $kt$Maîtriser le tracé et les lectures des Kanji logiques de base, et assimiler l’architecture morphosyntaxique de la forme conditionnelle en ～たら ( tara).$kt$, $kt$Tracé et Graphie : L’écriture de la logique et des choix
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
— 雨です (il pleut) → 雨だったら (ame dattara → s’il pleut / en cas de pluie).$kt$, $kt$$kt$, null),
  ('Japonais', 46, $kt$Cours 46 · [LECTURE] Décodage de scénarios hypothétiques et de choix logiques$kt$, $kt$Repérer visuellement l’indicateur conditionnel ～たら au cœur d’un texte continu et lire des scénarios prospectifs sans espaces.$kt$, $kt$Théorie de la Lecture : Cartographier la clause conditionnelle
Dans un énoncé en japonais natif dénué d’espaces, le suffixe たら fait office de charnière logique et de ligne de partage : tout ce qui précède représente la condition posée, et tout ce qui lui succède constitue la conséquence factuelle. Vos yeux doivent repérer cette balise en Hiragana, qui est très fréquemment annoncée en amont par l’adverbe optionnel もし (moshi → si par hasard) placé en tout début de proposition.

Analyse visuelle d’un texte projectif :
もしお金があったら、新しい車を買います。

Découpage visuel analytique :
もし (Si par hasard...) → Jalon adverbial d’annonce de la condition.
お金があったら ( おかねがあったら - Okane ga attara) → Clause conditionnelle active (Si j’ai / si possède de l’argent) + pivot TARA (verbe d’origine arimasu).

新しい車を買います ( あたらしいくるまをかいます - Atarashii kuruma o kaimasu) →
Conséquence logique finale (J’analyserai / j’achèterai une nouvelle voiture).$kt$, $kt$$kt$, null),
  ('Japonais', 47, $kt$Cours 47 · [COMPRÉHENSION] Les dilemmes professionnels$kt$, $kt$Entraîner l’oreille à capter les liaisons conditionnelles tara / dattara sous un débit de conversation rapide et extraire les conséquences logiques.$kt$, $kt$Théorie de l’Écoute : Capter la bascule prosodique de l’hypothèse
À l’oral spontané, les locuteurs japonais accentuent de manière très nette la syllabe ta du suffixe たら en y appliquant une légère inflexion montante. Cela permet de suspendre musicalement le discours afin de maintenir l’attention de l’interlocuteur avant de délivrer la conséquence. Votre oreille doit traquer cette rupture de cadence rythmique.

Écoute active des contrastes conditionnels en contexte :
落ちたら (ochitara - si cela tombe / si cela échoue) ↔ できたら (dekitara - si c’est réalisable / si possible).
安かったら (yasukattara - si c’est bon marché).

Pitch Accent de la forme conditionnelle (Norme de Tokyo)
— 食べたら ( たべたら ) : Schéma descendant [H-L-L-L] → La voix s’élève sur la première syllabe puis chute lourdement : ta↗betara↘.
— 行ったら ( いったら ) : Schéma haut étendu [L-H-H-H] → La voix s’amorce en bas et monte sur le doublement consonantique : i ↗ttara↗.$kt$, $kt$$kt$, null),
  ('Japonais', 48, $kt$Cours 48 · [EXPRESSION] Grand Laboratoire de Synthèse Projective « Objectif 2029 »$kt$, $kt$Rédiger un plan de vie hypothétique en caractères mixtes, et soutenir oralement un exposé continu de 3 minutes décrivant vos projets d’avenir sous condition pour valider le Bloc 4.$kt$, $kt$Syntaxe & Stratégie Narrative de Niveau Avancé
Pour clore de manière souveraine ce bloc d’apprentissage, vous devez être capable de marier de façon organique la condition en ～たら , la capacité technique au potentiel en ～ます , et la projection de projet ferme en ～つもり au sein d’une seule et même tirade oratoire continue. Structure d’enchaînement cible : 2029 年に日本語が話せたら、日本で働くつもりです。お金があったら、家を買いたいです。$kt$, $kt$$kt$, null),
  ('Japonais', 49, $kt$Cours 49 · [ÉCRIT] Les Kanji de l’esprit et la mécanique du discours indirect (～と思う , ～と言っていました )$kt$, $kt$Maîtriser le tracé et les lectures des Kanji de l’intellect et de la déclaration, et assimiler l’architecture morphologique des citations et opinions au style neutre-poli.$kt$, $kt$Tracé et Graphie : L’écriture de la pensée et du rapport
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
(Shachō wa ashita konai to itte imashita → Le directeur a dit qu’il ne viendrait pas demain / où 社長 = le président/directeur).$kt$, $kt$$kt$, null),
  ('Japonais', 50, $kt$Cours 50 · [LECTURE] Décodage de revues de presse et de comptes-rendus de réunions$kt$, $kt$Repérer visuellement la particule de citation と devant les verbes d’opinion, identifier les structures imbriquées et lire des rapports factuels sans espaces.$kt$, $kt$Théorie de la Lecture : Isoler la frontière de la citation
Dans un compte-rendu d’activité, un article ou un e-mail professionnel rédigé au style continu, la particule と agit mécaniquement comme une fermeture de parenthèse logique. Vos yeux doivent appréhender l’ensemble du bloc en amont comme la parole rapportée (conjuguée en forme courte), et le bloc en aval comme l’action de déclaration.

Analyse visuelle d’un rapport de réunion :
田中さんは来月新しい車を買うと言っていました。

Découpage visuel analytique :
田中さん + は → Émetteur initial des propos rapportés.
[来月新しい車を買う ] → Citation au style neutre court (Qu’il achètera une nouvelle voiture le mois prochain ―où le verbe kaimasu bascule à la forme dictionnaire 買う ).
と (Balise de fin de citation) | 言っていました (Déclaration au passé poli → a dit / rapportait).$kt$, $kt$$kt$, null),
  ('Japonais', 51, $kt$Cours 51 · [COMPRÉHENSION] Interception des rumeurs de bureau$kt$, $kt$Entraîner l’oreille à capter la particule d’appui と et la forme neutre passée ou négative qui la précède sous un débit professionnel rapide.$kt$, $kt$Théorie de l’Écoute : Repérer le pivot de citation dans le flux oral
À l’oral professionnel rapide ou lors d’échanges en réunion, la particule de liaison と (to) fusionne phonétiquement avec l’initiale vocalique des verbes omoimasu ou itte imashita. Votre oreille doit s’habituer à intercepter les contractions rythmiques ～とます ( toimasu) ou l’assimilation familière très fréquente ～ったって ( ttatte → équivalant à to itte imashita).

Script audio du laboratoire d’écoute (Deux collègues échangeant sur les directives de la direction) :
A : 社長は来年の計画について何か言っていましたか。
(Le président a-t-il dit quelque chose au sujet du plan de l’année prochaine ? / 計画 = le plan, について = au sujet de).
B : ええ、2029 年までに新しい会社を作ると言っていました。
(Oui, il a dit qu’il créerait une nouvelle entreprise d’ici l’année 2029 / 作る [ つくる ] = fabriquer/créer).
A : そうですか。Stencil 私はそれは難しいと思います。
(Ah oui ? Moi, je pense que c’est difficile / それ = cela).$kt$, $kt$$kt$, null),
  ('Japonais', 52, $kt$Cours 52 · [EXPRESSION] Grand Atelier du compterendu de projet argumenté$kt$, $kt$Rédiger un mémo de synthèse d’opinions croisées en caractères mixtes, et soutenir oralement un compte-rendu de réunion fluide de 2 minutes et 30 secondes sans notes.$kt$, $kt$Syntaxe & Stratégie d’argumentation nuancée de Niveau B2
Pour valider l’excellence de votre débit oratoire, vous devez être capable de confronter la déclaration d’un tiers et votre propre contre-argument au sein d’une structure logique unifiée et hautement professionnelle.

Structure cible : [Sujet A] は [Style neutre] と言っていましたが、私は [Style neutre]と思います。なぜなら [Raison] からです。
Note : なぜなら ... から (nazenara... kara) = Car / en effet / la raison en est que.$kt$, $kt$$kt$, null),
  ('Japonais', 53, $kt$Cours 53 · [ÉCRIT] Les Kanji de caractérisation et l’architecture de la proposition relative imbriquée$kt$, $kt$Maîtriser le tracé et les lectures des Kanji qualificatifs essentiels, et assimiler l’agencement inversé de la proposition relative japonaise.$kt$, $kt$Tracé et Graphie : Les Kanji de description et de matérialité
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
— Exemple : 友達が作ったお茶 (Tomodachi ga tsukutta ocha = Le thé que mon ami a préparé).$kt$, $kt$Lectures : もの (mono) ou ぶつ (butsu - comme dans 物価 bukka = le coût de la vie / 建物 tatemono = un bâtiment). · Lectures : な (na) ou めい (mei). · Combinaison essentielle : 有名 ( ゆうめい - Yūmei) = Célèbre / réputé / grand renom. · Lectures : おや (oya) ou しん (shin). · Combinaison essentielle : 親切 ( しんせつ - Shinsetsu) = Gentil / attentionné. · Lectures : かた (kata) ou ほう (hō).$kt$, null),
  ('Japonais', 54, $kt$Cours 54 · [LECTURE] Décodage de structures descriptives imbriquées et denses$kt$, $kt$Repérer visuellement le point de bascule précis entre la phrase relative courte et le nom noyau, et lire des descriptions complexes sans espaces.$kt$, $kt$Théorie de la Lecture : Isoler le nom noyau
Dans une trame de texte japonaise native continue, l’absence de pronoms relatifs impose une gymnastique visuelle spécifique : vos yeux doivent identifier le tout premier nom substantif principal qui se trouve précédé par un verbe ou un adjectif au style neutre court. Ce verbe qualifie le nom, il ne ferme pas la phrase globale.

Analyse visuelle d’une phrase à imbrication dense :
これは私が働く会社です。

Découpage visuel analytique :
これ (Ceci) + は (Particule de thème principal) → Cadre global de l’énoncé.
[私が働く ] ( わたしがはたらく - Watashi ga hataraku) → Proposition relative courte au style neutre (Dans laquelle je travaille). Le が verrouille le sujet secondaire.
会社 ( かいしゃ - Kaisha = Entreprise) → Nom noyau principal qualifié par le bloc complet en amont.
です → Copule de clôture de la phrase principale.
Sens final : Ceci est l’entreprise dans laquelle je travaille.$kt$, $kt$$kt$, null),
  ('Japonais', 55, $kt$Cours 55 · [COMPRÉHENSION] Laboratoire d’Écoute & Captation des qualifications enchâssées$kt$, $kt$Entraîner l’oreille à suspendre l’analyse sémantique jusqu’au nom noyau et décoder des descriptions d’objets et de lieux complexes à vitesse réelle.$kt$, $kt$Théorie de l’Écoute : Gérer l’attente structurelle du nom noyau
À l’oral standard de Tokyo, les propositions relatives modifient le rythme de phrase habituel. Le flux vocal s’écoule de manière continue et liée sur la phrase relative courte au style neutre, puis marque une micro-respiration subtile juste après le verbe court afin de poser l’accent tonique sur le nom qualifié. Votre oreille doit attendre ce substantif pivot pour assembler correctement le sens logique de la phrase.

Script audio du laboratoire d’écoute (Deux collègues identifiant un document égaré) :
A : すみません、昨日私が書いた文はどこにありますか。
(Excusez-moi, où se trouve le texte que j’ai écrit hier ? / どこ = où).
B : ああ、あの有名な先生が読んだ本の上にありますよ。
(Ah, il se trouve sur le livre qu’a lu ce professeur célèbre, je vous l’assure / あの = ce... là-bas,上 [ うえ ] = sur / au-dessus).
A : そうですか。ありがとうございました。
(Ah, d’accord. Merci beaucoup.)$kt$, $kt$$kt$, null),
  ('Japonais', 56, $kt$Cours 56 · [EXPRESSION] Grand Atelier de Description d’Infrastructures et d’Objets d’Étude$kt$, $kt$Rédiger une notice descriptive dense combinant adjectifs et propositions relatives imbriquées, et soutenir une présentation orale fluide de 2 minutes et 30 secondes sans notes.$kt$, $kt$Syntaxe & Stratégie de densification du discours de Niveau B2
Pour polir votre éloquence et atteindre le débit requis, vous devez éradiquer la juxtaposition de phrases courtes successives (« Je vais dans une entreprise. Cette entreprise est grande. ») au profit d’un bloc de proposition relative parfaitement intégré et dense.

Structure cible : これは [Sujet secondaire] が [Verbe court] [Nom noyau] です。
[Nom noyau] はとても [Adjectif] です。$kt$, $kt$$kt$, null),
  ('Japonais', 57, $kt$Cours 57 · [ÉCRIT] Les Kanji de déférence et la mécanique du Keigo (Sonkeigo / Kenjougo)$kt$, $kt$Maîtriser le tracé et les lectures des Kanji de l’étiquette et du milieu corporate, et assimiler l’architecture des verbes honorifiques et modestes.$kt$, $kt$Tracé et Graphie : L’écriture du protocole et des affaires
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
— Rencontrer : 会います → お目に掛かります (omenikakarimasu).$kt$, $kt$$kt$, null),
  ('Japonais', 58, $kt$Cours 58 · [LECTURE] Décodage de courriels d’affaires et de correspondances formelles$kt$, $kt$Repérer visuellement les mutations verbales du Keigo au cœur d’un texte continu et lire une correspondance corporate sans espaces.$kt$, $kt$Théorie de la Lecture : Cartographier les flux de politesse verticale
Dans un courriel d’affaires japonais (Business メール ), l’absence de segmentations est largement compensée par la récurrence de formules de politesse figées. Vos yeux doivent repérer le suffixe honorifique 様 (sama) attaché au destinataire, et identifier immédiatement si les verbes de clôture relèvent du respect (Sonkeigo) ou de la modestie (Kenjougo).

Analyse visuelle d’une phrase d’affaires type :
田中様、私は明日そちらへ参ります。

Découpage visuel analytique :
田中様 ( たなかさま - Tanaka-sama) → Élévation absolue du client en tête de message.私 (Je) + は (Particule de thème).
明日そちらへ ( あしたそちらへ - Ashita sochira e = Demain de votre côté / vers chez vous).参ります ( まいります - Mairimasu = Je vais / je viens) → Verbe final au registre Kenjougo (modestie). L’ingénieur abaisse humblement son propre déplacement par déférence pour Tanakasama.$kt$, $kt$$kt$, null),
  ('Japonais', 59, $kt$Cours 59 · [COMPRÉHENSION] Les codes de déférence de la réunion d’affaires$kt$, $kt$Entraîner l’oreille à capter les formes verbales irrégulières du Keigo (irasshaimasu, osshaimasu) sous un débit d’affaires rapide et décoder les interactions hiérarchiques.$kt$, $kt$Théorie de l’Écoute : Repérer l’élévation et l’humilité dans le flux oral
Dans les réunions de projets ou négociations de l’écosystème corporatif de Tokyo, le débit demeure soutenu mais la morphologie des verbes change. Les structures honorifiques du premier groupe se terminant en る effectuent leur flexion passée de manière irrégulière en ～いました( imashita). Votre oreille doit traquer ces finales pour décoder l’organigramme des rôles.
— おッシュいます → おっしゃいました (osshaimashita = vous avez dit / vous vous êtes exprimé).
— いらっしゃいます → いらっしゃいました (irasshaimashita = vous êtes allé / venu / vous vous trouviez).

Script audio du laboratoire d’écoute (Négociation d’ingénierie) :
社員 (Ingénieur de votre équipe) : 田中様、来週の計画について何かおっしゃいましたか。
(Tanaka-sama, avez-vous dit quelque chose au sujet du plan de la semaine prochaine ?)
田中様 (Client) : ええ、来週会社にいらっしゃいますか。
(Oui, irez-vous à l’entreprise la semaine prochaine ?)
社員 (Ingénieur de votre équipe) : はい、来週月曜日に参ります。お目に掛かります。(Oui, je m’y rendrai humblement lundi prochain. J’aurai l’honneur de vous rencontrer.)$kt$, $kt$$kt$, null),
  ('Japonais', 60, $kt$Cours 60 · [EXPRESSION] Grand Atelier de Soutenance Corporative face au Client Majeur$kt$, $kt$Rédiger un courriel d’affaires irréprochable combinant Kanji et Kana, et simuler oralement une soutenance technique face à un client exigeant en maintenant la cascade honorifique pendant 2 minutes et 30 secondes.$kt$, $kt$Syntaxe & Stratégie de la déférence corporate de Niveau B2
Pour valider votre objectif de fluidité complète d’ici 2029, vous devez automatiser la cascade
du Keigo : élever systématiquement les actions du client par le Sonkeigo et abaisser simultanément vos propres mouvements par le Kenjougo sans commettre d’inversion fâcheuse de registre.

Structure cible : [Client] 様が [Style neutre] とおっしゃいましたから、私は明 st / 明日 [Lieu] へ参ります。$kt$, $kt$$kt$, null),
  ('Japonais', 61, $kt$Cours 61 · [ÉCRIT] Syntaxe avancée, synthèse des structures complexes et Okurigana$kt$, $kt$Maîtriser l’agencement graphique final des phrases imbriquées (Relatives + Discours indirect + Keigo) et éliminer définitivement les erreurs récurrentes d’Okurigana.$kt$, $kt$Rigueur de la Graphie : L’agencement structurel ultime
Al’atteinte d’un niveau d’autonomie avancé, l’écriture manuscrite ou numérique doit refléter l’équilibre structurel parfait entre les blocs porteurs de sens sémantique (Kanji) et les marqueurs fonctionnels ou morphologiques (Hiragana).

La règle de l’Okurigana complexe :
Les verbes honorifiques irréguliers exigent une attention orthographique stricte sur la délimitation de la partie conjuguée en Kana.
— Structure incorrecte : 言っしゃいます × (Erreur grave de radicalisation).
— Structure correcte : おっしゃいます (osshaimasu = vous dites) → Tout s’écrit en Hiragana pour cette racine honorifique pure.

La cascade syntaxique finale intermédiaire :
[Proposition relative courte] + [Nom noyau] は [Citation au style neutre] とおっしゃいました。$kt$, $kt$$kt$, null),
  ('Japonais', 62, $kt$Cours 62 · [LECTURE] Grand Bilan de Lecture continu et décodage d’un rapport de projet$kt$, $kt$Valider sa capacité à lire à haute voix, découper mentalement et comprendre un rapport de projet complexe combinant propositions relatives et Keigo sans espaces.$kt$, $kt$Consigne : Lisez le texte continu suivant à voix haute, identifiez les articulations grammaticales et analysez sa structure de subordination : 「田中様は私が先月作った計画はとても便利だと言っていました。来年日本の会社 で働くつもりですから、毎日日本語を一生懸命勉強しています。」 (Note : 一生懸命 [ いっしょうけんめい - isshōkenmei] = de toutes ses forces / avec ardeur).$kt$, $kt$$kt$, null),
  ('Japonais', 63, $kt$Cours 63 · [COMPRÉHENSION] L’Examen d’Écoute de la revue de fin d’année$kt$, $kt$Valider son oreille face à un flux audio d’affaires à vitesse réelle de Tokyo et extraire les informations clés d’une décision hiérarchique.$kt$, $kt$Laboratoire d’Écoute : Script de la validation finale
Écoutez attentivement cet échange managérial crucial entre le Directeur Général ( 社長 ) et un ingénieur d’équipe :
(Avez-vous lu le rapport qu’a préparé Tanaka-sama ?)$kt$, $kt$社長 (Directeur) : 田中様が作った報告書を読みましたか。 · 社員 (Ingénieur) : はい、読みました。来週田中様にお目に掛かりますから、資料を準備しています。 · 社長 (Directeur) : そうですか。もし時間があったら、明日私のオフィスにいらっしゃってください。$kt$, null),
  ('Japonais', 64, $kt$Cours 64 · [EXPRESSION] Grand Bilan Final Oral & Clôture du Cursus en LaTeX$kt$, $kt$Soutenir un monologue argumentatif autonome de 3 minutes intégrant toutes les structures complexes du cursus, et valider la structure finale du document LaTeX pour le Japonais.$kt$, $kt$Grand Atelier d’Expression Orale : La soutenance d’éloquence B2 (3 minutes)
Consigne (Performance chronométrée de fin de cursus) :
Détachez-vous complètement de toute note écrite ou support visuel. Prenez la parole à voix haute de manière souveraine, fluide et assurée pendant 3 minutes complètes en continu. Critères de validation orale impératifs (Grille d’évaluation finale) :
— Proposition relative : Intégration organique d’une proposition relative imbriquée dense ( 名詞修飾 ).
— Raisonnement causal : Justification fluide par l’usage du connecteur arrière ～から( kara).
— Scénario hypothétique : Formulations de conditions claires via le suffixe ～たら ( tara).
— Planification ferme : Expression de projets d’avenir stables avec la structure ～つもり ( tsumori).
— Politesse verticale : Emploi à bon escient et sans confusion des verbes de respect (Sonkeigo) ou de modestie (Kenjougo).

お疲れ様でした！日本語のコースは無事に終了しました。
(Félicitations ! Votre cursus de japonais est officiellement et brillamment validé.)$kt$, $kt$$kt$, null)
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
  and c.language = 'Japonais'
  and e.origin <> 'member';

-- les exercices des membres passent après ceux du manuel (position + 1000, une seule fois)
update public.language_exercises e
set position = e.position + 1000
from public.language_courses c
where e.course_id = c.id
  and c.language = 'Japonais'
  and e.origin = 'member'
  and e.position < 1000;

-- 3) Nouveaux exercices du manuel
insert into public.language_exercises
  (course_id, position, prompt, answer, expected_answer, accepted_answers, explanation, exercise_type, origin)
select c.id, x.pos, x.prompt, x.expected, x.expected, x.accepted, x.explanation, 'written', 'manual'
from (values
  (2, 1, $kt$Lisez à voix haute les phrases suivantes en isolant mentalement les particules de structure : 私は日本人です。$kt$, $kt$わたしはにほんじんです$kt$, array[$kt$わたしはにほんじんです$kt$]::text[], $kt$わたしはにほんじんです (Watashi wa Nihonjin desu → Je suis Japonais/e).$kt$),
  (2, 2, $kt$Lisez à voix haute les phrases suivantes en isolant mentalement les particules de structure : フランス人ですか。             (Note : フランス人 = Français/e)$kt$, $kt$フランスじんですか$kt$, array[$kt$フランスじんですか$kt$]::text[], $kt$フランスじんですか (Furansujin desu ka ? → Êtes-vous Français/e ?).$kt$),
  (3, 1, $kt$„Gakusei desu ne.“ → Demande un$kt$, $kt$Accord / Validation / Partage d’opinion$kt$, array[$kt$Accord / Validation / Partage d’opinion$kt$, $kt$Accord Validation Partage d’opinion$kt$, $kt$Accord$kt$, $kt$Validation$kt$, $kt$Partage d’opinion$kt$]::text[], $kt$Accord / Validation / Partage d’opinion.$kt$),
  (3, 2, $kt$„Nihonjin desu yo.“ → Donne une information avec$kt$, $kt$Assurance / Certitude / Clarté affirmative$kt$, array[$kt$Assurance / Certitude / Clarté affirmative$kt$, $kt$Assurance Certitude Clarté affirmative$kt$, $kt$Assurance$kt$, $kt$Certitude$kt$, $kt$Clarté affirmative$kt$]::text[], $kt$Assurance / Certitude / Clarté affirmative.$kt$),
  (4, 1, $kt$Tâche écrite (Production) : Rédigez en caractères japonais combinés (exploitez le Kanji pour Watashi et Gakusei, et les Hiragana pour le reste de la structure) votre profil de présentation. Script de présentation officielle$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : はじめまして。私は[Votre Nom] です。学生です。よろしくおねがいします。 Tâche orale (Performance rituelle) : Mettez-vous en situation réelle de rencontre professionnelle ou académique. — Posture corporelle : Gardez les bras le long du corps de manière droite (si vous êtes un homme) ou les mains croisées sur le haut des cuisses (si vous êtes une femme). — La révérence (Ojigi) : Inclinez le buste à environ 15 ou 30 degrés à partir des hanches. Ne maintenez surtout pas le regard pendant la révérence (gardez la tête dans l’alignement de la colonne), et énoncez vos répliques à voix haute de manière parfaitement fluide : „Hajimemashite. Watashi wa [Votre Nom] desu. Gakusei desu. Yoroshiku onegai shimasu.“ Conseil de fluidité pro (2029) : La particule thématique は (wa) doit être phonétiquement fusionnée au mot 私 (watashi). Évitez la coupure saccadée Watashi | pause | wa. Enchaînez d’un seul élan vocal : [watashiwa]. Veillez également à ce que le です (desu) de fin de phrase soit sec et percutant [dess], la ligne de voix redescendant proprement sur la dernière consonne. Répétez l’enchaînement 5 fois pour fluidifier le débit.$kt$),
  (6, 1, $kt$Lisez à voix haute les phrases suivantes et transcrivez la lecture des Kanji entre parenthèses en Hiragana : 私は水を出します。             (Note : 出す [だす ] = servir/sortir) → わたしは                       をだします。$kt$, $kt$水 → みず$kt$, array[$kt$水 → みず$kt$]::text[], $kt$水 → みず (mizu)$kt$),
  (6, 2, $kt$Lisez à voix haute les phrases suivantes et transcrivez la lecture des Kanji entre parenthèses en Hiragana : お茶を飲みます。 →                       をのみます。$kt$, $kt$お茶 → おちゃ$kt$, array[$kt$お茶 → おちゃ$kt$]::text[], $kt$お茶 → おちゃ (ocha)$kt$),
  (7, 1, $kt$„Ocha o nomimasu ka.“ → □ Question factuelle        □ Invitation polie$kt$, $kt$Question factuelle$kt$, array[$kt$Question factuelle$kt$]::text[], $kt$Question factuelle (Est-ce que vous buvez / allez boire du thé ?).$kt$),
  (7, 2, $kt$„Ocha o nomimasen ka.“ → □ Question factuelle        □ Invitation polie$kt$, $kt$Invitation polie$kt$, array[$kt$Invitation polie$kt$]::text[], $kt$Invitation polie (Proposition adoucie : ”Et si on prenait un thé ?”).$kt$),
  (8, 1, $kt$Tâche écrite (Production) : Rédigez un paragraphe de 3 phrases fluides en écriture japonaise native, en veillant à insérer les Kanji appropriés pour les mots Je, Livre, Thé, Manger et Boire : ”Je lis un livre. Et je bois du thé.” Script de planification écrite$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 私は本を読みます。そして、お茶を形象飲みます。 → 私は本を読みます。そして、お 茶を飲みます。 Tâche orale (Simulation d’invitation) : Imaginez que vous proposez une activité de pause à un collègue ou à un camarade de classe. Fixez votre interlocuteur, adoptez un ton chaleureux, engageant et respectueux, et énoncez vos répliques à voix haute de manière continue : „Issho ni ocha o nomimasen ka. Resutoran de tabemasen ka.“ (Et si on buvait du thé ensemble ? Et si on mangeait un morceau au restaurant ?) Simulez ensuite la validation positive et enthousiaste de votre interlocuteur : „Ii desu ne ! Ikimashō !“ (Excellente idée ! Allons-y !) Conseil de fluidité pro (2029) : La particule d’objet direct を (o) ne doit jamais être isolée ou détachée du mot qu’elle qualifie par un silence artificiel. Évitez la coupure Hon | pause | o | yomimasu. Articulez l’ensemble du bloc nominal et verbal d’un seul souffle continu : [hon’o yomimasu]. De même, veillez à ce que la transition rythmique vers la finale interrogative masenka soit nette et dynamique. Répétez l’ensemble du dialogue 5 fois pour verrouiller l’automatisme.$kt$),
  (10, 1, $kt$Lisez à voix haute les phrases suivantes et déterminez leur sens exact en transcrivant la lecture des Kanji en Hiragana : 外に人がいます。 →                                に                     がいます。$kt$, $kt$そと$kt$, array[$kt$そと$kt$]::text[], $kt$そと (soto - extérieur) / ひと (hito - personne) → Il y a quelqu’un dehors.$kt$),
  (10, 2, $kt$Lisez à voix haute les phrases suivantes et déterminez leur sens exact en transcrivant la lecture des Kanji en Hiragana : 日本に駅があります。 →                                   に                     があります。$kt$, $kt$にほん$kt$, array[$kt$にほん$kt$]::text[], $kt$にほん (Nihon - Japon) / えき (eki - gare) → Il y a des gares au Japon.$kt$),
  (11, 1, $kt$„San-zen-en desu.“ →                               ¥$kt$, $kt$3 000 ¥$kt$, array[$kt$3 000 ¥$kt$]::text[], $kt$3 000 ¥ (En Kanji : 三千円 ).$kt$),
  (11, 2, $kt$„Ni-man-en desu.“ →                                ¥$kt$, $kt$20 000 ¥$kt$, array[$kt$20 000 ¥$kt$]::text[], $kt$20 000 ¥ (En Kanji : 二万円 ).$kt$),
  (12, 1, $kt$Tâche écrite (Production) : Rédigez en caractères japonais combinés (Kanji et Kana sans espaces) l’énoncé suivant : ”Il y a du thé vert à la gare. Donnez-moi deux thés verts s’il vous plaît.” Script de commande de repas$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 駅にお茶があります。お茶を二つください。 Tâche orale (Jeu de rôle au restaurant) : Imaginez que vous interpellez le serveur au comptoir d’un restaurant à Tokyo („Sumimasen ! “ = Excusez-moi !). Demandez le prix du thé vert, puis passez une commande complète de deux boissons. Prenez la parole à voix haute de manière fluide et rythmée pendant 3 minutes en continu : „Sumimasen. Ocha wa ikura desu ka. [...] Jaa, ocha o futatsu kudasai.“$kt$),
  (13, 1, $kt$Conjuguez les structures suivantes au passé affirmatif poli : 読みます (yomimasu) → __________$kt$, $kt$読みました$kt$, array[$kt$読みました$kt$]::text[], $kt$読みました (yomimashita)$kt$),
  (13, 2, $kt$Conjuguez les structures suivantes au passé affirmatif poli : 学生です (gakusei desu) → __________$kt$, $kt$学生でした$kt$, array[$kt$学生でした$kt$]::text[], $kt$学生でした (gakusei deshita).$kt$),
  (14, 1, $kt$Lisez à haute voix et transcrivez la prononciation exacte du bloc final en Hiragana : 私は先月学生でした。→ わたしはせんげつがくせい _____。$kt$, $kt$でした$kt$, array[$kt$でした$kt$]::text[], $kt$でした (deshita)$kt$),
  (14, 2, $kt$Lisez à haute voix et transcrivez la prononciation exacte du bloc final en Hiragana : お茶を読みました。→ おちゃを _____。(Note : verbe lire utilisé pour l’exercice).$kt$, $kt$よみました$kt$, array[$kt$よみました$kt$]::text[], $kt$よみました (yomimashita).$kt$),
  (15, 1, $kt$Cochez la valeur temporelle exacte entendue dans l’extrait audio simulé : „Ikimashita.“→ □ Présent / □ Passé / □ Passé Négatif$kt$, $kt$Passé$kt$, array[$kt$Passé$kt$]::text[], $kt$Passé (Je suis allé)$kt$),
  (15, 2, $kt$Cochez la valeur temporelle exacte entendue dans l’extrait audio simulé : „Tabemasen deshita.“→ □ Présent / □ Passé / □ Passé Négatif$kt$, $kt$Passé Négatif$kt$, array[$kt$Passé Négatif$kt$]::text[], $kt$Passé Négatif (Je n’ai pas mangé).$kt$),
  (16, 1, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes en écriture japonaise native, combinant Kanji et Kana sans espaces de séparation. Vous devez vous présenter, indiquer votre statut du mois dernier ( 先月 ), décrire une action de consommation ou de lecture passée réalisée dans un lieu précis, et stipuler une action non accomplie. Contrainte d’archivage : Utilisez obligatoirement les Kanji étudiés dans le Bloc 1 : 私、日本、 人、学生、本、お茶、水、駅、先月、今月 .$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (16, 2, $kt$Consigne : Détachez-vous de vos notes écrites. Prenez la parole à voix haute face à un miroir de manière posée, digne et continue pendant exactement 3 minutes (chronométré). Structurez votre récit historique de façon fluide : salutations, identité, chronologie des faits passés au Japon, et formule de clôture ( よろしくおねがいします ).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (18, 1, $kt$Lisez à voix haute la phrase suivante et délimitez la frontière sémantique entre les deux actions successives :友達はご飯を食べて行きます。 (Note : ご飯 [ごはん ] = le repas / le riz) → [Action 1 :                            ] → [Action 2 :                            ]$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Action 1 : 友達はご飯を食べて (Mon ami mange son repas, puis...) Action 2 : 行きます (il part / s’en va.).$kt$),
  (19, 1, $kt$„Hon o yonde...“ → Vient de □ 読みます            □ 帰ります$kt$, $kt$読みます$kt$, array[$kt$読みます$kt$]::text[], $kt$読みます (yomimasu).$kt$),
  (19, 2, $kt$„Uchi ni kaette...“ → Vient de □ 買います          □ 帰ります          (Note : うち = la maison / le foyer)$kt$, $kt$帰ります$kt$, array[$kt$帰ります$kt$]::text[], $kt$帰ります (kaerimasu).$kt$),
  (20, 1, $kt$Tâche écrite (Production) : Rédigez un paragraphe composé de deux phrases complexes en mêlant adroitement Kanji et Kana sans espaces : ”Aujourd’hui, je vais à la gare, je rencontre un ami, puis je rentre à la maison.” — Aide lexicale : Aujourd’hui = 今日 ( きょう - kyō), Rencontrer = 会います ( あいま す - aimasu → forme en て : 会って ). Script de routine chronologique$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 今日は駅へ行って、友達に会って、家へ帰ります。 Tâche orale (Le flux de la routine) : Imaginez que vous décrivez votre programme de la matinée à un collègue ou enseignant japonais de manière spontanée. Adoptez une posture droite, un débit constant et énoncez vos phrases à voix haute sans coupure artificielle : „Watashi wa asa uchi de gohan o tabete, eki he ikimasu. Soshite, tomodachi ni aimasu.“ Conseil de fluidité pro : La forme en ～て doit être appréhendée comme un tremplin rythmique. Ne baissez surtout pas l’intonation de votre voix à la fin de 食べて (tabete), maintenez au contraire un ton légèrement suspendu vers le haut pour indiquer à votre interlocuteur que votre pensée n’est pas close. Liez le bloc final 行って d’un seul élan tonique franc : [itte]. Répétez ce schéma 5 fois pour fluidifier la transition.$kt$),
  (22, 1, $kt$Lisez à voix haute les phrases suivantes et transcrivez la lecture des Kanji entre parenthèses en Hiragana : 私はテレビを見ています。                   (Note : テレビ = la télévision) → わたしはテレビを     ています。$kt$, $kt$見 → み$kt$, array[$kt$見 → み$kt$]::text[], $kt$見 → み (Forme en て : みて )$kt$),
  (22, 2, $kt$Lisez à voix haute les phrases suivantes et transcrivez la lecture des Kanji entre parenthèses en Hiragana : 学生は話を聞いています。 → がくせいははなしを                                       ています。$kt$, $kt$聞 → き$kt$, array[$kt$聞 → き$kt$]::text[], $kt$聞 → き (Forme en て : きいて )$kt$),
  (23, 1, $kt$„Ima, shinbun o yomimasu.“ → Action □ Habituelle / Générale        □ En train de s’accomplir$kt$, $kt$Action Habituelle / Générale$kt$, array[$kt$Action Habituelle / Générale$kt$, $kt$Action Habituelle Générale$kt$, $kt$Action Habituelle$kt$, $kt$Générale$kt$]::text[], $kt$Action Habituelle / Générale (Traduit un présent factuel non progressif).$kt$),
  (23, 2, $kt$„Ima, shinbun o yonde imasu.“ → Action □ Habituelle / Générale          □ En train de s’accomplir (where いま = maintenant)$kt$, $kt$En train de s’accomplir$kt$, array[$kt$En train de s’accomplir$kt$]::text[], $kt$En train de s’accomplir (Présent progressif strict porté par yonde imasu).$kt$),
  (24, 1, $kt$Tâche écrite (Production) : Rédigez un court dialogue composé de 2 répliques en caractères japonais combinés (Kanji et Kana sans espaces) : ”A : Allo, qu’êtes-vous en train de faire ? B : Je suis en train de parler au téléphone avec un ami.” — Aide grammaticale : La particule de coordination de compagnie ”avec” se traduit par と (to). Script d’appel téléphonique en direct Réplique A : Réplique B :$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : A : もしもし、今何をしていますか。 B : 私は今、友達と電話で話しています。 Tâche orale (La simulation d’appel d’urgence) : Prenez votre téléphone en main. Imaginez qu’un partenaire d’affaires ou un ami japonais vous contacte pour s’enquérir de votre disponibilité immédiate. Adoptez une diction téléphonique claire, fluide, modulée et polie. Prenez la parole à voix haute sans aucune note pendant 2 minutes et 30 secondes en continu : „Moshimoshi, [Votre Nom] desu. Ima uchi de shinbun o yonde imasu. Soshite, ocha o nonde imasu. Ima kara eki he ikimasu.“ (Allo, c’est [Nom]. En ce moment je lis le journal à la maison. Et je bois du thé. À partir de maintenant, je me rends à la gare.) Conseil de fluidité pro (2029) : Le bloc progressif 話しています (hanashite imasu) doit être produit d’un seul élan articulatoire unifié, sans coupure rythmique ou hésitation interne. Ne détachez jamais la copule imasu du reste du bloc verbal. Entraînez-vous à fusionner l’expression読んでいます comme un unique mot fluide : [yondeimasu]. Répétez cette simulation 5 fois pour stabiliser le débit.$kt$),
  (26, 1, $kt$Lisez à voix haute les phrases suivantes et déterminez s’il s’agit d’une Autorisation ou d’une Interdiction : ここで新聞を読んでもいいです。 →$kt$, $kt$Autorisation$kt$, array[$kt$Autorisation$kt$]::text[], $kt$Autorisation (Vous pouvez lire le journal ici / structure mo ii desu).$kt$),
  (26, 2, $kt$Lisez à voix haute les phrases suivantes et déterminez s’il s’agit d’une Autorisation ou d’une Interdiction : 電車の中で電話で話してはいけません。 →$kt$, $kt$Interdiction$kt$, array[$kt$Interdiction$kt$]::text[], $kt$Interdiction (Il est interdit de parler au téléphone à l’intérieur du train / structure wa ikemasen).$kt$),
  (27, 1, $kt$„Mizu o nonde mo ii desu ka.“ → □ Demande d’Autorisation          □ Énoncé d’Interdiction$kt$, $kt$Demande d’Autorisation$kt$, array[$kt$Demande d’Autorisation$kt$]::text[], $kt$Demande d’Autorisation (Puis-je boire de l’eau ?).$kt$),
  (27, 2, $kt$„Koko ni haitte wa ikemasen.“ → □ Demande d’Autorisation          □ Énoncé d’Interdiction$kt$, $kt$Énoncé d’Interdiction$kt$, array[$kt$Énoncé d’Interdiction$kt$]::text[], $kt$Énoncé d’Interdiction (Il ne faut pas entrer ici / l’accès est interdit).$kt$),
  (28, 1, $kt$Tâche écrite (Production) : Rédigez un mémo réglementaire de deux consignes pour l’espace de la gare en caractères japonais combinés (Kanji et Kana sans espaces) : ”Il ne faut pas arrêter la voiture ici. Cependant, vous pouvez lire le journal.” Mémo de sécurité$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ここで車を止めてはいけません。しかし、新聞を読んでもいいです。 Tâche orale (Le briefing des consignes de sécurité) : Imaginez que vous briefez un nouveau stagiaire ou un collaborateur lors de son accueil sur votre site de travail à Tokyo. Adoptez un ton ferme, hautement professionnel, direct et d’une fluidité constante. Prenez la parole à voix haute sans notes pendant 2 minutes et 30 secondes en continu : „Moshimoshi. Koko wa eki no mon no mae desu. Koko de kuruma o tomete wa ikemasen. Shinbun o yonde mo ii desu yo. Denwa de hanashite wa ikemasen.“ (Allo. Ici, nous sommes devant le portail de la gare. Il ne faut pas garer sa voiture ici. Vous pouvez lire le journal, je vous le certifie. Il est interdit de parler au téléphone.) Conseil de fluidité pro : Pour imposer votre leadership technique et linguistique, la structure prohibitive ～てはいけません doit être énoncée d’un seul élan rythmique. N’isolez pas les composants. Entraînez-vous à déclamer 止めてはいけません comme une unique unité mélodique indissociable : [tomete wa ikemasen], en laissant la voix redescendre de manière stable et posée après la syllabe me. Répétez ce briefing 5 fois pour ancrer la structure.$kt$),
  (30, 1, $kt$Lisez à voix haute les phrases suivantes et identifiez s’il s’agit d’une relation de Cause ou d’Opposition : お茶が大好きですから、毎日飲みます。 →$kt$, $kt$Cause$kt$, array[$kt$Cause$kt$]::text[], $kt$Cause (Puisque j’adore le thé, j’en bois tous les jours / structure kara).$kt$),
  (30, 2, $kt$Lisez à voix haute les phrases suivantes et identifiez s’il s’agit d’une relation de Cause ou d’Opposition : このテレビは小さいですが、高いです。 →$kt$, $kt$Opposition$kt$, array[$kt$Opposition$kt$]::text[], $kt$Opposition (Cette télévision est petite, mais elle coûte cher / structure ga).$kt$),
  (31, 1, $kt$„... benri desu ga...“ → □ Cause       □ Opposition$kt$, $kt$Opposition$kt$, array[$kt$Opposition$kt$]::text[], $kt$Opposition (Traduit le contraste : ”C’est pratique, mais...”).$kt$),
  (31, 2, $kt$„... takai desu kara...“ → □ Cause       □ Opposition$kt$, $kt$Cause$kt$, array[$kt$Cause$kt$]::text[], $kt$Cause (Pose la légitimité de l’action : ”Comme c’est cher, [par conséquent]...”).$kt$),
  (32, 1, $kt$Tâche écrite (Production) : Rédigez un paragraphe d’argumentation de 4 phrases en caractères japonais combinés, de manière continue et sans aucun espace : ”Le thé vert japonais est délicieux, donc j’en bois tous les jours. Ce restaurant est ancien mais il est très grand.” — Aide lexicale : Délicieux = 美味しい ( おいしい - oishii), Tous les jours = 毎日 ( ま いにち - mainichi). Essai argumentatif écrit (Bilan Bloc 1)$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 日本のお茶は美味しいですから、毎日飲みます。このレストランは古いですが、とても 大きいです。 Tâche orale (La soutenance du point de vue ―Pitch) : Imaginez que vous exposez à un interlocuteur ou à un jury les raisons pour lesquelles vous planifiez de vous installer à Tokyo ou vos préférences de cadre de vie. Détachez-vous de toute note écrite. Adoptez un ton convaincant, un débit constant et prenez la parole à voix haute pendant 3 minutes complètes en continu (performance chronométrée) : „Watashi wa Nihon no seikatsu ga daisuki desu. Tōkyō wa totemo benri desu kara, mainichi densha de ikimasu. Kuruma wa takai desu kara, kaimasen. Koko wa chiisai eki desu ga, atarashii desu ne. Issho ni ikimashō !“ (J’adore la vie au Japon. Comme Tokyo est très pratique, je prends le train tous les jours. Comme les voitures sont chères, je n’en achète pas. C’est une petite gare, mais elle est neuve, n’est-ce pas ? Allons-y ensemble !) Conseil de fluidité pro : Les connecteurs から (kara) et が (ga) agissent comme des pivots rythmiques structurants. À l’oral, la ligne de voix doit demeurer suspendue et stable sur le ga ou le kara, matérialisant une micro-pause naturelle (la virgule), avant de délivrer la proposition consécutive d’un seul élan dynamique. Ne segmentez pas à l’excès. Répétez ce grand exercice 5 fois pour éliminer les blancs de réflexion et clore avec brio ce premier grand bloc. CHAPITRE 3 BLOC 3 : Le registre familier & les structures complexes$kt$),
  (34, 1, $kt$Lisez à voix haute les phrases suivantes formulées au style familier et restituez leur équivalent strict au style poli de politesse ( masu) : 友達はお茶を読む。 →$kt$, $kt$友達はお茶を飲みます$kt$, array[$kt$友達はお茶を飲みます$kt$]::text[], $kt$友達はお茶を飲みます (Tomodachi wa ocha o nomimasu → Mon ami boit du thé).$kt$),
  (34, 2, $kt$Lisez à voix haute les phrases suivantes formulées au style familier et restituez leur équivalent strict au style poli de politesse ( masu) : 私は何も言わない。 (Note : 何も = rien) →$kt$, $kt$私は何も言いません$kt$, array[$kt$私は何も言いません$kt$]::text[], $kt$私は何も言いません (Watashi wa nani mo iimasen → Je ne dis rien).$kt$),
  (35, 1, $kt$Écoutez l’extrait audio simulé d’une interaction à voix haute et déterminez le registre exact employé par le locuteur : „Ashita, kuru ?“ → □ Style Poli      □ Style Familier$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (35, 2, $kt$Écoutez l’extrait audio simulé d’une interaction à voix haute et déterminez le registre exact employé par le locuteur : „Uchi ni kaerimasu.“ → □ Style Poli       □ Style Familier$kt$, $kt$$kt$, '{}'::text[], $kt$Corrigé non fourni dans le manuel : vérifiez votre réponse avec la théorie du cours.$kt$),
  (36, 1, $kt$Tâche écrite (Production) : Rédigez un dialogue informel composé de 3 répliques courtes entre deux étudiants en carac- tères japonais combinés (Kanji et Kana sans espaces) : textit”A : Tu lis ce livre ? B : Non, je ne le lis pas. Je mange.” Script de dialogue familier court Réplique A : textbfRéplique B :$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : A : この本、読むの？ textbfB : うーん、読まない偏食ご飯を食べる。 → うーん、読まない。ご飯を食べる。 Tâche orale (La bascule de registres dynamique) : Imaginez que vous êtes en poste dans un bureau à Tokyo. Vous vous adressez dans un premier temps à votre supérieur hiérarchique direct au style poli de courtoisie („Osaaki ni shitsurei shimasu. Watashi wa uchi e kaerimasu.“). Puis, vous vous tournez immédiatement vers votre collègue proche ou votre camarade pour basculer instantanément au style informel de rue („Jaa ne ! Ima kara kaeru yo. Ocha nomu ? Issho ni iku ?“). Prenez la parole à voix haute sans aucune note pendant 3 minutes complètes en continu en simulant cette double interaction : — Registre Poli (Hiérarchie) : 「お先に失礼します。私は家へ帰ります。お茶を飲みます。」 — Registre Familier (Ami) : 「じゃあね！今から帰るよ . お茶飲む？一緒に行く？」Conseil de fluidité pro (2029) : La forme courte du dictionnaire exige un débit très net, franc et percutant. Ne traînez pas de manière indécise sur la voyelle finale de 書く (kaku) ou読む ( 読む ). Le mot doit s’interrompre de manière sèche et dynamique. Répétez cet exercice de bascule linguistique 5 fois de suite jusqu’à éliminer toute friction cognitive lors du saut de registre.$kt$),
  (38, 1, $kt$Lisez à haute voix les phrases suivantes et isolez leur verbe d’origine à la forme polie ( masu) : 友達に会いたいです。 → Vient du verbe                                        ます。$kt$, $kt$会います$kt$, array[$kt$会います$kt$]::text[], $kt$会います (aimasu - rencontrer / voir quelqu’un).$kt$),
  (38, 2, $kt$Lisez à haute voix les phrases suivantes et isolez leur verbe d’origine à la forme polie ( masu) : お茶を飲むつもりです。 → Vient du verbe                                          ます。$kt$, $kt$飲みます$kt$, array[$kt$飲みます$kt$]::text[], $kt$飲みます (nomimasu - boire).$kt$),
  (39, 1, $kt$„Nihon ni ikitai desu.“ → □ Souhait simple         □ Intention ferme programmée$kt$, $kt$Souhait simple$kt$, array[$kt$Souhait simple$kt$]::text[], $kt$Souhait simple (Formulation d’un rêve ou d’une envie : ”Je voudrais aller au Japon”).$kt$),
  (39, 2, $kt$„Nihon ni iku tsumori desu.“ → □ Souhait simple           □ Intention ferme programmée$kt$, $kt$Intention ferme programmée$kt$, array[$kt$Intention ferme programmée$kt$]::text[], $kt$Intention ferme programmée (Formulation d’une décision planifiée : ”J’ai l’intention d’aller au Japon”).$kt$),
  (40, 1, $kt$Tâche écrite (Production) : Rédigez un paragraphe composé de 3 phrases fluides décrivant vos projets d’avenir en carac- tères japonais combinés (Kanji et Kana sans espaces) : ”L’année prochaine, je veux aller au Japon. J’ai l’intention de travailler dans une entreprise. Je veux rencontrer des amis.” Script de feuille de route professionnelle$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 来年、日本に行きたいです。会社で働くつもりです。友達に会いたいです。 Tâche orale (Le pitch de carrière « Horizon 2029 ») : Imaginez que vous présentez vos ambitions professionnelles devant un enseignant ou un employeur potentiel lors d’un entretien à Tokyo. Adoptez une posture droite, un ton posé, un débit régulier et prenez la parole à voix haute sans aucune note pendant 3 minutes complètes (performance chronométrée) : „Watashi wa 2029 nen ni Nihon no kaisha de hataraku tsumori desu. Nihongo ga daisuki desu kara, mainichi benkyō shimasu. Rainen Nihon he itte, atarashii tomodachi ni aitai desu. Yoroshiku onegai shimasu.“ (J’ai l’intention de travailler dans une entreprise japonaise en 2029. Comme j’adore la langue japonaise, j’étudie tous les jours. L’année prochaine, je veux me rendre au Japon et je souhaite rencontrer de nouveaux amis. Je m’en remets à votre bienveillance.) Conseil de fluidité pro : La structure d’intention つもりです ( tsumori desu) doit se lier au verbe à l’infinitif de manière parfaitement continue, sans aucun silence vocal. Évitez la coupure hataraku | pause | tsumori desu. Le bloc 働くつもりです doit être émis d’un seul élan rythmique : [hataraku tsumori desu]. Veillez également à bien nasaliser la particule de sujet が (ga) après votre objet de désir. Répétez ce pitch 5 fois pour parfaire l’enchaînement.$kt$),
  (42, 1, $kt$Lisez à haute voix les phrases suivantes au style continu et identifiez le groupe ainsi que le verbe d’origine de l’action fléchie : 漢字が書けます。               (Note : 漢字 = Kanji) → Vient du verbeます。$kt$, $kt$書きます$kt$, array[$kt$書きます$kt$]::text[], $kt$書きます (kakimasu - écrire / Verbe du Groupe 1).$kt$),
  (42, 2, $kt$Lisez à haute voix les phrases suivantes au style continu et identifiez le groupe ainsi que le verbe d’origine de l’action fléchie : 一人で来られます。 (Note : 一人で = seul/e) → Vient du verbeます。$kt$, $kt$来ます$kt$, array[$kt$来ます$kt$]::text[], $kt$来ます (kimasu - venir / Verbe du Groupe 3).$kt$),
  (43, 1, $kt$„Eigo o hanashimasu.“ → □ Action simple / fait habituel          □ Capacité potentielle$kt$, $kt$Action simple / fait habituel$kt$, array[$kt$Action simple / fait habituel$kt$, $kt$Action simple fait habituel$kt$, $kt$Action simple$kt$, $kt$fait habituel$kt$]::text[], $kt$Action simple / fait habituel (Enoncé de fait : ”Je parle anglais”).$kt$),
  (43, 2, $kt$„Eigo ga hanasemasu.“ → □ Action simple / fait habituel           □ Capacité potentielle$kt$, $kt$Capacité potentielle$kt$, array[$kt$Capacité potentielle$kt$]::text[], $kt$Capacité potentielle (Validation de compétence portée par la structure hanasemasu → ”Je sais / je peux parler anglais”).$kt$),
  (44, 1, $kt$Tâche écrite (Production) : Rédigez un paragraphe de synthèse de vos compétences professionnelles composé de 4 phrases distinctes en caractères japonais combinés, de façon continue et sans espaces : textit”Je peux parler anglais et japonais. Je peux écrire les Kanji. Je suis doué pour l’ordinateur. L’année prochaine, j’ai l’intention de travailler au Japon.” Script de pitch de compétences$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 私は英語と日本語が話せます。漢字が書けます。パソコンが上手です。来年、日本で働 くつもりです。 Tâche orale (La simulation d’entretien d’embauche ―Pitch) : Imaginez que vous soutenez vos aptitudes techniques lors d’un entretien de recrutement par visioconférence avec Tokyo pour l’horizon 2029. Adoptez une posture professionnelle, un ton d’une politesse et d’une déférence corporatives irréprochables, un débit stable et énoncez votre présentation à voix haute sans notes pendant 2 minutes et 30 secondes en continu : „Hajimemashite. Watashi wa [Votre Nom] desu. Furansujin desu. Watashi wa eigo to nihongo ga hanasemasu. Kanji mo sukoshi yomemasu. Pasokon ga dekimasu kara, kaisha de hatarakitai desu. Rainen Nihon e iku tsumori desu. Yoroshiku onegai shimasu.“ Conseil de fluidité pro : La substitution de la particule d’objet direct を par la particuleが (ga) devant un verbe de forme potentielle doit s’opérer comme un automatisme immédiat. Évitez absolument la rupture hésitante Nihongo | pause | o... non, ga | hanasemasu. Le bloc nominal et potentiel 日本語が話せます doit être expulsé d’un seul et unique jet vocal fluide : [nihongoga hanasemasu]. Répétez ce pitch 5 fois pour éliminer toute friction mentale.$kt$),
  (46, 1, $kt$Lisez à haute voix les phrases suivantes formulées au style continu et identifiez clairement la condition temporelle ou hypothétique posée par l’auteur : 明日雨だったら、行きません。 →                                               だったら、いきません。$kt$, $kt$明 st 雨 → 明日雨$kt$, array[$kt$明 st 雨 → 明日雨$kt$]::text[], $kt$明 st 雨 → 明日雨 ( あしたあめ - ashita ame → S’il pleut demain).$kt$),
  (46, 2, $kt$Lisez à haute voix les phrases suivantes formulées au style continu et identifiez clairement la condition temporelle ou hypothétique posée par l’auteur : 日本に行ったら、友達に会いたいです。 →                                                     にいったら、ともだちにあいたいです。$kt$, $kt$日本$kt$, array[$kt$日本$kt$]::text[], $kt$日本 ( にほん - Nihon → Quand je me rendrai au Japon / à mon arrivée au Japon).$kt$),
  (47, 1, $kt$„Eigo ga hanasetara...“ → Si je □ lis l’anglais     □ peux parler anglais$kt$, $kt$peux parler anglais$kt$, array[$kt$peux parler anglais$kt$]::text[], $kt$peux parler anglais (Combinaison morphologique de la forme potentielle et de la flexion conditionnelle hanasetara).$kt$),
  (47, 2, $kt$„Jikan ga attara...“ → Si □ j’ai du temps       □ je n’ai pas le temps    (where じかん = le temps)$kt$, $kt$j’ai du temps$kt$, array[$kt$j’ai du temps$kt$]::text[], $kt$j’ai du temps (Enoncé d’existence de la ressource temporelle portée par attara).$kt$),
  (48, 1, $kt$Tâche écrite (Production) : Rédigez un paragraphe composé de 4 phrases complexes et articulées en caractères japonais combinés (Kanji et Kana sans espaces) : textit”Si j’ai du temps demain, je lirai un livre. Si c’est bon marché, j’ai l’intention d’acheter cette voiture. Je veux aller au Japon.” Essai projectif écrit (Bilan Bloc 4)$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 明日時間があったら、本を読みます。安かったら、この車を買うつもりです。日本に行 きたいです。 Tâche orale (La soutenance projective ―Pitch 2029) : Imaginez que vous présentez votre feuille de route personnelle et professionnelle devant un jury d’évaluation ou des collaborateurs à Tokyo. Détachez-vous de toute note écrite. Adoptez une posture digne, un ton souverain, un débit stable et prenez la parole à voix haute pendant 3 minutes complètes en continu (performance chronométrée) : „Watashi wa 2029 nen ni Nihon no kaisha de hataraku tsumori desu. Nihongo ga jōzu dattara, atarashii shigoto ga dekimasu. Moshi jikan ga attara, mainichi kanji o benkyō shimasu. Rainen Nihon ni ittara, tomodachi ni aitai desu. Yoroshiku onegai shimasu.“ (J’ai l’intention de travailler dans une entreprise japonaise en 2029. Si je suis doué(e) en japonais, je pourrai accomplir un nouveau travail. Si par hasard j’ai du temps, j’étudierai les Kanji tous les jours. L’année prochaine, quand j’irai au Japon, je veux rencontrer des amis. Je m’en remets à votre bienveillance.) Conseil de fluidité pro : Le suffixe conditionnel ～たら ( tara) exige un enchaînement rythmique parfait, sans aucun à-coup, avec le radical verbal ou adjectival. Le bloc complexe 行ったら (ittara) ou 安かったら (yasukattara) doit faire office de pivot mélodique : faites monter très légèrement votre intonation de voix sur la finale pour marquer la suspension hypothétique, marquez une micro-respiration salvatrice, puis délivrez la conséquence d’un seul jet vocal unifié. Répétez ce grand exercice 5 fois pour éliminer les hésitations d’improvisation et archiver définitivement ce bloc. CHAPITRE 4 BLOC 4 : Vers l’autonomie nuancée & objectif B2$kt$),
  (50, 1, $kt$Lisez à haute voix les phrases suivantes au style continu et isolez la proposition portant l’opinion ou la parole rapportée : 先生は日本語の文法が面白いと言っていました。                                (Note : 面白い [おもしろい ] = intéressant)$kt$, $kt$Paroles de l’enseignant : 日本語の文法が面白い$kt$, array[$kt$Paroles de l’enseignant : 日本語の文法が面白い$kt$]::text[], $kt$Paroles de l’enseignant : 日本語の文法が面白い (La grammaire japonaise est intéressante).$kt$),
  (50, 2, $kt$Lisez à haute voix les phrases suivantes au style continu et isolez la proposition portant l’opinion ou la parole rapportée : 明日友達に会えないと思います。                        (Note : 会えない = forme potentielle négative courte)$kt$, $kt$Opinion personnelle : 明日友達に会えない$kt$, array[$kt$Opinion personnelle : 明日友達に会えない$kt$]::text[], $kt$Opinion personnelle : 明日友達に会えない (Je ne pourrai pas rencontrer mon ami demain).$kt$),
  (51, 1, $kt$„Tanaka-san wa kimasen.“ → □ Certitude factuelle directe          □ Opinion / Incertitude polie$kt$, $kt$Certitude factuelle directe$kt$, array[$kt$Certitude factuelle directe$kt$]::text[], $kt$Certitude factuelle directe (Énoncé d’un fait brut : ”M. Tanaka ne viendra pas”).$kt$),
  (51, 2, $kt$„Tanaka-san wa konai to omoimasu.“ → □ Certitude factuelle directe             □ Opinion / Incertitude polie$kt$, $kt$Opinion / Incertitude polie$kt$, array[$kt$Opinion / Incertitude polie$kt$, $kt$Opinion Incertitude polie$kt$, $kt$Opinion$kt$, $kt$Incertitude polie$kt$]::text[], $kt$Opinion / Incertitude polie (Nuance de jugement portée par la balise de citation : ”Je pense que M. Tanaka ne viendra pas”).$kt$),
  (52, 1, $kt$Tâche écrite (Production) : Rédigez un mémo de compte-rendu composé de 2 phrases complexes en caractères japonais combinés, de façon continue et sans espaces : ”Le directeur a dit qu’il lirait ce rapport demain. Mais je pense qu’il ne le lira pas, car il est très occupé ce mois-ci.” — Aide lexicale : Rapport = 報告書 ( ほうこくしょ - hōkokusho), Occupé = 忙しい ( い そがしい - isogashii). Mémo de synthèse de réunion$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 社長は明日この報告書を読むと言っていました。しかし、今月はとても忙しいですか ら、読まないと思います。 Tâche orale (La restitution de réunion de projet) : Imaginez que vous restituez de manière synthétique les positions de votre équipe lors d’un débriefing devant un cadre dirigeant de l’entreprise. Adoptez une posture professionnelle soignée, un débit constant et énoncez vos répliques à voix haute sans aucune note pendant 2 minutes et 30 secondes en continu : „Tanaka-san wa rainen Nihon no kaisha de hatarakanai to itte imashita ga, watashi wa kare ga kuru to omoimasu. Nihongo ga jōzu desu kara, shigoto ga dekimasu yo. 2029 nen no keikaku wa benri da to omoimasu.“ (M. Tanaka a dit qu’il ne travaillerait pas dans l’entreprise japonaise l’année prochaine, mais moi je pense qu’il viendra. Comme il est doué en japonais, il est tout à fait capable de faire le travail, je vous l’assure. Je pense que le plan pour 2029 est pratique.) Conseil de fluidité pro : La particule de citation と (to) doit être fusionnée rythmiquement avec le verbe qui lui succède. Le bloc verbal 読まないと思います (yomanai to omoimasu) doit être articulé comme un unique fleuve phonétique continu : [yomanaito omoimasu]. Ne marquez aucun temps mort ou blanche de réflexion entre la forme courte neutre et le verbe de pensée. Répétez ce compte-rendu 5 fois de suite pour stabiliser l’Okurigana.$kt$),
  (54, 1, $kt$Lisez à haute voix les phrases suivantes au style continu et isolez le nom noyau qualifié par la proposition relative : 田中さんが読む本は高いです。 → Nom noyau :$kt$, $kt$本$kt$, array[$kt$本$kt$]::text[], $kt$本 ( ほん - hon = Le livre → Le livre que M. Tanaka lit est cher).$kt$),
  (54, 2, $kt$Lisez à haute voix les phrases suivantes au style continu et isolez le nom noyau qualifié par la proposition relative : 昨日行った駅は大きかったです。 → Nom noyau :$kt$, $kt$駅$kt$, array[$kt$駅$kt$]::text[], $kt$駅 ( えき - eki = La gare → La gare où je suis allé hier était grande).$kt$),
  (55, 1, $kt$„Tomodachi ga mita terebi...“ → L’entité qualifiée est □ L’ami     □ La télévision$kt$, $kt$La télévision$kt$, array[$kt$La télévision$kt$]::text[], $kt$La télévision (Phrase relative : ”La télévision que mon ami a regardée”).$kt$),
  (55, 2, $kt$„Watashi ga hataraku kaisha...“ → L’entité qualifiée est □ Moi     □ L’entreprise$kt$, $kt$L’entreprise$kt$, array[$kt$L’entreprise$kt$]::text[], $kt$L’entreprise (Phrase relative : ”L’entreprise dans laquelle je travaille”).$kt$),
  (56, 1, $kt$Tâche écrite (Production) : Rédigez un paragraphe de description technique composé de 3 phrases complexes en carac- tères japonais combinés, de manière continue et sans aucun espace : ”Ceci est le livre que j’ai lu le mois dernier. C’est un livre très célèbre. L’ami attentionné que j’ai rencontré à la gare me l’a donné.” — Aide lexicale : Donner / Offrir (à moi) = くれました (kuremashita). Notice descriptive d’infrastructure$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : これは私が先月読んだ本です。とても有名な本です。駅で会った親切な友達がくれまし た Lights. → 是私が先月読んだ本です。とても有名な本です。駅で会った親切な友 達がくれました。 Tâche orale (La présentation d’infrastructure) : Imaginez que vous décrivez votre environnement d’étude ou les infrastructures clés de votre entreprise devant des partenaires ou auditeurs japonais. Adoptez un débit régulier, un ton professionnel et prenez la parole à voix haute sans notes pendant 2 minutes et 30 secondes en continu : „Kore wa watashi ga mainichi hataraku kaisha desu. Eki no mae ni aru benri na kaisha desu yo. Kinō katta hon wa kono kaisha no naka ni arimasu. Ano shinsetsu na hito ga yonda hon desu.“ (Ceci est l’entreprise dans laquelle je travaille tous les jours. C’est une entreprise pratique qui se trouve juste devant la gare, je vous l’assure. Le livre que j’ai acheté hier se trouve à l’intérieur de cette entreprise. C’est le livre qu’a lu cette personne attentionnée là-bas.) Conseil de fluidité pro : L’enchaînement syntaxique entre le verbe au style court et le nom noyau qu’il modifie doit être immédiat, fondu et parfaitement continu. Dans l’expression 毎日働く会社 (mainichi hataraku kaisha), ne marquez aucun temps d’arrêt ou pause respiratoire après la finale hataraku. Le flux verbal doit glisser d’un seul jet rythmique compact : [hatarakukaisha]. Veillez également à ce que la particule が (ga) du sujet enchâssé soit légère et brève. Répétez cette présentation 5 fois de suite pour stabiliser l’architecture relative.$kt$),
  (58, 1, $kt$Lisez à haute voix les propositions professionnelles suivantes au style continu et déterminez si le bloc verbal exprime le Respect (Sonkeigo) ou la Modestie (Kenjougo) : 社長はお茶を召し上がります。 →$kt$, $kt$Respect / Sonkeigo$kt$, array[$kt$Respect / Sonkeigo$kt$, $kt$Respect Sonkeigo$kt$, $kt$Respect$kt$, $kt$Sonkeigo$kt$]::text[], $kt$Respect / Sonkeigo (Le directeur général prend / boit du thé ; l’action du supérieur est surélevée).$kt$),
  (58, 2, $kt$Lisez à haute voix les propositions professionnelles suivantes au style continu et déterminez si le bloc verbal exprime le Respect (Sonkeigo) ou la Modestie (Kenjougo) : 私はマリーと申します。 →$kt$, $kt$Modestie / Kenjougo$kt$, array[$kt$Modestie / Kenjougo$kt$, $kt$Modestie Kenjougo$kt$, $kt$Modestie$kt$, $kt$Kenjougo$kt$]::text[], $kt$Modestie / Kenjougo (Je m’appele humblement Marie ; l’action du locuteur est rabaissée).$kt$),
  (59, 1, $kt$Cerne „Eki ni irasshaimasu.“→ Équivaut à □ 食べます               □ います / 行きます / 来ます$kt$, $kt$います / 行きます / 来ます$kt$, array[$kt$います / 行きます / 来ます$kt$, $kt$います 行きます 来ます$kt$, $kt$います$kt$, $kt$行きます$kt$, $kt$来ます$kt$]::text[], $kt$います / 行きます / 来ます (Selon le contexte de la phrase, ici : Le client se trouve ou se rend à la gare).$kt$),
  (59, 2, $kt$„Mairimasu.“ → Équivaut à □ 行きます / 来ます                    □ 読みます$kt$, $kt$行きます / 来ます$kt$, array[$kt$行きます / 来ます$kt$, $kt$行きます 来ます$kt$, $kt$行きます$kt$, $kt$来ます$kt$]::text[], $kt$行きます / 来ます (Je me rends ou je viens de manière humble et modeste).$kt$),
  (60, 1, $kt$Tâche écrite (Production) : Rédigez un courriel professionnel de 3 phrases fluides en écriture japonaise native sans es- paces : ”Tanaka-sama, j’ai l’intention de me rendre à la gare demain. S’il vous plaît, prenez ce thé vert. Je m’appelle [Votre Nom].” Courriel d’affaires formel$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 田中様、私は明日駅へ参るつもりです。お茶を召し上がってください。私は[Votre Nom]と申します。 Tâche orale (La soutenance face au client senior) : Imaginez que vous présentez les conclusions d’une revue de projet ou d’architecture d’ingénierie devant le directeur général de votre entreprise partenaire à Tokyo. Adoptez une posture formelle soignée, un ton mesuré, un débit stable et énoncez vos répliques à voix haute sans notes de manière continue : „Tanaka-sama, hajimemashite. Watashi wa [Votre Nom] to mōshimasu. Shachō wa ashita rainen no keikaku ni tsuite osshaimasu. Watashi wa ashita kaisha e mairimasu. Yoroshiku onegai shimasu.“ (Tanaka-sama, enchanté(e). Je m’appelle humblement [Nom]. Le président s’exprimera demain au sujet du plan de l’année prochaine. Je me rendrai humblement à l’entreprise demain. Je m’en remets à votre entière bienveillance.) Conseil de fluidité pro (2029) : Les blocs verbaux comme 召し上がります (meshiagarimasu) ou いらっしゃいます (irasshaimasu) ne doivent souffrir d’aucun ralentissement de débit. Ne hachez pas les syllabes. Le groupe conjugué いらっしゃいました doit sortir d’un seul élan articulatoire continu : [irasshaimashita]. Veillez à ce que le passage du Sonkeigo au Kenjougo s’opère sans friction cognitive. Répétez l’ensemble 5 fois pour verrouiller l’automatisme.$kt$),
  (61, 1, $kt$Rédigez la phrase complexe suivante en écriture japonaise native sans espaces : ”Le directeur de l’entreprise a dit qu’il lirait le rapport que j’ai écrit hier.” — Aide lexicale : Directeur = 社長 , hier = 昨日 , je = 私 , écrire = 書いた , rapport =報告書 , lire = 読む , dire que = と言っていました . Espace d’écriture de synthèse$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 社長は私が昨日書いた報告書を読むと言っていました。 Analyse : La proposition relative interne court 私が昨日書いた qualifie de manière directe le nom noyau 報告書 qui lui succède.$kt$),
  (62, 1, $kt$Répondez par Vrai ou Faux d’après le texte d’évaluation ci-dessus : Tanaka-sama pense que le plan préparé le mois dernier est pratique.$kt$, $kt$Vrai$kt$, array[$kt$Vrai$kt$]::text[], $kt$Vrai (Proposition textuelle : 計画はとても便利だと言っていました → ”A dit que le plan était très pratique”).$kt$),
  (62, 2, $kt$Répondez par Vrai ou Faux d’après le texte d’évaluation ci-dessus : L’auteur étudie le japonais car il a l’intention de travailler au Japon l’année prochaine.$kt$, $kt$Vrai$kt$, array[$kt$Vrai$kt$]::text[], $kt$Vrai (Proposition textuelle : 来年日本の会社で働くつもりですから → ”Parce que j’ai l’intention de travailler dans une entreprise japonaise l’année prochaine”).$kt$),
  (62, 3, $kt$Consigne : Lisez le texte continu suivant à voix haute, identifiez les articulations grammaticales et analysez sa structure de subordination : 「田中様は私が先月作った計画はとても便利だと言っていました。来年日本の会社 で働くつもりですから、毎日日本語を一生懸命勉強しています。」 (Note : 一生懸命 [ いっしょうけんめい - isshōkenmei] = de toutes ses forces / avec ardeur).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (63, 1, $kt$Répondez à la question suivante d’après le script audio extrait du laboratoire : Pour quelle raison l’ingénieur prépare-t-il les documents ( 資料 ) ? →$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 来週田中様にお目に掛かりますから (Analyse : ”Parce qu’il va rencontrer Tanaka-sama la semaine prochaine” → emploi régulier de la forme modeste Kenjougo omenikakarimasu).$kt$)
) as x(course_number, pos, prompt, expected, accepted, explanation)
join public.language_courses c
  on c.language = 'Japonais' and c.course_number = x.course_number;

commit;

-- Contrôle (à lancer après) : doit afficher 64 cours et 82 exercices du manuel
-- select count(*) from public.language_courses where language = 'Japonais';
-- select count(*) from public.language_exercises e join public.language_courses c on c.id = e.course_id
--   where c.language = 'Japonais' and e.origin = 'manual';
