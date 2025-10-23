# Résumé des Saisons O'clock

Cette fiche synthétise les notions fondamentales abordées durant les saisons de la formation "Expert Cybersécurité" en vue du Titre Pro "Administrateur d'Infrastructures Sécurisées".

Quelques liens utiles donnés lors de ces cours sont [ICI](../ressources/Ressources.md).

## **💻 Saison 01 : Savoirs de Base**

L'objectif de cette saison est de construire un socle de connaissances commun sur le fonctionnement des ordinateurs, des systèmes d'exploitation, des réseaux et de la sécurité.

---

### 🎯 0101. & 0102. Introduction Formation O'clock & Titre Pro AIS

Cette introduction a permis de présenter le déroulement de la formation, ses objectifs pédagogiques et les attentes pour l'obtention du **Titre Professionnel "Administrateur d'Infrastructures Sécurisées" (AIS)**. L'accent a été mis sur les compétences à acquérir, la méthodologie de travail (projets, veille technologique) et le référentiel du titre pro.

[Challenge 0102](../challenges/Challenge_0102.md)

---

### 📜 0103. Histoire de l'Informatique

L'informatique est un domaine dont les racines sont bien plus anciennes que les ordinateurs modernes.

* **Les Origines** : Les concepts de base remontent à l'Antiquité avec les algorithmes, comme celui d'**Euclide**. Le mot "algorithme" lui-même dérive du nom du mathématicien **Al-Khwarizmî**.
* **La Programmation Mécanique** : Le premier système mécanique programmable est le **métier à tisser Jacquard**, qui utilisait des cartes perforées. **Ada Lovelace** est reconnue pour avoir écrit le premier véritable programme informatique sur la machine analytique de Charles Babbage au XIXe siècle.
* **L'Ère Moderne** :
  * **Alan Turing** a posé les fondements scientifiques de l'informatique avec la "machine de Turing".
  * **John von Neumann** a défini l'architecture qui est encore utilisée dans la quasi-totalité des ordinateurs modernes.
  * L'invention du **transistor** en 1947 a été une révolution, remplaçant les tubes à vide et permettant la miniaturisation.
  * Le **circuit intégré** (1958) et le **microprocesseur** (1969) ont permis de réduire encore la taille et le coût des ordinateurs.
  * La **loi de Moore** postule que le nombre de transistors sur un microprocesseur double environ tous les deux ans, une tendance qui a guidé l'industrie pendant des décennies.
* **L'Ordinateur Personnel (PC)** : Les années 70 et 80 ont vu l'émergence des micro-ordinateurs accessibles au grand public, avec des machines emblématiques comme l'**Altair 8800**, l'**Apple II**, le **Commodore 64** et l'**IBM PC**.

En résumé :

| Période | Événement/Pionnier | Contribution |
| :--- | :--- | :--- |
| ~300 av. J.-C. | **Euclide** | Création de l'**algorithme d'Euclide**. |
| ~1830 | **Ada Lovelace** | Premier véritable **programme informatique**. |
| ~1936 | **Alan Turing** | Fondements scientifiques (machine de Turing). |
| 1945 | **John Von Neumann** | Architecture de von Neumann (base des PCs modernes). |
| 1947 | **Transistor** | Remplacement des tubes électroniques ; clé de la miniaturisation. |
| 1965 | **Loi de Moore** | Postule que le nombre de transistors double tous les deux ans. |
| 1969 | **Micro-processeur** | Invention du composant central (ex: Intel 4004). |
| 1975 | **Altair 8800** | Lancement de l'ère des micro-ordinateurs personnels. |

[Challenge 0103](../challenges/Challenge_0103.md)

---

### ⚙️ 0104. Les Composants Matériels (Hardware)

Un ordinateur est constitué d'un ensemble de composants physiques (le hardware) qui interagissent pour fonctionner.

* **La Carte Mère** : C'est le circuit imprimé central qui connecte tous les autres composants. Elle inclut :
  * Le **socket** pour le processeur.
  * Les **slots de mémoire vive (RAM)**.
  * Les **connecteurs d'extension** (ex: PCI Express) pour les cartes additionnelles.
  * Les **connecteurs de stockage** (ex: SATA, M.2) pour les disques durs et SSD.
  * Le **BIOS/UEFI**, un micrologiciel qui initialise le matériel au démarrage.
