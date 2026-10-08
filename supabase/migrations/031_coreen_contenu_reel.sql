-- Keltia : contenu réel des 48 cours de coréen (source : manuel Coreen.pdf).
-- Cible uniquement la bibliothèque Plan & Plate (language_courses / language_exercises).
-- Ne touche PAS au planning (weekly_schedule_items).
-- Relançable sans risque : les cours sont mis à jour par (language, course_number),
-- les exercices du manuel sont recréés, les exercices ajoutés par les membres sont conservés.

begin;

-- 1) Cours : titre, objectif, théorie et exemples réels ; plus de « Semaine X » (hors planning)
insert into public.language_courses (language, course_number, title, summary, theory, examples, week_number)
values
  ('Coréen', 1, $kt$Cours 1 · Les combinaisons complexes du Hangeul$kt$, $kt$Les extensions du système$kt$, $kt$Phonétique & Écriture : Les extensions du système
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
Entraînement pratique : Placez votre main devant votre bouche. Lorsque vous prononcez 코 (nez – aspiré), vous devez sentir un souffle d’air net. Lorsque vous prononcez 꼬리 (queue – consonne double), aucun air ne doit s’échapper. Répétez à voix haute : 가 (simple) → 카 (aspiré) → 까 (double).$kt$, $kt$Exemple : 방 (chambre) vs 빵 (pain – son tendu ﾳ ).$kt$, null),
  ('Coréen', 2, $kt$Cours 2 · Le secret du Batchim (받침 ) et les liaisons$kt$, $kt$Les règles de la consonne finale$kt$, $kt$Grammaire & Phonétique : Les règles de la consonne finale
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
Exemple 2 : 집에 (À la maison) s’écrit 집 - 에 mais se prononce [지베 ] (ji-bé).$kt$, $kt$Exemple 1 : 한국어 (Langue coréenne) s’écrit 한 - 국 - 어 mais se prononce oralement [한구 거 ] (Han-gu-gco). · Exemple 2 : 집에 (À la maison) s’écrit 집 - 에 mais se prononce [지베 ] (ji-bé).$kt$, null),
  ('Coréen', 3, $kt$Cours 3 · Présentations officielles (Style Poli-Formel)$kt$, $kt$L’affirmation de courtoisie$kt$, $kt$Grammaire & Syntaxe : L’affirmation de courtoisie
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
— 회사원 : Employé de bureau$kt$, $kt$$kt$, null),
  ('Coréen', 4, $kt$Cours 4 · La structure SOV et la particule d’objet (을 ̃/를 )$kt$, $kt$L’architecture de la phrase coréenne$kt$, $kt$Grammaire & Syntaxe : L’architecture de la phrase coréenne
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
— 마시다 : Boire (radical : 마시 )$kt$, $kt$Exemple de phrase SOV : 저는책을읽습니다 . (Je [thème] + livre [objet] + lis [poliformel] = Je lis un livre).$kt$, null),
  ('Coréen', 5, $kt$Cours 5 · Le duel des particules : Thème (은 ̃/는 ) vs Sujet (이 ̃/가 )$kt$, $kt$Distinguer le cadre de l’action de son auteur$kt$, $kt$Grammaire : Distinguer le cadre de l’action de son auteur
Savoir faire la différence entre la particule de thème et celle de sujet est l’un des piliers majeurs pour s’exprimer couramment en coréen.
— La particule de thème (은 ̃/는 ) : Elle pose le cadre général, le sujet de conversation global. Elle équivaut à “En ce qui concerne [X]” ou sert à marquer un contraste.
Exemple : 이름이무엇입니까 ? 저는미나입니다 . (Quel est votre nom ? En ce qui me concerne, je suis Mina).
— La particule de sujet (이 ̃/가 ) : Elle désigne l’auteur précis de l’action. On l’utilise pour apporter une information nouvelle ou répondre à la question spécifique “Qui ?”.
가 s’emploie après une voyelle ( 미나가 ) et 이 après une consonne finale ( 학생이 ).
Exemple : 누가커피를마십니까 ? 제가마십니다 . (Qui boit du café ? C’est moi qui bois.
Note : 저 + 가 devient 제가 ).

Compréhension Orale : Script du laboratoire d’écoute
Dialogue court dans un contexte professionnel lors d’une première rencontre.$kt$, $kt$지훈 : 안녕하세요 ? 저는이지훈입니다 . 이름이무엇입니까 ? · 미나 : 안녕하세요 ? 저는김미나입니다 . · 지훈 : 미나씨는학생입니까 ? · 미나 : 아니요 , 저는회사원입니다 . 지훈씨는무슨일을하십니까 ? · 지훈 : 제가프로그래머입니다 .$kt$, null),
  ('Coréen', 6, $kt$Cours 6 · Le style poli-informel (아 ̃ 요/어요 ) au présent$kt$, $kt$La conjugaison usuelle de la vie courante$kt$, $kt$Grammaire : La conjugaison usuelle de la vie courante
Le style poli-informel est le niveau de politesse le plus fréquent et indispensable pour la fluidité au quotidien. Pour conjuguer au présent, on extrait le radical du verbe (sans 다 ) et on applique trois règles selon la dernière voyelle :

Règles de conjugaison du présent usuel

1. Voyelle ￂ (a) ou ￌ (o) → on ajoute 아 ̃ 요 (a-yo)
가다 (aller) → radical 가 + 아요 → 가요 (fusion phonétique).
보다 (regarder) → radical 보 + 아요 → 봐요 (contraction de ￌ + 아 ).

Toutes les autres voyelles → on ajoute 어 ̃ 요 (eo-yo)
먹다 (manger) → radical 먹 + 어요 → 먹어요 (prononciation liée : 머거요 ).
마시다 (boire) → 마시 + 어요 → 마셔요 (contraction de ￜ + 어 → ￊ ).

Tous les verbes se terminant en 하다 → deviennent 해 ̃ 요 (hae-yo)
공부하다 (étudier) → 공부해요 / 운동하다 (faire du sport) → 운동해요 .$kt$, $kt$$kt$, null),
  ('Coréen', 7, $kt$Cours 7 · L’existence, la non-existence et la localisation$kt$, $kt$있다 vs 없다$kt$, $kt$Grammaire & Syntaxe : 있다 vs 없다
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
— 친구 : Ami(e)$kt$, $kt$$kt$, null),
  ('Coréen', 8, $kt$Cours 8 · La gymnastique des deux systèmes de chiffres$kt$, $kt$Chiffres sino-coréens vs Chiffres coréens purs$kt$, $kt$Grammaire : Chiffres sino-coréens vs Chiffres coréens purs
Le coréen intègre deux systèmes numériques distincts. Pour atteindre une fluidité authentique, vous devez automatiser les contextes d’utilisation de chacun.

Les deux systèmes numériques

A. Les chiffres sino-coréens (D’origine chinoise) :
Usage : Les prix (l’argent), les numéros de téléphone, les minutes, les mois, les étages.
Les bases (1-10) : 일 (1), 이 (2), 삼 (3), 사 (4), 오 (5), 육 (6), 칠 (7), 팔 (8), 구 (9), 십 (10). 백 (100), 천 (1000), 만 (10000).

B. Les chiffres coréens purs (D’origine autochtone) :
Usage : L’âge, les heures, et le comptage d’éléments concrets via des spécificateurs. Les bases (1-10) : 하나 (1), 둘 (2), 셋 (3), 넷 (4), 다섯 (5), 여덟 (6), 일곱 (7), 여덟 (8), 아홉 (9), 열 (10). 스물 (20).
Règle de modification : Devant un compteur, 1, 2, 3, 4 et 20 changent de forme → 한 (1), 두 (2), 세 (3), 네 (4), 스무 (20).

Compréhension Orale : Script du laboratoire d’écoute
Interaction commerciale entre un client et une marchande sur un marché traditionnel de Séoul.$kt$, $kt$손님 : 이사과얼마예요 ? (Combien coûte cette pomme ?) · 주인 : 한개에 천오백원이에요 . (C’est 1500 wons l’unité.) · 손님 : 사과 세개주세요 . 그리고물 두병주세요 . (Donnez-moi 3 pommes et 2 bouteilles d’eau, s’il vous plaît.) · 주인 : 네 , 여기있습니다 . 모두 오천원입니다 . (Oui, voici. Le tout fait 5000 wons.)$kt$, null),
  ('Coréen', 9, $kt$Cours 9 · Commander au restaurant et faire des demandes (주 ̃ 세요 )$kt$, $kt$La requête polie avec 주 ̃ 세요 (Ju-sé-yo)$kt$, $kt$Grammaire & Syntaxe : La requête polie avec 주 ̃ 세요 (Ju-sé-yo)
La structure [Substantif] + 주세요 signifie littéralement “Donnez-moi [X], s’il vous plaît”. C’est la formule clé pour commander ou acheter de manière courante.
— L’ordre des mots pour le décompte : Pour insérer une quantité, l’architecture naturelle de la phrase suit l’ordre suivant : [Nom] + [Chiffre coréen pur] + [Compteur] + 주세요 .

— Ejemplo : 커피한잔주세요 . (Café + un + tasse + donnez-moi = Donnez-moi une tasse de café, s’il vous plaît).

Lexique des compteurs et de la restauration
— 개 : Compteur général pour les objets inanimés (pommes, pains, etc.)
— 잔 : Compteur pour les verres, tasses et tasses de boisson (café, thé)
— 병 : Compteur pour les liquides en bouteille
— 명 : Compteur pour les êtres humains (amis, collègues)
— 메뉴판 : La carte / le menu du restaurant
— 비빔밥 : Le Bibimbap (plat coréen traditionnel)$kt$, $kt$$kt$, null),
  ('Coréen', 10, $kt$Cours 10 · L’expression du temps et la particule 에 ̃$kt$, $kt$Le marquage temporel$kt$, $kt$Grammaire & Syntaxe : Le marquage temporel
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
— 시 : L’heure (s’utilise obligatoirement avec les chiffres coréens purs : 한시 = 1h, 두시 = 2h).$kt$, $kt$$kt$, null),
  ('Coréen', 11, $kt$Cours 11 · La conjugaison au passé ( 았 ̃ 어요/었어요 )$kt$, $kt$La construction du passé usuel$kt$, $kt$Grammaire : La construction du passé usuel
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
Récit rétrospectif de Min-jun résumant ses activités du week-end passé.$kt$, $kt$민준 : 저는주말에친구를만났어요 . 토요일저녁에식당에갔어요 . 식당에서비빔밥을먹었어요 . 그 리고커피도마셨어요 . 일요일아침에는집에서한국어를공부했어요 . 주말이정말재미있었어요 !$kt$, null),
  ('Coréen', 12, $kt$Cours 12 · Grand Bilan du Bloc 1 (Récit et Routine)$kt$, $kt$Production narrative rétrospective$kt$, $kt$Atelier d’Expression Orale : L’allocution narrative continue

CHAPITRE 2$kt$, $kt$$kt$, null),
  ('Coréen', 13, $kt$Cours 13 · L’expression des projets et le futur ( ﾩ /̃ 을거예요 )$kt$, $kt$La construction du futur poli-informel$kt$, $kt$Grammaire & Syntaxe : La construction du futur poli-informel
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
— 부산 : Busan (deuxième plus grande métropole de Corée)$kt$, $kt$$kt$, null),
  ('Coréen', 14, $kt$Cours 14 · Les déplacements et l’itinéraire ( 로 ̃/으로 ,에̃서까̃지)$kt$, $kt$Les directions et les jalons de l’itinéraire$kt$, $kt$Grammaire : Les directions et les jalons de l’itinéraire
Complexifier la structure spatiale est une étape clé vers la fluidité. Le coréen emploie des particules spécifiques pour indiquer les bornes d’un déplacement et la direction d’un mouvement.
— La particule de direction 로 ̃ / 으 ̃ 로 : Elle indique la direction vers laquelle on se meut (ou le moyen de transport utilisé).
로 s’emploie après une voyelle ou la consonne basse ﾩ ( 서울로 ).
으로 s’emploie après une consonne ( 부산으로 , 오른쪽으로 → vers la droite).
— Les bornes de l’itinéraire (에 ̃ 서 ... 까 ̃ 지 ) : Signifie littéralement “de [Lieu A] ... jusqu’à [Lieu B]”.
Ejemplo : 집에서학교까지걸어가요 . (Je vais à pied de la maison jusqu’à l’école).

Compréhension Orale : Script du laboratoire d’écoute
Échange de planification logistique entre Min-ji et un ami préparant un itinéraire en Corée.$kt$, $kt$친구 : 내일어디에갈거예요 ? · 민지 : 내일 서울역에서부산역까지기차로갈거예요 . · 친구 : 부산역에서어디로갈거예요 ? · 미나 : 호텔로갈거예요 . 그리고바다에서운동할거예요 .$kt$, null),
  ('Coréen', 15, $kt$Cours 15 · Le laboratoire de planification de voyage à Séoul$kt$, $kt$Note de planification logistique$kt$, $kt$Consigne : Rédigez une note descriptive de 6 à 8 lignes en Hangeul résumant vos intentions de déplacement pour la semaine prochaine (villes traversées, bornes de l’itinéraire, transports utilisés). Vous devez obligatoirement intégrer : au moins deux verbes conjugués au futur ( ﾩ ̃/을거예요 ), une structure de délimitation d’itinéraire ( 에 ̃ 서 까 ̃ 지 ), et un marquage directionnel via la particule 로 ̃/으로 .

Consigne : Imaginez que vous décrivez vos projets de voyage de manière décontractée à un ami coréen. Sans regarder vos notes manuscrites, prenez la parole à voix haute pendant 2 minutes complètes en continu. Conseil de fluidité : Pour assurer un débit naturel, amalgamez le bloc verbal du futur sans coupure artificielle. 할거예요 doit s’assimiler phonétiquement comme [할꺼예요 ] (doublement du son k).$kt$, $kt$$kt$, null),
  ('Coréen', 16, $kt$Cours 16 · L’expression du désir ( 고 ̃ 싶다 )$kt$, $kt$Exprimer la volonté d’action$kt$, $kt$Grammaire & Syntaxe : Exprimer la volonté d’action
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
— 쇼핑하다 : Faire du shopping$kt$, $kt$$kt$, null),
  ('Coréen', 17, $kt$Cours 17 · Les propositions et invitations ( ﾩ ̃/을까 요 ?, 읍 ̃ 시다 )$kt$, $kt$Formuler des suggestions collectives et valider un projet$kt$, $kt$Grammaire : Formuler des suggestions collectives et valider un projet
Interagir de manière fluide nécessite de maîtriser l’art de la suggestion et de l’invitation conjointe.
— Formuler une proposition (ﾩ ̃/을까요 ?) : Équivaut à “Et si on... ?” ou “Que diraistu de... ?”.
ﾩ ̃ 까요 ? s’utilise après une voyelle : 가다 → 갈까요 ? (Et si on y allait ?). 을 ̃ 까요 ? s’utilise après une consonne (Batchim) : 먹다 → 먹을까요 ? (Et si on mangeait ?).
— Inviter ou acter une décision (읍 ̃ 시다 / ﾲ ̃ 시다 ) : Style poli-formel signifiant “Faisons cela / Allons-y”.
ﾲ ̃ 시다 après une voyelle ( 가다 → 갑시다 ) et 읍 ̃ 시다 après une consonne ( 먹다 → 먹읍시다 ).
Note d’oralité informelle : Entre amis très proches, on utilise la terminaison 자 ̃ ( 가 자 = allons-y).

Compréhension Orale : Script du laboratoire d’écoute
Planification d’une sortie de week-end lors d’un échange téléphonique entre Min-su et Yuna.$kt$, $kt$민수 : 유나씨 , 주말에시간이있어요 ? 같이영화를 볼까요 ? · 유나 : 네 , 좋아요 ! 저도영화를 보고싶었어요 . 무슨영화를 볼까요 ? · 민수 : 한국영화를 봅시다 . 영화관에몇시에 갈까요 ? · 유나 : 주말저녁여섯시에호텔앞에서 만납시다 .$kt$, null),
  ('Coréen', 18, $kt$Cours 18 · Le laboratoire de l’invitation et des sorties amicales$kt$, $kt$Script de dialogue interactif$kt$, $kt$Atelier d’Écriture : Script de dialogue interactif$kt$, $kt$et d’un lieu de rendez-vous). Vous devez obligatoirement intégrer : au moins deux structures de proposition ( ﾩ ̃/을까요 ?), deux expressions du désir ( 고 ̃ 싶다 ), et utiliser les marqueurs temporels et spatiaux adéquats ( 에 ̃).$kt$, null),
  ('Coréen', 19, $kt$Cours 19 · Donner des instructions polies et des ordres ( 세 ̃ 요 )$kt$, $kt$L’impératif poli de courtoisie$kt$, $kt$Grammaire & Syntaxe : L’impératif poli de courtoisie
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

— 앉다 : S’asseoir$kt$, $kt$$kt$, null),
  ('Coréen', 20, $kt$Cours 20 · Exprimer l’interdiction et la santé ( 지 ̃ 마세요 )$kt$, $kt$L’interdiction formelle polie$kt$, $kt$Grammaire : L’interdiction formelle polie
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
— 아프다 : Être malade / avoir mal (conjugaison usuelle au présent : 아파요 )$kt$, $kt$의사 : 어디가아픕니까 ? (Où avez-vous mal ?) · 환자 : 머리가너무아파요 . 그리고배도아파요 . (J’ai très mal à la tête. Et j’ai aussi mal au ventre.) · 의사 : 감기입니다 . 열이있어요 . 이약을 드세요 . (C’est un rhume. Vous avez de la fièvre. Prenez ce médicament, s’il vous plaît. Note : 드시다 est le terme honorifique pour 먹다 ). 그 리고오늘은 운동하지마세요 . 집에서쉬세요 . · 환자 : 네 , 감사합니다 .$kt$, null),
  ('Coréen', 21, $kt$Cours 21 · Le laboratoire de l’interaction médicale et des conseils de santé$kt$, $kt$Le script de la clinique$kt$, $kt$Consigne : Rédigez un dialogue de 8 à 10 répliques en Hangeul mettant en scène une consultation entre un médecin et un patient. Vous devez décrire vos symptômes (zones douloureuses comme la gorge 나 les yeux) et le médecin doit formuler deux consignes impératives positives ( 세 ̃ 요 ) ainsi qu’une interdiction formelle ( 지 ̃ 마세요 ). Mobilisez le lexique de la santé.

Consigne : Donnez de la voix en interprétant les deux rôles de votre script de manière fluide pendant 2 minutes et 30 secondes. Incarnez un ton fatigué pour le patient et une diction claire et directive pour le praticien. Conseil de fluidité : Soignez la resyllabation de la particule d’objet devant la voyelle. 약을 (médicament) s’écrit 약 - 을 mais doit glisser oralement comme [야글 ] (le ﾡ du bas monte).$kt$, $kt$$kt$, null),
  ('Coréen', 22, $kt$Cours 22 · Les connecteurs de coordination et d’opposition ( 고 ̃, 지 ̃ 만 )$kt$, $kt$L’art de lier les propositions complexes$kt$, $kt$Grammaire & Syntaxe : L’art de lier les propositions complexes
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
haute : „ 한국어는어렵지만 ↗, 재미있어요 ↘.“$kt$, $kt$$kt$, null),
  ('Coréen', 23, $kt$Cours 23 · Grand Bilan du Bloc 2$kt$, $kt$Analyse d’un texte de blog de voyage$kt$, $kt$Compréhension Écrite : Analyse d’un texte de blog de voyage

Compréhension Orale : Script du laboratoire d’écoute
Discussion informelle sur le cadre de vie urbain entre Ji-min et Yu-na.
지민 : 유나씨는서울생활이어때요 ?
유나 : 서울은참 복잡하지만문화생활이많아서좋아요 . 지민씨는요 ?
지민 : 저는서울에서주말에운동하고싶지만사람이너무많아요 . 그래서다음달에 부산으로이사할거 예요 . 부산은바다가있어서쉬고싶을때좋아요 .
유나 : 그렇군요 . 부산역까지 KTX 기차로가세요 !$kt$, $kt$„ 다음주에저는서울에갈거예요 . 서울역에서친구를만날거예요 . 우리는한국음식을먹고쇼핑도 하고싶어요 . 서울은아주복잡하지만교통이편리해요 . 주말에는서울에서부산까지기차로갈거예요 . 부산에서는바다를보고맛있는요리를먹으세요 !“$kt$, null),
  ('Coréen', 24, $kt$Cours 24 · Grand Laboratoire de débat argumenté écrit et oral$kt$, $kt$Essai d’argumentation comparative$kt$, $kt$Atelier d’Expression Orale : La soutenance de point de vue

CHAPITRE 3$kt$, $kt$$kt$, null),
  ('Coréen', 25, $kt$Cours 25 · L’expression de la cause (* 아/어서 *, * 기 때문에 *)$kt$, $kt$Expliquer le “Pourquoi”$kt$, $kt$Grammaire & Syntaxe : Expliquer le “Pourquoi”
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

— 날씨 : Le temps / la météo$kt$, $kt$$kt$, null),
  ('Coréen', 26, $kt$Cours 26 · Le climat, les émotions et les justifications$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Message audio d’explication envoyé sur une application de messagerie par Min-ho à sa collègue Ji-soo.

Banque de Vocabulaire Enrichi
— 차가막히다 : Y avoir des embouteillages / la circulation est bloquée
— 미안하다 : Être désolé / s’excuser
— 일찍 / 늦게 : Tôt / tard
— 춥다 : Faire froid (conjugaison de cause : 춥 + 어서 → 더부드럽게 추워서 – irrégulierﾲ)
— 덥다 : Faire chaud (conjugaison de cause : 덥 + 어서 → 더워서 )
— 기분 : L’humeur / l’état d’esprit ( 기분이좋다 = être de bonne humeur)$kt$, $kt$민호 : 지수씨 , 미안해요 . 제가오늘아침에조금 늦을거예요 . 지금밖에 비가많이와서차가너무막혀 요 . 그리고어제저녁에늦게까지일해서지금너무 피곤해요 . 미안하지만조금만기다려주세요 . 회사 에가서만나요 !$kt$, null),
  ('Coréen', 27, $kt$Cours 27 · Le laboratoire de l’explication et de la justification spontanée$kt$, $kt$Note formelle de justification$kt$, $kt$Atelier d’Écriture : Note formelle de justification

deux justifications claires (intempéries climatiques, fatigue accumulée, ou surcharge de travail). Vous devez impérativement intégrer : une structure causative en 아 ̃/어서 , une structure en 기 ̃ 때문에 , et mobiliser le vocabulaire du climat et des émotions.$kt$, $kt$$kt$, null),
  ('Coréen', 28, $kt$Cours 28 · L’expression de la capacité et de la possibilité (* ﾩ/을수있다/없다 *)$kt$, $kt$Pouvoir vs Ne pas pouvoir$kt$, $kt$Grammaire & Syntaxe : Pouvoir vs Ne pas pouvoir
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
— 태권도 : Le Taekwondo$kt$, $kt$$kt$, null),
  ('Coréen', 29, $kt$Cours 29 · Le monde professionnel et les compétences linguistiques$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Extrait d’un entretien de recrutement entre un directeur des ressources humaines (면접 관 ) et une candidate (지원자 ).

Banque de Vocabulaire Enrichi
— 외국어 : Langue étrangère
— 컴퓨터프로그램 : Programme informatique
— 잘하다 : Être doué / bien faire
— 출근하다 : Aller au travail / commencer sa journée de travail
— 내일부터 : À partir de demain$kt$, $kt$면접관 : 김미나씨 , 우리회사에지원해서반갑습니다 . 혹시외국어를 할수있습니까 ? · 지원자 : 네 , 저는프랑스어와영어를 할수있어요 . 그리고한국어도조금 말할수있어요 . · 면접관 : 컴퓨터프로그램을잘 할수있어요 ? · 지원자 : 네 , 대학교에서공부해서잘 할수있어요 . 내일부터출근할수있어요 .$kt$, null),
  ('Coréen', 30, $kt$Cours 30 · Le laboratoire de l’entretien d’embauche et du pitch de compétences$kt$, $kt$Le mini-curriculum argumenté$kt$, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes en Hangeul pour présenter vos atouts professionnels à une entreprise coréenne (langues parlées, conduite, outils maîtrisés, flexibilité d’horaires). Vous devez obligatoirement intégrer : au moins deux structures de capacité ( ﾩ/을수있다 ), une structure de cause ( 아/어서 ou 기때문에 ), et utiliser le lexique professionnel du cours précédent.

Consigne : Imaginez que vous passez un entretien d’embauche par visioconférence avec Séoul. Sans regarder vos notes, répondez à voix haute aux questions du recruteur pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Attention au bloc phonétique 수있어요 . À l’oral, la consonne ﾵ glisse sur la voyelle 어 . Enchaînez d’un coup : [수이써요 - su-i-sseo-yo]. Répétez le bloc 할수있어요 jusqu’à ce qu’il sorte comme un mot unique : [할쑤이써요 ].$kt$, $kt$$kt$, null),
  ('Coréen', 31, $kt$Cours 31 · L’action en cours (* 고있다 *) et l’intention (* 려고하다 *)$kt$, $kt$L’aspect verbal intermédiaire$kt$, $kt$Grammaire & Syntaxe : L’aspect verbal intermédiaire
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
— 일하다 : Travailler$kt$, $kt$$kt$, null),
  ('Coréen', 32, $kt$Cours 32 · La communication et les appels téléphoniques professionnels$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Échange téléphonique professionnel entre un employé de bureau (수혁 ) et une cliente (영미 ).

Banque de Vocabulaire Enrichi
— 여보세요 : Allo (formule exclusive aux interactions téléphoniques)
— 보고서 : Rapport / compte-rendu écrit
— 회의 : Réunion / conférence professionnelle
— 자료 : Documents / données / matériel de travail
— 보내다 : Envoyer ( 보내겠습니다 = je vais envoyer – futur formel)$kt$, $kt$수혁 : 여보세요 ? 대성무역의이수혁입니다 . · 영미 : 안녕하세요 , 수혁씨 . 저김영미예요 . 혹시지금바빠요 ? · 수혁 : 아니요 , 안바빠요 . 지금컴퓨터로보고서를 만들고있어요 . · 영미 : 아 , 다행이네요 . 제가내일회의를 준비하려고해요 . 혹시자료가있어요 ? · 수혁 : 네 , 지금이메일로보내겠습니다 .$kt$, null),
  ('Coréen', 33, $kt$Cours 33 · Le laboratoire de l’appel professionnel et de la gestion de projets$kt$, $kt$Le script de la conversation téléphonique$kt$, $kt$Atelier d’Écriture : Le script de la conversation téléphonique$kt$, $kt$tuellement en cours d’exécution ( 고있다 ) et lui faire part de vos intentions logistiques immédiates pour la suite du projet ( 려고하다 ). Intégrez le lexique professionnel du cours précédent.$kt$, null),
  ('Coréen', 34, $kt$Cours 34 · L’expression de l’obligation (* 어야하다 *) et de la permission (* 어도되다 *)$kt$, $kt$Règles, devoirs et autorisations$kt$, $kt$Grammaire & Syntaxe : Règles, devoirs et autorisations
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
— 규칙 : La règle / le règlement intérieur$kt$, $kt$$kt$, null),
  ('Coréen', 35, $kt$Cours 35 · Grand Bilan du Bloc 3 (Règles de vie et Gestion d’espace)$kt$, $kt$Analyse d’un règlement d’espace de travail$kt$, $kt$Compréhension Écrite : Analyse d’un règlement d’espace de travail

Compréhension Orale : Script du laboratoire d’écoute
Consignes de colocation et règles de vie commune énoncées par Min-ji à un nouvel arrivant.
민지 : 우리집에온것을환영해요 ! 몇가지규칙이있어요 . 밤 11 시이후에는조용히 해야해요 . 친구를 집에 데려와도돼요 . 하지만먼저이야기를 해야해요 . 주말에는같이부엌을청소해야해요 . 규칙이어 렵지않지요 ?$kt$, $kt$„ 우리사무실에는몇가지중요한규칙이있어요 . 아침아홉시까지출근해야해요 . 그리고사무실안 에서는담배를 피우면안돼요 . 그렇지만커피를 마셔도돼요 . 전화를할때에는밖으로나가서 전화해 야해요 . 모두규칙을잘지키세요 !“$kt$, null),
  ('Coréen', 36, $kt$Cours 36 · Grand Laboratoire de synthèse normative et présentation orale$kt$, $kt$Le mémo des règles communautaires$kt$, $kt$Atelier d’Expression Orale : Le briefing direct de bienvenue

CHAPITRE 4$kt$, $kt$$kt$, null),
  ('Coréen', 37, $kt$Cours 37 · L’expression de l’hypothèse et de la condition (* 면/으면 *)$kt$, $kt$Poser une condition structurelle$kt$, $kt$Grammaire & Syntaxe : Poser une condition structurelle
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
— 사다 : Acheter$kt$, $kt$$kt$, null),
  ('Coréen', 38, $kt$Cours 38 · Imaginer des situations hypothétiques et des désirs$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Discussion spéculative et projection de vie entre 두친구 (deux amis), Min-su et Ji-won.

Banque de Vocabulaire Enrichi
— 세계여행 : Voyage autour du monde / international
— 크다 / 작다 : Être grand / être petit (adjectifs)
— 돈이많다 : Avoir beaucoup d’argent / être fortuné
— 계획 : Projet / plan / planification d’avenir
— 매일 : Chaque jour / quotidiennement$kt$, $kt$민수 : 지원씨 , 만약복권에당첨되면뭐 할거예요 ? · 지원 : 돈이 많으면먼저큰집을 사고싶어요 . 그리고세계여행을 할거예요 . 민수씨는요 ? · 민수 : 저는시간이 있으면매일쉬고싶어요 . 회사를안가고한국어만 공부할거예요 . · 지원 : 와 , 정말좋은계획이네요 !$kt$, null),
  ('Coréen', 39, $kt$Cours 39 · Le laboratoire du manifeste spéculatif et de l’idéal de vie$kt$, $kt$Essai projectif et prospectif$kt$, $kt$Atelier d’Expression Orale : L’exposé des ambitions futures

nutes et 30 secondes. Conseil de fluidité : La structure conditionnelle exige un traitement prosodique spécifique. Évitez de segmenter la phrase après le 면 . Marquez une intonation montante suspendue sur la clause en 면 , puis délivrez la conséquence d’un
bloc lié : [당첨되면 ↗, 할거예요 ↘].$kt$, $kt$$kt$, null),
  ('Coréen', 40, $kt$Cours 40 · Le style indirect et le discours rapporté (* 다고하다 *)$kt$, $kt$Transposer les propos au style indirect$kt$, $kt$Grammaire & Syntaxe : Transposer les propos au style indirect
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
— 듣다 : Entendre / écouter (conjugaison passée : 들었어요 )$kt$, $kt$$kt$, null),
  ('Coréen', 41, $kt$Cours 41 · Les médias, Internet et la transmission d’informations$kt$, $kt$Script du laboratoire d’écoute$kt$, $kt$Compréhension Orale : Script du laboratoire d’écoute
Échange quotidien au bureau entre Min-su et Seo-yeon au sujet des prévisions météorologiques lues en ligne.

Banque de Vocabulaire Enrichi
— 눈이오다 : Neiger
— 변경하다 : Modifier / restructurer (un plan, un horaire)
— 다 ̃ 고들었어요 : J’ai entendu dire que...
— 날씨예보 : Les prévisions météorologiques
— 사실 : En réalité / le fait / la vérité$kt$, $kt$민수 : 서연씨 , 오늘아침뉴스봤어요 ? 인터넷기사에서봤는데 , 내일부터날씨가아주 춥다고해요 . · 서연 : 아 , 정말요 ? 저는어제뉴스에서비가 온다고들었어요 . · 민수 : 기사에서는비가안오고눈이 온다고해요 . 주말에날씨가안좋아서집에서 쉬고싶어요 . · 서연 : 저도주말계획을변경해야겠네요 .$kt$, null),
  ('Coréen', 42, $kt$Cours 42 · Le laboratoire du compte-rendu d’information et de la revue de presse$kt$, $kt$Le mini-bulletin d’information$kt$, $kt$Consigne : Rédigez un paragraphe de synthèse de 6 à 8 lignes en Hangeul compilant les affirmations de votre entourage ou des médias sur un sujet contemporain. Vous devez impérativement intégrer : au moins une structure indirecte basée sur un adjectif ( 다고 하다 ), une structure basée sur un verbe d’action ( ﾤ/는다고하다 ), et lier vos propositions par un connecteur logique du bloc précédent.

Consigne : Incarnez le rôle d’un journaliste ou d’un rapporteur transmettant des informations de synthèse. Sans regarder vos notes, prenez la parole à voix haute de manière neutre, claire et fluide pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Le bloc 다고해요 s’énonce sans coupure interne ([다고해요 ]). Appliquez rigoureusement l’assimilation nasale des verbes d’action au style indirect : 먹는다고 doit s’articuler phonétiquement comme [멍는다고 ] pour un rendu naturel.$kt$, $kt$$kt$, null),
  ('Coréen', 43, $kt$Cours 43 · Le système honorifique supérieur (* 께 서 *, * 시 *)$kt$, $kt$Élever le sujet par respect sociolinguistique$kt$, $kt$Grammaire & Syntaxe : Élever le sujet par respect sociolinguistique
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
— 성함 : Le prénom / nom (substantif honorifique exclusif pour 이름 )$kt$, $kt$$kt$, null),
  ('Coréen', 44, $kt$Cours 44 · Les verbes honorifiques spécifiques et le respect social$kt$, $kt$Les mutations lexicales de déférence$kt$, $kt$Grammaire : Les mutations lexicales de déférence
Certains verbes d’action ou d’état fondamentaux ne tolèrent pas la simple insertion du suffixe 시 . Ils mutent totalement vers un nouveau radical pour sceller le respect absolu envers le sujet de l’action.

Verbe Standard                Radical Honorifique     Conjugaison Présente Usuelle 있다 (se trouver)               계시다                     계세요 (gyé-sé-yo)
있다 (posséder/avoir)           있으시다                    있으세요
먹다 / 마시다 (manger/boire)       드시다                     드세요
자다 (dormir)                   주무시다                    주무세요

Compréhension Orale : Script du laboratoire d’écoute
Interaction polie au sein d’un secrétariat de direction d’entreprise à Séoul.$kt$, $kt$손님 : 안녕하세요 ? 사장님지금사무실에있습니까 ? · 비서 : 네 , 사장님께서지금사무실에 계세요 . 지금차를 드시고계세요 . 잠시만여기에서기다리세요 . · textbf 손님 : 아 , 네 . 알겠습니다 . 감사합니다 .$kt$, null),
  ('Coréen', 45, $kt$Cours 45 · Le laboratoire de l’interaction respectueuse avec les aînés$kt$, $kt$Le message de courtoisie formelle$kt$, $kt$Consigne : Rédigez une note ou un courriel de politesse de 6 à 8 lignes en Hangeul s’adressant à votre enseignant référent ( 선생님 ). Prenez de ses nouvelles avec déférence (demandez s’il se trouve en bonne santé, s’il se repose bien) et formulez vos intentions d’études futures d’ici la semaine prochaine. Vous devez intégrer : la particule 께서 , au moins deux verbes honorifiques spécifiques, et maintenir le style poli-informel élevé.

Consigne : Imaginez que vous êtes reçu en audience officielle par un cadre supérieur à Séoul. Sans regarder vos notes de travail, prenez la parole à voix haute de manière posée, digne et fluide pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Les formes honorifiques dessinent un rythme fluide spécifique. Amalgamez le bloc 계세 요 d’un seul élan ([계세요 ]). Ne confondez pas 있으세요 (possession respectée) et 계세요 (localisation physique respectée).$kt$, $kt$$kt$, null),
  ('Coréen', 46, $kt$Cours 46 · Syntaxe avancée, particules d’accentuation et révision des pièges$kt$, $kt$La rigueur de l’accumulation et de la place des particules$kt$, $kt$Grammaire : La rigueur de l’accumulation et de la place des particules
Le passage au niveau intermédiaire supérieur exige une automatisation absolue de la place des structures négatives et des particules restrictives ou inclusives.

La particule d’inclusion 도 ̃ & Le piège de la négation 안/못

A. La particule d’inclusion 도 ̃ (aussi / également) :
Elle se substitue entièrement aux particules de thème ( 은 ̃/는 ) et d’objet direct ( 을 /̃ 를 ), mais s’accumule obligatoirement après les particules casuelles de lieu ( 에 ̃) ou de provenance ( 에 ̃ 서 ).
Exemple d’objet : 사과를먹어요 . 커피도마셔요 . (Je mange une pomme. Je bois aussi du café).
Exemple de lieu : 학 교 에 가 요 . 회 사 에 도 가 요 . (Je vais à l’école. Je vais aussi à l’entreprise).

B. La place des adverbes de négation 안 (ne... pas) et 못 (ne pas pouvoir) :
Pour l’intégralité des verbes composés formés sur la base nominale + 하다 , l’adverbe négatif s’intercale rigoureusement juste avant le bloc 하다 .
Ejemplo : 공부 안해요 (et non 안공부해요 ) / 운전 못해요 (et non 못운전해요 ).$kt$, $kt$Exemple d’objet : 사과를먹어요 . 커피도마셔요 . (Je mange une pomme. Je bois aussi du café). · Exemple de lieu : 학 교 에 가 요 . 회 사 에 도 가 요 . (Je vais à l’école. Je vais aussi à l’entreprise).$kt$, null),
  ('Coréen', 47, $kt$Cours 47 · Grand Bilan Final A2/B1 (Écrit & Compréhension)$kt$, $kt$Texte de synthèse socio-cultural$kt$, $kt$Compréhension Écrite : Texte de synthèse socio-cultural
기차로갈거예요 . 만약한국에가면한국사람들과한국어로많이말하려고해요 . 부모님께서도제계획 을좋아하세요 .“

Compréhension Orale : Script du laboratoire d’écoute final
Échange d’actualité de niveau B1 entre Yuna et son enseignant référent, le Professeur Park.
유나 : 선생님 , 안녕하세요 ? 요즘어떻게지내세요 ?
선생님 : 안녕하세요 , 유나씨 . 저는지금대학원기사를 읽고있어요 . 요즘조금바쁘지만기분이아주 좋아요 .
유나 : 네 , 다행이네요 . 선생님 , 혹시내일저녁에시간이있으세요 ?
선생님 : 내일저녁에는중요한회의가 있으세요 . 회의가끝나면연락할게요 .$kt$, $kt$„ 한국어는아주재미있지만처음에문법이조금어려워요 . 그렇지만매일열심히공부하면 2029 년 에한국어를잘할수있을거예요 . 저는내년에서울에가고싶어요 . 서울역에서친구를만나서부산까지$kt$, null),
  ('Coréen', 48, $kt$Cours 48 · Grand Bilan Final Oral & Clôture du manuel$kt$, $kt$La validation du profil de fluidité$kt$, $kt$Grand Atelier d’Expression Orale : La validation du profil de fluidité

축하합니다 ! 한국어과정을성공적으로마쳤습니다 .$kt$, $kt$$kt$, null)
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
  and c.language = 'Coréen'
  and e.origin <> 'member';

