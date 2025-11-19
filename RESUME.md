# Résumé des Saisons O'clock

Cette fiche synthétise les notions fondamentales abordées durant les saisons de la formation "Expert Cybersécurité" en vue du Titre Pro "Administrateur d'Infrastructures Sécurisées" et quelques ressources partagées lors des cours.

## 📖 Table des Matières

### [Saison A1. Savoirs de Base 💻](#-saison-a1-savoirs-de-base)

- [A101. & A102. Introduction Formation O'clock & Titre Pro AIS](#-a101--a102-introduction-formation-oclock--titre-pro-ais)
- [A103. Histoire de l'Informatique](#-a103-histoire-de-linformatique)
- [A104. Les Composants Matériels](#️-a104-les-composants-matériels)
- [A105. Le Système d'Exploitation](#-a105-le-système-dexploitation)
- [A106. Numération : Bits et Octets](#-a106-numération--bits-et-octets)
- [A107. Introduction aux Réseaux Informatiques](#-a107-introduction-aux-réseaux-informatiques)
- [A108. Sécurité Informatique](#️-a108-sécurité-informatique)
- [A109. Atelier calcul d'adresse IP et Masque sous-réseau](#-a109-atelier-calcul-dadresse-ip-et-masque-sous-réseau)
- [Fin Saison 1 & QCM](#-fin-saison-a1-savoirs-de-base)

### [Saison A2. Support aux Utilisateurs 🛠️](#️-saison-a2-support-aux-utilisateurs)

- [A201. Outils Bureautiques](#-a201-outils-bureautiques)
- [A202. Diagnostic et Résolution d'Incidents](#-a202-diagnostic-et-résolution-dincidents)
- [A203. Contrôle à distance](#-a203-contrôle-à-distance)
- [A204. Incidents Hardware et Réglementation](#-a204-incidents-hardware-et-réglementation)
- [A205. Atelier Mme Michu](#-a205-atelier-mme-michu-)
- [A206. BIOS, UEFI, MBR et GPT](#-a206-bios-uefi-mbr-et-gpt)
- [A207. ITIL](#-a207-itil)
- [A208. Pratiques ITIL et GLPI](#️-a208-pratiques-itil-et-glpi)
- [Fin Saison 2 & QCM](#️-fin-saison-a2-support-aux-utilisateurs)

### [Saison A3. Réseau 🌐](#-saison-a3-réseau)

- [A301. Fondamentaux Réseau & Ethernet](#-a301-fondamentaux-réseau--ethernet)
- [A302. Hubs, Switchs, MAC & ARP](#-a302-hubs-switchs-mac--arp)
- [A303. Modèle OSI, TCP/IP, UDP & DHCP](#️-a303-modèle-osi-tcpip-udp--dhcp)
- [A304. Cisco IOS & Routage Statique](#-a304-cisco-ios--routage-statique)
- [A305. Atelier Packet Tracer](/challenges/Challenge_A305.md)
- [A306. DNS, Telnet et SSH](#-a306-dns-telnet-et-ssh)
- [A307. RFC1918, NAT & self-hosting](#-a307-rfc1918-nat--self-hosting)
- [A308. Atelier proxmox](/challenges/Challenge_A308.md)
- [A309. VLANs, L3 switchs, WiFi & IPv6](#-a309-vlans-l3-switchs-wifi--ipv6)
- [Fin Saison A3 & QCM](#-fin-saison-a3-réseau)

### [Saison A4. Windows Server 💠](#saison-a4-windows-server-)

- [A401. Introduction et Installation](#️-a401-introduction-et-installation)

---

## **💻 Saison A1. Savoirs de Base**

> L'objectif de cette saison est de construire un socle de connaissances commun sur le fonctionnement des ordinateurs, des systèmes d'exploitation, des réseaux et de la sécurité.

---

### 🎯 A101. & A102. Introduction Formation O'clock & Titre Pro AIS

> Cette introduction a permis de présenter le déroulement de la formation, ses objectifs pédagogiques et les attentes pour l'obtention du **Titre Professionnel "Administrateur d'Infrastructures Sécurisées" (AIS)**. L'accent a été mis sur les compétences à acquérir, la méthodologie de travail (projets, veille technologique) et le référentiel du titre pro.

[Challenge A102](/challenges/Challenge_A102.md)

>📚 Ressources :
>
>- [Titre Pro AIS](https://www.francecompetences.fr/recherche/rncp/37680/)
>- [Le dossier Professionnel](https://www.dossierprofessionnel.fr/)

[Retour en haut](#-table-des-matières)

---

### 📜 A103. Histoire de l'Informatique

> L'informatique est un domaine dont les racines sont bien plus anciennes que les ordinateurs modernes.

- **Les Origines** : Les concepts de base remontent à l'Antiquité avec les algorithmes, comme celui d'**Euclide**. Le mot "algorithme" lui-même dérive du nom du mathématicien **Al-Khwarizmî**.
- **La Programmation Mécanique** : Le premier système mécanique programmable est le **métier à tisser Jacquard**, qui utilisait des cartes perforées. **Ada Lovelace** est reconnue pour avoir écrit le premier véritable programme informatique sur la machine analytique de Charles Babbage au XIXe siècle.
- **L'Ère Moderne** :
  - **Alan Turing** a posé les fondements scientifiques de l'informatique avec la "machine de Turing".
  - **John von Neumann** a défini l'architecture qui est encore utilisée dans la quasi-totalité des ordinateurs modernes.
  - L'invention du **transistor** en 1947 a été une révolution, remplaçant les tubes à vide et permettant la miniaturisation.
  - Le **circuit intégré** (1958) et le **microprocesseur** (1969) ont permis de réduire encore la taille et le coût des ordinateurs.
  - La **loi de Moore** postule que le nombre de transistors sur un microprocesseur double environ tous les deux ans, une tendance qui a guidé l'industrie pendant des décennies.
- **L'Ordinateur Personnel (PC)** : Les années 70 et 80 ont vu l'émergence des micro-ordinateurs accessibles au grand public, avec des machines emblématiques comme l'**Altair 8800**, l'**Apple II**, le **Commodore 64** et l'**IBM PC**.

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

[Challenge A103](/challenges/Challenge_A103.md)

>📚 Ressources :
>
>- [Informatique](https://fr.wikipedia.org/wiki/Informatique)
>- [Machine analytique](https://fr.wikipedia.org/wiki/Machine_analytique)
>- [Algorythme d'Euclide](https://fr.wikipedia.org/wiki/Algorithme_d%27Euclide)
>- [Machine de Turing](https://fr.wikipedia.org/wiki/Machine_de_Turing)
>- [Architecture de Von Neumann](https://fr.wikipedia.org/wiki/Architecture_de_von_Neumann)
>- [Ferranti Mk I](https://fr.wikipedia.org/wiki/Ferranti_Mark_I)
>- [UNIVAC I](https://fr.wikipedia.org/wiki/UNIVAC_I)
>- [PDP-8](https://fr.wikipedia.org/wiki/PDP-8)
>- [Microprocesseur](https://fr.wikipedia.org/wiki/Microprocesseur)
>- [Téléscripteur](https://fr.wikipedia.org/wiki/T%C3%A9l%C3%A9scripteur)

[Retour en haut](#-table-des-matières)

---

### ⚙️ A104. Les Composants Matériels

> Un ordinateur est constitué d'un ensemble de composants physiques (le hardware) qui interagissent pour fonctionner.

- **La Carte Mère** : C'est le circuit imprimé central qui connecte tous les autres composants. Elle inclut :
  - Le **socket** pour le processeur.
  - Les **slots de mémoire vive (RAM)**.
  - Les **connecteurs d'extension** (ex: PCI Express) pour les cartes additionnelles.
  - Les **connecteurs de stockage** (ex: SATA, M.2) pour les disques durs et SSD.
  - Le **BIOS/UEFI**, un micrologiciel qui initialise le matériel au démarrage.
- **Le Processeur (CPU)** : C'est le "cerveau" de l'ordinateur qui exécute les calculs et les instructions. Ses performances dépendent de sa **fréquence** (en GHz) et de son **nombre de cœurs**. Il doit être refroidi, généralement par un **ventirad** (ventilateur + radiateur) avec de la **pâte thermique** pour assurer le transfert de chaleur.
- **La Mémoire Vive (RAM)** : C'est la mémoire de travail, rapide mais **volatile** (elle perd ses données quand l'ordinateur est éteint). On la trouve sous forme de barrettes (DIMM pour les PC fixes, SO-DIMM pour les portables).
- **Le Stockage** : C'est la mémoire de masse, non volatile, où sont stockés le système d'exploitation, les logiciels et les fichiers.
  - **Disque Dur (HDD)** : Technologie magnétique plus ancienne, à disques tournants.
  - **SSD (Solid-State Drive)** : Technologie plus récente basée sur de la **mémoire flash**, beaucoup plus rapide et résistante aux chocs.
- **La Carte Graphique (GPU)** : C'est une carte d'extension dédiée à la production et à l'affichage des images sur un écran. Elle est essentielle pour les jeux vidéo et les applications graphiques intensives.
- **L'Alimentation (PSU)** : C'est le bloc qui convertit le courant alternatif du secteur en tensions continues pour alimenter tous les composants. Sa capacité est mesurée en **Watts (W)**.
- **Les Périphériques** : Ce sont des dispositifs connectés à l'ordinateur pour lui ajouter des fonctionnalités. Ils se classent en trois catégories :
  - **Périphériques d'entrée** : Clavier, souris, webcam, micro.
  - **Périphériques de sortie** : Écran, imprimante, haut-parleurs.
  - **Périphériques d'entrée-sortie** : Clé USB, disque dur externe, écran tactile.

[Challenge A104](/challenges/Challenge_A104.md)

>📚 Ressources :
>
>- [Composants d'un PC](https://www.malekal.com/les-composants-hardware-et-materiel-dun-pc-le-dossier/)
>- [Cache de Processeur](https://fr.wikipedia.org/wiki/Cache_de_processeur)
>- [Architecture mémoire multi canaux](https://fr.wikipedia.org/wiki/Architecture_de_m%C3%A9moire_%C3%A0_multiples_canaux)
>- [PC Builder](https://fr.pcpartpicker.com/list/)

[Retour en haut](#-table-des-matières)

---

### 💿 A105. Le Système d'Exploitation

> Le système d'exploitation (OS) est le logiciel principal qui sert d'intermédiaire entre le matériel et les applications logicielles. Les plus courants sur ordinateur sont Windows, macOS et GNU/Linux.

- **Le Noyau (Kernel)** : C'est le cœur de l'OS. Il gère les ressources matérielles (mémoire, processeur), l'exécution des programmes, les périphériques et les systèmes de fichiers.
- **Les Interfaces** : Pour interagir avec le noyau, on utilise :
  - L'**interface graphique (GUI)** : Menus, icônes, fenêtres (ex: le bureau Windows).
  - L'**interface en ligne de commande (CLI)** : Terminal où l'on tape des commandes textuelles (ex: `shutdown`).
  - L'**interface de programmation (API)** : Utilisée par les programmes pour demander des services à l'OS.
- **Concepts Clés** :
  - **Processus** : Un programme en cours d'exécution.
  - **Système Multitâches** : Capacité de l'OS à exécuter plusieurs programmes de façon "simultanée" en alternant très rapidement entre eux.
  - **Pilotes (Drivers)** : Programmes spécifiques qui permettent à l'OS de communiquer avec un périphérique matériel.
- **Installation d'un OS** :
  - Se fait généralement à partir d'un **média d'installation** (clé USB ou DVD).
  - Ce média est créé à partir d'une **image ISO**, qui est une copie conforme d'un disque.
  - Il faut configurer le **BIOS/UEFI** de l'ordinateur pour qu'il démarre ("boot") sur ce média d'installation.

[Challenge A105](/challenges/Challenge_A105.md)

>📚 Ressources :
>
>- [Commandes Ubuntu](https://doc.ubuntu-fr.org/tutoriel/console_commandes_de_base)
>- [Les distributions Linux](https://alexblog.fr/wp-content/uploads/2011/01/evolution-linux-distributions.jpg)

[Retour en haut](#-table-des-matières)

---

### 🔢 A106. Numération : Bits et Octets

> Les ordinateurs fonctionnent avec un système binaire, qui est la base de toute information numérique.

- **Bit et Octet** :
  - Le **bit** (binary digit) est la plus petite unité d'information et peut avoir deux valeurs : 0 ou 1.
  - Un **octet** (Byte en anglais) est un groupe de 8 bits.
- **Multiples** : Il existe une confusion fréquente entre les multiples décimaux (base 10) et binaires (base 2).
  - **Préfixes SI (décimaux)** : kilooctet (ko) = 1000 octets, mégaoctet (Mo) = 1 000 000 octets.
  - **Préfixes binaires** : kibioctet (Kio) = 1024 octets, mébioctet (Mio) = 1 048 576 octets.
  - C'est pourquoi un disque dur de 1 Téraoctet (To) est affiché par le système d'exploitation comme ayant environ 930 Gibioctets (Go).
- **Systèmes de Numération** :
  - **Binaire (base 2)** : Utilise les chiffres 0 et 1.
  - **Décimal (base 10)** : Le système que nous utilisons tous les jours (0-9).
  - **Hexadécimal (base 16)** : Utilise les chiffres 0-9 et les lettres A-F. Souvent utilisé en informatique pour représenter des valeurs binaires de manière plus compacte.
- **Encodage des Caractères** : Pour représenter du texte, chaque caractère est associé à un nombre.
  - **ASCII** : Une des premières normes, limitée à 128 caractères (principalement pour l'anglais).
  - **Unicode (UTF-8)** : La norme moderne qui peut représenter la quasi-totalité des systèmes d'écriture du monde, y compris les accents et les emojis.

[Challenge A106](/challenges/Challenge_A106.md)

[Retour en haut](#-table-des-matières)

---

### 🌐 A107. Introduction aux Réseaux Informatiques

> Un réseau est un ensemble d'équipements informatiques connectés entre eux pour partager des ressources et communiquer.

- **Types de Réseaux (par étendue)** :
  - **LAN (Local Area Network)** : Réseau local (ex: à la maison, dans une entreprise).
  - **WAN (Wide Area Network)** : Réseau étendu qui connecte plusieurs LAN sur de longues distances. **Internet** est le plus grand des WAN.
- **Topologies de Réseau** : C'est la manière dont les équipements sont interconnectés.
  - **En étoile** : Tous les équipements sont connectés à un point central (un switch). C'est la topologie la plus courante pour les réseaux LAN.
  - Autres topologies : en bus, en anneau, maillée.
- **Adressage IP (IPv4)** :
  - Chaque machine sur un réseau a une **adresse IP** unique pour être identifiée, comme une adresse postale.
  - Une adresse IPv4 est composée de 4 nombres entre 0 et 255 (ex: `192.168.1.10`). C'est une adresse de 32 bits (4 octets).
  - Le **masque de sous-réseau** (ex: `255.255.255.0`) permet de diviser l'adresse IP en deux parties : une partie qui identifie le **réseau** et une partie qui identifie la **machine** sur ce réseau.
  - Deux machines peuvent communiquer directement seulement si elles sont sur le **même réseau**, c'est-à-dire si elles ont la même partie réseau.
- **Diagrammes Réseau** : Ce sont des schémas qui représentent l'organisation d'un réseau.
  - **Diagramme Physique** : Montre l'emplacement réel des équipements et leur câblage.
  - **Diagramme Logique** : Montre comment les informations circulent, les adresses IP, les sous-réseaux, etc.

[Challenge A107](/challenges/Challenge_A107.md)

>Ressources :
>
>- [Le virus Stuxnet](https://www.youtube.com/watch?v=gXtp6C-3JKo)
>- [Le cas Ledger](https://www.youtube.com/watch?v=4nXEfsQalkI)
>- [Le cas Proton](https://www.youtube.com/watch?v=-pSdE6jjdG0)
>- [Top 10 Web Application Security Risks](https://owasp.org/www-project-top-ten/)
>- [Mitre-CVE version Européenne (car le Mitre à failli sauter avec les coupes de Trump)](https://euvd.enisa.europa.eu/)
>- [Loi informatique et Libertés](https://fr.wikipedia.org/wiki/Loi_informatique_et_libert%C3%A9s)

[Retour en haut](#-table-des-matières)

---

### 🛡️ A108. Sécurité Informatique

> La sécurité informatique vise à protéger les systèmes d'information contre les menaces et à garantir leur bon fonctionnement.

- **Les 5 Piliers de la Sécurité** :
    1. **Confidentialité** : S'assurer que seules les personnes autorisées peuvent accéder aux données.
    2. **Intégrité** : Garantir que les données n'ont pas été modifiées de manière non autorisée.
    3. **Disponibilité** : S'assurer que le système et les données sont accessibles lorsque l'on en a besoin.
    4. **Authentification** : Vérifier l'identité d'un utilisateur.
    5. **Non-répudiation (ou Traçabilité)** : S'assurer qu'un utilisateur ne peut pas nier avoir effectué une action.
- **Grands Principes** :
  - **Défense en profondeur** : Mettre en place plusieurs couches de sécurité.
  - **Principe du moindre privilège** : Donner aux utilisateurs uniquement les droits nécessaires pour accomplir leurs tâches.
  - La sécurité absolue n'existe pas ; il faut se préparer à l'échec (sauvegardes, plans de reprise).
  - L'utilisateur est souvent le maillon le plus faible de la chaîne de sécurité.
- **Bonnes Pratiques** :
  - **Mots de passe** : Utiliser un **gestionnaire de mots de passe** pour créer et stocker des mots de passe longs, uniques et aléatoires pour chaque service.
  - **Authentification multifacteur (MFA/2FA)** : Activer une deuxième étape de vérification (ex: un code sur le téléphone) en plus du mot de passe.
- **Cryptographie** :
  - **Hachage** : Transformation irréversible d'une donnée en une chaîne de caractères de taille fixe. Utilisé pour vérifier l'intégrité d'un fichier ou stocker des mots de passe.
  - **Chiffrement** : Transformation réversible d'une donnée à l'aide d'une clé pour la rendre illisible.
    - **Symétrique** : La même clé est utilisée pour chiffrer et déchiffrer.
    - **Asymétrique** : Utilise une paire de clés (une publique pour chiffrer, une privée pour déchiffrer).

![CIA Triad](https://d1jnx9ba8s6j9r.cloudfront.net/blog/wp-content/uploads/2018/06/CIA-Triad-What-is-cybersecurity-Edureka.png)

[Challenge A108](/challenges/Challenge_A108.md)

>📚 Ressources :
>
>- [Antivirus](https://fr.wikipedia.org/wiki/Logiciel_antivirus)
>- [Exemple Social Engineering : Hushpuppy](https://etudestech.com/decryptage/portrait-arnaquer-hushpuppi-hacker/)
>- [Chiffrer et pas Crypter](https://chiffrer.info/)
>- [Chiffrement Asymétrique + Symétrique](https://fr.wikipedia.org/wiki/%C3%89change_de_cl%C3%A9s_Diffie-Hellman)
>- [Comprendre le chiffrement](https://www.youtube.com/watch?v=7W7WPMX7arI)
>- [Télégraphe de Chappe](https://fr.wikipedia.org/wiki/T%C3%A9l%C3%A9graphe_Chappe)
>- [Préfixe Binaire](https://fr.wikipedia.org/wiki/Pr%C3%A9fixe_binaire)
>- [Tableau de Calcul Binaire](https://lesitedelaclasse.fr/wp-content/uploads/2018/12/tableau-binaire.png)
>- [Table de Conversion](http://yannklein.free.fr/cours/reseau/conversion.html)
>- [Convertisseur](https://www.rapidtables.org/fr/convert/number/binary-to-decimal.html?x=1111)
>- [Encodage de nos lettres UTF-8](https://www.malekal.com/utf-8-comment-ca-marche/)

[Retour en haut](#-table-des-matières)

---

### 🧮 A109. Atelier calcul d'adresse IP et Masque sous-réseau

> Cet atelier pratique a permis de mettre en application les concepts de l'adressage IPv4.

L'objectif était de pouvoir, à partir d'une adresse IP et de son masque, déterminer les informations essentielles d'un sous-réseau :

- L'adresse du réseau.
- L'adresse de broadcast (diffusion).
- La première et la dernière adresse IP utilisables pour des machines.

La **Méthode de calcul Binaire** avec l'utilisation du *ET Logique* pour l'adresse réseau et du *OU logique* pour l'adresse de broadcast.

- (Adresse IP) **ET** (masque de sous-réseau) = adresse Réseau
- (**NOT** masque sous-réseau) **OU** (adresse réseau) = adresse Broadcast

La **Méthode du Nombre Magique** (basée sur l'octet significatif du masque) a été présentée comme une technique rapide pour effectuer ces calculs sans conversion binaire complète.

- Octet Significatif
- 256- OS = Nombre magique
- Calcul avec les multiples de l'adresse réseau et broadcast

[Challenge A109](/challenges/Challenge_A109.md)

>📚 Ressources :
>
>- [Logique ET OU](https://github.com/GitFreed/Challenges-O-clock/blob/main/images/Logique.jpg)
>- [Méthode du nombre magique](https://zestedesavoir.com/tutoriels/321/calculer-une-plage-dadresses-avec-la-methode-magique/#2-10258_quest-ce-que-la-methode-magique)
>- [Table masque de sous réseau, binaire et hôtes](https://www.it-connect.fr/wp-content-itc/uploads/2021/05/reseau-adresse-ipv4-calcul-masque-sous-reseau-12.png)
>- [CIDR Calculator](https://www.subnet-calculator.com/cidr.php)

[Retour en haut](#-table-des-matières)

---

## **💻 FIN Saison A1. Savoirs de Base**

[QCM Saison A1](https://forms.gle/MofrrYWGy8XXPN6D7)

![QCM Résultats](../images/QCMs01.png)

[Retour en haut](#-table-des-matières)

---

## **🛠️ Saison A2. Support aux Utilisateurs**

> Cette saison se concentre sur les outils et méthodes pour assister les utilisateurs, diagnostiquer et résoudre les incidents courants sur les postes de travail, etc.

---

### 💼 A201. Outils Bureautiques

> Ce cours présente les suites bureautiques, des ensembles de logiciels essentiels pour la productivité en entreprise.

- **Suite Microsoft Office** : La suite la plus répandue, développée par Microsoft.
  - **Composants principaux** : **Word** (traitement de texte), **Excel** (tableur), **PowerPoint** (présentation) et **Outlook** (messagerie).
  - **Versions** : Il existe des versions sous **licence perpétuelle** (ex: Office 2024) et des versions par **abonnement** basées sur le cloud (**Microsoft 365**), qui incluent des services comme OneDrive et permettent la collaboration en temps réel.

- **LibreOffice** : Une alternative **gratuite et open-source** à Microsoft Office.
  - **Équivalents** : Elle propose des logiciels similaires comme **Writer** (Word), **Calc** (Excel), **Impress** (PowerPoint) et **Base** (Access).
  - **Avantages** : Elle est multiplateforme, compatible avec les formats de fichiers Microsoft et n'implique aucun coût de licence.

- **Collaboration et Partage** : Les outils modernes, notamment ceux basés sur le cloud, facilitent le travail d'équipe grâce au partage de fichiers et à la co-édition de documents en temps réel.

[Challenge A201](/challenges/Challenge_A201.md)

>📚 Ressources :
>
>- [Autoformation aux bases de la bureautique](http://clic-formation.net/)
>- [Base de donnée de logiciels alternatifs](https://alternativeto.net/)
>- [Site comparatif de solutions alternatives d'entreprises](https://www.capterra.fr/)

[Retour en haut](#-table-des-matières)

---

### 🔍 A202. Diagnostic et Résolution d'Incidents

> Ce cours aborde les outils et les procédures pour diagnostiquer et résoudre les problèmes sur un système d'exploitation Windows.

- **Outils de diagnostic natifs de Windows** :
  - **Gestionnaire des tâches** : Pour surveiller les processus, les performances (CPU, mémoire) et gérer les applications au démarrage.
  - **Observateur d'événements** : Pour consulter les journaux système et identifier les erreurs, avertissements et événements critiques qui peuvent causer des instabilités.
  - **Éditeur du Registre (Regedit)** : Permet de modifier la base de données de configuration de Windows. Une manipulation incorrecte peut endommager gravement le système.
  - **Gestionnaire de périphériques** : Pour gérer les pilotes (drivers) des composants matériels et identifier les conflits ou les dysfonctionnements.

- **Dépannage du démarrage de Windows** :
  - **Processus de démarrage** : Implique des composants clés comme **BootMGR** (gestionnaire de démarrage), **Winload.exe** (chargeur de l'OS) et le **BCD** (base de données de configuration du démarrage).
  - **Outils de réparation** :
    - **`bootrec`** : Commande pour réparer le MBR, le secteur de démarrage et reconstruire le BCD.
    - **`chkdsk`** : Pour vérifier et réparer les erreurs sur le disque dur.
    - **Options de démarrage avancé** : Permet d'accéder au mode sans échec, à la restauration du système ou à l'invite de commandes de récupération.

- **Sauvegarde et Récupération** :
  - **Restauration du système** : Permet de revenir à un point de restauration antérieur pour annuler des modifications qui ont causé un problème.
  - **Historique des fichiers** : Sauvegarde automatiquement différentes versions de vos fichiers personnels.
  - **Image système** : Crée une copie complète du système pour une restauration totale en cas de panne majeure.

- **Logiciels tiers utiles** :
  - Des outils comme **CCleaner** pour le nettoyage, **Malwarebytes** pour la sécurité, ou **AOMEI Backupper** pour des sauvegardes avancées peuvent compléter les fonctionnalités natives de Windows.

[Challenge A202](/challenges/Challenge_A202.md)

>📚 Ressources :
>
>- [Sysinternals](https://learn.microsoft.com/fr-fr/sysinternals/)
>- [Autocomplétion des CMD Terminal](https://github.com/chrisant996/clink)

[Retour en haut](#-table-des-matières)

---

### 🔁 A203. Contrôle à distance

>📚 Ressources :
>
>- [Les réseaux virtuels sur virtualbox](https://www.it-connect.fr/comprendre-les-differents-types-de-reseaux-virtualbox/)
>- [Les réseaux virtuels sur vmware](https://www.it-connect.fr/comprendre-les-differents-types-de-reseaux-de-vmware-workstation-pro/)
>- [WinRM](https://www.it-connect.fr/chapitres/utiliser-winrm-pour-la-gestion-a-distance/)
>- [MobaXterm](https://mobaxterm.mobatek.net/)
>- [Ruskdesk](https://rustdesk.com/fr/) et [Ruskdesk Github](https://github.com/rustdesk/rustdesk)

---

### 🔩 A204. Incidents Hardware et Réglementation

> Ce cours couvre la méthodologie de diagnostic des pannes matérielles, ainsi que les cadres réglementaires essentiels liés à la gestion des équipements informatiques en fin de vie (DEEE) et à la protection des données personnelles (RGPD).

- **Diagnostic des Pannes Matérielles** :
  - **Premières étapes** : Avant toute intervention complexe, il est crucial d'effectuer des vérifications simples : nettoyer la poussière, débrancher les périphériques non essentiels, tester les câbles et analyser les messages d'erreur au démarrage.
  - **Isoler le problème** : Une approche méthodique consiste à tester les composants un par un pour identifier la source de la panne. Les causes fréquentes d'un écran noir incluent l'alimentation, la carte graphique, la mémoire RAM ou la pile du BIOS.
  - **Outils de diagnostic** :
    - **Logiciels** : Des outils spécialisés permettent de tester la stabilité et les performances de chaque composant une fois le PC démarré :
      - **CPU-Z** pour le processeur et la carte graphique.
      - **MemTest86** pour la mémoire RAM.
      - **CrystalDiskInfo** pour l'état de santé des disques durs et SSD.
      - **OCCT** pour tester l'alimentation en charge.
    - **Matériel** : Un **multimètre** peut être utilisé pour vérifier les tensions de sortie de l'alimentation.

- **Réglementation DEEE (Déchets d'Équipements Électriques et Électroniques)** :
  - **Objectif** : Encadrer la collecte et le recyclage des équipements en fin de vie pour limiter leur impact environnemental, dû aux matériaux polluants qu'ils contiennent (plomb, mercure).
  - **Obligations des entreprises** : Les professionnels doivent trier leurs DEEE, les confier à une filière de recyclage agréée et s'assurer de la **destruction sécurisée des données** présentes sur les supports de stockage. Des outils comme **DBAN** peuvent être utilisés pour cela.

- **Réglementation RGPD (Règlement Général sur la Protection des Données)** :
  - **Objectif** : Protéger les **données personnelles** des citoyens de l'Union Européenne et encadrer leur traitement par les organisations.
  - **Principes clés** : Le traitement des données doit être légal, limité à des finalités précises (minimisation), et les données doivent être conservées de manière sécurisée et confidentielle pour une durée limitée.
  - **Rôle de la CNIL** : En France, la **Commission Nationale de l'Informatique et des Libertés (CNIL)** est l'autorité chargée de veiller au respect du RGPD. Elle informe, contrôle et peut sanctionner les entreprises en cas de manquement.
  - **En cas de violation de données** : L'entreprise a l'obligation de notifier la CNIL dans les 72 heures et d'informer les personnes concernées si le risque pour leurs droits et libertés est élevé.

[Challenge A203](/challenges/Challenge_A203.md)

>📚 Ressources :
>
>- [DEEE](https://www.economie.gouv.fr/cedef/fiches-pratiques/gestion-et-traitement-des-dechets-dequipements-electriques-et-electroniques)
>- [CNIL - RGPD](https://www.cnil.fr/fr/reglement-europeen-protection-donnees)

[Retour en haut](#-table-des-matières)

---

### 💻 A205. Atelier Mme Michu 👵🐶

> L'atelier « Mme Michu » a servi de cas pratique pour appliquer les concepts vu précédemment, en simulant un dépannage complet : réparation du démarrage de Windows, résolution d'une surcharge CPU/RAM, vérification de l'état des disques et restauration de fichiers disparus.

[Challenge A204](/challenges/Challenge_A204.md)

>📚 Ressources :
>
>- [Lignes cmd BCDBoot](https://learn.microsoft.com/fr-fr/windows-hardware/manufacture/desktop/bcdboot-command-line-options-techref-di?view=windows-11)
>- [Process Démarrage Windows](https://www.malekal.com/processus-demarrage-windows-mbr/)

[Retour en haut](#-table-des-matières)

---

### 💾 A206. BIOS, UEFI, MBR et GPT

> Ce cours explore les firmwares qui gèrent le démarrage de l'ordinateur (BIOS et UEFI) et les structures de partitionnement des disques durs (MBR et GPT) qui organisent les données.

- **Le Firmware : BIOS vs UEFI** :
  - **BIOS (Basic Input/Output System)** : Ancien firmware stocké sur une puce de la carte mère, responsable de l'initialisation du matériel au démarrage (POST - Power-On Self Test).
    - **Limitations** : Interface textuelle (navigation au clavier), mode 16 bits, et incapacité à gérer des disques de plus de 2 To.
  - **UEFI (Unified Extensible Firmware Interface)** : Le successeur moderne du BIOS.
    - **Avantages** : Interface graphique (support de la souris), fonctionnement en 32/64 bits, et prise en charge des disques de plus de 2 To grâce au GPT.
    - **Fonctionnalités avancées** :
      - **Secure Boot** : Empêche l'exécution de chargeurs de démarrage non signés pour protéger contre les malwares au démarrage.
      - **Fast Boot** : Accélère le démarrage en sautant certaines étapes d'initialisation matérielle.
  - **Mise à jour (Flasher)** : Mettre à jour le firmware (BIOS/UEFI) peut améliorer la stabilité et la compatibilité, mais une erreur durant le processus peut rendre la carte mère inutilisable.

- **Partitionnement de Disque : MBR vs GPT** :
  - **MBR (Master Boot Record)** : Ancien standard de partitionnement.
    - **Structure** : Stocke les informations de démarrage et la table des partitions dans le premier secteur du disque.
    - **Limitations** : Limité à 4 partitions principales et à des disques de 2 To maximum. Vulnérable car les informations de démarrage sont stockées à un seul endroit.
  - **GPT (GUID Partition Table)** : Le standard moderne, associé à l'UEFI.
    - **Avantages** : Supporte jusqu'à 128 partitions, gère des disques de très grande taille (plus de 2 To), et offre une meilleure protection contre la corruption des données grâce à des copies de sauvegarde de la table de partition.

- **Les Systèmes de Fichiers** : Ils organisent la manière dont les données sont stockées sur une partition.
  - **NTFS (New Technology File System)** : Le système de fichiers par défaut de Windows. Robuste, il gère les grands fichiers et offre des fonctionnalités de sécurité avancées (chiffrement, permissions).
  - **FAT32 (File Allocation Table 32)** : Ancien système de fichiers très compatible avec la plupart des appareils (clés USB, cartes mémoire). Sa principale limitation est qu'il ne peut pas gérer les fichiers de plus de 4 Go.
  - **exFAT (Extended File Allocation Table)** : Conçu pour les supports amovibles, il combine la large compatibilité de FAT32 avec la capacité de gérer des fichiers de plus de 4 Go, ce qui en fait un excellent choix pour les disques durs externes et les clés USB de grande capacité.

[Challenge A206](/challenges/Challenge_A206.md)

>📚 Ressources :
>
>- [2 Versions BIOS historiques](https://www.quora.com/What-are-the-differences-between-AMI-and-AWARD-BIOSes-1)
>- [Boot PXE](https://www.it-connect.fr/le-boot-pxe-et-le-boot-ipxe-pour-les-debutants/)
>- [GUID Partition Table](https://fr.wikipedia.org/wiki/GUID_Partition_Table)
>- [MBR vs GPT](https://www.simplylinuxfaq.com/2017/10/main-differences-between-mbr-gpt.html)

[Retour en haut](#-table-des-matières)

---

### 📝 A207. ITIL

> [Ce cours](https://gamma.app/docs/ITIL-V4-naxpqmck8b6yltv?mode=doc) introduit ITIL (Information Technology Infrastructure Library), un référentiel de meilleures pratiques pour la gestion des services informatiques ITSM (Information Technology Service Management).

- **Qu'est-ce qu'ITIL ?**
    ITIL est un ensemble de bonnes pratiques destiné aux entreprises pour gérer au mieux leurs services informatiques. L'objectif principal est d'aligner les services informatiques sur les besoins métier afin de créer de la **valeur**. ITIL n'est pas une norme rigide mais un **cadre** (framework) qui fournit des recommandations. Il n'existe pas de "certification ITIL" pour une entreprise, mais des certifications individuelles pour les professionnels.

- **Historique** :
    Développé dans les années 1980 par le gouvernement britannique, ITIL visait à standardiser la gestion des services informatiques. Il a depuis évolué à travers plusieurs versions pour s'adapter aux changements technologiques et aux nouvelles méthodologies. **ITIL 4**, la version actuelle, est conçu pour être plus flexible et s'intégrer avec d'autres cadres comme **Agile, DevOps et Lean**.
  - - *Agile est une approche de gestion de projet qui privilégie la flexibilité et la collaboration. Le travail est découpé en cycles courts et itératifs (appelés "sprints") pour s'adapter rapidement aux changements.*
  - - *DevOps est une culture qui vise à unifier le développement (Dev) et les opérations (Ops) pour livrer des applications et des services plus rapidement et de manière plus fiable, en s'appuyant sur l'automatisation et la collaboration.*
  - - *Lean est une philosophie axée sur l'optimisation des processus en éliminant tout gaspillage ("waste") afin de maximiser la valeur pour le client avec le moins de ressources possible.*

- **Concepts Clés de la Gestion des Services** :
  - **Valeur** : Le bénéfice perçu, l'utilité et l'importance de quelque chose. La valeur est toujours **co-créée** par une collaboration active entre le fournisseur de services et le consommateur.
  - **Service** : Un moyen de co-créer de la valeur en facilitant les **résultats** que les clients souhaitent obtenir, sans qu'ils aient à gérer les **coûts** et les **risques** spécifiques.
  - **Produit** : Une configuration des ressources d'une organisation, conçue pour offrir de la valeur à un consommateur. Les services sont basés sur des produits.
  - **Relation de service** : Comprend la **fourniture de service** (par le fournisseur), la **consommation de service** (par le consommateur) et la **gestion de la relation** pour assurer la co-création de valeur.

- **Le Système de Valeur des Services (SVS)** :
    Le SVS décrit comment tous les composants et activités d'une organisation fonctionnent ensemble comme un système pour faciliter la création de valeur. Il transforme une **opportunité** ou une **demande** en **valeur** pour les parties prenantes. Ses 5 composants principaux sont :
    1. **Les Principes Directeurs ITIL** : Recommandations qui guident une organisation en toutes circonstances.
    2. **La Gouvernance** : Les moyens par lesquels une organisation est dirigée et contrôlée.
    3. **La Chaîne de Valeur des Services (SVC)** : Le modèle opérationnel central du SVS.
    4. **Les Pratiques ITIL** : Ensembles de ressources pour accomplir un travail (anciennement "processus").
    5. **L'Amélioration Continue** : Une activité récurrente à tous les niveaux pour s'assurer que les performances répondent aux attentes.

![ITILSVS](/images/ITIL1.png)

- **Les Sept Principes Directeurs** :
    Ce sont des recommandations universelles et durables qui guident les décisions et les actions.
    1. **Privilégier la valeur** : Tout doit contribuer, directement ou indirectement, à la création de valeur.
    2. **Commencer là où vous êtes** : Ne pas repartir de zéro ; évaluer et tirer parti de ce qui existe déjà.
    3. **Progresser par itérations avec des retours** : Organiser le travail en petites parties gérables pour livrer des résultats plus rapidement et s'ajuster grâce aux retours.
    4. **Collaborer et promouvoir la visibilité** : Travailler ensemble et partager les informations pour prendre de meilleures décisions.
    5. **Penser et travailler de façon holistique** : Avoir une vision d'ensemble et comprendre comment les différentes parties du système interagissent.
    6. **Opter pour la simplicité et rester pratique** : Éliminer tout ce qui n'apporte pas de valeur et choisir la solution la plus simple et efficace.
    7. **Optimiser et automatiser** : Maximiser la valeur du travail en optimisant les processus avant de les automatiser.

- **Les Quatre Dimensions de la Gestion des Services** :
    Pour une approche holistique, ITIL 4 identifie quatre dimensions à considérer pour chaque service.
    1. **Organisations et personnes** : Culture, structure, rôles et compétences.
    2. **Information et technologie** : Les informations, connaissances et technologies nécessaires.
    3. **Partenaires et fournisseurs** : Les relations avec les autres organisations impliquées.
    4. **Flux de valeur et processus** : Les activités et workflows qui permettent la création de valeur.

- **La Chaîne de Valeur des Services (SVC)** :
    C'est le cœur du SVS. Elle représente un modèle opérationnel de six activités qui peuvent être combinées pour créer différents **flux de valeur** afin de répondre à la demande.
    1. **Planifier** : Assurer une compréhension partagée de la vision et de la direction.
    2. **Améliorer** : Assurer l'amélioration continue des produits et services.
    3. **Engager** : Comprendre les besoins des parties prenantes et maintenir de bonnes relations.
    4. **Concevoir et assurer la transition** : S'assurer que les services répondent aux attentes en termes de qualité, de coût et de délai.
    5. **Obtenir/construire** : S'assurer que les composants de service sont disponibles quand et où ils sont nécessaires.
    6. **Fournir et assurer le support** : S'assurer que les services sont fournis et supportés conformément aux attentes.

- **Quelques Pratiques ITIL Clés** :
  - **Amélioration continue** : Aligner les services sur les besoins métier en constante évolution.
  - **Contrôle des changements** : Maximiser le nombre de changements réussis en évaluant les risques.
  - **Gestion des incidents** : Rétablir le fonctionnement normal du service le plus rapidement possible.
  - **Gestion des problèmes** : Réduire la probabilité et l'impact des incidents en identifiant leurs causes profondes.
  - **Gestion des demandes de service** : Gérer les demandes prédéfinies des utilisateurs (ex: demande d'information, d'accès).
  - **Centre de services (Service Desk)** : Le point de contact unique entre le fournisseur et les utilisateurs.
  - **Gestion des niveaux de service (SLM)** : Définir des cibles de performance claires pour les services (SLA).

![ITIL](/images/ITIL2.png)

[Challenge A207](/challenges/Challenge_A207.md)

>📚 Ressources :
>
>- [PDF ITIL](/ressources/ITIL%20V4%20-%20Foundation%20-%20Axelos.pdf)
>- [Manifeste Agile](https://manifesteagile.fr/)

[Retour en haut](#-table-des-matières)

---

### 🛠️ A208. Pratiques ITIL et GLPI

> Ce cours présente GLPI (Gestion Libre de Parc Informatique), une solution open-source de gestion des services informatiques (ITSM) qui permet de mettre en application concrètement les bonnes pratiques du référentiel ITIL. Il existe de nombreuses autres solutions ITSM sur le marché, comme Zendesk, Connectwise, Easyvista, ou historiquement Lotus (IBM).

- **Introduction à GLPI** : GLPI (**G**estion **L**ibre de **P**arc **I**nformatique) est un outil complet qui centralise la gestion du parc informatique, des tickets de support et des processus d'assistance. Il est conçu pour aider les équipes IT à structurer leur travail en s'appuyant sur les concepts ITIL.

- **Gestion des Actifs et des Utilisateurs** :
  - **Inventaire (Parc)** : GLPI permet de recenser et de suivre le cycle de vie de tous les actifs de l'entreprise (ordinateurs, logiciels, imprimantes, etc.), ainsi que de gérer les contrats de maintenance et les licences logicielles associés.
  - **Gestion des utilisateurs** : L'outil permet de créer des comptes utilisateurs et de leur assigner des profils avec des droits spécifiques (**Admin**, **Technicien**, **Hotliner**, **Observer**, **Self-Service**). Cette gestion fine des permissions repose sur le principe des **ACL (Access Control List)**, qui définissent précisément qui peut voir ou modifier quoi dans l'application.

- **Gestion des Tickets (Incidents & Demandes)** :
  - C'est le cœur de GLPI. Les utilisateurs peuvent soumettre des **incidents** (pannes) ou des **demandes de service** via une interface simple.
  - Chaque ticket suit un **workflow** clair : création, assignation, résolution et clôture, ce qui permet de tracer chaque étape et d'assurer une prise en charge efficace.
  - Les tickets sont priorisés en fonction de leur **impact** et de leur **urgence**, conformément aux principes ITIL.

- **Indicateurs de Performance (KPIs)** :
    GLPI permet de mesurer l'efficacité du support technique grâce à des indicateurs clés:
  - **TTO (Time To Own)** : Temps entre la création d'un ticket et sa prise en charge par un technicien.
  - **TTR (Time To Resolve)** : Temps total entre la création et la résolution complète du ticket.
    Ces métriques sont essentielles pour évaluer et améliorer la réactivité de l'équipe support.

- **Autres fonctionnalités clés** :
  - **Base de connaissances** : Un espace pour documenter les solutions aux problèmes récurrents et les procédures, accessible aux techniciens et aux utilisateurs.
  - **Gestion des changements et des projets** : GLPI permet de suivre les modifications apportées à l'infrastructure IT et de gérer des projets de A à Z.
  - **Rapports et statistiques** : L'outil peut générer des rapports détaillés sur les performances, l'état du parc ou l'activité des utilisateurs pour aider à la prise de décision.

- **Pratiques ITIL dans GLPI** :
  - **Gestion des Niveaux de Service (SLM)** : Cette pratique est matérialisée par le **SLA (Service Level Agreement)**. C'est un contrat formel entre un fournisseur de services et un client qui définit les attentes en matière de performance, les niveaux de service promis, les délais de réponse et de résolution (comme le TTO et le TTR), ainsi que les conséquences en cas de non-respect des engagements.

[Challenge A208](/challenges/Challenge_A208.md)

>📚 Ressources :
>
>- [GLPI server](https://glpi.pandit.fr/public/)
>- [GLPI Documentation](https://help.glpi-project.org/documentation/fr)

[Retour en haut](#-table-des-matières)

---

## **🛠️ FIN Saison A2. Support aux Utilisateurs**

[QCM Saison A2](https://forms.gle/k9oAMPjiy1Eb2U7x9)

![Résultat QCM](/images/2025-10-31-09-04-11.png)

[Retour en haut](#-table-des-matières)

---

## **🌐 Saison A3. Réseau**

> Cette saison introduit les concepts fondamentaux des réseaux informatiques. L'objectif est de comprendre le modèle OSI, la suite TCP/IP, l'adressage (IPv4/IPv6) et la configuration des équipements clés comme les switchs, les routeurs (Cisco) et les pare-feux (pfSense), en utilisant des outils de simulation tels que Cisco Packet Tracer.

---

### 🌐 A301. Fondamentaux Réseau & Ethernet

> Ce cours couvre les briques de base de la communication réseau, des architectures logiques (Client/Serveur) aux supports physiques (Ethernet).

#### Rappels SA1

Deux types de masques de sous-réseau :

- masques **FLSM** (Fixed Length Subnet Mask masque à "taille fixe" en français)
- masques **VLSM** (Variable Length Subnet Mask, masque à "taille variable")

Les masques à taille fixe FLSM (à connaitre par coeur) :

- /24 : 255.255.255.0
- /16 : 255.255.0.0
- /8  : 255.0.0.0

Avec un masque à taille fixe, on "coupe" l'adresse IP pile poil entre 2 octets !

Exemple, avec 192.168.1.42 :

- si on a un masque /24, on coupe entre le 3ème et le 4ème octet :
  - partie réseau : 192.168.1
  - partie machine : 42
  - adresse de réseau : 192.168.1.0 (on prend la partie réseau et on met les octets restants à 0)
  - adresse de broadcast : 192.168.1.255 (on prend la partie réseau et on met les octets restants à 255)
  - plage utilisable : 192.168.1.1 -> 192.168.1.254
  - nombre de machine : 254 machines max

- si on a un masque /16, on coupe entre le 2ème et le 3ème octet :
  - partie réseau : 192.168
  - partie machine : 1.42
  - adresse de réseau : 192.168.0.0 (on prend la partie réseau et on met les octets restants à 0)
  - adresse de broadcast : 192.168.255.255 (on prend la partie réseau et on met les octets restants à 255)
  - plage utilisable : 192.168.0.1 -> 192.168.255.254
  - nombre de machine : 2^(32 - masque au format CIDR) - 2 = 65 534 machines

- si on a un masque /8, on coupe entre le 1er et le 2ème octet :
  - partie réseau : 192
  - partie machine : 168.1.42
  - adresse de réseau : 192.0.0.0 (on prend la partie réseau et on met les octets restants à 0)
  - adresse de broadcast : 192.255.255.255 (on prend la partie réseau et on met les octets restants à 255)
  - plage utilisable : 192.0.0.1 -> 192.255.255.254
  - nombre de machine : 2^(32 - masque au format CIDR) - 2 = 16 777 214 machines

Pour les masques à taille variable (VLSM), pas le choix, il va falloir faire des calculs !
On a vu deux méthodes en SA1 :

- méthode "classique", qui nécessite plein de conversions binaire/décimal
- méthode du "nombre magique", qui ne nécessite presque pas de calculs et pas de conversion !

Quelle que soit la méthode, il faut retenir quelques petites choses par coeur !

⚠️ Un masque de sous-réseau ne peut pas être composé de n'importe quelles valeurs, puisque tous les 1 doivent être à gauche et tous les 0 à droite dans sa notation binaire.

>- 1111 1111 = 255
>- 1111 1110 = 254 (-1)
>- 1111 1100 = 252 (-2)
>- 1111 1000 = 248 (-4)
>- 1111 0000 = 240 (-8)
>- 1110 0000 = 224 (-16)
>- 1100 0000 = 192 (-32)
>- 1000 0000 = 128 (-64)

À partir de ça, on peut retrouver la correspondance CIDR - notation classique de n'importe quel masque !

💡 Pour rappel, la notation CIDR c'est le nombre de bits à 1 dans le masque de sous-réseau (en notation binaire)

>- /32 = 255.255.255.255 (1111 1111.1111 1111.1111 1111.1111 1111)
>- /31 = 255.255.255.254 (1111 1111.1111 1111.1111 1111.1111 1110)
>- /30 = 255.255.255.252 (1111 1111.1111 1111.1111 1111.1111 1100)
>- /29 = 255.255.255.248
>- /28 = 255.255.255.240
>- ...
>- /24 = 255.255.255.0
>- ...
>- /19 = 255.255.224.0
>- /18 = 255.255.192.0
>- /17 = 255.255.128.0
>- /16 = 255.255.0.0
>- ...
>- /8  = 255.0.0.0
>- /7  = 254.0.0.0
>- ...
>- /0  = 0.0.0.0

##### Méthode du nombre magique

**1er exemple** : 10.42.153.87 /17

D'abord, on doit déterminer l'octet significatif dans le masque de sous-réseau.

S'il est au format CIDR, il faut le convertir dans son format "classique" en utilisant les infos à retenir par coeur ci-dessus.

/17 -> 255.255.128.0

L'octet significatif, c'est là où intervient la "coupure" entre partie réseau et partie machine.

Ici, c'est 128.

On détermine ensuite le nombre magique en faisant 256 - octet significatif : 256 - 128 = 128

On doit ensuite lister tous les multiples du nombre magique jusqu'à 256 : 0, 128, 256

Pour obtenir l'adresse de réseau, on remplace l'octet significatif dans l'adresse IP par le multiple du nombre magique inférieur ou égal à la valeur de cet octet. Dans notre cas, on remplace donc 153 par 128. Et on met tous les octets restants (à droite) à 0.

adresse de réseau : 10.42.128.0

Pour l'adresse de broadcast, on remplace ce même octet par le multiple suivant - 1 ! Et on met tous les octets restants à 255.

adresse de broadcast : 10.42.255.255

On peut déterminer la plage utilisable : 10.42.128.1 -> 10.42.255.254

Nombre de machines : 2 ^ (32 - masque CIDR) - 2 : 2^15 -2 = 32 766 machines max

**2ème exemple** : 10.42.153.87 /28

/28 correspond à 255.255.255.240

nombre magique = 256 - 240 = 16

multiples du nb magique : 0, 16, 32, 48, 64, 80, 96, 112, ... 256

adresse de réseau : 10.42.153.80
adresse de broadcast : 10.42.153.95

plage utilisable : 10.42.153.81 -> 10.42.153.94
nombre de machine : 14

---

#### 🌐 A301. Introduction Réseau & Ethernet

- **Règles de Communication** : Toute communication nécessite trois éléments : une **source** (expéditeur), une **destination** (destinataire) et un **canal** (média). Ces échanges sont régis par des **protocoles**, qui sont des règles définissant l'encodage, le formatage, la taille et la synchronisation des messages.

- **Encapsulation** : C'est le processus qui consiste à "emballer" les données dans un format spécifique, appelé **trame** (frame), avant de les envoyer. Cette "enveloppe" (la trame) contient les adresses source et destination, à l'instar d'une lettre postale.

- **Modes de Remise** :

  - **Unicast** : 1-à-1 (une source vers une destination).
  - **Multicast** : 1-à-plusieurs (une source vers un groupe défini).
  - **Broadcast** : 1-à-tous (une source vers tous les participants du réseau).

- **Canaux de Communication** :

  - **Simplex** : Communication à sens unique (ex: la radio FM).
  - **Half-duplex** : Communication dans les deux sens, mais pas simultanément (ex: talkie-walkie).
  - **Full-duplex** : Communication simultanée dans les deux sens (ex: téléphone).

- **Architectures Réseau** :

  - **Client/Serveur** : Un **serveur** (qui peut être un matériel dédié ou un logiciel) fournit un service, et un **client** le consomme (ex: un PC accédant à un site web). Les serveurs matériels sont souvent au format **rack** (ex: 1U, 2U) pour être montés dans des baies 19 pouces, situées dans des salles serveurs sécurisées et climatisées. Les serveurs logiciels fournissent des services spécifiques comme des serveurs **Web** (HTTP), de **fichiers** (FTP/SMB), ou d'**annuaire** (LDAP).
  - **Pair-à-Pair (Peer-to-Peer)** : Chaque machine est à la fois client et serveur (ex: partage de fichiers en torrent).

- **Protocole Ethernet** : C'est le protocole standard pour les réseaux locaux (LAN). Il définit les normes de câblage et de signalisation.

  - **Normes** : 100BASE-T (Fast Ethernet), 1000BASE-T (Gigabit Ethernet), 10GBASE-T, etc.
  - **Câblage** : Utilise des **câbles à paires torsadées** (ex: Cat 5e 1Gbit/s, Cat 6 1Gbit/s+PoE, Cat 6a 10Gbit/s, Cat 7, Cat 8) avec un connecteur **RJ45** (sauf Cat 7). En France, on utilise aussi la notion de **Grades** (ex: Grade 3 TV) pour les installations domestiques.
  - **Blindage** : Les câbles à paires torsadées ont différents types de blindage pour se protéger des interférences. La nomenclature (X/YTP) décrit le blindage global (X) et le blindage par paire (Y) : **U/UTP** (aucun blindage), **F/UTP** (blindage global en aluminium), **U/FTP** (blindage par paire), **S/FTP** (tresse globale et blindage par paire), etc.
  - **Sertissage** : Les câbles sont sertis selon deux normes : **T-568A** et **T-568B**. Un câble **droit** (même norme aux deux bouts) sert à connecter un appareil à un équipement central (PC -\> Switch). Un câble **croisé** (normes différentes) servait à relier deux appareils identiques (PC -\> PC ou Switch -\> Switch).
  - **Auto MDI-X** : Aujourd'hui, cette distinction est largement obsolète car la plupart des équipements modernes peuvent "croiser" les paires automatiquement.

![Blindages](/images/2025-11-03-13-28-06.png)

[Challenge A301](/challenges/Challenge_A301.md)

>**📚 Ressources :**
>
>- Classes IP : <https://fr.wikipedia.org/wiki/Classe_d%27adresse_IP>
>- Table des masques : <https://www.it-connect.fr/wp-content-itc/uploads/2021/05/reseau-adresse-ipv4-calcul-masque-sous-reseau-12.png>
>- IPcalc : <https://www.mupssoft.com/ipcalc.html> (all OS) / <https://jodies.de/ipcalc> (unix) / <https://sourceforge.net/projects/ipcalc-net/> (windows)
>- Protocoles de communication : <https://fr.wikipedia.org/wiki/Protocole_de_communication>
>- Norme Ethernet : <https://fr.wikipedia.org/wiki/Ethernet>
>- Autonégociation : <https://fr.wikipedia.org/wiki/Auton%C3%A9gociation>
>- Paire torsadée : <https://fr.wikipedia.org/wiki/Paire_torsad%C3%A9e>

[Retour en haut](#-table-des-matières)

---

### 🌍 A302. Hubs, Switchs, MAC & ARP

> Ce cours aborde les équipements qui connectent les machines sur un réseau local (LAN) et les systèmes d'adressage qu'ils utilisent.

- **Concentrateur (Hub) vs. Commutateur (Switch)** :

  - Pour connecter plus de deux machines, on utilise un équipement central (Hub ou Switch), ce qui crée une topologie en **étoile**.
  - **Hub (obsolète)** : C'est une "multiprise réseau". Il est "bête" : il reçoit une trame sur un port et la retransmet (broadcast) à **tous** les autres ports, surchargeant inutilement le réseau.
  - **Switch** : C'est un appareil "intelligent". Il apprend quelles machines sont connectées à quels ports en inspectant les trames qui passent.
  - **Table MAC** : Il construit une **table d'adresses MAC** (un tableau qui associe un port à une adresse MAC). Il transmet les données **uniquement** au port de destination, ce qui rend le réseau rapide et efficace.

- **Adresse MAC (Media Access Control)** :

  - C'est l'**adresse physique** (ou matérielle) utilisée par les switchs pour identifier les appareils.
  - Elle est **unique au monde** (en théorie) et gravée sur chaque carte réseau (PC, smartphone, frigo connecté...).
  - Elle est définie par une norme de l'**IEEE** (Institute of Electrical and Electronics Engineers).
  - **Format** : Elle est codée sur 6 octets (48 bits) et s'écrit en hexadécimal (ex: `24:4B:FE:DE:96:80`).
  - **OUI** : Les 3 premiers octets (ex: `24:4B:FE`) sont l'**OUI** (Organizationally Unique Identifier), un préfixe attribué par l'**IEEE** à chaque fabricant. 3 octets équivalents à 24 bits (2^24) soit plus de 16 millions d'adresses uniques possibles.
  - **Trame Ethernet** : L'adresse MAC est utilisée pour la source et la destination dans une **trame Ethernet** (Couche 2 OSI).

- **Protocole ARP (Address Resolution Protocol)** :

  - **Problème** : Un switch fonctionne avec les adresses MAC (Couche 2), mais nos applications utilisent des adresses IP (Couche 3). Comment un PC (Alice) trouve-t-il l'adresse MAC d'un autre PC (Bob) en ne connaissant que son adresse IP ?
  - **Solution** : Le protocole ARP.
  - **Fonctionnement** :
        1. Alice envoie une requête ARP en **Broadcast** sur le réseau ("Qui a l'IP `192.168.1.42` ?").
        2. Bob (qui possède cette IP) est le seul à répondre, en **Unicast**, à Alice ("C'est moi \! Mon adresse MAC est `24:4B:FE:DE:96:80`.").
  - **Cache ARP** : Alice stocke cette correspondance (IP \<-\> MAC) dans son **cache ARP** pour ne pas avoir à reposer la question pendant un certain temps.
  - **Sécurité** : Ce protocole est vulnérable à l'**ARP Poisoning**, une attaque *Man-in-the-Middle* où un attaquant se fait passer pour une autre machine (ex: le routeur) en envoyant de fausses réponses ARP.

>**📚 Ressources :**
>
>- IEEE : <https://fr.wikipedia.org/wiki/Institute_of_Electrical_and_Electronics_Engineers>
>- Spoofing : <https://en.wikipedia.org/wiki/MAC_spoofing>
>- ID MAC : <https://macvendors.com/>
>- ARP Poisoning : <https://fr.wikipedia.org/wiki/ARP_poisoning>
>- Cache ARP : Exécuter (win+R) : ``cmd`` : ``arp -a`` (visualiser le cache ARP), ``arp -d`` (effacer le cache ARP)
>- Connexions réseau : Exécuter (win+R) : ``ncpa.cpl``
>- Table ARP d'un Switch : CLI / enable, ``show mac address-table dynamic``
>- Scan du réseau : nmap ou AngryIPscanner
>- Vidéo présentant un Datacenter : <https://www.youtube.com/watch?v=rO6bXt7d2L8>,
>- Valorisation de la Chaleur produite d'un Datacenter : <https://www.youtube.com/watch?v=JTmUUofSt7I>
>- OVHcloud : <https://www.youtube.com/watch?v=W--OHDSoraw>

[Retour en haut](#-table-des-matières)

---

### 🏛️ A303. Modèle OSI, TCP/IP, UDP & DHCP

> Ce cours explore les modèles de communication réseau (OSI et TCP/IP) et les protocoles fondamentaux qui assurent l'adressage (DHCP) et le transport des données (TCP/UDP).

#### **Le modèle OSI**

- **Qu'est-ce que le modèle OSI ?**
    Développé par l'ISO, c'est un modèle théorique qui décompose la communication réseau en 7 couches (layers). Il permet de comprendre le rôle de chaque protocole et équipement. Il ne s'agit pas d'un protocole en soi, mais d'un "plan" pour créer des normes cohérentes.

- **Encapsulation et Décapsulation** :
    À l'envoi (émission), chaque couche ajoute un en-tête (encapsulation), comme on mettrait une lettre (données) dans une enveloppe (segment), puis cette enveloppe dans un colis (paquet), et enfin une étiquette d'expédition sur le colis (trame). À la réception, le processus est inversé (décapsulation).

- **Les 7 Couches du Modèle OSI** :

  Couches Hautes (Logicielles) :

  - **Couche 7 - Application** : Le point d'accès aux services réseau pour les logiciels. C'est la couche avec laquelle l'utilisateur interagit.
    - *Protocoles : HTTP, FTP, SMTP, POP.*
  - **Couche 6 - Présentation** : Gère la conversion des données (encodage, ex: ASCII), le chiffrement/déchiffrement et la compression.
  - **Couche 5 - Session** : Ouvre, gère et ferme les "transactions" (sessions) entre les applications.

  Couches Basses (Matérielles) :

  - **Couche 4 - Transport** : Assure la connexion de bout en bout et le contrôle de flux. C'est ici qu'intervient la notion de **port** (TCP et UDP) pour distinguer les applications sur une même machine.
    - *Unité : Segment (TCP) / Datagramme (UDP).*
  - **Couche 3 - Réseau** (Network) : S'occupe de l'adressage logique (Adresse **IP**) et du routage (déterminer le meilleur chemin pour les paquets).
    - C'est ici qu'opère le protocole **ARP** (Address Resolution Protocol), qui fait le lien entre la Couche 3 (IP) et la Couche 2 (MAC). Il permet de trouver une adresse MAC à partir d'une IP.
    - Les machines hôtes stockent les correspondances (IP \<-\> MAC) dans un **cache ARP**. Les routeurs et les switchs de niveau 3 maintiennent également une table ARP pour savoir où acheminer les paquets.
    - *Unité : Paquet.*
  - **Couche 2 - Liaison de données** (Data Link) : S'occupe de l'adressage physique sur le réseau local (LAN) et du transfert des données entre les entités d'un même réseau.
    - C'est la couche de l'**adresse MAC** (Media Access Control). Cette adresse est **unique**, **gravée par le fabricant** sur la carte réseau (selon une norme **IEEE**) et codée sur 6 octets (48 bits).
    - *Format MAC :* `24:4B:FE:DE:96:80`. Les 3 premiers octets (l'OUI) identifient le fabricant, ce qui lui laisse 24 bits (plus de 16 millions) d'adresses uniques.
    - C'est la couche principale des **Switchs**.
    - *Unité : Trame.*
  - **Couche 1 - Physique** : Gère la transmission des signaux bruts (les bits : 0 et 1) sur le média physique (câble cuivre, fibre optique, ondes radio).
    - C'est la couche des **Hubs** et des câbles.
    - *Unité : Bit.*

![OSI Layers](/images/2025-11-04-14-53-10.png)

Moyen mnémotechnique de Haut en bas : **``All People Seem To Need Data Processing``** (Network & Data-link en anglais).

![OSI Layers2](/images/2025-11-04-15-03-09.png)

#### **Suite de Protocoles TCP/IP**

- C'est le **modèle pratique** sur lequel fonctionne Internet, développé par la DARPA (inspiré du projet français Cyclades) et rendu obligatoire sur Arpanet en 1983.
  - Le modèle TCP/IP standard (défini par la RFC 1122) ne comporte que **4 couches** :
      1. **Application** (Regroupe OSI 5, 6, 7) : HTTP, FTP, DNS...
      2. **Transport** (Identique à OSI 4) : **TCP**, **UDP**.
      3. **Internet/Réseau** (Identique à OSI 3) : **IP**, ICMP.
      4. **Accès Réseau** (Regroupe OSI 1, 2) : Ethernet, WiFi.
  - **Modèle TCP/IP à 5 couches** : Pour faciliter la comparaison avec le modèle OSI, il est aussi courant de le présenter en 5 couches, en séparant la couche "Accès Réseau" en deux : **Liaison de données (C2)** et **Physique (C1)**.

![TCP/IP](/images/2025-11-05-11-01-13.png)

- **TCP vs. UDP (Couche Transport)** :

  - **TCP (Transmission Control Protocol)** :

    - **Fiable** et **orienté connexion**. Il établit une connexion ("three-way handshake" : SYN, SYN-ACK, ACK) avant d'envoyer des données.
    - Il garantit que **tous les segments arrivent dans l'ordre** et sans erreur (il accuse réception de chaque segment et gère la retransmission des segments perdus).
    - Utilisé pour : Web (HTTP/HTTPS), e-mail (SMTP), transfert de fichiers (FTP).
  - **UDP (User Datagram Protocol)** :
    - **Non fiable** et **sans connexion** ("fire and forget"). Il envoie les datagrammes sans vérifier s'ils arrivent.
    - **Avantage** : Très rapide, léger et faible latence.
    - Utilisé pour : Streaming vidéo, jeux en ligne, VoIP, DNS, et les protocoles de diffusion (Broadcast/Multicast) comme le DHCP.
    - **Ports** : Les deux protocoles utilisent des numéros de **ports** (codés sur 16 bits) pour permettre à l'ordinateur de savoir à quelle application (processus) remettre les données. (ex: HTTP: 80, HTTPS: 443, FTP: 21, SSH: 22, DNS: 53).

![TCP/IP Protocoles Ports](/images/2025-11-05-11-01-36.png)

![Encapsulation](/images/2025-11-05-10-59-19.png)

#### **DHCP (Dynamic Host Configuration Protocol)**

- C'est un protocole de la couche Application qui permet à une machine (client) d'obtenir **automatiquement** sa configuration réseau auprès d'un **serveur DHCP**. Il utilise UDP car il doit contacter le serveur via un **Broadcast**, ce que TCP ne permet pas.
  - **Configuration fournie** : Adresse IP, Masque de sous-réseau, Passerelle par défaut, Serveurs DNS, et la durée du **bail DHCP** (la "location" de l'adresse IP).
  - **Processus (D.O.R.A.)** :

    - **D**iscover : Le client envoie un **Broadcast** ("Il y a un serveur DHCP ?").
    - **O**ffer : Un ou plusieurs serveurs DHCP répondent avec une offre d'adresse IP.
    - **R**equest : Le client choisit une offre (généralement la première reçue) et envoie un **Broadcast** pour l'accepter (informant les autres serveurs qu'ils n'ont pas été choisis).
    - **A**CK (Acknowledge) : Le serveur choisi confirme l'attribution et envoie le reste de la configuration (masque, DNS, etc.) ainsi que la durée du bail.

[Challenge A303](/challenges/Challenge_A303.md)

> **📚 Ressources :**
>
>- Mnémotechnique modèle OSI (de bas en haut) : ``Pour Le Réseau Tout Se Passe Automatiquement`` ou ``Petit Lapin Rose Trouvé à la SPA``
>- Mnémotechnique modèle OSI (de haut en bas) : ``Après Plusieurs Semaines, Tout Respire La paix`` ou **``All People Seem To Need Data Processing``** (Network & Data-link en anglais).
>- RFC 1122 & 23 : <https://www.rfc-editor.org/rfc/rfc1122.html> <https://www.rfc-editor.org/rfc/rfc1123> Exigences pour les hôtes Internet – Couches de communication, est une spécification officielle publiée en octobre 1989 par l'Internet Engineering Task Force (IETF)
>- Représentations TCP/IP : <https://reussirsonccna.fr/wp-content/uploads/2014/10/modele_TCPIP_evolution.png>
>- Protocoles par couches : <https://reussirsonccna.fr/wp-content/uploads/2014/10/ports-connus.png>
>- Protocole TCP : <https://fr.wikipedia.org/wiki/Transmission_Control_Protocol>
>- MTU : <https://fr.wikipedia.org/wiki/Maximum_transmission_unit>
>- Jumbo frames : <https://fr.wikipedia.org/wiki/Trame_g%C3%A9ante>
>- Protocole UDP : <https://fr.wikipedia.org/wiki/User_Datagram_Protocol>
>- Liste de ports logiciels : <https://fr.wikipedia.org/wiki/Liste_de_ports_logiciels>
>- Protocole DHCP : <https://fr.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol>
>- Mnémotechnique requête DHCP : DORA (Discover , Offer, Request, Acknowledge)
>- Protocole APIPA : <https://fr.wikipedia.org/wiki/Automatic_Private_Internet_Protocol_Addressing>
>- Réseau privé RFC 1918 : <https://fr.wikipedia.org/wiki/R%C3%A9seau_priv%C3%A9>
>- Liaison Série (RS-232) : <https://fr.wikipedia.org/wiki/Transmission_s%C3%A9rie>
>- PuTTY (émulateur de terminal/client pour les protocoles SSH, Telnet, rlogin, et TCP brut) : <https://www.chiark.greenend.org.uk/~sgtatham/putty/>

[Retour en haut](#-table-des-matières)

---

### 🌐 A304. Cisco IOS & Routage Statique

> Ce cours introduit le routeur, l'équipement de Couche 3 qui interconnecte différents réseaux. Il couvre les bases du système d'exploitation Cisco (IOS), la connexion initiale en console, et la configuration des interfaces et des routes statiques.

- **Le Routeur (Couche 3)** : Un routeur est un équipement réseau opérant à la **Couche 3 (Réseau)** du modèle OSI. Son rôle principal est d'**interconnecter des réseaux différents** (ex: LAN 1 en `192.168.1.0/24` et LAN 2 en `172.16.0.0/16`) en "routant" les paquets IP d'une interface à l'autre.

- **Cisco IOS (Internetwork Operating System)** : C'est le système d'exploitation qui équipe la plupart des routeurs et switchs Cisco. La configuration se fait principalement via une **Interface en Ligne de Commande (CLI)**.

- **Accès Console (Configuration Initiale)** :

  - Pour la première configuration (avant que le réseau ne soit fonctionnel), on accède au routeur via un **câble console** (bleu, type RJ45 vers DB9 ou USB).
  - On utilise un logiciel (ex: **PuTTY**) sur le port **COM** de l'ordinateur (vitesse : **9600**) pour se connecter.

- **Fichiers de Configuration et Modes IOS** :

  - IOS utilise deux fichiers de configuration :
        1. `running-config` : La configuration active, stockée en **RAM** (volatile). Les modifications sont appliquées instantanément.
        2. `startup-config` : La configuration de démarrage, stockée en **NVRAM** (non-volatile).
  - **Il est impératif** de sauvegarder les modifications de la `running-config` vers la `startup-config` avec la commande `copy running-config startup-config` pour qu'elles persistent après un redémarrage.
  - La navigation dans l'IOS se fait via différents modes :
    - **User EXEC** (`Router>`) : Mode de base, très limité.
    - **Privileged EXEC** (`Router#`) : Accès avec `enable`. Permet la vérification (`show...`) et la sauvegarde (`copy...`).
    - **Global Configuration** (`Router(config)#`) : Accès avec `configure terminal`. Permet de modifier la configuration globale (ex: `hostname R1`, `enable secret [mot_de_passe]`).
    - **Interface Configuration** (`Router(config-if)#`) : Accès avec `interface [type/num]`. Permet de configurer une interface (ex: `ip address 192.168.1.1 255.255.255.0`, `no shutdown`).

- **Table de Routage & Routes Statiques** :

  - La **table de routage** est le "cerveau" du routeur ; il l'utilise pour décider où envoyer un paquet. Elle contient les réseaux directement connectés, les routes statiques et les routes apprises dynamiquement.
  - Une **route statique** est une route qu'un administrateur ajoute manuellement.
    - *Commande :* `ip route [réseau_destination] [masque] [ip_du_prochain_routeur]`
  - Une **route par défaut** est une route statique spéciale (`0.0.0.0 0.0.0.0`) qui capture tout le trafic sans destination connue (généralement vers Internet).

- **Routeur en tant que Serveur DHCP** : Un routeur Cisco peut aussi être configuré pour agir comme un serveur DHCP (`ip dhcp pool ...`) afin d'attribuer automatiquement des adresses IP aux clients de son réseau local (LAN).

[Challenge A304](/challenges/Challenge_A304.md)

> **📚 Ressources :**
>
>**Config Switch cmd :**
>
>1. enable
>2. show running-config -> **sh run**
>3. configure terminal -> **conf t**
>4. **hostname** XXX = nom du Switch
>5. **enable secret** XXX = password
>6. interface Vlan 1 = pour config l'IP du VLAN
>7. ip address 192.168.0.x 255.255.255.x
>8. no shutdown -> **no shut**
>9. **show ip interface brief** = montre les IP sur l'interface
>10. end
>11. copy running-config startup-config -> **copy run sta**
>
>- Ctrl + Shift + 9 (ou 6) stop une commande en cours
>- Plages IP attribuées sur un /24 (exemple)  1.0 : Réseau, 1.1 : Routeur, 1.2 -> 1.99 : Infra, 1.100 -> 1.250 : DHCP (les machines clients), 1.254 : Switch, 1.255 : Broadcast.
>
>Routeur : <https://fr.wikipedia.org/wiki/Routeur>
>
>**Config Routeur cmd :**
>
>1. enable
>2. conf t
>3. hostname
>4. enable secret
>5. interface gigabitethernet 0/1
>6. ip address 172.16.0.1 255.255.255.0
>7. no shutdown
>8. exit / end
>9. sh run
>10. copy run sta
>
>Table de routage : <https://fr.wikipedia.org/wiki/Table_de_routage>
>
>**Config Routage cmd :** Route par défaut -> ip route 0.0.0.0 0.0.0.0 xx.xx.xx.xx puis end et show ip route pour voir
>
>**Config DHCP Routeur :**
>
>1. conf t
>2. ip dhcp pool LAN3
>3. network 10.0.0.0 255.255.0.0
>4. default-router 10.0.0.1
>5. dns-server 8.8.8.8
>6. exit
>7. ip dhcp excluded-address 10.0.0.1 10.0.0.10
>8. end
>
>Pour consulter : show ip dhcp binding

[Retour en haut](#-table-des-matières)

---

### 🔐 A306. DNS, Telnet et SSH

> Ce cours couvre les protocoles essentiels pour la communication réseau (DNS) et l'administration à distance (Telnet & SSH), y compris leur configuration de base sur des équipements Cisco.

- **DNS (Domain Name System)** :

  - C'est un protocole de la **Couche 7 (Application)** qui agit comme "l'annuaire d'Internet". Sa fonction principale est de traduire les noms de domaine (ex: `google.com`) que les humains peuvent lire en adresses IP (ex: `172.217.16.14`) que les machines utilisent pour communiquer.
  - Il utilise principalement **UDP** sur le **port 53** pour des requêtes rapides.
  - Sur un équipement Cisco, on configure un client DNS (pour que le routeur lui-même puisse résoudre les noms) avec la commande :
    - `ip name-server [adresse_ip_dns]`
  - La recherche DNS est activée par défaut (`ip domain-lookup`). Si elle est désactivée, le routeur ne tentera pas de traduire les commandes inconnues (comme une faute de frappe) en nom de domaine, ce qui évite les temps d'attente "Translating...".
    - `no ip domain-lookup` (pour désactiver la recherche)

  - Il y a plusieurs types d'enregistrements DNS :
    - type A : faire matcher un nom de domaine avec une adresse IPv4
    - type AAAA : faire matcher un nom de domaine avec une adresse IPv6
    - type CNAME : alias, fait matcher un nom de domaine avec un autre nom de domaine

- **Telnet (Telecommunication Network)** :

  - Un protocole d'administration à distance de la **Couche 7 (Application)** qui permet d'accéder à la CLI d'un équipement.
  - Il utilise **TCP** sur le **port 23**.
  - **OBSOLÈTE ET NON SÉCURISÉ** : Telnet est à proscrire en production car il transmet toutes les informations, y compris les mots de passe, en **texte clair**. Un attaquant peut facilement "sniffer" le réseau (ex: via ARP Poisoning) et intercepter les identifiants.
  - **Configuration Cisco (pour démo)** :

        ```bash
        Router(config)# line vty 0 4
        Router(config-line)# transport input telnet
        Router(config-line)# password [mot_de_passe]
        Router(config-line)# login
        ```

- **SSH (Secure Shell)** :

  - Le successeur **sécurisé** de Telnet. Il utilise le **chiffrement asymétrique** (ex: RSA) pour échanger une clé de session, puis chiffre l'intégralité de la communication.
  - Il utilise **TCP** sur le **port 22**.
  - **Configuration Cisco (requise)** :

        ```bash
        # 1. Définir un nom d'hôte
        Router(config)# hostname [NomDuRouteur]

        # 2. Définir un nom de domaine IP
        [NomDuRouteur](config)# ip domain-name [nom_domaine.local]

        # 3. Générer les clés de chiffrement RSA
        [NomDuRouteur](config)# crypto key generate rsa
        (Choisir une taille de clé, ex: 2048)

        # 4. Forcer la version 2 de SSH (plus sécurisée)
        [NomDuRouteur](config)# ip ssh version 2

        # 5. Créer un utilisateur local
        [NomDuRouteur](config)# username [nom_admin] password [mot_de_passe_secret]

        # 6. Configurer les lignes virtuelles (VTY)
        [NomDuRouteur](config-line)# line vty 0 4
        [NomDuRouteur](config-line)# transport input ssh
        [NomDuRouteur](config-line)# login local 
        ```

- **Lignes VTY (Virtual Teletype)** : Ce sont les lignes de terminal virtuelles d'un équipement Cisco. Leur nombre (ex: `0 4` pour 5 lignes) détermine combien de sessions d'administration à distance (Telnet ou SSH) peuvent être ouvertes simultanément. Un peu comme une ligne téléphonique.

**Correction** [packet tracer](/challenges/Challenge_A305_correction.pkt) du [Challenge A305](/challenges/Challenge_A305.md)

[Challenge A306](/challenges/Challenge_A306.md)

> 📚 **Ressources :**
>
>
>**Commande traceroute :**
>
>- sur MacOS/Linux : traceroute
>- sur Windows : tracert
>
>Mise en place d'un **agent relais DHCP** : <https://www.it-connect.fr/mise-en-place-dun-agent-relais-dhcp/>
>
>Pour se connecter en SSH le clcient le plus connu est [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html), il en existe d'autres comme [MobaXterm](https://mobaxterm.mobatek.net/)

[Retour en haut](#-table-des-matières)

---

### 🏠 A307. RFC1918, NAT & self-hosting

> Ce cours explique la différence fondamentale entre les adresses IP publiques et privées (RFC1918) et introduit le mécanisme de traduction NAT qui permet aux réseaux locaux d'accéder à Internet. Il aborde également le "self-hosting" via la redirection de port.

- **Adresses IP Publiques vs. Privées (RFC1918)** :

  - Les routeurs sur Internet ne savent router que des **adresses IP publiques**, qui sont uniques au monde (ex: `92.34.56.78`).
  - Pour éviter l'épuisement des adresses IPv4, la **RFC1918** a défini des plages d'**adresses IP privées**. Celles-ci sont non-routables sur Internet et réservées à l'usage interne des réseaux locaux (LAN).
  - **Les plages privées (à connaître) sont :**
    - `10.0.0.0` à `10.255.255.255` (Classe A, `10.0.0.0/8`)
    - `172.16.0.0` à `172.31.255.255` (Bloc de 16 Classes B, `172.16.0.0/12`)
    - `192.168.0.0` à `192.168.255.255` (Bloc de 256 Classes C, `192.168.0.0/16`)

- **Principe du NAT (Network Address Translation)** :

  - Le **NAT** est le mécanisme qui permet à des machines avec des adresses IP privées d'accéder à Internet.
  - Le **routeur de bordure** (votre box Internet) sert d'intermédiaire :
        1. **Envoi** : Quand un PC (`192.168.1.5`) envoie un paquet vers Internet, le routeur **traduit** l'adresse IP source privée en sa **propre adresse IP publique** (`12.34.56.78`).
        2. **Réception** : Quand le serveur Internet répond au routeur (`12.34.56.78`), ce dernier consulte sa **table NAT** (qui mémorise les correspondances) et re-traduit l'IP de destination vers l'IP privée d'origine (`192.168.1.5`).

- **Types de NAT** :

  - **NAT Statique** : Fait une correspondance 1-pour-1 entre une IP privée et une IP publique. (Ex: `192.168.1.10` utilise *toujours* `90.1.1.10`). C'est utilisé pour rendre un serveur interne accessible depuis l'extérieur.
  - **NAT Dynamique** : Fait une correspondance "plusieurs-vers-plusieurs". Un pool d'IP privées utilise un pool (plus petit) d'IP publiques. Si le pool public est plein, les nouvelles connexions échouent.
  - **PAT (Port Address Translation) ou NAT Overload** : C'est la forme la plus courante (celle de votre box). Un "plusieurs-vers-un". Toutes les machines du LAN partagent la **seule IP publique** du routeur. Pour distinguer les connexions, le routeur modifie les **ports source** (ex: PC 1 utilise le port 50000, PC 2 le port 50001).

- **Self-Hosting (Auto-hébergement) & Redirection de Port** :

  - Par défaut, un routeur (pare-feu) bloque tout le trafic entrant non-sollicité. Pour héberger un service (ex: un site web) chez soi (self-hosting), il faut créer une exception.
  - Le **Port Forwarding (Redirection de Port)** est une règle de NAT statique configurée sur le routeur.
  - Elle dit : "Tout trafic arrivant sur mon IP publique *sur un port spécifique* (ex: Port 80) doit être redirigé vers l'IP privée de *ce serveur interne* (ex: `192.168.1.100` sur le Port 80)". Cela crée une "porte" dans votre pare-feu.
  - Il faut également avoir une adresse IP "fullstack", c'est à dire avoir sa propre adresse IP Publique et non celle donnée par le CG-NAT (Carrier-Grade Network Address Translation). C'est une technologie utilisée par les fournisseurs d'accès à Internet (FAI) pour partager une seule adresse IP publique entre des centaines, voire des milliers de clients.

[Challenge A307](/challenges/Challenge_A307.md)

> 📚 **Ressources :**
>
> **Config NAT sur routeur :**
>
>1. conf t
>2. interface gigabitEthernet (côté LAN)
>3. ip nat inside
>4. exit
>5. interface gigabitEthernet (côté WAN)
>6. ip nat outside
>7. exit
>8. access-list 1 permit x.x.x.0 (IP LAN) x.x.x.255 (masque inverse = wildcard)
>9. ip nat inside source list 1 interface gigabitEthernet (côté WAN) overload
>10. exit
>11. show ip nat stat (voir config & stats)
>12. show ip nat translation
>
> **Redirection de Port :**
>
>1. ip nat inside source static tcp 10.10.0.5 80 (IP serveur privée / port) 34.56.78.91 80 (IP router outside publique / port)
>1. NAT et PAT <https://www.it-connect.fr/le-nat-et-le-pat-pour-les-debutants/>
>
> Caddy : <https://github.com/caddyserver/caddy/releases>
>
> JSON : <https://fr.wikipedia.org/wiki/JavaScript_Object_Notation>

[Retour en haut](#-table-des-matières)

---

### [A308. Atelier proxmox](/challenges/Challenge_A308.md)

---

### 💠 A309. VLANs, L3 switchs, WiFi & IPv6

> Ce cours approfondit la segmentation réseau avec les VLANs, introduit les switchs de niveau 3 pour le routage, détaille les normes et la sécurité du WiFi, et présente des outils de contrôle d'accès comme les proxys et portails captifs.

- **VLANs (Virtual LANs)** :

  - Un VLAN est un **réseau local virtuel** qui permet de **cloisonner logiquement** des machines au sein d'un même équipement physique (switch).
  - **Avantages** :
    - **Sécurité** : Isole les départements ou fonctions sensibles (ex: Compta vs. Invités).
    - **Flexibilité** : Permet de regrouper des utilisateurs géographiquement dispersés dans le même réseau logique.
    - **Optimisation** : Réduit la taille des **domaines de diffusion** (broadcast domains), ce qui limite le trafic inutile et améliore les performances.
  - **Fonctionnement** : On assigne des ports du switch à un VLAN spécifique (ex: Ports 1-5 pour VLAN 10). Les trames d'un VLAN ne peuvent pas passer directement vers un autre VLAN.
  - **Tagging (802.1Q)** : Pour faire transiter plusieurs VLANs entre deux switchs via un seul câble, on utilise un lien **Trunk**. Le protocole **802.1Q** ajoute un "tag" (étiquette) à la trame Ethernet pour indiquer son numéro de VLAN (VLAN ID).
  - **QoS (Quality of Service)** : Les VLANs facilitent la mise en place de la QoS, par exemple pour prioriser le trafic **VoIP** (téléphonie sur IP) afin d'assurer une bonne qualité d'appel même si le réseau est chargé.

- **Switchs de Niveau 3 (L3 Switchs)** :

  - Contrairement aux switchs classiques (Niveau 2) qui ne comprennent que les adresses MAC, un switch L3 peut traiter les paquets IP et effectuer du **routage**.
  - **Routage Inter-VLAN** : Pour faire communiquer deux VLANs différents, il faut normalement un routeur. Un switch L3 peut remplir ce rôle en interne, routant le trafic entre les VLANs à très haute vitesse sans passer par un routeur externe ("router-on-a-stick").
  - Ils sont souvent utilisés en **cœur de réseau** pour leur performance.

  Sur un switch, chaque port peut être configuré dans un mode spécifique selon l'équipement qui y est connecté.

- **Mode Access (Accès)** :
  - **Usage** : Utilisé pour connecter des **équipements terminaux** qui ne "comprennent" pas les VLANs (PC, imprimante, caméra, etc.).
  - **Fonctionnement** : Le port est membre d'**un seul VLAN**.
    - Lorsque le switch envoie une trame vers le PC (sortant), il **enlève le tag** VLAN (la trame redevient une trame Ethernet standard).
    - Lorsque le PC envoie une trame au switch (entrant), le switch lui **ajoute le tag** du VLAN configuré sur ce port.
  - **En bref** : 1 Port = 1 VLAN.

- **Mode Trunk** :
  - **Usage** : Utilisé pour connecter **deux équipements réseau** entre eux (Switch vers Switch, ou Switch vers Routeur) pour laisser passer le trafic de plusieurs VLANs.
  - **Fonctionnement** : Le port transporte simultanément les trames de **plusieurs VLANs**.
    - Il utilise le protocole **802.1Q** pour ajouter une étiquette (tag) à chaque trame indiquant son numéro de VLAN (VLAN ID), afin que le switch de l'autre côté sache à qui elle appartient.
  - **En bref** : 1 Port = Plusieurs VLANs (trames étiquetées).

- **VLAN Natif (Native VLAN)** :
  - C'est un concept spécifique au mode **Trunk**.
  - Par défaut, sur un lien Trunk, toutes les trames sont taguées... sauf celles du **VLAN Natif**.
  - Les trames qui circulent **sans étiquette (untagged)** sur un lien Trunk sont automatiquement considérées comme appartenant au VLAN Natif.
  - **Sécurité** : Par défaut, c'est souvent le VLAN 1. Il est recommandé de le changer pour un VLAN inutilisé (ex: VLAN 99 ou 42) pour des raisons de sécurité.

  Il est bon de connaître les équivalences car les termes changent selon les fabricants :

  | Terme Cisco | Terme Standard / Autres | Description |
  | :--- | :--- | :--- |
  | **Access Port** | **Untagged Port** | Port appartenant à un seul VLAN, trames non taguées. |
  | **Trunk Port** | **Tagged Port** | Port transportant plusieurs VLANs, trames taguées (802.1Q). |

- **WiFi (Wireless Fidelity)** :

  - Ensemble de protocoles de communication sans fil régis par les normes **IEEE 802.11**.
  - **Normes** : Du 802.11b (11 Mbit/s) au moderne 802.11ax (Wi-Fi 6) et au-delà, offrant des débits toujours plus élevés et une meilleure gestion de la densité d'appareils.
  - **Sécurité** :
    - **WEP** : Obsolète et non sécurisé (cassable en quelques minutes).
    - **WPA/WPA2/WPA3** : Standards actuels. WPA2 (AES) est le minimum recommandé. WPA3 apporte des améliorations contre les attaques par force brute.
  - **Obligations Légales (WiFi Public)** : En France, offrir un accès WiFi public (ex: entreprise, hôtel) impose des obligations légales, notamment la **conservation des logs de connexion** (qui s'est connecté, quand, etc.) pour une durée légale (généralement 1 an), conformément aux directives de la CNIL et à la loi antiterroriste.

- **Proxy & Portail Captif** :

  - **Proxy (Mandataire)** : Un serveur intermédiaire (Couche 7 Application) qui s'intercale entre l'utilisateur et Internet.
    - Rôles : Filtrage d'URL (blocage de sites), mise en cache (accélération), anonymisation, et journalisation des accès (logs).
  - **Portail Captif** : Une technique (souvent utilisée sur les WiFi publics) qui force tout nouvel utilisateur à voir une page web spécifique (authentification, acceptation des CGU) avant de pouvoir accéder à Internet.
  - **Filtrage MAC** : Méthode de sécurité basique (Couche 2) qui autorise ou bloque l'accès au réseau selon l'adresse MAC. Elle est peu efficace car l'adresse MAC est facilement falsifiable (spoofing).

[Challenge A309](/challenges/Challenge_A309.md)

> 📚 **Ressources :**
>
> WiFi : <https://fr.wikipedia.org/wiki/Wi-Fi>
>
> WiFi Protected Access : <https://fr.wikipedia.org/wiki/Wi-Fi_Protected_Access>
>
> CNIL point d'accès et obligations : <https://www.cnil.fr/fr/fournir-un-acces-internet-public-quelles-obligations>
>
> Vlan cmd :
>
> - *show vlan* : affiche les Vlans et les ports
> - *conf t / vlan 10 / name LAN1* : crée un vlan qui se nomme 10 dans la config et visible comme LAN1
> - *conf t / interface range fastEthernet 0/1-12 / switchport mode access / switchport access vlan 10* : configure la plage des ports fastEth 1 à 12 en mode access sur le vlan 10.
>
> Vlan Trunk : <https://fr.wikipedia.org/wiki/IEEE_802.1Q>
>
> Vlan Trunk cmd :
>
> - *conf t / interface gigabitEthernet 0/1 / switchport mode trunk* : passer l'interface gigEth en mode Trunk sur les 2 switchs pour propager plusieurs vlans.
> - *conf t / vlan 42 / name Management / exit / interface vlan 42 / ip address 10.42.0.1 255.255.255.0 / no shutdown* : crée une interface virtuelle et lui alloue une IP (pour le administrer à distance sur un switch L2, ou passerelle par défaut sur un routeur L3 ).
> - *interface gigabitEthernet 0/1 / switchport trunk native vlan 42* : Passe le Vlan 42 en natif, un seul Vlan untagged autre que le défaut permet d'être plus sécurisé (Hardening) contre le Vlan Hopping.
> - *interface gigabitEthernet 0/1 / switchport trunk allowed vlan 10,20,42* (sur tous les switchs) : bloque tous les Vlans sauf le 10, 20 et 42. A faire sur tous les switchs.
Passerelle VLan sur Routeur (L3)
> - *conf t / interface vlan 10 / description Passerelle LAN1 / ip address 192.168.1.254 255.255.255.0 / no shutdown* : alloue une IP sur l'interface pour être une Passerelle (idem sur LAN2)
> - *ip routing* : active le routage entre les VLANs
>
> IPv6
>
> - ``.0.0.0.`` peut s'écrire ``. .``
> - Quasi toujours en /64 moitié hextets en préfix, moitié en clients
>
>IANA : <https://www.iana.org/numbers>
>
> - Prefixes régionaux : <https://www.iana.org/assignments/ipv6-unicast-address-assignments/ipv6-unicast-address-assignments.xhtml>
>
> ICMP (v6) : <https://fr.wikipedia.org/wiki/Internet_Control_Message_Protocol>
>
> Proxy : <https://fr.wikipedia.org/wiki/Proxy>
>
> Proxy Squid : <https://www.it-connect.fr/proxy-transparent-mise-en-place-de-squid-sur-pfsense/>

[Retour en haut](#-table-des-matières)

---

## **🌐 FIN Saison A3. Réseau**

[QCM Saison A3](https://forms.gle/SXH9yy4tfSV8ePiW8)

![Résultat QCM](/images/2025-11-18-12-11-28.png)

[Retour en haut](#-table-des-matières)

---

C'est une excellente initiative ! Les modes de ports sont effectivement des concepts cruciaux pour bien configurer les VLANs.

Voici les détails complémentaires sur les modes **Access**, **Trunk** et le **VLAN Natif**, à ajouter à votre fiche de révision pour le cours A309.

---

## **💠 Saison A4. Windows Server**

> Cette saison se concentre sur l'administration système dans un environnement Microsoft. L'objectif est de maîtriser l'installation, la configuration et la gestion des services essentiels (AD DS, DNS, DHCP) sur Windows Server.

### 🖥️ A401. Introduction et Installation

> Ce cours introduit la famille des systèmes d'exploitation serveurs de Microsoft, leur historique, leurs spécificités par rapport aux versions "publiques" (Windows 10/11), et détaille la procédure d'installation et de promotion d'un contrôleur de domaine.

- **Historique et Évolution** :

  - **Les débuts (NT)** : Tout commence avec **Windows NT 3.1 Advanced Server** (1993) et **NT 4.0**, séparant la branche professionnelle de la branche grand public (Windows 95/98).
  - **Le tournant (2000)** : **Windows 2000 Server** introduit **Active Directory**, révolutionnant la gestion centralisée des réseaux d'entreprise.
  - **La maturité** :
    - **Server 2003 & 2008** : Améliorations de stabilité, introduction de **Hyper-V** (virtualisation) et du mode **Server Core** (sans interface graphique).
    - **Server 2012/2016** : Focus sur le Cloud, l'interface "Metro" et les conteneurs.
  - **Aujourd'hui (2019/2022)** : Intégration poussée avec le cloud hybride (**Azure**), sécurité renforcée (Windows Defender ATP) et gestion via **Windows Admin Center**.

- **Fonctionnement : Rôles et Fonctionnalités** :

  - Contrairement à un Windows classique, Windows Server est modulaire. On n'installe que ce dont on a besoin pour des raisons de sécurité et de performance.
  - **Rôles** : Ce sont les fonctions principales du serveur (ex: Serveur Web IIS, Serveur DNS, Services de domaine Active Directory).
  - **Fonctionnalités** : Ce sont des outils de support (ex: .NET Framework, Chiffrement BitLocker, Telnet Client).
  - **Gestion** : Tout se gère centralement via le **Gestionnaire de serveur** (Server Manager) ou en ligne de commande avec **PowerShell**.

- **Préparation et Installation (Windows Server 2019)** :

  - **Prérequis matériels** : Processeur 64 bits 1.4 GHz, RAM minimum 512 Mo (mais **8 Go** recommandés en production), et 32 Go d'espace disque.
  - **Types d'installation** :
    - **Expérience utilisateur (Desktop Experience)** : Avec l'interface graphique complète (GUI), recommandée pour les débutants.
    - **Server Core** : Sans interface graphique (gestion en ligne de commande), plus léger et sécurisé (moins de surface d'attaque), mais plus complexe à gérer.
  - **Processus** : Démarrage sur l'ISO, choix de la langue, sélection de l'édition (Standard ou Datacenter), partitionnement du disque et installation des fichiers.

- **Configuration Post-Installation** :

  - **Sécurité de base** : Définition du mot de passe Administrateur local (complexe requis).
  - **Réseau** : Attribution impérative d'une **adresse IP statique** et configuration des DNS.
  - **Identité** : Renommer le serveur avec un nom cohérent avant toute autre action.
  - **Accès** : Activation du Bureau à distance (RDP) pour l'administration.
  - **Mises à jour** : Installation critique des correctifs via Windows Update.

- **Promotion en Contrôleur de Domaine (Active Directory)** :

  - Pour qu'un serveur devienne le "chef" du réseau, on installe le rôle **AD DS** (Active Directory Domain Services).
  - **Promotion** : Une fois le rôle installé, on doit "promouvoir" le serveur.
  - **Nouvelle Forêt** : Pour le premier serveur, on crée une nouvelle forêt et on définit le nom de domaine racine (ex: `thm.local`).
  - **DSRM** : On définit un mot de passe de restauration des services d'annuaire (crucial en cas de crash de l'AD).

[Challenge A401](./challenges/Challenge_A401.md)

> 📚 Ressources :
>
>Installation sur Proxmox : <https://getlabsdone.com/how-to-install-windows-server-2019-on-proxmox-step-by-step/>
>
> Créer un active directory : <https://www.it-connect.fr/creer-un-domaine-ad-avec-windows-server-2016/>

[Retour en haut](https://www.google.com/search?q=%23-table-des-mati%C3%A8res)

---