* **Le Processeur (CPU)** : C'est le "cerveau" de l'ordinateur qui exécute les calculs et les instructions. Ses performances dépendent de sa **fréquence** (en GHz) et de son **nombre de cœurs**. Il doit être refroidi, généralement par un **ventirad** (ventilateur + radiateur) avec de la **pâte thermique** pour assurer le transfert de chaleur.
* **La Mémoire Vive (RAM)** : C'est la mémoire de travail, rapide mais **volatile** (elle perd ses données quand l'ordinateur est éteint). On la trouve sous forme de barrettes (DIMM pour les PC fixes, SO-DIMM pour les portables).
* **Le Stockage** : C'est la mémoire de masse, non volatile, où sont stockés le système d'exploitation, les logiciels et les fichiers.
  * **Disque Dur (HDD)** : Technologie magnétique plus ancienne, à disques tournants.
  * **SSD (Solid-State Drive)** : Technologie plus récente basée sur de la **mémoire flash**, beaucoup plus rapide et résistante aux chocs.
* **La Carte Graphique (GPU)** : C'est une carte d'extension dédiée à la production et à l'affichage des images sur un écran. Elle est essentielle pour les jeux vidéo et les applications graphiques intensives.
* **L'Alimentation (PSU)** : C'est le bloc qui convertit le courant alternatif du secteur en tensions continues pour alimenter tous les composants. Sa capacité est mesurée en **Watts (W)**.
* **Les Périphériques** : Ce sont des dispositifs connectés à l'ordinateur pour lui ajouter des fonctionnalités. Ils se classent en trois catégories :
  * **Périphériques d'entrée** : Clavier, souris, webcam, micro.
  * **Périphériques de sortie** : Écran, imprimante, haut-parleurs.
  * **Périphériques d'entrée-sortie** : Clé USB, disque dur externe, écran tactile.

[Challenge 0104](../challenges/Challenge_0104.md)

---

### 💿 0105. Le Système d'Exploitation (OS)

Le système d'exploitation (OS) est le logiciel principal qui sert d'intermédiaire entre le matériel et les applications logicielles. Les plus courants sur ordinateur sont Windows, macOS et GNU/Linux.

* **Le Noyau (Kernel)** : C'est le cœur de l'OS. Il gère les ressources matérielles (mémoire, processeur), l'exécution des programmes, les périphériques et les systèmes de fichiers.
* **Les Interfaces** : Pour interagir avec le noyau, on utilise :
  * L'**interface graphique (GUI)** : Menus, icônes, fenêtres (ex: le bureau Windows).
  * L'**interface en ligne de commande (CLI)** : Terminal où l'on tape des commandes textuelles (ex: `shutdown`).
  * L'**interface de programmation (API)** : Utilisée par les programmes pour demander des services à l'OS.
* **Concepts Clés** :
  * **Processus** : Un programme en cours d'exécution.
  * **Système Multitâches** : Capacité de l'OS à exécuter plusieurs programmes de façon "simultanée" en alternant très rapidement entre eux.
  * **Pilotes (Drivers)** : Programmes spécifiques qui permettent à l'OS de communiquer avec un périphérique matériel.
* **Installation d'un OS** :
  * Se fait généralement à partir d'un **média d'installation** (clé USB ou DVD).
  * Ce média est créé à partir d'une **image ISO**, qui est une copie conforme d'un disque.
  * Il faut configurer le **BIOS/UEFI** de l'ordinateur pour qu'il démarre ("boot") sur ce média d'installation.

[Challenge 0105](../challenges/Challenge_0105.md)

---

### 🔢 0106. Numération : Bits et Octets

Les ordinateurs fonctionnent avec un système binaire, qui est la base de toute information numérique.

* **Bit et Octet** :
  * Le **bit** (binary digit) est la plus petite unité d'information et peut avoir deux valeurs : 0 ou 1.
  * Un **octet** (Byte en anglais) est un groupe de 8 bits.
* **Multiples** : Il existe une confusion fréquente entre les multiples décimaux (base 10) et binaires (base 2).
  * **Préfixes SI (décimaux)** : kilooctet (ko) = 1000 octets, mégaoctet (Mo) = 1 000 000 octets.
  * **Préfixes binaires** : kibioctet (Kio) = 1024 octets, mébioctet (Mio) = 1 048 576 octets.
  * C'est pourquoi un disque dur de 1 Téraoctet (To) est affiché par le système d'exploitation comme ayant environ 930 Gibioctets (Go).