-- les exercices des membres passent après ceux du manuel (position + 1000, une seule fois)
update public.language_exercises e
set position = e.position + 1000
from public.language_courses c
where e.course_id = c.id
  and c.language = 'Coréen'
  and e.origin = 'member'
  and e.position < 1000;

-- 3) Nouveaux exercices du manuel
insert into public.language_exercises
  (course_id, position, prompt, answer, expected_answer, accepted_answers, explanation, exercise_type, origin)
select c.id, x.pos, x.prompt, x.expected, x.expected, x.accepted, x.explanation, 'written', 'manual'
from (values
  (1, 1, $kt$Lisez à voix haute les mots suivants et isolez le caractère double ou complexe : 회사 (Entreprise) : __________$kt$, $kt$회$kt$, array[$kt$회$kt$]::text[], $kt$회 (Contient la diphtongue complexe “we”).$kt$),
  (1, 2, $kt$Lisez à voix haute les mots suivants et isolez le caractère double ou complexe : 아빠 (Papa) : __________$kt$, $kt$빠$kt$, array[$kt$빠$kt$]::text[], $kt$빠 (Contient la consonne double tendue “pp”).$kt$),
  (2, 1, $kt$Transcrivez la prononciation phonétique réelle après application de la liaison : 만나요 (Rencontrer) → [__________]$kt$, $kt$[만나요 ]$kt$, array[$kt$[만나요 ]$kt$]::text[], $kt$[만나요 ] (Pas de modification car la syllabe suivante commence par ﾤ ).$kt$),
  (2, 2, $kt$Transcrivez la prononciation phonétique réelle après application de la liaison : 걸어요 (Marcher) → [__________]$kt$, $kt$[거러요 ]$kt$, array[$kt$[거러요 ]$kt$]::text[], $kt$[거러요 ] (Le ﾩ du bas remonte occuper l’espace vide du ﾷ ).$kt$),
  (3, 1, $kt$Complétez les espaces vides : 저는프랑스사람 __________.$kt$, $kt$입니다$kt$, array[$kt$입니다$kt$]::text[], $kt$입니다$kt$),
  (3, 2, $kt$Complétez les espaces vides : 학생 __________ 공부를합니다 . (L’étudiant étudie).$kt$, $kt$은$kt$, array[$kt$은$kt$]::text[], $kt$은 (학생은 – présence d’un Batchim).$kt$),
  (3, 3, $kt$Consigne : Rédigez votre profil en trois lignes en Hangeul : votre nom, votre nationalité et votre statut. (Modèle : 저는 [Nom] 입니다 . 저는프랑스사람입니다 .) Une fois le texte écrit, inclinez légèrement la tête et récitez-le à voix haute de manière continue, en veillant à la nasalisation du son [im-ni-da].$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (4, 1, $kt$Ajoutez la particule d’objet correcte (을 ̃ ou 를 ̃) derrière les noms suivants : 저는커피 _____ 마십니다 . (Je bois du café).$kt$, $kt$를$kt$, array[$kt$를$kt$]::text[], $kt$를 (커피를 – se termine par la voyelle ￜ ).$kt$),
  (4, 2, $kt$Ajoutez la particule d’objet correcte (을 ̃ ou 를 ̃) derrière les noms suivants : 저는물 _____ 마십니다 . (Je bois de l’eau).$kt$, $kt$을$kt$, array[$kt$을$kt$]::text[], $kt$을 (물을 – se termine par la consonne basse ﾩ ).$kt$),
  (5, 1, $kt$Choisissez la bonne particule de sujet (이 ̃ ou 가 ̃) : 친구 _____ 옵니다 . (L’ami vient. / 친구 = ami)$kt$, $kt$가$kt$, array[$kt$가$kt$]::text[], $kt$가 (친구가 – se termine par la voyelle ￓ ).$kt$),
  (5, 2, $kt$Choisissez la bonne particule de sujet (이 ̃ ou 가 ̃) : 한국어 _____ 재미있습니다 . (La langue coréenne est intéressante).$kt$, $kt$가$kt$, array[$kt$가$kt$]::text[], $kt$가 (한국어가 – se termine par la voyelle ￆ ).$kt$),
  (6, 1, $kt$Conjuguez les verbes suivants au présent poli-informel : 하다 (faire) → __________$kt$, $kt$해요$kt$, array[$kt$해요$kt$]::text[], $kt$해요$kt$),
  (6, 2, $kt$Conjuguez les verbes suivants au présent poli-informel : 보다 (regarder) → __________$kt$, $kt$봐요$kt$, array[$kt$봐요$kt$]::text[], $kt$봐요$kt$),
  (6, 3, $kt$Conjuguez les verbes suivants au présent poli-informel : 먹다 (manger) → __________$kt$, $kt$먹어요$kt$, array[$kt$먹어요$kt$]::text[], $kt$먹어요 .$kt$),
  (6, 4, $kt$Consigne : Rédigez 4 phrases décrivant vos activités régulières en respectant scrupuleusement la structure SOV et le marquage des objets (ex : 저는밥을먹어요 .). Entraînezvous ensuite à les énoncer de manière continue à haute voix sans aucune hésitation. Portez une attention particulière à la resyllabation : 먹어요 doit glisser oralement comme [머 거요 ].$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (7, 1, $kt$Complétez les espaces avec la bonne particule (에 ̃ ou 이 ̃/가 ) : 학교 _____ 친구 _____ 있어요 . (L’ami se trouve à l’école).$kt$, $kt$학교에친구가있어요$kt$, array[$kt$학교에친구가있어요$kt$]::text[], $kt$학교에친구가있어요 . (Lieu + Sujet se terminant par une voyelle).$kt$),
  (7, 2, $kt$Complétez les espaces avec la bonne particule (에 ̃ ou 이 ̃/가 ) : 저는돈 _____ 없어요 . (Je n’ai pas d’argent).$kt$, $kt$돈이없어요$kt$, array[$kt$돈이없어요$kt$]::text[], $kt$돈이없어요 . (Sujet se terminant par une consonne basse → 이 ).$kt$),
  (8, 1, $kt$Écrivez la combinaison correcte en Hangeul (Chiffre modifié + Compteur) : 2 bouteilles d’eau (Bouteille = 병 ) → 물 __________ 병$kt$, $kt$두$kt$, array[$kt$두$kt$]::text[], $kt$두 (둘 s’amuse à devenir 두 devant un compteur)$kt$),
  (8, 2, $kt$Écrivez la combinaison correcte en Hangeul (Chiffre modifié + Compteur) : 3 pommes (Compteur général = 개 ) → 사과 __________ 개$kt$, $kt$세$kt$, array[$kt$세$kt$]::text[], $kt$세 (셋 devient 세 ).$kt$),
  (9, 1, $kt$Traduisez les requêtes en coréen en respectant l’ordre syntaxique des compteurs : Donnez-moi un café, s’il vous plaît. (Tasse = 잔 ) → ____________________$kt$, $kt$커피한잔주세요$kt$, array[$kt$커피한잔주세요$kt$]::text[], $kt$커피한잔주세요 .$kt$),
  (9, 2, $kt$Traduisez les requêtes en coréen en respectant l’ordre syntaxique des compteurs : Donnez-moi quatre pommes, s’il vous plaît. (Objet = 개 ) → ____________________$kt$, $kt$사과네개주세요$kt$, array[$kt$사과네개주세요$kt$]::text[], $kt$사과네개주세요 . (Le chiffre 넷 se modifie en 네 devant le compteur 개 ).$kt$),
  (9, 3, $kt$Consigne : Imaginez que vous interpellez le serveur dans un restaurant coréen („ 여 기요 !“ – Yeo-gi-yo !). Rédigez puis énoncez à haute voix de manière continue votre script de commande : demandez la carte, puis commandez deux bibimbaps et une bouteille d’eau. Veillez à la fluidité de la liaison : 한병 doit s’articuler d’une seule traite comme [한 병 ].$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (10, 1, $kt$Ajoutez la particule 에 ̃ uniquement si cela est grammaticalement requis : 오늘 _____ 친구를만나요 . (Aujourd’hui, je rencontre un ami).$kt$, $kt$Pas de particule$kt$, array[$kt$Pas de particule$kt$]::text[], $kt$Pas de particule (오늘친구를만나요 – adverbe relatif exclu).$kt$),
  (10, 2, $kt$Ajoutez la particule 에 ̃ uniquement si cela est grammaticalement requis : 주말 _____ 운동을해요 . (Le week-end, je fais du sport).$kt$, $kt$에$kt$, array[$kt$에$kt$]::text[], $kt$에 (주말에운동을해요 – marqueur temporel standard).$kt$),
  (11, 1, $kt$Conjuguez les verbes suivants au passé poli-informel : 먹다 (manger) → __________$kt$, $kt$먹었어요$kt$, array[$kt$먹었어요$kt$]::text[], $kt$먹었어요$kt$),
  (11, 2, $kt$Conjuguez les verbes suivants au passé poli-informel : 가다 (aller) → __________$kt$, $kt$갔어요$kt$, array[$kt$갔어요$kt$]::text[], $kt$갔어요$kt$),
  (11, 3, $kt$Conjuguez les verbes suivants au passé poli-informel : 운동하다 (faire du sport) → __________$kt$, $kt$운동했어요$kt$, array[$kt$운동했어요$kt$]::text[], $kt$운동했어요 .$kt$),
  (12, 1, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes en Hangeul narrant le déroulement complet de votre journée d’hier ou de votre dernier week-end de repos. Vous devez obli- gatoirement intégrer : au moins deux actions conjuguées au passé, un repère temporel marqué par la particule 에 ,̃ une structure d’objet direct ( 을 ̃/를 ), et un élément de décompte ou de localisation statique ( 있다/없다 ).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (12, 2, $kt$Consigne : Détachez-vous complètement de vos notes manuscrites. Imaginez que vous racontez vos expériences récentes de manière spontanée à un ami coréen. Prenez la parole à voix haute pendant 2 minutes et 30 secondes en continu. Portez une attention méticuleuse à la prononciation tendue du double ﾶ lors du suffixe de passé : le son doit être net, sec, court et glisser immédiatement sur la voyelle suivante (ex : 갔어요 → [가써요 ]).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (13, 1, $kt$Conjuguez les verbes entre parenthèses au futur usuel : 내일친구를 __________. ( 만나다 – Je vais rencontrer un ami demain).$kt$, $kt$만날거예요$kt$, array[$kt$만날거예요$kt$]::text[], $kt$만날거예요 (Le radical se termine par la voyelle ￂ )$kt$),
  (13, 2, $kt$Conjuguez les verbes entre parenthèses au futur usuel : 다음주에한국에 __________. ( 가다 – J’irai en Corée la semaine prochaine).$kt$, $kt$갈거예요$kt$, array[$kt$갈거예요$kt$]::text[], $kt$갈거예요 (Le radical se termine par la voyelle ￂ ).$kt$),
  (14, 1, $kt$Insérez les particules appropriées ( 로 ̃/으로 ou 에 ̃ 서 까 ̃ 지 ) : 서울 _____ 부산 _____ 세시간걸려요 . (Ça prend trois heures de Séoul à Busan).$kt$, $kt$에서 / 까지$kt$, array[$kt$에서 / 까지$kt$, $kt$에서 까지$kt$, $kt$에서$kt$, $kt$까지$kt$]::text[], $kt$에서 / 까지 (Marquage de l’origine et de la destination)$kt$),
  (14, 2, $kt$Insérez les particules appropriées ( 로 ̃/으로 ou 에 ̃ 서 까 ̃ 지 ) : 오른쪽 _____ 가세요 . (Allez vers la droite).$kt$, $kt$으로$kt$, array[$kt$으로$kt$]::text[], $kt$으로 (오른쪽 se termine par la consonne ﾡ , l’insertion de 으로 est requise).$kt$),
  (15, 1, $kt$Traduisez la phrase descriptive suivante en coréen en respectant l’ordre syntaxique SOV : „Demain, je vais voyager de Séoul jusqu’à Busan.“→ _______________________________________________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 내일서울에서부산까지여행할거예요 . (Le repère temporel absolu se place en tête, suivi des bornes de déplacement déclinées, le verbe au futur fermant la proposition).$kt$),
  (15, 2, $kt$Consigne : Rédigez une note descriptive de 6 à 8 lignes en Hangeul résumant vos intentions de déplacement pour la semaine prochaine (villes traversées, bornes de l’itinéraire, transports utilisés). Vous devez obligatoirement intégrer : au moins deux verbes conjugués au futur ( ﾩ ̃/을거예요 ), une structure de délimitation d’itinéraire ( 에 ̃ 서 까 ̃ 지 ), et un marquage directionnel via la particule 로 ̃/으로 .$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (15, 3, $kt$Consigne : Imaginez que vous décrivez vos projets de voyage de manière décontractée à un ami coréen. Sans regarder vos notes manuscrites, prenez la parole à voix haute pendant 2 minutes complètes en continu. Conseil de fluidité : Pour assurer un débit naturel, amalgamez le bloc verbal du futur sans coupure artificielle. 할거예요 doit s’assimiler phonétiquement comme [할꺼예요 ] (doublement du son k).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (16, 1, $kt$Transposez les verbes entre parenthèses à la forme du désir au présent usuel : 집에서한국영화를 __________. ( 보다 – Je veux regarder un film coréen à la maison).$kt$, $kt$보고싶어요$kt$, array[$kt$보고싶어요$kt$]::text[], $kt$보고싶어요 (Radical 보 + 고싶어요 )$kt$),
  (16, 2, $kt$Transposez les verbes entre parenthèses à la forme du désir au présent usuel : 오늘은집에서 __________. ( 쉬다 – Aujourd’hui, je veux me reposer à la maison).$kt$, $kt$쉬고싶어요$kt$, array[$kt$쉬고싶어요$kt$]::text[], $kt$쉬고싶어요 (Radical 쉬 + 고싶어요 ).$kt$),
  (17, 1, $kt$Complétez les propositions interrogatives avec la structure ﾩ ̃/을까요 ? : 오늘저녁에식당에서같이 __________ ? ( 먹다 – Si on mangeait ensemble ce soir au restaurant ?).$kt$, $kt$먹을까요 ?$kt$, array[$kt$먹을까요 ?$kt$]::text[], $kt$먹을까요 ? (Le radical se termine par la consonne ﾡ )$kt$),
  (17, 2, $kt$Complétez les propositions interrogatives avec la structure ﾩ ̃/을까요 ? : 내일몇시에 __________ ? ( 만나다 – À quelle heure va-t-on se rencontrer demain ?).$kt$, $kt$만날까요 ?$kt$, array[$kt$만날까요 ?$kt$]::text[], $kt$만날까요 ? (Le radical se termine par la voyelle ￂ ).$kt$),
  (18, 1, $kt$Traduisez la proposition d’invitation suivante en coréen en respectant l’ordre SOV : „Et si on buvait un café ensemble au restaurant demain ?“→ ____________________________________________$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 내일식당에서같이커피를마실까요 ? (Les repères de temps et de lieu se placent en tête de phrase, suivis du COD marqué par sa particule, le verbe de proposition fermant l’interrogation).$kt$),
  (18, 2, $kt$Consigne : Rédigez un dialogue de 8 à 10 répliques en Hangeul mettant en scène deux amis qui planifient une sortie (activité de loisir, choix d’un repas, fixation d’un horaire$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (18, 3, $kt$Consigne : Donnez de la voix en interprétant les deux rôles de votre script à voix haute pendant 2 minutes et 30 secondes en continu. Modifiez subtilement votre intonation pour incarner chaque personnage. Conseil de fluidité : La prononciation du suffixe ﾩ ̃ 까요 ? exige une tension consonantique marquée sur le double ﾢ . Le son doit être sec et sans souffle d’air ([갈까용 ]). Accrochez fermement les particules à leur substantif.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (19, 1, $kt$Transformez les verbes à l’impératif poli ( 세 ̃ 요 / 으 ̃ 세요 ) : 여기에서잠시 __________. ( 기다리다 – Attendez un moment ici, s’il vous plaît).$kt$, $kt$기다리세요$kt$, array[$kt$기다리세요$kt$]::text[], $kt$기다리세요 (Le radical se termine par la voyelle ￜ )$kt$),
  (19, 2, $kt$Transformez les verbes à l’impératif poli ( 세 ̃ 요 / 으 ̃ 세요 ) : 책을 __________. ( 읽다 – Lisez le livre, s’il vous plaît).$kt$, $kt$읽으세요$kt$, array[$kt$읽으세요$kt$]::text[], $kt$읽으세요 (Le radical se termine par la consonne basse ﾡ ).$kt$),
  (20, 1, $kt$Transformez les actions à la forme négative de l’interdiction ( 지 ̃ 마세요 ): 커피를많이 __________. ( 마시다 – Ne buvez pas beaucoup de café).$kt$, $kt$마시지마세요$kt$, array[$kt$마시지마세요$kt$]::text[], $kt$마시지마세요$kt$),
  (20, 2, $kt$Transformez les actions à la forme négative de l’interdiction ( 지 ̃ 마세요 ): 오늘은 __________. ( 일하다 – Ne travaillez pas aujourd’hui).$kt$, $kt$일하지마세요$kt$, array[$kt$일하지마세요$kt$]::text[], $kt$일하지마세요 (La structure 지 ̃ 마세요 se colle de manière régulière sur le radical).$kt$),
  (21, 1, $kt$Traduisez la recommandation médicale suivante en coréen en respectant la syntaxe des verbes finaux : „Asseyez-vous ici et ne mangez pas de riz ce soir.“→ _______________________________________________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 여기에앉으세요 . 그리고오늘저녁에밥을먹지마세요 . (Les blocs verbaux impératifs et d’interdiction ferment de manière rigoureuse chaque proposition de conseil).$kt$),
  (21, 2, $kt$Consigne : Rédigez un dialogue de 8 à 10 répliques en Hangeul mettant en scène une consultation entre un médecin et un patient. Vous devez décrire vos symptômes (zones douloureuses comme la gorge 나 les yeux) et le médecin doit formuler deux consignes impératives positives ( 세 ̃ 요 ) ainsi qu’une interdiction formelle ( 지 ̃ 마세요 ). Mobilisez le lexique de la santé.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (21, 3, $kt$Consigne : Donnez de la voix en interprétant les deux rôles de votre script de manière fluide pendant 2 minutes et 30 secondes. Incarnez un ton fatigué pour le patient et une diction claire et directive pour le praticien. Conseil de fluidité : Soignez la resyllabation de la particule d’objet devant la voyelle. 약을 (médicament) s’écrit 약 - 을 mais doit glisser oralement comme [야글 ] (le ﾡ du bas monte).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (22, 1, $kt$Reliez les deux énoncés en insérant le suffixe requis directement sur le radical : 김치를먹다 . 물을마시다 . ( 고 ̃) → 김치를 __________ 물을마셔요 . (Je mange du kimchi et je bois de l’eau).$kt$, $kt$먹고$kt$, array[$kt$먹고$kt$]::text[], $kt$먹고 (Radical 먹 + 고 )$kt$),
  (22, 2, $kt$Reliez les deux énoncés en insérant le suffixe requis directement sur le radical : 백화점에가다 . 쇼핑을하지않다 . ( 지 ̃ 만 ) → 백화점에 __________ 쇼핑을하지않아요 . (Je vais au grand magasin mais je ne fais pas de shopping).$kt$, $kt$가지만$kt$, array[$kt$가지만$kt$]::text[], $kt$가지만 (Radical 가 + 지만 ).$kt$),
  (23, 1, $kt$(Lecture) Répondez par Vrai ou Faux d’après le texte de blog : L’auteur du blog a l’intention d’utiliser le train pour se rendre à Busan le week-end prochain. __________$kt$, $kt$Vrai$kt$, array[$kt$Vrai$kt$]::text[], $kt$Vrai ( 주말에는서울에서부산까지기차로갈거예요 ).$kt$),
  (23, 2, $kt$(Écoute) Répondez aux questions d’après le script audio : 왜지민씨는다음달에부산으로갈거예요 ? ____________________$kt$, $kt$사람이너무많아서 / 부산에바다가있어서$kt$, array[$kt$사람이너무많아서 / 부산에바다가있어서$kt$, $kt$사람이너무많아서 부산에바다가있어서$kt$, $kt$사람이너무많아서$kt$, $kt$부산에바다가있어서$kt$]::text[], $kt$사람이너무많아서 / 부산에바다가있어서 (Il y a trop de monde à Séoul / il y a la mer à Busan pour se reposer)$kt$),
  (23, 3, $kt$(Écoute) Répondez aux questions d’après le script audio : 유나씨는왜서울을좋아합니까 ? ____________________$kt$, $kt$문화생활이많아서$kt$, array[$kt$문화생활이많아서$kt$]::text[], $kt$문화생활이많아서 (Parce que la vie culturelle y est très riche).$kt$),
  (24, 1, $kt$Consigne : Rédigez un paragraphe comparatif de 8 à 10 lignes en Hangeul sur le thème : „ 서울생활의장점과단점“ (Avantages et inconvénients de la vie à Séoul). Vous devez obligatoirement intégrer : au moins une structure au futur ( ﾩ ̃/을거예요 ), une phrase d’association ( 고 ̃), une phrase d’opposition ( 지 ̃ 만 ), et mobiliser le lexique de l’espace urbain ( 복잡하다 = être encombré, 편리하다 = être pratique).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (24, 2, $kt$Consigne : Imaginez que vous expliquez de manière spontanée à un ami coréen pourquoi vous préférez planifier votre avenir à Busan plutôt qu’à Séoul. Sans regarder vos notes de travail, prenez la parole à voix haute pendant 3 minutes complètes en continu. Structurez votre argumentaire de façon fluide : commencez par le cadre de Séoul, amenez le contraste („ 서울은편리하지만 ...“), valorisez Busan („ 부산은바다가있고 ... “) et concluez par vos projets d’installation au futur.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (25, 1, $kt$Reliez les énoncés en utilisant le suffixe de cause 아 ̃/어서 : 시간이없다 . 친구를안만나요 . → 시간이 __________ 친구를안만나요 . (Parce que je n’ai pas le temps, je ne vois pas mon ami).$kt$, $kt$없어서$kt$, array[$kt$없어서$kt$]::text[], $kt$없어서 (Radical 없 + 어서 )$kt$),
  (25, 2, $kt$Reliez les énoncés en utilisant le suffixe de cause 아 ̃/어서 : 날씨가좋다 . 공원에가요 . → 날씨가 __________ 공원에가요 . (Comme le temps est beau, je vais au parc).$kt$, $kt$좋아서$kt$, array[$kt$좋아서$kt$]::text[], $kt$좋아서 (Radical 좋 + 아서 ).$kt$),
  (26, 1, $kt$Répondez à la question d’après l’écoute du message de Min-ho : 왜민호씨는회사에늦어요 ? → ____________________$kt$, $kt$비가많이와서차가막혀요$kt$, array[$kt$비가많이와서차가막혀요$kt$]::text[], $kt$비가많이와서차가막혀요 . (Parce qu’il pleut abondamment et que les axes routiers sont saturés).$kt$),
  (27, 1, $kt$Traduisez l’explication suivante en coréen en respectant l’harmonie des suffixes : „Aujourd’hui, il fait froid, donc je reste à la maison.“→ _______________________________________________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 오늘은날씨가추워서집에있어요 . (L’adjectif descriptif 춥다 subit sa modification en 우 avant d’accueillir le suffixe 어서 pour sceller la relation de cause à effet).$kt$),
  (27, 2, $kt$Consigne : Rédigez un court message d’excuse de 6 à 8 lignes en Hangeul destiné à un collègue ou un enseignant. Vous devez reporter un rendez-vous prévu en formulant$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (27, 3, $kt$Consigne : Imaginez que vous laissez un mémo vocal sur le répondeur de votre interlocuteur. Sans regarder vos notes de travail, prenez la parole de manière fluide et naturelle pendant 2 minutes complètes en continu. Conseil de fluidité : Le suffixe 아 /̃ 어서 est le secret de la cadence coréenne. Ne marquez aucune coupure après le 서 , liez le bloc verbal d’un seul jet d’air ( 비가와서 → [비가와서 ]). Soignez la vocalisation du ﾲirrégulier ( 추워서 → [추워서 ]).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (28, 1, $kt$Conjuguez les verbes à la forme de la capacité affirmative ( ﾩ/을수있어 요): 저는운전 __________. ( 하다 – Je sais conduire).$kt$, $kt$할수있어요$kt$, array[$kt$할수있어요$kt$]::text[], $kt$할수있어요 (Radical 하 + ﾩ수있어요 )$kt$),
  (28, 2, $kt$Conjuguez les verbes à la forme de la capacité affirmative ( ﾩ/을수있어 요): 한국책을 __________. ( 읽다 – Je peux lire les livres coréens).$kt$, $kt$읽을수있어요$kt$, array[$kt$읽을수있어요$kt$]::text[], $kt$읽을수있어요 (Radical 읽 + 을수있어요 ).$kt$),
  (29, 1, $kt$Répondez à la question d’après l’écoute de l’entretien : 지원자는무슨외국어를할수있어요 ? → ____________________$kt$, $kt$프랑스어와영어 , 그리고한국어를할수있어요$kt$, array[$kt$프랑스어와영어 , 그리고한국어를할수있어요$kt$]::text[], $kt$프랑스어와영어 , 그리고한국어를할수있어요 . (Le français, l’anglais et le coréen).$kt$),
  (30, 1, $kt$Traduisez la déclaration de compétences suivante en coréen : „J’ai étudié le coréen, donc je peux parler un peu.“→ _______________________________________________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 한국어를공부해서조금말할수있어요 . (L’utilisation de la cause séquentielle fluide permet d’articuler naturellement la compétence résultante).$kt$),
  (30, 2, $kt$Consigne : Rédigez un paragraphe de 6 à 8 lignes en Hangeul pour présenter vos atouts professionnels à une entreprise coréenne (langues parlées, conduite, outils maîtrisés, flexibilité d’horaires). Vous devez obligatoirement intégrer : au moins deux structures de capacité ( ﾩ/을수있다 ), une structure de cause ( 아/어서 ou 기때문에 ), et utiliser le lexique professionnel du cours précédent.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (30, 3, $kt$Consigne : Imaginez que vous passez un entretien d’embauche par visioconférence avec Séoul. Sans regarder vos notes, répondez à voix haute aux questions du recruteur pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Attention au bloc phonétique 수있어요 . À l’oral, la consonne ﾵ glisse sur la voyelle 어 . Enchaînez d’un coup : [수이써요 - su-i-sseo-yo]. Répétez le bloc 할수있어요 jusqu’à ce qu’il sorte comme un mot unique : [할쑤이써요 ].$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (31, 1, $kt$Conjuguez les verbes au présent usuel selon la structure demandée entre parenthèses : 친구가지금전화를 __________. ( 고있어요 – Mon ami est en train de téléphoner).$kt$, $kt$하고있어요$kt$, array[$kt$하고있어요$kt$]::text[], $kt$하고있어요 (Radical 하 + 고있어요 )$kt$),
  (31, 2, $kt$Conjuguez les verbes au présent usuel selon la structure demandée entre parenthèses : 내년에한국에 __________. ( 려고해요 – J’ai l’intention d’aller en Corée).$kt$, $kt$가려고해요$kt$, array[$kt$가려고해요$kt$]::text[], $kt$가려고해요 (Radical 가 + 려고해요 ).$kt$),
  (32, 1, $kt$Répondez aux questions d’après l’écoute de l’appel téléphonique : 수혁씨는지금무슨일을하고있어요 ? → ____________________$kt$, $kt$컴퓨터로보고서를만들고있어요$kt$, array[$kt$컴퓨터로보고서를만들고있어요$kt$]::text[], $kt$컴퓨터로보고서를만들고있어요 . (Il est en train de rédiger un rapport sur l’ordinateur).$kt$),
  (32, 2, $kt$Répondez aux questions d’après l’écoute de l’appel téléphonique : 영미씨는왜전화했어요 ? → ____________________$kt$, $kt$내일회의를준비하려고자료를찾고있어요$kt$, array[$kt$내일회의를준비하려고자료를찾고있어요$kt$]::text[], $kt$내일회의를준비하려고자료를찾고있어요 . (Elle a appelé car elle a l’intention de préparer la réunion de demain et nécessite les documents).$kt$),
  (33, 1, $kt$Traduisez l’explication téléphonique suivante en coréen en reliant la cause et l’intention : „Allo ? Je suis en train de travailler actuellement, donc j’ai l’intention de vous appeler demain.“→ _______________________________________________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 여보세요 ? 지금일하고있어서내일전화하려고해요 . (L’association du présent continu marqué par la cause en 아서 permet d’articuler avec fluidité une intention future).$kt$),
  (33, 2, $kt$Consigne : Rédigez un dialogue d’affaires de 8 à 10 répliques en Hangeul simulant un appel entre vous et un collaborateur coréen. Vous devez lui exposer vos tâches ac-$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (33, 3, $kt$Consigne : Simulez cet appel à voix haute pendant 2 minutes et 30 secondes en continu. Adoptez l’intonation dynamique et légèrement plus haute propre aux stan- dards téléphoniques coréens, en marquant bien le 여보세요 d’ouverture. Conseil de flui- dité : Pour la structure 려고해요 , veillez à l’enchaînement fluide du ﾩ sans marquer d’arrêt. 준비하려고해요 doit s’énoncer comme un seul bloc phonétique unifié : [준비하려 고요 ].$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (34, 1, $kt$Conjuguez les verbes entre parenthèses selon la nuance demandée au présent usuel : 박물관에서사진을 __________. ( 면안돼요 / 찍다 – Interdiction : On ne doit pas prendre de photos au musée).$kt$, $kt$찍으면안돼요$kt$, array[$kt$찍으면안돼요$kt$]::text[], $kt$찍으면안돼요 (Le radical se termine par une consonne, l’interdiction se marque par 으면안돼요 )$kt$),
  (34, 2, $kt$Conjuguez les verbes entre parenthèses selon la nuance demandée au présent usuel : 한국어수업에꼭 __________. ( 어야해요 / 오다 – Obligation : Je dois impérativement venir au cours).$kt$, $kt$와야해요$kt$, array[$kt$와야해요$kt$]::text[], $kt$와야해요 (Contraction régulière du radical 오 + 아야해요 ).$kt$),
  (35, 1, $kt$(Lecture) Répondez par Vrai ou Faux d’après le règlement du bureau : Dans ce bureau, il est strictement interdit de boire du café à l’intérieur. __________$kt$, $kt$Faux$kt$, array[$kt$Faux$kt$]::text[], $kt$Faux ( 커피를마셔도돼요 signifie expressément que c’est autorisé).$kt$),
  (35, 2, $kt$(Écoute) Répondez aux questions d’après les consignes de Min-ji : 밤 11 시이후에는어떻게해야해요 ? → ____________________$kt$, $kt$조용히해야해요$kt$, array[$kt$조용히해야해요$kt$]::text[], $kt$조용히해야해요 (On doit être silencieux)$kt$),
  (35, 3, $kt$(Écoute) Répondez aux questions d’après les consignes de Min-ji : 주말에는무엇을해야해요 ? → ____________________$kt$, $kt$부엌을청소해야해요$kt$, array[$kt$부엌을청소해야해요$kt$]::text[], $kt$부엌을청소해야해요 (On doit nettoyer la cuisine ensemble).$kt$),
  (36, 1, $kt$Consigne : Rédigez un paragraphe réglementaire de 8 à 10 lignes en Hangeul détaillant le cahier des charges de votre logement en colocation ou de votre espace d’étude (obligations, permissions, interdictions). Vous devez obligatoirement intégrer : deux structures d’obligation ( 아야/어야해요 ), une structure de permission ( 어도돼요 ), et employer la cause fluide ( 아/어서 ) pour légitimer une restriction.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (36, 2, $kt$Consigne : Imaginez que vous accueillez un nouveau stagiaire ou colocataire coréen. Sans lire vos notes de travail, prenez la parole à voix haute de manière ferme, polie et rythmée pendant exactement 2 minutes (chronométré). Conseil de fluidité : Pour la structure 어야해요 , fusionnez les blocs verbaux sans à-coup. 해야해요 doit s’articuler comme un seul mot coulant : [해야해요 ]. Soignez la liaison dans 앉으세요 (→ [안즈세요 ]).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (37, 1, $kt$Reliez les verbes au suffixe conditionnel adéquat selon le radical : 주말에시간이 __________ 여행을갈거예요 . ( 있다 – Si j’ai du temps ce week-end, je voyagerai).$kt$, $kt$있으면$kt$, array[$kt$있으면$kt$]::text[], $kt$있으면 (Le radical se termine par la consonne basse ﾶ )$kt$),
  (37, 2, $kt$Reliez les verbes au suffixe conditionnel adéquat selon le radical : 내일비가 __________ 집에서쉴거예요 . ( 오다 – S’il pleut demain, je me reposerai).$kt$, $kt$오면$kt$, array[$kt$오면$kt$]::text[], $kt$오면 (Le radical se termine par la voyelle ￌ ).$kt$),
  (38, 1, $kt$Répondez à la question ouverte d’après l’écoute du dialogue : 만약지원씨가돈이많으면무엇을하고싶어요 ? → ____________________$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 큰집을사고싶고세계여행을하고싶어요 . (Elle projette d’acheter un grand logement et d’effectuer une boucle autour du monde).$kt$),
  (39, 1, $kt$Traduisez l’énoncé complexe suivant en coréen en respectant l’agencement SOV :Si j’étudie le coréen tous les jours, je parlerai bien (couramment) d’ici 2029. “→ ____________________ .$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 매일한국어를공부하면 2029 년에잘할거예요 . (Le bloc conditionnel s’établit en première ligne de phrase, suivi des jalons de temps de la proposition principale close par le verbe de capacité future).$kt$),
  (39, 2, $kt$Consigne : Rédigez un court essai spéculatif de 8 à 10 lignes en Hangeul narrant les contours de votre cadre de vie idéal à l’horizon 2029 (objectifs linguistiques validés, accomplissements professionnels, voyages d’immersion). Vous devez obligatoirement in- tégrer : au moins deux clauses conditionnelles ( 면 / 으면 ), deux formes futures ( ﾩ/을거 예요 ), et deux formulations d’aspiration ou de désir ( 고싶다 ).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (39, 3, $kt$Consigne : Détachez-vous complètement de vos notes manuscrites. Incarnez un ton convaincant et dynamique pour exposer vos rêves de réussite en continu pendant 2 mi-$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (40, 1, $kt$Transposez les énoncés directs au style indirect au présent usuel : 지훈 : “ 한국어가아주재미있어요 .” → 지훈씨가한국어가아주 __________.$kt$, $kt$재미있다고해요$kt$, array[$kt$재미있다고해요$kt$]::text[], $kt$재미있다고해요 (재미있다 est un adjectif)$kt$),
  (40, 2, $kt$Transposez les énoncés directs au style indirect au présent usuel : 미나 : “ 지금식당에서밥을먹어요 .” → 미나씨가지금식당에서밥을 __________.$kt$, $kt$먹는다고해요$kt$, array[$kt$먹는다고해요$kt$]::text[], $kt$먹는다고해요 (먹다 est un verbe d’action doté d’un Batchim).$kt$),
  (41, 1, $kt$Répondez d’après l’écoute active du dialogue scripté : 민수씨는인터넷기사에서날씨에대해무엇을읽었어요 ? → ____________________$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 내일부터날씨가아주춥고눈이온다고해요 . (L’article annonce une chute des températures et des précipitations neigeuses).$kt$),
  (42, 1, $kt$Consigne : Rédigez un paragraphe de synthèse de 6 à 8 lignes en Hangeul compilant les affirmations de votre entourage ou des médias sur un sujet contemporain. Vous devez impérativement intégrer : au moins une structure indirecte basée sur un adjectif ( 다고 하다 ), une structure basée sur un verbe d’action ( ﾤ/는다고하다 ), et lier vos propositions par un connecteur logique du bloc précédent.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (42, 2, $kt$Consigne : Incarnez le rôle d’un journaliste ou d’un rapporteur transmettant des informations de synthèse. Sans regarder vos notes, prenez la parole à voix haute de manière neutre, claire et fluide pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Le bloc 다고해요 s’énonce sans coupure interne ([다고해요 ]). Appliquez rigoureusement l’assimilation nasale des verbes d’action au style indirect : 먹는다고 doit s’articuler phonétiquement comme [멍는다고 ] pour un rendu naturel.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (43, 1, $kt$Élevez la structure de la phrase simple au niveau honorifique supérieur requis : 선생님이한국책을읽어요 . → 선생님 _____ 한국책을 __________.$kt$, $kt$께서 / 읽으세요$kt$, array[$kt$께서 / 읽으세요$kt$, $kt$께서 읽으세요$kt$, $kt$께서$kt$, $kt$읽으세요$kt$]::text[], $kt$께서 / 읽으세요 (Sujet marqué + insertion harmonique du Batchim 으시 )$kt$),
  (43, 2, $kt$Élevez la structure de la phrase simple au niveau honorifique supérieur requis : 사장님이내일부산에가요 . → 사장님 _____ 내일부산에 __________.$kt$, $kt$께 서 / 가세요$kt$, array[$kt$께 서 / 가세요$kt$, $kt$께 서 가세요$kt$, $kt$께 서$kt$, $kt$가세요$kt$]::text[], $kt$께 서 / 가세요 (Sujet marqué + insertion directe de 시 ).$kt$),
  (44, 1, $kt$Substituez le verbe de base par sa forme honorifique spécifique au présent usuel :방에서 _____ . ( 자다 – Ma mère dort dans la chambre). 아침을 _____ . ( 먹다 – Ma grand-mère prend son repas).$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 주무세요 (Le radical 자 mute entièrement en 주무시다 ) | 2. 드세요 (Le radical 먹 mute entièrement en 드시다 ).$kt$),
  (45, 1, $kt$Consigne : Rédigez une note ou un courriel de politesse de 6 à 8 lignes en Hangeul s’adressant à votre enseignant référent ( 선생님 ). Prenez de ses nouvelles avec déférence (demandez s’il se trouve en bonne santé, s’il se repose bien) et formulez vos intentions d’études futures d’ici la semaine prochaine. Vous devez intégrer : la particule 께서 , au moins deux verbes honorifiques spécifiques, et maintenir le style poli-informel élevé.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (45, 2, $kt$Consigne : Imaginez que vous êtes reçu en audience officielle par un cadre supérieur à Séoul. Sans regarder vos notes de travail, prenez la parole à voix haute de manière posée, digne et fluide pendant 2 minutes et 30 secondes en continu. Conseil de fluidité : Les formes honorifiques dessinent un rythme fluide spécifique. Amalgamez le bloc 계세 요 d’un seul élan ([계세요 ]). Ne confondez pas 있으세요 (possession respectée) et 계세요 (localisation physique respectée).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (46, 1, $kt$Rectifiez l’erreur syntaxique dans l’énoncé suivant : Falsch : 저는내일안요리해요 . (Je ne cuisinerai pas demain). → Richtig : _______________________________________________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : 저는내일요리안해요 . (L’adverbe de négation courte se positionne directement devant le verbe opératoire 하다 ).$kt$),
  (47, 1, $kt$(Lecture) Répondez par Vrai ou Faux d’après le texte d’évaluation : L’auteur du texte pense qu’il sera capable de bien parler coréen d’ici 2029 s’il étudie rigoureusement chaque jour. __________$kt$, $kt$Vrai$kt$, array[$kt$Vrai$kt$]::text[], $kt$Vrai ( 매일열심히공부하면 2029 년에한국어를잘할수있을거예요 ).$kt$),
  (47, 2, $kt$(Écoute) Répondez à la question d’après le script audio : 선생님은왜내일저녁에시간이없으세요 ? → ____________________$kt$, $kt$중요한회의가있으셔서요$kt$, array[$kt$중요한회의가있으셔서요$kt$]::text[], $kt$중요한회의가있으셔서요 . (Le professeur est indisponible car il est retenu par une importante séance de travail).$kt$),
  (48, 1, $kt$Consigne : Sélectionnez un grand axe thématique parmi ceux validés (votre feuille de route linguistique pour 2029, l’itinéraire d’affaires Séoul-Busan, ou la soutenance de vos compétences en entretien). Prenez la parole à voix haute de manière totalement autonome pendant 3 minutes complètes en continu (chronométré). Vous devez impé- rativement valider la présence de clauses d’opposition ( 지만 ), de cause ( 아/어서 ), d’hypothèse ( 면 ) et fermer chaque unité de sens par la structure SOV réglementaire.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$)
) as x(course_number, pos, prompt, expected, accepted, explanation)
join public.language_courses c
  on c.language = 'Coréen' and c.course_number = x.course_number;

commit;

-- Contrôle (à lancer après) : doit afficher 48 cours et 103 exercices du manuel
-- select count(*) from public.language_courses where language = 'Coréen';
-- select count(*) from public.language_exercises e join public.language_courses c on c.id = e.course_id
--   where c.language = 'Coréen' and e.origin = 'manual';
