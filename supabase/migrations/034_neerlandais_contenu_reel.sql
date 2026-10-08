-- Keltia : contenu réel des 32 cours de néerlandais (source : manuel Neerlandais.pdf).
-- Cible uniquement la bibliothèque Plan & Plate (language_courses / language_exercises).
-- Ne touche PAS au planning (weekly_schedule_items).
-- Relançable sans risque : les cours sont mis à jour par (language, course_number),
-- les exercices du manuel sont recréés, les exercices ajoutés par les membres sont conservés.

begin;

-- 1) Cours : titre, objectif, théorie et exemples réels ; plus de « Semaine X » (hors planning)
insert into public.language_courses (language, course_number, title, summary, theory, examples, week_number)
values
  ('Néerlandais', 1, $kt$Cours 1 · Clinique Syntactique (L’Inversion et la Négation Niet)$kt$, $kt$Éliminer définitivement les fautes d’inversion après un complément en position 1 et maîtriser la place exacte de la négation niet à l’oral comme à l’écrit.$kt$, $kt$Théorie Grammaticale Fine
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
Mise en situation : Vous défendez votre système automatisé lors d’une réunion de crise. Le directeur de l’usine (de fabrieksmanager) vous reproche un manque d’anticipation. Vous démontrez que le cahier des charges d’origine contenait des tolérances électriques erronées.$kt$, $kt$$kt$, null),
  ('Néerlandais', 2, $kt$Cours 2 · Grand Laboratoire (Rapport d’Audit et Réunion de Crise)$kt$, $kt$Rédiger un rapport d’analyse d’incident d’automatisation rigoureux et défendre l’architecture du système en réunion de crise face aux objections de la direction.$kt$, $kt$Écrit : Het Syntheserapport (Rapport d’analyse d’incident)
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
Négation partielle d’un constituant : De fout ligt niet aan onze PLC, maar aan de elektrische toleranties.$kt$, $kt$$kt$, null),
  ('Néerlandais', 3, $kt$Cours 3 · Lexique de Terrain I (Composants, Matériel & Câblage)$kt$, $kt$Maîtriser le vocabulaire précis de l’électricité, de l’électronique et de l’automatisme pour collaborer de manière fluide avec l’équipe technique.$kt$, $kt$Vocabulaire Technique Mécatronique Ciblée
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
— Aarden (werkwoord) / de aarding : Mettre à la terre / la mise à la terre.$kt$, $kt$$kt$, null),
  ('Néerlandais', 4, $kt$Cours 4 · Grand Laboratoire (Fiche d’Instructions et Guidage en Atelier)$kt$, $kt$Rédiger une fiche de procédure claire à l’infinitif d’instruction et guider un technicien junior par téléphone dans une procédure de diagnostic en atelier.$kt$, $kt$Oral : Guidage technique en direct et support de terrain
Mise en situation : Un technicien junior est à l’atelier face au prototype. Les capteurs ne remontent aucun signal dans le logiciel. Vous devez le guider pas à pas par téléphone pour vérifier les connexions physiques, tester la continuité au bornier et valider l’alimentation.$kt$, $kt$$kt$, null),
  ('Néerlandais', 5, $kt$Cours 5 · Clinique Syntactique (Subordonnées complexes & Cascade verbale)$kt$, $kt$Maîtriser l’agencement des verbes accumulés en fin de proposition subordonnée et automatiser la règle IPP (Infinitivus-pro-participio).$kt$, $kt$Théorie Grammaticale Fine
L’ordre rouge vs l’ordre vert en subordonnée (Bijzin) :
Dans une proposition subordonnée (introduite par omdat, als, dat, of...), tous les verbes migrent à la fin. Si l’on combine un verbe conjugué (auxiliaire) et un participe passé, deux ordres sont corrects :
— De rode volgorde (Ordre rouge) : Verbe conjugué + Participe passé.
Ex : ... omdat hij de machine heeft stopgezet. (Courant aux Pays-Bas, très fluide à l’oral).
— De groene volgorde (Ordre vert) : Participe passé + Verbe conjugué.
Ex : ... omdat hij de machine stopgezet heeft. (Courant en Belgique flamande, très utilisé à l’écrit formel).

La règle de l’IPP (Infinitivus-pro-participio) :
Lorsque l’on combine un auxiliaire (hebben/zijn) et un verbe modal (kunnen, moeten, willen...) au passé composé dans une subordonnée, le participe passé du verbe modal se transforme obligatoirement en infinitif. L’ordre devient alors fixe : le verbe conjugué se place devant les deux infinitifs.
— Structure incorrecte : ... omdat we de parameters niet aanpassen moeten hebben. ×
— Structure correcte : ... omdat we de parameters niet hebben moeten aanpassen. ✓$kt$, $kt$$kt$, null),
  ('Néerlandais', 6, $kt$Cours 6 · Grand Laboratoire (Spécification Technique et Explication Algorithmique)$kt$, $kt$Rédiger la spécification logique d’une boucle de régulation thermique et expliquer oralement le fonctionnement d’un correcteur PID avec des subordonnées imbriquées.$kt$, $kt$Oral : Explication de la boucle de rétroaction PID devant un comité
Mise en situation : Vous présentez l’implémentation de la boucle de contrôle d’un servomoteur. Vous décrivez le traitement du signal de position envoyé par le codeur (de encoder) en continu vers le correcteur PID (de PID-regelaar) pour corriger l’erreur de trajectoire.$kt$, $kt$$kt$, null),
  ('Néerlandais', 7, $kt$Cours 7 · Clinique Syntactique (Les Nuances du Passif et la structure impersonnelle Er)$kt$, $kt$Maîtriser l’usage du pronom impersonnel er combiné à la voix passive pour décrire des processus automatisés de manière fluide et naturelle.$kt$, $kt$Théorie Grammaticale Fine
Le passif présent (Worden) vs passif parfait (Zijn) :
— Présent : De parameter wordt gewijzigd. (La valeur est modifiée / action en cours).
— Parfait : De parameter is gewijzigd. (La valeur a été modifiée / état résultant).

La structure impersonnelle avec ER au Passif :
En néerlandais, lorsqu’une phrase passive n’a pas de sujet réel défini (action générale), on utilise obligatoirement le pronom impersonnel er en position 1 (ou en position 3 après inversion) pour introduire l’action. C’est une structure essentielle pour rédiger des rapports techniques neutres.
— Structure active : Men controleert de sensoren. (On contrôle les capteurs).
— Structure passive B2/C1 : Er wordt gecontroleerd of de sensoren correct werken. (Il est contrôlé si... / On contrôle si...).
— Inversion avec ER : Vandaag wordt er gecontroleerd of... (Aujourd’hui, il est procédé au contrôle de...).$kt$, $kt$$kt$, null),
  ('Néerlandais', 8, $kt$Cours 8 · Grand Laboratoire (Notice d’Homologation et Exposé d’Architecture)$kt$, $kt$Rédiger une procédure d’homologation CE via le passif impersonnel et soutenir un exposé d’architecture globale sans notes (Bilan Bloc 1).$kt$, $kt$Oral : Exposé magistral sur l’architecture d’une chaîne automatisée
Mise en situation : Vous présentez l’architecture globale d’une nouvelle ligne de production devant un panel d’auditeurs et d’ingénieurs partenaires. Vous devez décrire le flux de production, la centralisation des données des capteurs et les protocoles de sécurité redondants.

BLOC 2 : PRÉCISION LEXICALE
DIAGNOSTICS DE MAINTENANCE
(CYCLES 5 À 8)$kt$, $kt$$kt$, null),
  ('Néerlandais', 9, $kt$Cours 9 · Lexique de Terrain II (Mécanique, Outillage & Diagnostic de panne)$kt$, $kt$S’approprier le vocabulaire précis de l’ingénierie mécanique, de l’outillage de précision et des termes d’atelier pour mener un diagnostic de panne rapide avec l’équipe.$kt$, $kt$Vocabulaire Technique Mécatronique Ciblée
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
— Smeren (werkwoord) / het smeermiddel : Lubrifier / le lubrifiant.$kt$, $kt$$kt$, null),
  ('Néerlandais', 10, $kt$Cours 10 · Grand Laboratoire (Rapport de Panne et Dépannage d’Urgence)$kt$, $kt$Rédiger un rapport d’incident mécanique au style nominal et mener un diagnostic guidé par téléphone en situation de crise sans calque francophone.$kt$, $kt$Oral : Le dépannage d’urgence en direct avec l’atelier (Intervention de crise)
Mise en situation : La ligne de production principale est à l’arrêt. Un technicien d’astreinte est sur place devant la machine, sous pression. Vous menez le diagnostic à distance par téléphone. Vous devez lui faire tester la tension au multimètre, vérifier l’état du vérin pneumatique et inspecter les engrenages pour identifier si la panne est d’origine électrique ou mécanique.$kt$, $kt$$kt$, null),
  ('Néerlandais', 11, $kt$Cours 11 · Clinique Syntactique (Les Verbes à préposition fixe et Adverbes pronominaux)$kt$, $kt$Éradiquer les fautes de prépositions associées aux verbes de l’ingénierie et maîtriser la construction structurelle des adverbes pronominaux (daarmee, waarmee).$kt$, $kt$Théorie Grammaticale Fine
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
— Structure incorrecte à éradiquer : De machine met wat we werken... × → De machine waarmee we werken... ✓$kt$, $kt$$kt$, null),
  ('Néerlandais', 12, $kt$Cours 12 · Grand Laboratoire (Appel d’Offres et Revue de Conception Exécutive)$kt$, $kt$Rédiger une section de validation de conformité pour un cahier des charges et défendre vos choix d’architecture mécanique devant un client exigeant.$kt$, $kt$Oral : La revue de conception exécutive face à un client exigeant
Mise en situation : Vous menez une revue de conception (ontwerpreview) stratégique devant l’équipe d’ingénierie d’un grand client industriel. Le client remet en question le choix de l’architecture de vos actionneurs et doute de la fiabilité de vos capteurs en milieu humide.$kt$, $kt$$kt$, null),
  ('Néerlandais', 13, $kt$Cours 13 · Clinique Lexicale (Traitement des Faux Amis et Choix des Mots Métrologiques)$kt$, $kt$Éliminer les calques lexicaux de l’anglais ou de l’allemand dans le domaine des grandeurs physiques (électricité, mécanique) et de la métrologie.$kt$, $kt$Traitement des Interférences et Faux Amis
Chez les locuteurs polyglottes, les termes des grandeurs électriques et physiques se mélangent fréquemment. Voici la cartographie de précision à automatiser :

Concept Physique           Terme Néerlandais Correct         Calque Anglais/Allemand à Éviter La tension électrique      De spanning                       De voltage / de tensie × Le courant électrique      De stroom                         De current / de ampèrage × La puissance               Het vermogen                      De power / de kracht (Kracht = force mécanique) × La vitesse (de rotation)   Het toerental / de snelheid       De speed / de rotatie × Le couple mécanique        Het koppel / het draaimoment      Het torque ×
L’étalonnage / calibrage   De kalibratie / het ijken         De schaling ×

Nuance cruciale : Maken vs Doen.
Ne dites jamais een aanpassing maken (calque de to make an adjustment), utilisez exclusive-
ment : een aanpassing doorvoeren ou aanpassen. De même, on effectue des mesures avec
la structure : metingen verrichten ou meten.$kt$, $kt$$kt$, null),
  ('Néerlandais', 14, $kt$Cours 14 · Grand Laboratoire (Fiche de Métrologie et Arbitrage d’Architecture)$kt$, $kt$Rédiger un protocole d’essai métrologique pur et défendre un arbitrage d’architecture en comparant des grandeurs physiques rigoureuses.$kt$, $kt$Oral : Arbitrage d’architecture technique et défense budgétaire
Mise en situation : Deux architectures mécatroniques s’affrontent pour le projet final. L’une privilégie la puissance et le couple au détriment de la consommation électrique, l’autre est plus économe mais plus complexe à programmer. Vous devez soutenir votre arbitrage technique et justifier vos choix de composants devant le directeur technique.

Focus éradication des fautes : Précision absolue des termes métrologiques à l’oral. Éradication complète des tics verbaux anglophones (power, torque).$kt$, $kt$$kt$, null),
  ('Néerlandais', 15, $kt$Cours 15 · Clinique du Style (Le Conditionnel, la gestion des risques et les registres de langue)$kt$, $kt$Maîtriser les structures hypothétiques avancées du conditionnel (zouden + infinitif ) appliquées à la gestion des risques industriels (AMDEC) et adapter son registre selon l’interlocuteur.$kt$, $kt$Théorie Grammaticale Fine
Le conditionnel de scénario de défaillance (Zouden / Hadden / Waren) :
Pour analyser les risques théoriques d’un système sans que la panne ne soit réelle, l’allemand ou l’anglais influencent souvent à tort la structure. En néerlandais, on utilise la structure fluide : ZOUDEN + Infinitif ou les formes de prétérit modifiées pour exprimer une hypothèse irréelle du passé.
— Hypothèse présente : Als de sensor zou falen, zou het systeem direct stilvallen. (Si le capteur venait à faillir, le système s’arrêterait immédiatement).
— Hypothèse passée irréelle : Als de technicus de smering had gecontroleerd, was de storing niet opgetreden.
(Si le technicien avait vérifié la lubrification, la panne ne serait pas survenue. Note : l’auxiliaire de optreden est zijn → was).

La gestion des registres (Atelier vs Boardroom) :
Un ingénieur expert doit savoir basculer instantanément de registre selon son public :
— Style d’atelier (Technicien) : Kijk eens naar die kabel, daar zit een breuk in. (Regarde ce câble, il y a une rupture dedans).
— Style de direction / brevet (Boardroom) : Er dient te worden opgemerkt dat de kabelbreuk de continuïteit van het signaal in het gedrang brengt.
(Il convient de noter que la rupture de câble compromet la continuité du signal).$kt$, $kt$$kt$, null),
  ('Néerlandais', 16, $kt$Cours 16 · Grand Bilan du Bloc 2 (Soutenance Industrielle de l’Ingénieur)$kt$, $kt$Valider l’ensemble des compétences de syntaxe, de métrologie et de structures passives d’ingénierie à l’écrit et soutenir un grand débat oratoire d’influence de niveau C1.$kt$, $kt$Oral : Grand débat oratoire contradictoire La viabilité de l’Industrie 4.0
Mise en situation : Vous devez défendre l’opportunité stratégique et technique de basculer l’usine vers le modèle de la Smart Industry (maintenance prédictive, capteurs connectés IoT, jumeaux numériques) face à un comité d’audit sceptique quant au retour sur investissement et à la cybersécurité.$kt$, $kt$$kt$, null),
  ('Néerlandais', 17, $kt$Cours 17 · Clinique Syntactique (Les Connecteurs d’argumentation avancés)$kt$, $kt$Articuler une pensée technique et contradictoire de niveau expert en utilisant des connecteurs logiques de concession et d’opposition complexes, et maîtriser leur impact sur la structure de la phrase.$kt$, $kt$Théorie Grammaticale Fine
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
— Correcte constructie : Het systeem werkt echter niet. / De resultaten zijn echter onbevredigend.$kt$, $kt$$kt$, null),
  ('Néerlandais', 18, $kt$Cours 18 · Grand Laboratoire (Note de Réfutation et Atelier de Contradiction Technique)$kt$, $kt$De Weerleggingsnota (Note technique de contestation de données)$kt$, $kt$Écrit : De Weerleggingsnota (Note technique de contestation de données)
— Consigne : Rédigez une note de contestation de 15 à 20 lignes en néerlandais formel destinée à un fournisseur de moteurs électriques. Vous devez contester ses spécifications techniques en démontrant que le couple fourni à bas régime ne correspond pas à la fiche technique fournie, ce qui paralyse l’axe d’entraînement mécanique (de aandrijfas).
— Contraintes : Intégrez hoewel, daarentegen, et placez correctement l’adverbe echter au cur d’une proposition. Utilisez le lexique métrologique du Bloc 2.

Oral : La négociation d’ingénierie face au litige fournisseur
— Mise en situation : Vous êtes en visioconférence avec les ingénieurs d’un sous-traitant. Ils soutiennent que le problème vient de votre code d’automatisation et non de leur matériel. Vous devez réfuter leurs arguments un par un, de manière ferme et spontanée, en vous appuyant sur vos relevés de tension et de couple.
— Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Formulez les objections du fournisseur pour les détruire immédiatement (U beweert dat..., aangezien... Desalniettemin tonen onze metingen aan dat...).
— Focus éradication des fautes : Automatisme absolu de l’inversion après les adverbes de liaison. Gestion fluide du ton de la contradiction courtoise mais implacable.$kt$, $kt$$kt$, null),
  ('Néerlandais', 19, $kt$Cours 19 · Clinique Syntactique (Structures adjectivales denses et Gérondifs)$kt$, $kt$Maîtriser l’utilisation des adjectifs étendus et des structures infinitivales denses pour condenser la documentation technique à un niveau managérial et quasi-native.$kt$, $kt$Théorie Grammaticale Fine
L’adjectif étendu et le participe présent pré-positionné (De uitbreiding van
het adjectief)

Le néerlandais formel et le langage d’ingénierie adorent condenser une proposition relative entière sous la forme d’un très long bloc adjectival placé devant le nom. C’est une structure difficile à improviser mais indispensable pour éradiquer les lourdeurs de style.
— Style courant (Structure relative) : De maatregelen die we moeten nemen, zijn duur.
— Style C1 compact (Adjectif étendu) : De te nemen maatregelen zijn duur.
— Structure complexe étendue : De door de hoofdingenieur goedgekeurde softwareversie. (La version logicielle approuvée par l’ingénieur en chef).
— Règle d’or : Le participe passé (goedgekeurde) se place à la fin du bloc adjectival, juste avant le nom qu’il qualifie. Tous les compléments d’agent ou d’objet s’intercalent au milieu.

L’usage du gérondif d’action (Al doende)

Pour exprimer la simultanéité d’un processus automatique ou d’une action humaine (en faisant X...), on utilise le participe présent précédé ou non de al.
Ex : Al metend ontdekte de technicus de kabelbreuk. (En mesurant, le technicien a découvert la rupture de câble).$kt$, $kt$$kt$, null),
  ('Néerlandais', 20, $kt$Cours 20 · Grand Laboratoire (Plan de Déploiement et Pitch de Synthèse Stratégique)$kt$, $kt$Het Implementatieplan (Plan de déploiement d’une mise à jour de parc$kt$, $kt$Écrit : Het Implementatieplan (Plan de déploiement d’une mise à jour de parc
machines)
— Consigne : Rédigez une note d’implémentation de 20 lignes détaillant la mise à niveau logicielle et matérielle d’un parc de 50 machines de découpe automatisées.
— Contraintes : Intégrez au moins trois structures adjectivales denses complexes (ex : de te implementeren softwareversie, de door de kwaliteitsdienst gecertificeerde sensoren). Utilisez le style de la nominalisation pour un rendu concis et exécutif.

Oral : Le briefing stratégique devant le comité d’investissement
— Mise en situation : Vous présentez le plan de déploiement technologique devant le comité de direction. Vous devez justifier le calendrier, la gestion des risques d’arrêt de production (de downtime) et l’impact sur l’efficacité globale des équipements (OEE).
— Consigne orale : Parlez à voix haute pendant 5 minutes en continu, sans aucun support visuel. Votre débit doit être régulier, dense et précis.
— Focus éradication des fautes : Intégrez naturellement des structures de gérondifs pour décrire les gains de temps (Al optimaliserend kunnen we de downtime beperken...). Sécurisez la prononciation des longs adjectifs fléchis sans bafouiller sur le -e final.$kt$, $kt$$kt$, null),
  ('Néerlandais', 21, $kt$Cours 21 · Clinique Syntactique (Le Discours indirect formel et la Concordance des temps)$kt$, $kt$Rapporter les conclusions d’un tiers ou d’un audit de manière indirecte en gérant parfaitement la concordance des temps et les verbes de citation.$kt$, $kt$Théorie Grammaticale Fine
Lorsque vous rapportez un audit, des faits d’atelier ou les directives d’une autorité, vous devez basculer la structure verbale. Si la phrase principale est au passé (De auditeur verklaarde dat...), les verbes de la subordonnée subissent une translation temporelle.

Le style indirect au passé (De indirecte rede)

— Présent Prétérit : Het systeem is onveilig. De auditeur verklaarde dat het systeem onveilig was.
— Passé Plus-que-parfait : We hebben de sensoren gekalibreerd. De technicus meldde dat ze de sensoren hadden gekalibreerd.

Ne répétez pas zeggen. Utilisez la nuance exacte.

Le choix des verbes de citation pour nuancer le propos

— Beweren : Prétendre / affirmer (sous-entend un doute ou une absence de preuve).
— Aantonen / Aantonen dat : Démontrer que / prouver que.
— Benadrukken : Mettre l’accent sur / insister sur.
— Vermelden : Mentionner / faire état de.$kt$, $kt$$kt$, null),
  ('Néerlandais', 22, $kt$Cours 22 · Grand Laboratoire (Rapport d’Audit Qualité et Débriefing d’Équipe)$kt$, $kt$Het Auditverslag (Compte-rendu d’audit de conformité ISO 9001)$kt$, $kt$Écrit : Het Auditverslag (Compte-rendu d’audit de conformité ISO 9001)
1. Consigne : Rédigez un rapport d’audit interne de 15 à 20 lignes synthétisant les conclusions d’un inspecteur qualité concernant la traçabilité des composants mécatroniques dans votre atelier.

Contraintes : Rédigez l’intégralité du corps du texte au discours indirect au passé. Variez
vos verbes de citation (benadrukken, beweren, vermelden). Veillez à la stricte application du rejet des blocs verbaux au plus-que-parfait.

2. Oral : Le débriefing technique et la transmission des directives d’audit
1. Mise en situation : Vous réunissez votre équipe de techniciens d’atelier pour leur restituer les conclusions de l’audit qualité. Vous devez leur expliquer ce que l’inspecteur a validé, ce qu’il a critiqué (le manque de rigueur sur l’étalonnage des capteurs) et leur transmettre les nouvelles directives obligatoires de traçabilité.
2. Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Votre ton doit être managérial, neutre et direct.

Focus éradication des fautes : Ne faites aucun glissement de temps à l’oral (De
inspecteur zei dat de aarding niet goed is... was). Maintenez la concordance des temps historique du début à la fin de votre débriefing.$kt$, $kt$$kt$, null),
  ('Néerlandais', 23, $kt$Cours 23 · Grand Bilan du Bloc 3 (Analyse Stylistique et Sinistres Techniques)$kt$, $kt$Diagnostiquer les failles de style dans des écrits industriels complexes, maîtriser les tournures d’analyse de défaillances et valider le Bloc 3.$kt$, $kt$Théorie Grammaticale Stylistique Fine
Rédiger un rapport d’expertise après une rupture de pièce ou un crash de machine exige une neutralité absolue pour des raisons juridiques et d’assurance. Le style doit être hautement descriptif, s’appuyant sur des passifs d’état et des structures causales objectives.

L’analyse de sinistre et la nuance de la responsabilité technique

— Formulation de cause objective : Te wijten aan (Dû à / imputable à) / Voortvloeien uit (Découler de / résulter de).
— Ex : De schade vloeit voort uit een oververhitting van de servomotor. (Les dommages résultent d’une surchauffe...).

Élimination des scories de style (Le diagnostic final du Bloc 3)

— Vérification des inversions après groupes prépositionnels complexes.
— Validation de la place des particules séparables combinées à des infinitifs (om te herprogrammeren).$kt$, $kt$$kt$, null),
  ('Néerlandais', 24, $kt$Cours 24 · Grand Laboratoire (Rapport d’Expertise Judiciaire et Pitch de Restitution de Sinistre)$kt$, $kt$Valider l’autonomie en contexte professionnel complexe à travers la rédaction technique d’un rapport de sinistre et sa restitution orale devant un comité de direction.$kt$, $kt$Écrit : Het Schaderapport (Rapport d’expertise après rupture mécanique)
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
SCORIES (CYCLES 13 À 16)$kt$, $kt$$kt$, null),
  ('Néerlandais', 25, $kt$Cours 25 · Clinique Lexicale & Culturelle (Variations Pays-Bas vs Flandre L’espace DACH/Ned)$kt$, $kt$Maîtriser le pluricentrisme de la langue néerlandaise, distinguer le lexique technique et managérial des Pays-Bas (Nederlands-Nederlands) de celui de la Belgique flamande (Belgisch-Nederlands), et adapter instantanément son registre à l’oral.$kt$, $kt$Théorie Linguistique Fine : Le marché de la mécatronique (Eindhoven vs Anvers)
La langue néerlandaise est pluricentrique. Si l’allemand officiel sert de référence globale, le néerlandais présente des variations subtiles mais capitales entre le jargon corporate de la région d’Eindhoven (Brainport high-tech) et le monde industriel des ports d’Anvers ou de Gand.

Les interférences de vocabulaire technique et administratif :
— Le logiciel / software : Aux Pays-Bas, on utilise massivement l’anglicisme software (prononcé à l’anglaise). En Flandre, le terme officiel et soutenu est programmatuur.
— L’usine / l’atelier : Aux Pays-Bas, on parlera souvent de de fabriek ou de plant. En Flandre, l’utilisation de de werkplaats ou het bedrijf est privilégiée pour l’atelier de terrain.
— Le bureau / la fonction : Un poste de chef de projet se dira projectmanager aux Pays-Bas, mais on entendra fréquemment projectleider ou diensthoofd en Belgique.
— Les tournures de courtoisie : Le pronom de vouvoiement u est systématique en
Flandre dans le milieu pro. Aux Pays-Bas, le tutoiement (je/jij) s’installe très vite, même avec la hiérarchie directe, sauf dans les rapports ultra-formels.$kt$, $kt$$kt$, null),
  ('Néerlandais', 26, $kt$Cours 26 · Grand Laboratoire (Note de Synthèse Régionale et Négociation d’Écosystème)$kt$, $kt$Rédiger une note d’orientation stratégique adaptée au marché cible et mener une négociation complexe en adaptant instantanément sa posture culturelle.$kt$, $kt$Écrit : De Regionale Aanpassingsnota (Note d’adaptation aux standards du mar-
ché)

Oral : La négociation inter-régionale (L’ingénieur face aux deux marchés)
Mise en situation : Vous menez une réunion commerciale cruciale. Durant la première moitié, vous vous adressez à un acheteur néerlandais direct, pragmatique et adepte du tutoiement collaboratif. Durant la seconde moitié, vous basculez face au directeur technique flamand, très attaché aux protocoles de courtoisie, au vouvoiement (u) et à un langage technique pur.$kt$, $kt$$kt$, null),
  ('Néerlandais', 27, $kt$Cours 27 · Clinique Syntactique (La Syntaxe de la Focalisation et Inversions Stylistiques)$kt$, $kt$Maîtriser l’art de la mise en relief stylistique en déplaçant délibérément des éléments en position 1 pour insister sur des jalons de sécurité ou des choix d’ingénierie.$kt$, $kt$Théorie Grammaticale Fine
Au niveau d’excellence (C1/C2), la phrase ne suit plus uniquement la structure linéaire Sujet-Verbe-Complément. Pour guider l’attention du lecteur sur une donnée critique, l’ingénieur doit savoir manipuler la focalisation :

L’inversion stylistique par l’adverbe restrictif :
Des adverbes comme slechts (seulement), pas (seulement/pas avant), nauwelijks (à peine) forcent une inversion dramatique de la phrase.

— Exemple standard : We hebben de noodstop pas na het incident geactiveerd.
— Exemple focalisé B2/C1 : Pas na het incident (Pos 1) hebben (Pos 2) we (Pos 3) de noodstop geactiveerd.
(Ce n’est qu’après l’incident que nous avons activé l’arrêt d’urgence).

La mise en relief par la structure inversée (Inversie als stijlfiguur) :
Pour souligner une relation de cause à effet immédiate entre deux événements d’atelier :
— Exemple : Instabiel was de spanning, waardoor de PLC crashte.
(Instable était la tension, ce qui a fait planter l’automate).$kt$, $kt$$kt$, null),
  ('Néerlandais', 28, $kt$Cours 28 · Grand Laboratoire (Le Manifeste de l’Innovation et le Pitch d’Influence)$kt$, $kt$Exploiter les structures d’inversion complexes à l’écrit et maîtriser l’accentuation oratoire persuasive face à un jury financier.$kt$, $kt$Écrit : Het Innovatiemanifest (Le Manifeste d’architecture mécatronique disrup-
tive)

Oral : Le Pitch d’influence et d’éloquence devant les investisseurs (Venture Ca-
pitalists)
Mise en situation : Vous devez pitcher votre startup de robotique industrielle devant un fonds d’investment néerlandais à Rotterdam. Vous demandez un financement d’un million d’euros. Vous devez les captiver, prouver la viabilité technologique de votre système automatique et imposer votre leadership technique par une éloquence sans faille.$kt$, $kt$$kt$, null),
  ('Néerlandais', 29, $kt$Cours 29 · Clinique du Style (Chasse aux Scories Finales & Accords d’Adjectifs Complexes)$kt$, $kt$Éradiquer les ultimes fautes d’inattention grammaticale qui trahissent un locuteur étranger, notamment les exceptions d’accords d’adjectifs et les pluriels scientifiques rares.$kt$, $kt$Théorie Grammaticale Chirurgicale : Les zones d’ombre du C1/C2
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
— Het medium → de media.$kt$, $kt$$kt$, null),
  ('Néerlandais', 30, $kt$Cours 30 · Grand Laboratoire (Spécification de Brevet et Monologue Philosophique)$kt$, $kt$Rédiger une demande de brevet d’une précision nominale absolue et soutenir une argumentation abstraite fluide de niveau C1/C2 sans support.$kt$, $kt$Oral : Le monologue de haute volée sur l’éthique de la robotique industrielle
Mise en situation : Vous êtes invité à donner une conférence de clôture lors d’un symposium international à l’Université de Technologie d’Eindhoven (TU/e). Votre sujet est abstrait et
philosophique : De ethiek van automatisering en de autonomie van de machine in de samenleving van morgen.$kt$, $kt$$kt$, null),
  ('Néerlandais', 31, $kt$Cours 31 · Grand Examen Blanc de Maîtrise Syntactique et Lexicale (Niveau C1 Technique)$kt$, $kt$Évaluer l’ensemble des compétences acquises sur la trame de néerlandais à travers une batterie de diagnostics d’erreurs complexes à corriger sous pression.$kt$, $kt$Consigne : Identifiez et corrigez les fautes dissimulées dans ce paragraphe rédigé par un ingénieur non-natif : Gisteren de projectleider heeft besloten om de software te updaten, omdat het systeem wegens een kortsluiting gisteravond niet opstarten kon. Echter, de fotocel is niet werkend y voldoet niet op de eisen van het bestek. We moeten een meting maken om de power te controleren, hoewel de te nemen maatregelen erg duur zijn.$kt$, $kt$$kt$, null),
  ('Néerlandais', 32, $kt$Cours 32 · Le Grand Oral Blanc de Fin de Cursus & Structure Globale LaTeX$kt$, $kt$Soutenir une performance oratoire ultime de niveau C1 professionnel et préparer l’organisation finale du code LaTeX pour l’archivage de votre manuel de néerlandais.$kt$, $kt$Grand Atelier d’Expression Orale : La Soutenance Finale de Maîtrise (10 minutes)

Gefeliciteerd ! U heeft de geavanceerde cursus Nederlands voor
mechatronisch ingenieurs succesvol afgerond.$kt$, $kt$$kt$, null)
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
  and c.language = 'Néerlandais'
  and e.origin <> 'member';

-- les exercices des membres passent après ceux du manuel (position + 1000, une seule fois)
update public.language_exercises e
set position = e.position + 1000
from public.language_courses c
where e.course_id = c.id
  and c.language = 'Néerlandais'
  and e.origin = 'member'
  and e.position < 1000;

-- 3) Nouveaux exercices du manuel
insert into public.language_exercises
  (course_id, position, prompt, answer, expected_answer, accepted_answers, explanation, exercise_type, origin)