* **Systèmes de Numération** :
  * **Binaire (base 2)** : Utilise les chiffres 0 et 1.
  * **Décimal (base 10)** : Le système que nous utilisons tous les jours (0-9).
  * **Hexadécimal (base 16)** : Utilise les chiffres 0-9 et les lettres A-F. Souvent utilisé en informatique pour représenter des valeurs binaires de manière plus compacte.
* **Encodage des Caractères** : Pour représenter du texte, chaque caractère est associé à un nombre.
  * **ASCII** : Une des premières normes, limitée à 128 caractères (principalement pour l'anglais).
  * **Unicode (UTF-8)** : La norme moderne qui peut représenter la quasi-totalité des systèmes d'écriture du monde, y compris les accents et les emojis.

[Challenge 0106](../challenges/Challenge_0106.md)

---

### 🌐 0107. Introduction aux Réseaux Informatiques

Un réseau est un ensemble d'équipements informatiques connectés entre eux pour partager des ressources et communiquer.

* **Types de Réseaux (par étendue)** :
  * **LAN (Local Area Network)** : Réseau local (ex: à la maison, dans une entreprise).
  * **WAN (Wide Area Network)** : Réseau étendu qui connecte plusieurs LAN sur de longues distances. **Internet** est le plus grand des WAN.
* **Topologies de Réseau** : C'est la manière dont les équipements sont interconnectés.
  * **En étoile** : Tous les équipements sont connectés à un point central (un switch). C'est la topologie la plus courante pour les réseaux LAN.
  * Autres topologies : en bus, en anneau, maillée.
* **Adressage IP (IPv4)** :
  * Chaque machine sur un réseau a une **adresse IP** unique pour être identifiée, comme une adresse postale.
  * Une adresse IPv4 est composée de 4 nombres entre 0 et 255 (ex: `192.168.1.10`). C'est une adresse de 32 bits (4 octets).
  * Le **masque de sous-réseau** (ex: `255.255.255.0`) permet de diviser l'adresse IP en deux parties : une partie qui identifie le **réseau** et une partie qui identifie la **machine** sur ce réseau.
  * Deux machines peuvent communiquer directement seulement si elles sont sur le **même réseau**, c'est-à-dire si elles ont la même partie réseau.
* **Diagrammes Réseau** : Ce sont des schémas qui représentent l'organisation d'un réseau.
  * **Diagramme Physique** : Montre l'emplacement réel des équipements et leur câblage.
  * **Diagramme Logique** : Montre comment les informations circulent, les adresses IP, les sous-réseaux, etc.

[Challenge 0107](../challenges/Challenge_0107.md)

---

### 🛡️ 0108. Sécurité Informatique

La sécurité informatique vise à protéger les systèmes d'information contre les menaces et à garantir leur bon fonctionnement.

* **Les 5 Piliers de la Sécurité** :
    1. **Confidentialité** : S'assurer que seules les personnes autorisées peuvent accéder aux données.
    2. **Intégrité** : Garantir que les données n'ont pas été modifiées de manière non autorisée.
    3. **Disponibilité** : S'assurer que le système et les données sont accessibles lorsque l'on en a besoin.
    4. **Authentification** : Vérifier l'identité d'un utilisateur.
    5. **Non-répudiation (ou Traçabilité)** : S'assurer qu'un utilisateur ne peut pas nier avoir effectué une action.
* **Grands Principes** :
  * **Défense en profondeur** : Mettre en place plusieurs couches de sécurité.
  * **Principe du moindre privilège** : Donner aux utilisateurs uniquement les droits nécessaires pour accomplir leurs tâches.
  * La sécurité absolue n'existe pas ; il faut se préparer à l'échec (sauvegardes, plans de reprise).
  * L'utilisateur est souvent le maillon le plus faible de la chaîne de sécurité.
* **Bonnes Pratiques** :
  * **Mots de passe** : Utiliser un **gestionnaire de mots de passe** pour créer et stocker des mots de passe longs, uniques et aléatoires pour chaque service.
  * **Authentification multifacteur (MFA/2FA)** : Activer une deuxième étape de vérification (ex: un code sur le téléphone) en plus du mot de passe.
* **Cryptographie** :
  * **Hachage** : Transformation irréversible d'une donnée en une chaîne de caractères de taille fixe. Utilisé pour vérifier l'intégrité d'un fichier ou stocker des mots de passe.
  * **Chiffrement** : Transformation réversible d'une donnée à l'aide d'une clé pour la rendre illisible.
    * **Symétrique** : La même clé est utilisée pour chiffrer et déchiffrer.
    * **Asymétrique** : Utilise une paire de clés (une publique pour chiffrer, une privée pour déchiffrer).

![CIA Triad](https://d1jnx9ba8s6j9r.cloudfront.net/blog/wp-content/uploads/2018/06/CIA-Triad-What-is-cybersecurity-Edureka.png)

[Challenge 0108](../challenges/Challenge_0108.md)

---

### 🧮 0109. Atelier calcul d'adresse IP et Masque sous-réseau

Cet atelier pratique a permis de mettre en application les concepts de l'adressage IPv4. L'objectif était de pouvoir, à partir d'une adresse IP et de son masque, déterminer les informations essentielles d'un sous-réseau :

* L'adresse du réseau.
* L'adresse de broadcast (diffusion).
* La première et la dernière adresse IP utilisables pour des machines.

La **Méthode de calcul Binaire** avec l'utilisation du *ET Logique* pour l'adresse réseau et du *OU logique* pour l'adresse de broadcast.

* (Adresse IP) **ET** (masque de sous-réseau) = adresse Réseau
* (**NOT** masque sous-réseau) **OU** (adresse réseau) = adresse Broadcast

La **Méthode du Nombre Magique** (basée sur l'octet significatif du masque) a été présentée comme une technique rapide pour effectuer ces calculs sans conversion binaire complète.

* Octet Significatif
* 256- OS = Nombre magique
* Calcul avec les multiples de l'adresse réseau et broadcast

[Challenge 0109](../challenges/Challenge_0109.md)

---

## **🛠️ Saison 02 : Support aux Utilisateurs**

Cette saison se concentre sur les outils et méthodes pour assister les utilisateurs, diagnostiquer et résoudre les incidents courants sur les postes de travail, etc.

---

### 💼 0201. Outils Bureautiques

Ce cours présente les suites bureautiques, des ensembles de logiciels essentiels pour la productivité en entreprise.

* **Suite Microsoft Office** : La suite la plus répandue, développée par Microsoft.
  * **Composants principaux** : **Word** (traitement de texte), **Excel** (tableur), **PowerPoint** (présentation) et **Outlook** (messagerie).
  * **Versions** : Il existe des versions sous **licence perpétuelle** (ex: Office 2024) et des versions par **abonnement** basées sur le cloud (**Microsoft 365**), qui incluent des services comme OneDrive et permettent la collaboration en temps réel.

* **LibreOffice** : Une alternative **gratuite et open-source** à Microsoft Office.
  * **Équivalents** : Elle propose des logiciels similaires comme **Writer** (Word), **Calc** (Excel), **Impress** (PowerPoint) et **Base** (Access).
  * **Avantages** : Elle est multiplateforme, compatible avec les formats de fichiers Microsoft et n'implique aucun coût de licence.

* **Collaboration et Partage** : Les outils modernes, notamment ceux basés sur le cloud, facilitent le travail d'équipe grâce au partage de fichiers et à la co-édition de documents en temps réel.

[Challenge 0201](../challenges/Challenge_0201.md)

---

### 🔍 0202. Diagnostic et Résolution d'Incidents

Ce cours aborde les outils et les procédures pour diagnostiquer et résoudre les problèmes sur un système d'exploitation Windows.

* **Outils de diagnostic natifs de Windows** :
  * **Gestionnaire des tâches** : Pour surveiller les processus, les performances (CPU, mémoire) et gérer les applications au démarrage.
  * **Observateur d'événements** : Pour consulter les journaux système et identifier les erreurs, avertissements et événements critiques qui peuvent causer des instabilités.
  * **Éditeur du Registre (Regedit)** : Permet de modifier la base de données de configuration de Windows. Une manipulation incorrecte peut endommager gravement le système.
  * **Gestionnaire de périphériques** : Pour gérer les pilotes (drivers) des composants matériels et identifier les conflits ou les dysfonctionnements.

* **Dépannage du démarrage de Windows** :
  * **Processus de démarrage** : Implique des composants clés comme **BootMGR** (gestionnaire de démarrage), **Winload.exe** (chargeur de l'OS) et le **BCD** (base de données de configuration du démarrage).
  * **Outils de réparation** :
    * **`bootrec`** : Commande pour réparer le MBR, le secteur de démarrage et reconstruire le BCD.
    * **`chkdsk`** : Pour vérifier et réparer les erreurs sur le disque dur.
    * **Options de démarrage avancé** : Permet d'accéder au mode sans échec, à la restauration du système ou à l'invite de commandes de récupération.

* **Sauvegarde et Récupération** :
  * **Restauration du système** : Permet de revenir à un point de restauration antérieur pour annuler des modifications qui ont causé un problème.
  * **Historique des fichiers** : Sauvegarde automatiquement différentes versions de vos fichiers personnels.
  * **Image système** : Crée une copie complète du système pour une restauration totale en cas de panne majeure.

* **Logiciels tiers utiles** :
  * Des outils comme **CCleaner** pour le nettoyage, **Malwarebytes** pour la sécurité, ou **AOMEI Backupper** pour des sauvegardes avancées peuvent compléter les fonctionnalités natives de Windows.

[Challenge 0202](../challenges/Challenge_0202.md)

---

### 🔩 0203. Incidents Hardware et Réglementation

Ce cours couvre la méthodologie de diagnostic des pannes matérielles, ainsi que les cadres réglementaires essentiels liés à la gestion des équipements informatiques en fin de vie (DEEE) et à la protection des données personnelles (RGPD).

* **Diagnostic des Pannes Matérielles** :
  * **Premières étapes** : Avant toute intervention complexe, il est crucial d'effectuer des vérifications simples : nettoyer la poussière, débrancher les périphériques non essentiels, tester les câbles et analyser les messages d'erreur au démarrage.
  * **Isoler le problème** : Une approche méthodique consiste à tester les composants un par un pour identifier la source de la panne. Les causes fréquentes d'un écran noir incluent l'alimentation, la carte graphique, la mémoire RAM ou la pile du BIOS.
  * **Outils de diagnostic** :
    * **Logiciels** : Des outils spécialisés permettent de tester la stabilité et les performances de chaque composant une fois le PC démarré :
      * **CPU-Z** pour le processeur et la carte graphique.
      * **MemTest86** pour la mémoire RAM.
      * **CrystalDiskInfo** pour l'état de santé des disques durs et SSD.
      * **OCCT** pour tester l'alimentation en charge.
    * **Matériel** : Un **multimètre** peut être utilisé pour vérifier les tensions de sortie de l'alimentation.

* **Réglementation DEEE (Déchets d'Équipements Électriques et Électroniques)** :
  * **Objectif** : Encadrer la collecte et le recyclage des équipements en fin de vie pour limiter leur impact environnemental, dû aux matériaux polluants qu'ils contiennent (plomb, mercure).
  * **Obligations des entreprises** : Les professionnels doivent trier leurs DEEE, les confier à une filière de recyclage agréée et s'assurer de la **destruction sécurisée des données** présentes sur les supports de stockage. Des outils comme **DBAN** peuvent être utilisés pour cela.

* **Réglementation RGPD (Règlement Général sur la Protection des Données)** :
  * **Objectif** : Protéger les **données personnelles** des citoyens de l'Union Européenne et encadrer leur traitement par les organisations.
  * **Principes clés** : Le traitement des données doit être légal, limité à des finalités précises (minimisation), et les données doivent être conservées de manière sécurisée et confidentielle pour une durée limitée.
  * **Rôle de la CNIL** : En France, la **Commission Nationale de l'Informatique et des Libertés (CNIL)** est l'autorité chargée de veiller au respect du RGPD. Elle informe, contrôle et peut sanctionner les entreprises en cas de manquement.
  * **En cas de violation de données** : L'entreprise a l'obligation de notifier la CNIL dans les 72 heures et d'informer les personnes concernées si le risque pour leurs droits et libertés est élevé.

[Challenge 0203](../challenges/Challenge_0203.md)

---

### 🐶 0204. Atelier Mme Michu 👵

[Challenge 0204](../challenges/Challenge_0204.md)