select c.id, x.pos, x.prompt, x.expected, x.expected, x.accepted, x.explanation, 'written', 'manual'
from (values
  (1, 1, $kt$Consigne : Rédigez une note d’analyse technique de 15 lignes en néerlandais soutenu. Vous résumez un incident d’automatisation sur une ligne de conditionnement. Données à intégrer : Des variations de tension spanningsschommelingen) provoquent des arrêts d’urgence de l’automate(PLC-storingen). Les capteurs ne sont pas calibrés de manière optimale. Contraintes syntaxiques : Amorcez au moins trois phrases par un complément complexe avec inversion. Variez l’usage de niet (négation totale vs partielle).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (1, 2, $kt$Consigne orale : Parlez à voix haute en continu pendant 5 minutes. Simulez les questions agressives du directeur et apportez vos répliques de défense techniques de manière fluide. Focus éradication des fautes : Aucun blocage sur l’inversion lors du passage du coq à l’âne (Daarom kunnen we... / In dat geval moeten we...). Accentuez fermement la première syllabe des mots composés : kórtsluiting, ínstelling.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (2, 1, $kt$Consigne orale : Parlez à voix haute en continu pendant 5 minutes complètes. Simulez vous-même les questions agressives du directeur d’usine et apportez vos répliques de défense techniques de manière fluide et souveraine. Focus éradication des fautes : — Aucun blocage ou hésitation sur la structure d’inversion lors du passage du coq à l’âne ou des transitions rapides (Daarom kunnen we... / In dat geval moeten we...). — Accentuez fermement et distinctement la première syllabe des mots composés : kórtsluiting, ínstelling.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (3, 1, $kt$Traduisez les phrases suivantes en néerlandais technique : "Le technicien doit raccorder le faisceau de câbles au bornier de l’automate."$kt$, $kt$De technicus moet de kabelboom aansluiten op het klemmenblok van de PLC$kt$, array[$kt$De technicus moet de kabelboom aansluiten op het klemmenblok van de PLC$kt$]::text[], $kt$De technicus moet de kabelboom aansluiten op het klemmenblok van de PLC.$kt$),
  (3, 2, $kt$Traduisez les phrases suivantes en néerlandais technique : "Vérifie si la mise à la terre du circuit imprimé est correcte."$kt$, $kt$Controleer of de aarding van de printplaat correct is$kt$, array[$kt$Controleer of de aarding van de printplaat correct is$kt$]::text[], $kt$Controleer of de aarding van de printplaat correct is.$kt$),
  (4, 1, $kt$Consigne : Rédigez une fiche d’instructions d’atelier (werkinstructie) de 15 lignes. Vous détaillez la procédure d’installation, de raccordement et de test d’un nouveau module de tri équipé de capteurs optiques et de moteurs pas-à-pas (stappenmotoren). Contraintes : Utilisez le ton de l’infinitif d’instruction ou la tournure semi-formelle U dient... te.... Intégrez au moins 5 mots du cours 3. Appliquez l’inversion lors du changement d’étape (Na het monteren van de printplaat sluit u...).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (4, 2, $kt$Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Donnez des instructions de dépannage claires. Utilisez l’inversion pour lier les actions (Eerst meet je de spanning, daarna controleer je...). Focus éradication des fautes : Bannissez absolument les calques maken een test (→ een test uitvoerenoutesten)etde sensor is niet werkend(→ de sensor werkt niet).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (5, 1, $kt$Reliez les éléments au sein d’une subordonnée correcte en appliquant la règle IPP : De software werkt niet, omdat de technicus / de parameters / moeten / aanpassen / heeft.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : ... omdat de technicus de parameters heeft moeten aanpassen.$kt$),
  (6, 1, $kt$Consigne : Rédigez une spécification logique d’algorithme (technische specificatie) de 15 lignes détaillant la logique de contrôle d’une boucle de régulation de température pour un système de refroidissement. Données à intégrer : Si la température mesurée dépasse le seuil critique (de drempelwaarde), le ventilateur doit s’enclencher à sa puissance maximale. Tant que la pression n’est pas descendue sous les 2 bars, la vanne de sécurité (de veiligheidsklep) ne peut pas être rouverte. Contraintes : Utilisez les termes de voorwaarde (la condition), de lus (la boucle), de feedbackkoppeling (la boucle de rétroaction). Gérez la cascade verbale finale de manière rigoureuse dans toutes vos subordonnées imbriquées.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (6, 2, $kt$Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Expliquez la logique de manière fluide comme si vous dessiniez le diagramme d’architecture sur un tableau blanc. Focus éradication des fautes : Maintenez une syntaxe parfaite lors des subordonnées imbriquées (Wanneer de encoder detecteert dat de afwijking te groot is, zal...). Accentuez cor- rectement : ’pá-rameter, ’féedbackkoppeling.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (7, 1, $kt$Transposez la phrase active générale à la voix passive impersonnelle avancée avec er : Men test de veiligheidskleppen elke ochtend. → Er                                            .$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Er worden elke ochtend veiligheidskleppen getest. Note : Le verbe se met au pluriel (worden) car le COD de la phrase active (de veiligheidskleppen) devient le sujet réel au pluriel de la phrase passive.$kt$),
  (8, 1, $kt$Consigne : Rédigez une section de notice de sécurité et d’homologation (veiligheidsprocedure) de 15 lignes pour une ligne de montage automatisée. Contraintes : Intégrez au moins trois structures passives impersonnelles avec er (ex : er wordt geadviseerd om..., er dient te worden opgemerkt dat...). Utilisez le lexique de la conformité industrielle (de conformiteit, de CE-markering, de noodstop = l’arrêt d’urgence).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (8, 2, $kt$Consigne orale : Soutenez un exposé de 5 minutes en continu, sans aucune note écrite sous les yeux. Le ton doit être académique, fluide et percutant. Focus éradication des fautes (Grand Bilan Bloc 1) : — Zéro faute d’inversion lors des transitions (Vervolgens wordt er... / Tegelijkertijd moeten we...). — Intégration fluide de subordonnées contenant des cascades de trois verbes sans rupture syntaxique.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (9, 1, $kt$Complétez les phrases techniques avec le terme adéquat : De machine is stilgelegd vanwege een ernstige                         (panne) in de overbrenging.$kt$, $kt$storing$kt$, array[$kt$storing$kt$]::text[], $kt$storing$kt$),
  (9, 2, $kt$Complétez les phrases techniques avec le terme adéquat : De technicus moet de                      (roulements) vervangen om verdere (usure) te voorkomen.$kt$, $kt$lagers / slijtage$kt$, array[$kt$lagers / slijtage$kt$, $kt$lagers slijtage$kt$, $kt$lagers$kt$, $kt$slijtage$kt$]::text[], $kt$lagers / slijtage$kt$),
  (10, 1, $kt$Consigne : Rédigez un rapport d’incident mécanique de 15 lignes destiné au département de maintenance. Vous décrivez la rupture d’un accouplement d’arbre de transmission due à un défaut de lubrification et à l’usure prématurée des roulements. Contraintes : Utilisez le style nominal soigné. Intégrez au moins 5 termes techniques étudiés au cours 9. Appliquez l’ordre des verbes finaux de manière rigoureuse dans toutes vos justifications logiques.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (10, 2, $kt$Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Menez l’interaction en gérant le stress du technicien. Formulez des instructions impératives claires et structurez vos hypothèses de diagnostic (Als de multimeter nul volt aangeeft, dan betekent dit dat...). Focus éradication des fautes : Bannissez la traduction littérale ń être en panne ż par is in panne (calque francophone). Utilisez exclusivement la formule standard : de machine heeft een storing ou de machine ligt plat.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (11, 1, $kt$Remplissez avec l’adverbe pronominal ou la préposition correcte : Het prototype voldoet volledig                   de technische specificaties.$kt$, $kt$aan$kt$, array[$kt$aan$kt$]::text[], $kt$aan (voldoen aan).$kt$),
  (11, 2, $kt$Remplissez avec l’adverbe pronominal ou la préposition correcte : De sensoren                         (avec lesquels) we de druk meten, zijn zeer nauwkeurig.$kt$, $kt$waarmee$kt$, array[$kt$waarmee$kt$]::text[], $kt$waarmee (met + wat → waarmee).$kt$),
  (12, 1, $kt$Consigne : Rédigez la section de validation de conformité d’une offre d’ingénierie de 15 lignes. Vous démontrez que votre système mécatronique répond parfaitement aux contraintes d’espace, de consommation et de cadence imposées par le client. Contraintes : Intégrez au moins quatre verbes à préposition fixe étudiés au cours 11, et exploitez judicieusement les adverbes pronominaux complexes de liaison (daardoor, waarmee, waaraan).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (12, 2, $kt$Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Soutenez votre position de manière ferme, hautement professionnelle, technique et courtoise. Focus éradication des fautes : Intégration naturelle et spontanée des adverbes pronominaux de relance à l’oral (De documenten waarnaar u verwijst... / De oplossing waarmee we dit probleem oplossen...). Aucun glissement ou erreur de préposition.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (13, 1, $kt$Corrigez les erreurs lexicales industrielles dans la phrase suivante : De technicus moet een meting maken om de power en de voltage van de motor te controleren.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : De technicus moet een meting verrichten om het vermogen en de spanning van de motor te controleren.$kt$),
  (14, 1, $kt$Consigne : Rédigez un protocole de test métrologique (kalibratieprotocol) de 15 lignes décrivant l’étalonnage des capteurs de pression et l’analyse de la puissance absorbée par les moteurs lors des essais de charge. Contraintes : Utilisez un vocabulaire métrologique pur et précis (termes d’incertitude : de nauwkeurigheid = la précision, de afwijking = l’écart, de tolerantie). Appliquez les structures de verbes d’action corrects (verrichten, doorvoeren).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (14, 2, $kt$Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Argumentez de manière structurée en comparant les grandeurs physiques exactes (spanning, stroom, toerental, koppel).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (15, 1, $kt$Mettez la phrase au conditionnel passé irréel pour analyser l’incident : Als we de PLC (reprogrammeren), (voorkomen) we de storing.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Als we de PLC hadden herprogrammeerd, hadden we de storing voorkomen.$kt$),
  (16, 1, $kt$Consigne : Rédigez une note technique formelle de 20 lignes dans un registre hautement académique et d’ingénierie soignée. Vous devez décrire le fonctionnement innovant d’un système de récupération d’énergie sur un axe mécanique automatisé. Contraintes (Grand Bilan Bloc 2) : Mobilisez l’ensemble des cliniques de fautes étudiées : utilisez une syntaxe d’inversion impeccable, placez parfaitement niet, intégrez des adverbes pronominaux complexes (waardoor, hiermee), appliquez les termes de grandeurs physiques sans calque de l’anglais, et rédigez le tout dans un style passif impersonnel dense.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (16, 2, $kt$Consigne orale (Performance ultime du bloc) : Prenez la parole à voix haute pendant 10 minutes complètes en continu. Menez le débat de manière autonome en formulant vousmême les objections complexes du comité d’audit, puis en y répondant immédiatement avec l’assurance, le débit et le registre d’un ingénieur mécatronique quasi-native. Focus éradication des fautes : Fluidité absolue du débit, aucune scorie syntaxique de fin de phrase, précision lexicale chirurgicale des grandeurs physiques et des composants de terrain lors des phases d’improvisation rapide.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (17, 1, $kt$Reliez ou corrigez les énoncés en utilisant les connecteurs avancés requis : Echter, de PLC-programmeur heeft de code niet geoptimaliseerd. (Corrigez la place de echter).$kt$, $kt$De PLC-programmeur heeft de code echter niet geoptimaliseerd$kt$, array[$kt$De PLC-programmeur heeft de code echter niet geoptimaliseerd$kt$]::text[], $kt$De PLC-programmeur heeft de code echter niet geoptimaliseerd.$kt$),
  (17, 2, $kt$Reliez ou corrigez les énoncés en utilisant les connecteurs avancés requis : De metingen zijn nauwkeurig. (Néanmoins), we moeten een tweede testverloop uitvoeren. (Desalniettemin).$kt$, $kt$De metingen zijn nauwkeurig. Desalniettemin moeten we een tweede testverloop uitvoeren$kt$, array[$kt$De metingen zijn nauwkeurig. Desalniettemin moeten we een tweede testverloop uitvoeren$kt$]::text[], $kt$De metingen zijn nauwkeurig. Desalniettemin moeten we een tweede testverloop uitvoeren.$kt$),
  (19, 1, $kt$Transposez la proposition relative en une structure adjectivale dense prépositionnée :De parameters die door de PLC-regelaar worden aangepast... De __________ parameters... Coreection Cours 19$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (19, 2, $kt$1. De door de PLC-regelaar aangepaste parameters ...$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (21, 1, $kt$Transposez la déclaration directe de l’auditeur au style indirect au passé : De inspecteur benadrukt : De machineoperators hebben de veiligheidsprocedure niet gerespecteerd. De inspecteur benadrukte dat de machineoperators de veiligheidsprocedure __________ .$kt$, $kt$de veiligheidsprocedure niet hadden gerespecteerd$kt$, array[$kt$de veiligheidsprocedure niet hadden gerespecteerd$kt$]::text[], $kt$... de veiligheidsprocedure niet hadden gerespecteerd. (Translation au plus-que-parfait en fin de subordonnée).$kt$),
  (23, 1, $kt$Reliez les faits techniques de manière formelle et causale en utilisant voortvloeien uit : De PLC-storing / een foutieve parameterinstelling / (volgde uit). De PLC-storing __________.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : De PLC-storing vloeide voort uit een foutieve parameterinstelling. (Prétérit de voortvloeien uit).$kt$),
  (24, 1, $kt$Consigne orale : Prenez la parole à voix haute pendant 5 minutes complètes en continu, sans aucune note. Votre ton doit être celui d’un expert technique souverain. Vous devez : 1. Expliquer scientifiquement l’origine du sinistre (phénomène de fatigue des matériaux due à des vibrations de haute fréquence non détectées par les capteurs d’origine). 2. Énoncer le plan d’action d’urgence et les mesures correctives pour la remise en production. Focus éradication des fautes : Le débit doit être parfaitement fluide. L’évaluation portera sur l’intégration spontanée et correcte de structures de style nominal et d’adjectifs étendus fléchis, sans aucune hésitation ou rupture en fin de phrase.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (25, 1, $kt$Adaptez la phrase technique suivante selon le public cible : "Le chef de projet veut mettre à jour le logiciel de l’automate." Variante Pays-Bas (Eindhoven) : De                               wil de                     van de PLC updaten. Variante Flandre (Anvers) : De                             wil de                     van de PLC bijwerken.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Variante Pays-Bas : De projectmanager wil de software van de PLC updaten. Variante Flandre : De projectleider (ou het diensthoofd) wil de programmatuur van de PLC bijwerken.$kt$),
  (26, 1, $kt$Consigne : Rédigez une note d’orientation de 15 lignes détaillant l’implantation d’une filiale de votre entreprise d’ingénierie. Vous devez adapter le document selon que vous postulez pour un projet auprès d’ASML à Veldhoven (Pays-Bas) ou d’un consortium industriel à Courtrai (Flandre). Contraintes : — Appliquez scrupuleusement le lexique ciblé de l’écosystème choisi (anglicismes intégrés pour les Pays-Bas vs purisme lexical pour la Flandre). — Maintenez la structure C1 des connecteurs du bloc 3.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (26, 2, $kt$Consigne orale : Parlez à voix haute pendant 5 minutes en continu. Modifiez votre posture, votre niveau de langue et votre lexique au milieu du pitch pour prouver votre flexibilité culturelle absolue. Focus éradication des fautes : Ne faites aucune erreur d’accord de pronom (u avec la conjugaison en -t vs je/jij sans -t lors de l’inversion).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (27, 1, $kt$Transformez la phrase linéaire en une structure de focalisation forte en déplaçant le bloc prépositionnel en Position 1 : We hebben de parameters pas na de kalibratie handmatig aangepast. → Pas na de kalibratie                                      de parameters handmatig aangepast.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : Pas na de kalibratie hebben we de parameters handmatig aangepast. (L’inversion de focalisation bloque le bloc auxiliaire-sujet).$kt$),
  (28, 1, $kt$Consigne : Rédigez un plaidoyer technique (innovatiemanifest) de 15 à 20 lignes démontrant la supériorité d’un brevet de robotique collaborative que vous avez conçu. Contraintes : — Utilisez au moins quatre inversions de focalisation stylistique en début de phrase (ex : Slechts door..., Nauwelijks had de actuator...). — Éliminez toute tiédeur de style, chaque phrase doit percuter le lecteur par sa structure.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (28, 2, $kt$Consigne orale : Parlez à voix haute pendant 5 minutes en continu, sans aucun support. Votre débit doit être percutant, théâtral mais rigoureusement scientifique. Focus éradication des fautes : Précision absolue des structures de mise en relief. L’accentuation oratoire doit être parfaitement calée sur les préfixes séparables pour marquer la puissance de vos verbes d’action (doorvoeren, úitvoeren).$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (29, 1, $kt$Accordez correctement l’adjectif entre parenthèses selon le genre et le nombre du nom : Dit is een uiterst (complex)                        probleem. (het probleem).$kt$, $kt$complex$kt$, array[$kt$complex$kt$]::text[], $kt$complex (Nom neutre, singulier, précédé de een → l’adjectif reste invariable).$kt$),
  (29, 2, $kt$Accordez correctement l’adjectif entre parenthèses selon le genre et le nombre du nom : We moeten aan strenge (technisch)                         criteria voldoen. (de criteria).$kt$, $kt$technische$kt$, array[$kt$technische$kt$]::text[], $kt$technische (Nom au pluriel → prend systématiquement la désinence -e).$kt$),
  (30, 1, $kt$Consigne : Rédigez le texte de dépôt d’un brevet (octrooiaanvraag) de 20 lignes décrivant l’interaction automatisée entre un capteur inductif et un actionneur linéaire. Contraintes : — Rigueur nominale absolue. Zéro faute sur les exceptions d’accord de l’adjectif (introduisez délibérément des noms neutres indéterminés comme elektrisch vermogen, digitaal signaal). — Utilisez les pluriels scientifiques exacts de manière organique.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (30, 2, $kt$Consigne orale : Parlez à voix haute pendant 5 minutes en continu, sans aucune note. Vous devez manier des concepts abstraits, lier vos arguments avec l’élégance des connecteurs du bloc 3 et la force de focalisation vue au cours 27. Focus éradication des fautes : Fluidité totale, maîtrise absolue de la mélodie de phrase, intonation descendante parfaite sur les verbes de fin de proposition subordonnée, aucune scorie résiduelle.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$),
  (31, 1, $kt$Consigne : Identifiez et corrigez les fautes dissimulées dans ce paragraphe rédigé par un ingénieur non-natif : Gisteren de projectleider heeft besloten om de software te updaten, omdat het systeem wegens een kortsluiting gisteravond niet opstarten kon. Echter, de fotocel is niet werkend y voldoet niet op de eisen van het bestek. We moeten een meting maken om de power te controleren, hoewel de te nemen maatregelen erg duur zijn.$kt$, $kt$$kt$, '{}'::text[], $kt$Proposition de corrigé : — Gisteren de projectleider heeft... × → Gisteren heeft de projectleider... (Erreur de focalisation, inversion requise en Position 1). — ... niet opstarten kon. × → ... niet heeft kunnen opstarten. (Erreur de cascade verbale, règle de l’IPP avec deux infinitifs). — Echter, de fotocel... × → De fotocel is echter... (Erreur de positionnement de l’adverbe echter, qui ne peut pas démarrer la phrase suivi d’une virgule). — ... is niet werkend... × → ... werkt niet... (Lourdeur stylistique, calque structurel maladroit de l’anglais). — ... voldoet niet op de eisen... × → ... voldoet niet aan de eisen... (Erreur de préposition fixe liée au verbe voldoen aan). — ... een meting maken... × → ... een meting verrichten (ou uitvoeren). (Calque lexical incorrect). — ... de power... × → ... het vermogen (Faux ami de la métrologie et du jargon technique).$kt$),
  (32, 1, $kt$Consigne : Choisissez la problématique technique la plus complexe de votre cursus (l’analyse du sinistre de l’arbre mécanique du cours 24 ou l’arbitrage d’architecture du cours 14). Prenez la parole à voix haute de manière souveraine pendant 10 minutes complètes en continu. Critères de validation finale C1/C2 : — Adaptation culturelle : Adaptation fluide du lexique et des pronoms selon le marché ciblé (jargon d’Eindhoven vs purisme de Flandre). — Structure d’éloquence : Utilisation spontanée d’inversions stylistiques de focalisation pour rythmer et scander votre présentation. — Zéro scorie : Maîtrise absolue des prépositions fixes, des exceptions d’accords d’adjectifs et de l’ordre des mots en fin de subordonnée. — Prosodie : Débit constant, diction articulée et intonation descendante naturelle sur les blocs verbaux terminaux.$kt$, $kt$$kt$, '{}'::text[], $kt$Production libre : relisez votre texte en vérifiant les points de grammaire du cours.$kt$)
) as x(course_number, pos, prompt, expected, accepted, explanation)
join public.language_courses c
  on c.language = 'Néerlandais' and c.course_number = x.course_number;

commit;

-- Contrôle (à lancer après) : doit afficher 32 cours et 46 exercices du manuel
-- select count(*) from public.language_courses where language = 'Néerlandais';
-- select count(*) from public.language_exercises e join public.language_courses c on c.id = e.course_id
--   where c.language = 'Néerlandais' and e.origin = 'manual';
