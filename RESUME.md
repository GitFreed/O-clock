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
- [Fin Saison 1 : QCM](#-fin-saison-a1-savoirs-de-base)

### [Saison A2. Support aux Utilisateurs 🛠️](#️-saison-a2-support-aux-utilisateurs)

- [A201. Outils Bureautiques](#-a201-outils-bureautiques)
- [A202. Diagnostic et Résolution d'Incidents](#-a202-diagnostic-et-résolution-dincidents)
- [A203. Contrôle à distance](#-a203-contrôle-à-distance)
- [A204. Incidents Hardware et Réglementation](#-a204-incidents-hardware-et-réglementation)
- [A205. Atelier Mme Michu](#-a205-atelier-mme-michu-)
- [A206. BIOS, UEFI, MBR et GPT](#-a206-bios-uefi-mbr-et-gpt)
- [A207. ITIL](#-a207-itil)
- [A208. Pratiques ITIL et GLPI](#️-a208-pratiques-itil-et-glpi)
- [Fin Saison 2 : QCM](#️-fin-saison-a2-support-aux-utilisateurs)

### [Saison A3. Réseau 🌐](#-saison-a3-réseau)

- [A301. Fondamentaux Réseau & Ethernet](#-a301-fondamentaux-réseau--ethernet)
- [A302. Hubs, Switchs, MAC & ARP](#-a302-hubs-switchs-mac--arp)
- [A303. Modèle OSI, TCP/IP, UDP & DHCP](#️-a303-modèle-osi-tcpip-udp--dhcp)
- [A304. Cisco IOS & Routage Statique](#-a304-cisco-ios--routage-statique)
- [A305. Atelier Packet Tracer](/challenges/Challenge_A305.md)
- [A306. DNS, Telnet et SSH](#-a306-dns-telnet-et-ssh)
- [A307. RFC1918, NAT & self-hosting](#-a307-rfc1918-nat--self-hosting)
- [A308. Atelier Proxmox](/challenges/Challenge_A308.md)
- [A309. VLANs, L3 switchs, WiFi & IPv6](#-a309-vlans-l3-switchs-wifi--ipv6)
- [Fin Saison A3 : QCM](#-fin-saison-a3-réseau)

### [Saison A4. Windows Server 💠](#-saison-a4-windows-server)

- [A401. Introduction et Installation](#️-a401-introduction-et-installation)
- [A402. Active Directory Domain Services (AD DS)](#-a402-active-directory-domain-services-ad-ds)
- [A403. Stratégies de Groupe (GPO)](#️-a403-stratégies-de-groupe-gpo)
- [A404. Serveur de fichiers distribués (DFS)](#-a404-serveur-de-fichiers-distribués-dfs)
- [A405. Gestion du Stockage : Filtres, Quotas & Audit](#️-a405-gestion-du-stockage--filtres-quotas--audit)
- [A406 & 407. Atelier Windows Server](./challenges/Challenge_A406.md)
- [A408. DNS et IIS](#-a408-dns--iis)
- [A409. Pools, Authentification et Sauvegarde](#️-a409-pools-iis-authentification-et-backup)
- [A410. Service de Déploiement Windows (WDS)](#-a410-windows-deployment-services-wds)
- [A411. Services Bureau à Distance (RDS)](#️-a411-rds-remote-desktop-services)
- [A412. VDI & Hyper-V](#️-a412-vdi--hyper-v)
- [A413. Déploiement VDI & Sysprep](#-a413-déploiement-vdi--sysprep)
- [A414. Azure](#️-a414-microsoft-azure)
- [Fin Saison A4 : QCM](#-fin-saison-a4-windows-server)

### [Saison A5. Linux 🐧](#-saison-a5-linux)

- [A501. Introduction](#️-a501-introduction-à-gnulinux)
- [A502. Composants d'un système GNU/Linux](#-a502-composants-dun-système-gnulinux)
- [A503. Utilisateurs, Groupes, Permissions & Sudo](#-a503-utilisateurs-groupes-permissions--sudo)
- [A504. Gestion des Paquets, Compilation & Logs](#-a504-gestion-des-paquets-compilation--logs)
- [A505. Atelier LAMP](#-a505-atelier-lamp)
- [A506. Atelier SAMBA](#-a506-atelier-samba)
- [A507. Arch Linux](#-a507-arch-linux)
- [A508. Introduction à la VoIP et Asterisk](#-a508-introduction-à-la-voip-et-asterisk)
- [A509. Atelier Asterisk](#️-a509-atelier-asterisk)
- [Fin Saison A5 : QCM](#-fin-saison-a5-linux)

### [Saison B1. Virtualisation ☁️](#️-saison-b1-virtualisation)

- [B101. Introduction à la Virtualisation](#-b101-introduction-à-la-virtualisation)
- [B102. Proxmox VE & Infrastructure Haute Disponibilité](#️-b102-proxmox-ve--infrastructure-haute-disponibilité)

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

### 💻 Fin Saison A1. Savoirs de Base

[QCM Saison A1](https://forms.gle/MofrrYWGy8XXPN6D7)

![QCM Résultats](./images/QCMs01.png)

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

### 🛠️ Fin Saison A2. Support aux Utilisateurs

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

### 🌐 Fin Saison A3. Réseau

[QCM Saison A3](https://forms.gle/SXH9yy4tfSV8ePiW8)

![Résultat QCM](/images/2025-11-18-12-11-28.png)

[Retour en haut](#-table-des-matières)

---

## **💠 Saison A4. Windows Server**

> Cette saison se concentre sur l'administration système dans un environnement Microsoft. L'objectif est de maîtriser l'installation, la configuration et la gestion des services essentiels (AD DS, DNS, DHCP) sur Windows Server.

### 🖥️ A401. Introduction et Installation

> Ce cours introduit la famille des systèmes d'exploitation serveurs de Microsoft, leur historique, leurs spécificités par rapport aux versions "publiques" (Windows 10/11), et détaille la procédure d'installation et de promotion d'un contrôleur de domaine.

- **Introduction et Contexte** :

  - **Définition** : Windows Server est une solution conçue pour répondre aux besoins d'infrastructure des entreprises, distincte des versions "client" (Windows 10/11).
  - **Part de marché** : Il domine le monde de l'entreprise avec environ **70% de parts de marché** mondiales, même si Linux reste majoritaire pour les serveurs Web.
  - **Impact** : Il a standardisé les infrastructures IT grâce à son adoption massive et son intégration forte avec l'écosystème Microsoft (**Office, Azure**).

- **Historique et Évolution** :

  - **Les débuts (NT)** : Tout commence avec **Windows NT 3.1 Advanced Server** (1993) et **NT 4.0**, séparant la branche professionnelle de la branche grand public (Windows 95/98).
  - **Le tournant (2000)** : **Windows 2000 Server** introduit **Active Directory**, révolutionnant la gestion centralisée des réseaux d'entreprise.
  - **La maturité** :
    - **Server 2003 & 2008** : Améliorations de stabilité, introduction de **Hyper-V** (virtualisation) et du mode **Server Core** (sans interface graphique).
    - **Server 2012/2016** : Focus sur le Cloud, l'interface "Metro" et les conteneurs.
  - **Aujourd'hui (2019/2022/2025)** : Intégration poussée avec le cloud hybride (**Azure**), sécurité renforcée (Windows Defender ATP) et gestion via **Windows Admin Center**.

- **Fonctionnement : Rôles et Fonctionnalités** :

  - Contrairement à un Windows classique, Windows Server est modulaire. On n'installe que ce dont on a besoin pour des raisons de sécurité et de performance.
  - **Rôles** : Ce sont les fonctions principales du serveur (ex: Serveur Web IIS, Serveur DNS, Services de domaine Active Directory).
  - **Fonctionnalités** : Ce sont des outils de support (ex: .NET Framework, Chiffrement BitLocker, Telnet Client).
  - **Gestion** : Tout se gère centralement via le **Gestionnaire de serveur** (Server Manager) ou en ligne de commande avec **PowerShell**. Dans le Gestionnaire de serveur on retrouve la **MMC** (Microsoft Management Console). C'est l'outil graphique qui héberge les composants (snap-ins) pour gérer les différents rôles Windows. .

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

> **📚 Ressources :**
>
> Wiki Windows Server : <https://en.wikipedia.org/wiki/Windows_Server>
>
> Installation sur Proxmox : <https://getlabsdone.com/how-to-install-windows-server-2019-on-proxmox-step-by-step/>

[Retour en haut](#-table-des-matières)

---

### 🏢 A402. Active Directory Domain Services (AD DS)

> Ce cours détaille l'architecture et les composants fondamentaux d'Active Directory, le service d'annuaire de Microsoft qui centralise la gestion des identités et des accès dans un réseau Windows.

- **Les Fondations : LDAP** :

  - **LDAP (Lightweight Directory Access Protocol)** est le protocole standard utilisé pour interroger et modifier les annuaires. Il structure les données de manière hiérarchique (comme un arbre) pour faciliter la recherche.
  - Active Directory est l'implémentation Microsoft de LDAP. Il utilise ce protocole pour communiquer, tout en intégrant la sécurité Kerberos.

- **Architecture Logique** :

  - **Domaine** : C'est l'unité de base d'administration et de sécurité. Il regroupe des objets (utilisateurs, ordinateurs) partageant une base de données commune.
  - **Arbre (Tree)** : Regroupement de un ou plusieurs domaines partageant un espace de noms DNS contigu (ex: `thm.local` et `us.thm.local`).
  - **Forêt (Forest)** : Le conteneur de plus haut niveau. Elle regroupe un ou plusieurs arbres qui partagent le même **schéma** (définition des objets) et la même configuration. C'est la frontière de sécurité ultime.
  - **OU (Unité Organisationnelle)** : Conteneurs à l'intérieur d'un domaine permettant d'organiser les objets (par département, lieu...) et surtout d'appliquer des **GPO** (Stratégies de groupe) ou de déléguer des droits d'administration.

- **Architecture Physique** :

  - **Site** : Représente la topologie physique du réseau (un ou plusieurs sous-réseaux IP). Les sites servent à optimiser la **réplication** (synchronisation) entre les contrôleurs de domaine et à permettre aux utilisateurs de s'authentifier sur le serveur le plus proche.
  - **Contrôleur de Domaine (DC)** : Serveur qui héberge la base de données AD (`NTDS.dit`) et le dossier SYSVOL.

- **Gestion des Objets** :

  - **Utilisateurs et Ordinateurs** : Comptes utilisés pour l'authentification sur le réseau.
  - **Groupes** : Permettent de gérer les permissions efficacement (on donne des droits à un groupe, pas à un utilisateur seul).
    - **Types** : Sécurité (pour les permissions d'accès) ou Distribution (pour les e-mails).
    - **Portées** : Domaine Local, Global, Universel (définissent la visibilité du groupe dans la forêt).

- **Le SYSVOL** :

  - C'est un dossier partagé présent sur chaque Contrôleur de Domaine. Il contient les éléments publics nécessaires aux clients, comme les **scripts de connexion** et les fichiers des **GPO** (Stratégies de groupe). Il est automatiquement répliqué sur tous les DC.

[Challenge A402](./challenges/Challenge_A402.md)

> **📚 Ressources :**
>
> Créer un active directory : <https://www.it-connect.fr/creer-un-domaine-ad-avec-windows-server-2016/>
>
> Domaine Forestier : <https://www.it-connect.fr/chapitres/domaine-arbre-et-foret/>
>
> Mise en place step by step :
>
>1. install win serveur (choisir expérience de bureau)
>2. configurer le nom de la machine
>3. mettre une IP statique
>4. ajouter le rôle AD DS (ajouter une nouvelle forêt, choisir "oclock.lan")
>5. promouvoir ce serveur en contrôleur de domaine
>
>6. sur une VM Win10, configurer DNS -> utiliser IP statique du serveur windows
>7. renommer la machine
>8. rejoindre le domaine oclock.lan (vérifier que le ping du domaine passe avant)

[Retour en haut](#-table-des-matières)

---

### 🛡️ A403. Stratégies de Groupe (GPO)

> Ce cours aborde les Stratégies de Groupe (GPO - Group Policy Objects), un outil puissant d'Active Directory pour gérer centralement la configuration des utilisateurs et des ordinateurs dans un environnement Windows.

- **Principe des GPO** :
  - Une GPO est un ensemble de paramètres de configuration appliqués à des utilisateurs ou des ordinateurs.
  - Elles permettent d'automatiser la gestion, d'appliquer des règles de sécurité, d'installer des logiciels ou de configurer l'environnement de travail (fond d'écran, mappage de lecteurs, etc.) à grande échelle.

- **Structure et Application** :
  - **Conteneurs** : Les GPO peuvent être liées à des **Sites**, des **Domaines** ou des **Unités Organisationnelles (OU)**.
  - **Héritage** : Par défaut, les GPO appliquées à un conteneur parent sont héritées par les conteneurs enfants. Cet héritage peut être bloqué ou forcé.
  - **Ordre d'application (LSDOU)** : Local > Site > Domaine > OU. La dernière GPO appliquée l'emporte en cas de conflit (l'OU a donc la priorité sur le Domaine).

- **Configuration Utilisateur vs. Ordinateur** :
  - **Configuration Ordinateur** : S'applique au démarrage de la machine, quel que soit l'utilisateur qui se connecte (ex: paramètres de pare-feu, installation de logiciels système).
  - **Configuration Utilisateur** : S'applique à l'ouverture de session de l'utilisateur (ex: scripts de connexion, restrictions du panneau de configuration, raccourcis bureau).

- **Gestion des GPO** :
  - L'outil principal est la **Console de gestion des stratégies de groupe (GPMC)**.
  - On y crée les objets GPO, on les modifie via l'éditeur, et on les lie aux conteneurs AD souhaités.
  - **Filtrage de sécurité** : Permet de restreindre l'application d'une GPO à certains utilisateurs, groupes ou ordinateurs spécifiques, même si elle est liée à leur OU.
  - **WMI Filters** : Permettent d'appliquer une GPO selon des critères techniques (ex: version de l'OS, espace disque disponible).

- **Commande utile** :
  - `gpupdate /force` : Force la mise à jour immédiate des stratégies de groupe sur le client, sans attendre le cycle de rafraîchissement automatique (environ 90 minutes).
  - `gpresult /r` : Affiche un rapport sur les GPO appliquées à l'utilisateur et à l'ordinateur, utile pour le diagnostic.

[Challenge A403](./challenges/Challenge_A403.md)

> **📚 Ressources :**
>
> Contrôle de comptes d'utilisateur : <https://learn.microsoft.com/fr-fr/windows/security/application-security/application-control/user-account-control/how-it-works>
>
> GPO sur IT-connect : <https://www.it-connect.fr/chapitres/quest-ce-quune-strategie-de-groupe-ou-gpo/>

[Retour en haut](#-table-des-matières)

---

### 💾 A404. Serveur de fichiers distribués (DFS)

> Ce cours explore le service DFS de Windows Server, essentiel pour centraliser l'accès aux données, simplifier l'arborescence réseau pour les utilisateurs, et garantir la haute disponibilité des fichiers grâce à la réplication.

- **Protocole SMB (Server Message Block)** :
  - C'est le protocole standard des réseaux Microsoft pour le partage de fichiers et d'imprimantes.
  - Il permet aux clients d'accéder aux ressources via des chemins UNC (ex: `\\NomServeur\NomPartage`).
  - La version moderne (**SMB 3.x**) inclut des fonctionnalités avancées de sécurité (chiffrement) et de performance, essentielles pour les serveurs de fichiers et la virtualisation (Hyper-V).

- **DFS (Distributed File System)** :

  - **Définition** : Service Windows Server permettant de regrouper plusieurs partages réseau (situés sur différents serveurs) sous un seul et unique espace de noms logique (ex : `\\domaine.local\partages`).
  - **Rôle principal - DFS Namespace** : Crée un point d'accès logique et unifié. Les utilisateurs n'ont plus besoin de connaître le nom du serveur physique.
  - **Rôle secondaire - DFS Replication (DFSR)** : Synchronise les données entre plusieurs serveurs pour assurer la tolérance de panne et la haute disponibilité. Si un serveur tombe, les utilisateurs accèdent automatiquement à une copie des données sur un autre serveur.
  - **Bénéfices** : Simplification des chemins d'accès pour les utilisateurs et haute disponibilité des données.

- **Gestion des Permissions : Partage vs. NTFS** :

  - **Permissions NTFS** : S'appliquent au niveau du **système de fichiers local**. Elles définissent les droits précis (Lecture, Écriture, Modification, Contrôle total) et s'appliquent après l'accès au partage.
  - **Permissions de Partage** : Gérées au niveau du **répertoire partagé** sur le réseau. Elles sont plus générales (Lecture, Modification, Contrôle total).
  - **Règle de cumul** : Les permissions NTFS s'appliquent **après** les droits de partage. L'utilisateur reçoit toujours le **droit le plus restrictif** entre les droits de partage et les droits NTFS.

- **Héritage et Bonnes Pratiques** :

  - **Héritage** : Transmet automatiquement les droits définis sur un dossier parent aux sous-dossiers et fichiers. Il est possible de désactiver cet héritage ("casser l'héritage") pour isoler et redéfinir des droits spécifiques.
  - **Bonne Pratique (Simplification)** : Pour la simplicité administrative, il est courant de donner le droit **Contrôle total** au groupe `Tout le monde` (ou `Utilisateurs Authentifiés`) sur la **permission de partage**, et de gérer toutes les **vraies restrictions** et la sécurité via les **permissions NTFS**.

- **Modèle AGDLP / AGP (Modèle pour les droits)** :

  - Ce modèle est une bonne pratique pour l'administration évolutive des droits dans les grandes structures :
    - **A**ccounts (Utilisateurs et ordinateurs)
    - placés dans des **G**roupes **D**omains **G**lobaux
    - ajoutés dans des **L**ocal **P**ermission Groups
    - puis ces groupes reçoivent des **P**ermissions sur la ressource (dossiers NTFS ou partages DFS).

- **Tips** :

  - Ajouter le suffixe `$` au nom d'un dossier partagé (ex : `drivers$`) cache le répertoire aux utilisateurs qui parcourent le réseau, tout en permettant l'accès via le chemin UNC complet.
  - Pour les besoins spécifiques, il est parfois plus simple de **casser l'héritage** et de redéfinir manuellement les permissions. Soit en supprimant tout et remettant manuellement, soit en

[Challenge A404](./challenges/Challenge_A404.md)

> **📚 Ressources :**
>
> Serveur de Fichier - ITconnect: <https://www.it-connect.fr/serveur-de-fichiers-les-permissions-ntfs-et-de-partage/>
>
> AGDLP - ITconnect : <https://www.it-connect.fr/agdlp-bien-gerer-les-permissions-de-son-serveur-de-fichiers/>
>
> Documentation DFS – Microsoft <https://learn.microsoft.com/fr-fr/windows-server/storage/dfs-namespaces/dfs-overview?tabs=server-manager>
>
> DFS Replication – Microsoft <https://learn.microsoft.com/fr-fr/windows-server/storage/dfs-replication/dfs-replication-overview>

[Retour en haut](#-table-des-matières)

---

### 🗄️ A405. Gestion du Stockage : Filtres, Quotas & Audit

> Ce cours aborde la gestion avancée des serveurs de fichiers, principalement via le rôle **FSRM** (File Server Resource Manager / Gestionnaire de ressources du serveur de fichiers). Il permet de contrôler l'utilisation du stockage et de sécuriser les données grâce à la mise en place de l'audit.

- **Le Rôle FSRM (Gestionnaire de ressources du serveur de fichiers)** :
  - C'est une fonctionnalité de Windows Server qu'il faut installer pour gérer finement les quotas et les filtres de fichiers.
  - Contrairement aux quotas NTFS standards (qui s'appliquent à un volume entier), FSRM permet de gérer des quotas par **dossier**.

- **Gestion des Quotas (Limitation d'espace)** :
  - **Objectif** : Empêcher la saturation des disques par les utilisateurs et répartir équitablement les ressources de stockage.
  - **Types de Quotas** :
    - **Quota strict (Hard quota / Inconditionnels)** : Bloque l'écriture une fois la limite atteinte (l'utilisateur reçoit un message "Espace disque insuffisant").
    - **Quota souple (Soft quota / Conditionnels)** : Ne bloque pas l'utilisateur, mais sert à la surveillance. Il génère des alertes (logs, emails à l'admin) lorsque des seuils sont dépassés.
  - **Modèles** : On utilise des modèles de quotas pour appliquer automatiquement des règles (ex: "Limite de 5 Go") à tous les nouveaux sous-dossiers créés.

- **Filtrage de Fichiers (File Screening)** :
  - **Objectif** : Contrôler le type de contenu stocké sur le serveur (ex: interdire les fichiers personnels comme les MP3 ou les vidéos AVI sur un serveur professionnel).
  - **Fonctionnement** : Se base sur des **groupes de fichiers** (listes d'extensions, ex: `*.mp3`, `*.mkv`).
  - **Types de filtrage** :
    - **Filtrage actif** : Empêche l'utilisateur d'enregistrer le fichier interdit (message "Accès refusé").
    - **Filtrage passif** : Autorise l'enregistrement mais génère une alerte pour l'administrateur (utile pour surveiller sans bloquer le travail).

- **Audit des Accès (Traçabilité)** :
  - **Objectif** : Renforcer la sécurité en gardant une trace ("Qui a fait quoi et quand ?") sur les fichiers sensibles. Idéal pour savoir qui a supprimé ou modifié un fichier critique.
  - **Mise en place (2 étapes)** :
        1. **Activer la stratégie d'audit** : Via une GPO (Configuration Ordinateur > Stratégies > Paramètres Windows > Paramètres de sécurité > Stratégies locales > Stratégie d'audit > **Auditer l'accès aux objets**).
        2. **Configurer la SACL** : Sur le dossier cible (Clic droit > Propriétés > Sécurité > Avancé > Onglet **Audit**), on définit *qui* on surveille et pour *quelles actions* (Réussite/Échec de suppression, écriture, etc.).
  - **Consultation** : Les traces se trouvent dans l'**Observateur d'événements**, journal **Sécurité**.

[Challenge A405](./challenges/Challenge_A405.md)

> **📚 Ressources :**
>
> Monter un Lecteur réseau par GPO - ITconnect : <https://www.it-connect.fr/comment-monter-un-lecteur-reseau-par-gpo/>
>
> GPSearch Microsoft : <https://gpsearch.azurewebsites.net/>
>
> Audit des Groupes de Sécurité de l'AD - ITconnect : <https://www.it-connect.fr/audit-des-groupes-de-securite-de-lactive-directory/>
>
> Audit des accès aux Fichiers et Dossiers - RDR-IT : <https://rdr-it.com/serveur-fichiers-windows-enregistrer-acces-fichiers-dossiers/>

[Retour en haut](#-table-des-matières)

---

### ⚙️ A406. Atelier

[Challenge A406](./challenges/Challenge_A406.md)

et Correction Atelier A407.

[Retour en haut](#-table-des-matières)

---

### 🌐 A408. DNS & IIS

> Ce cours explore deux rôles fondamentaux de Windows Server : le serveur DNS, pilier de la résolution de noms dans le réseau, et le serveur Web IIS, plateforme d'hébergement d'applications et de sites internet. Leur configuration conjointe est essentielle pour rendre les services accessibles de manière conviviale.

- **DNS (Domain Name System)** :

  - **Rôle** : C'est l'annuaire d'Internet et des réseaux locaux. Il convertit des noms de domaine lisibles par l'humain (ex: `www.exemple.com`) en adresses IP utilisables par les machines.
  - **Gestionnaire DNS** : L'outil d'administration sur Windows Server permet de configurer deux types de zones principales :
    - **Zone de recherche directe** : Associe un nom à une IP (le cas le plus courant). Elle contient des enregistrements de type **A** (IPv4), **AAAA** (IPv6), **CNAME** (Alias), **MX** (Messagerie) ou **TXT** (Infos diverses).
    - **Zone de recherche inversée** : Associe une IP à un nom. Elle utilise des enregistrements de type **PTR** (Pointeur). Utile pour le diagnostic réseau et certaines vérifications de sécurité.

- **IIS (Internet Information Services)** :

  - **Définition** : C'est le serveur Web modulaire et extensible de Microsoft. Il permet d'héberger des sites web (HTML, ASP.NET), des services FTP et des API.
  - **Test rapide** : Après l'installation du rôle, accéder à `http://127.0.0.1` ou `http://localhost` depuis le serveur affiche la page d'accueil par défaut d'IIS, confirmant son bon fonctionnement.
  - **Fonctionnalités clés** :
    - **Sites multiples** : Hébergement de plusieurs sites sur un même serveur grâce aux **bindings** (liaisons).
    - **Sécurité** : Gestion des certificats SSL/TLS pour le HTTPS.
    - **Pools d'applications** : Isolation des processus pour qu'un crash sur un site n'affecte pas les autres.
    - **Exploration de répertoire** : Option (souvent désactivée par sécurité) qui permet d'afficher la liste des fichiers d'un dossier ("Index of...").

- **L'Interaction DNS \<-\> IIS** :

  - Pour qu'un utilisateur accède à un site hébergé sur IIS via un nom (ex: `intranet.thm.local`), deux configurations sont nécessaires :
        1. **Côté DNS** : Créer un enregistrement **A** qui fait pointer le nom `intranet` vers l'adresse IP du serveur IIS.
        2. **Côté IIS** : Configurer le **binding** (liaison) du site pour qu'il écoute les requêtes arrivant sur cette IP avec ce nom d'hôte spécifique (ex: port 80, nom d'hôte `intranet.thm.local`).

[Challenge A408](./challenges/Challenge_A408.md)

> **📚 Ressources :**
>
> - **Commande `nslookup`** : Outil en ligne de commande essentiel pour interroger un serveur DNS et diagnostiquer les problèmes de résolution.
>   - **Mode interactif** : Taper `nslookup` puis `server <IP_du_DNS>` pour tester un serveur spécifique.
>   - **Recherche directe** : `nslookup www.google.com` (renvoie l'IP).
>   - **Recherche inversée** : `nslookup 8.8.8.8` (renvoie le nom associé `dns.google`).

[Retour en haut](#-table-des-matières)

---

### 🛡️ A409. Pools IIS, Authentification et Backup

> Ce cours approfondit la configuration du serveur Web IIS avec la gestion des pools d'applications et de l'authentification, et aborde un aspect critique de l'administration système : la sauvegarde et la restauration (notamment d'Active Directory) avec Windows Server Backup.

- **IIS - Pools d'Application** :

  - **Définition** : Un pool d'application est un mécanisme d'isolation qui permet d'exécuter des sites web ou des applications dans des processus séparés. Chaque pool fonctionne avec son propre processus système (**`w3wp.exe`**).
  - **Idée clé** : **Un pool = Une isolation**. Si un site plante ou consomme toutes les ressources, les autres sites (dans d'autres pools) continuent de fonctionner normalement.
  - **Avantages** :
    - **Isolation** : Si une application plante, elle ne fait pas tomber les autres pools.
    - **Sécurité & Stabilité** : Permet de définir une identité spécifique (compte de service) et des réglages de recyclage pour chaque application.
    - **Flexibilité** : Possibilité de configurer des versions de .NET différentes par pool.
  - **Configuration** : Dans le Gestionnaire IIS \> Pools d'applications \> Ajouter un pool d'applications. Chaque pool peut avoir sa propre version de .NET et son propre compte de service (identité).

- **IIS - Authentification et Contrôle d'Accès** :

  - **Objectif** : Par défaut, un site est en accès anonyme. L'authentification permet d'exiger une identification pour garantir la traçabilité et restreindre l'accès aux seules personnes autorisées.
  - **Installation** : C'est une fonctionnalité à ajouter via le Gestionnaire de serveur \> Rôle Serveur Web (IIS) \> Serveur Web \> Sécurité \>
  - **Authentification de base** : Méthode simple où le navigateur demande un identifiant et un mot de passe.
    - *Attention* : Les identifiants sont encodés en Base64 (facilement déchiffrables), il est donc crucial d'utiliser le **SSL/TLS (HTTPS)** pour chiffrer la connexion.
    - **Règle d'or** : Si on active l'Authentification de base, il faut impérativement **désactiver l'Authentification anonyme** pour forcer la connexion.
  - **Authentification Digest** : Plus sécurisée que la "Basic" (hachage des identifiants), mais moins robuste que Windows.
  - **Authentification Windows** : La plus robuste pour un Intranet, utilise **NTLM** ou **Kerberos** (AD).
  - **Certificat Client** : Authentification forte basée sur des certificats X.509.
  - **Autres restrictions** : Il est aussi possible de filtrer par **Adresse IP/Domaine** ou d'utiliser le **Filtrage des demandes** (URL Authorization) pour bloquer certaines requêtes spécifiques.

- **Windows Server Backup & Stratégie de Sauvegarde (PRA)** :

  - **Contexte** : La sauvegarde est le pilier du **PRA (Plan de Reprise d'Activité)**.

  - **Windows Server Backup** : Solution native idéale pour les TPE/PME. Elle permet des sauvegardes complètes, incrémentielles ou de l'état du système ("System State"). A installer via "Ajout de rôles et fonctionnalités".
  - **Limites** : Pour les grandes structures, on privilégie des solutions tierces (Veeam, etc.) offrant la centralisation, la déduplication, et la réplication cloud.
  - **Technologies** :
    - **Sauvegarde classique** : Garantie de continuité "à froid".
    - **VSS (Volume Shadow Copy)** : Mécanisme de "Snapshot" (instantané) permettant de sauvegarder des fichiers en cours d'utilisation sans interrompre le service.
  - **Stratégie** : Les snapshots permettent des sauvegardes fréquentes sans interruption de service. Une sauvegarde complète "à froid" (services arrêtés) reste une bonne pratique ponctuelle pour une cohérence absolue.
  - **Format** : Les sauvegardes sont stockées sous forme d'images disques **.vhdx**, qui peuvent être montées manuellement pour récupérer des fichiers unitaires.
  - **Types de récupération** : Fichiers et dossiers, Volumes entiers, Applications, ou **État du système** (System State).

- **Sauvegarde et Restauration Active Directory** :

  - **Composants critiques** : La sauvegarde de l'AD repose sur deux dossiers clés :
    - **NTDS** : Contient la base de données de l'annuaire (`ntds.dit` avec utilisateurs, groupes, ordinateurs).
    - **SYSVOL** : Contient les fichiers publics répliqués (Stratégies de groupe/GPO, scripts de connexion).
    - **Restauration de l'État du Système (System State)** : C'est l'option à choisir pour récupérer un AD. Elle restaure :
    - **AD** (L'annuaire lui-même).
    - **FRS/DFSR** (Le dossier SYSVOL).
    - **Registry** (La configuration système locale).
  - **Règle impérative** : Active Directory étant un service critique en cours d'exécution, il **ne peut pas être restauré en mode normal**. Il faut obligatoirement redémarrer le serveur en **Mode de restauration des services d'annuaire (DSRM)**.

[Challenge A409](./challenges/Challenge_A409.md)

> 📚 **Ressources** :
>
> - **Démarrage en Mode Restauration des Services d'Annuaire (DSRM)** : Nécessaire pour certaines restaurations AD.
>   - Via l'interface : `msconfig` \> Onglet Démarrer \> Démarrage sécurisé \> Réparer Active Directory.
>   - Au démarrage : Maintenir la touche **MAJ (Shift)** en cliquant sur "Redémarrer" \> Dépannage \> Options avancées \> Paramètres de démarrage.
>
> Sauvegarder son serveur avec Windows Server Backup - IT-connect <https://www.it-connect.fr/chapitres/windows-server-2025-sauvegarder-son-serveur-avec-windows-backup/>
>
> Restaurer un contrôleur de domaine AD - IT-connect <https://www.it-connect.fr/comment-restaurer-un-controleur-de-domaine-active-directory/>
>
> Restaurer une zone DNS - IT-connect <https://www.it-connect.fr/windows-server-comment-restaurer-une-zone-dns/>
>
> Vidéo Sauvegarde et restauration Active Directory - ENNIBI-IT <https://www.youtube.com/watch?v=p3N8LkLb7sU>
>
> Reset mdp Admin en DSRM <https://learn.microsoft.com/fr-fr/troubleshoot/windows-server/active-directory/reset-directory-services-restore-mode-admin-pwd>

[Retour en haut](#-table-des-matières)

---

### 🚀 A410. Windows Deployment Services (WDS)

> Ce cours aborde le déploiement automatisé de systèmes d'exploitation via le réseau en utilisant le rôle **WDS** (Windows Deployment Services). Il permet d'installer Windows sur de multiples machines simultanément, sans avoir besoin de support physique (clé USB/DVD) pour chaque poste. Ainsi que l'injection de pilotes et l'automatisation des installations via des fichiers de réponses.

#### 1. **WDS (Windows Deployment Services)**

- **Rôle** : Permet de stocker et de diffuser des images systèmes Windows (fichiers `.wim`) via le réseau. C'est l'évolution des anciens services RIS.
- **Images** : Le service repose sur deux types d'images principales :
  - **Image de démarrage (Boot Image)** : C'est l'environnement Windows PE (`boot.wim`) qui se charge en premier via le réseau pour lancer l'assistant d'installation.
  - **Image d'installation (Install Image)** : C'est l'image du système d'exploitation complet (`install.wim`) qui sera copiée sur le disque dur du client.
  - **Image de capture (Capture Image)** : C'est une image de démarrage spéciale. Elle sert à capturer l'état d'une machine de référence (préalablement préparée avec Sysprep) pour créer une nouvelle image d'installation ``.wim`` personnalisée (Master) qui pourra être redéployée ultérieurement (voir cours A413. VDI).

- **Fonctionnement via PXE** :
  - Le déploiement repose sur la norme **PXE (Preboot Execution Environment)**. Cette technologie permet à une station de travail de démarrer directement depuis sa carte réseau (avant même le chargement de l'OS local) pour récupérer une image système située sur un serveur.
  - **Prérequis** : Pour que cela fonctionne, l'environnement doit disposer d'un serveur **DNS** (résolution de noms), d'un serveur **DHCP** (attribution d'IP) et d'un domaine **Active Directory** (authentification).

- **Configuration DHCP pour le PXE** :
  - Si le DHCP n'est pas sur le même serveur que WDS (exemple : un routeur pfSense), des options spécifiques doivent être configurées pour guider le client PXE :
    - **Option 66 (Boot Server Host Name)** : L'adresse IP ou le nom du serveur WDS.
    - **Option 67 (Bootfile Name)** : Le chemin du fichier de démarrage (ex: `boot\x64\wdsnbp.com` pour BIOS ou `boot\x64\wdsmgfw.efi` pour UEFI).
  - **Option 60 (PXEClient)** : Cette option est nécessaire uniquement si le DHCP et le WDS cohabitent sur le **même serveur**, pour éviter les conflits car ils écoutent tous deux sur le port UDP 67.

- **Limitations et transition vers MDT** :
  - WDS seul montre ses limites, notamment avec Windows 11 (nouveaux formats `.esd`, prérequis TPM/Secure Boot). Microsoft recommande d'utiliser **MDT (Microsoft Deployment Toolkit)**.
  - **MDT** est un outil gratuit qui se superpose à WDS pour offrir des scénarios beaucoup plus riches : il permet d'injecter automatiquement des drivers, d'installer des logiciels post-déploiement, d'exécuter des scripts de personnalisation et de migrer des données utilisateur, ce que WDS ne fait pas nativement. Pour les très grandes structures, on passera sur **SCCM** (System Center).

#### 2. WDS : Gestion des Pilotes (Drivers)

Pour que l'installation de Windows fonctionne sur différents matériels, WDS permet de gérer et déployer des pilotes (ex: carte réseau, contrôleur de disque).

- **Groupes de Pilotes** : Permet d'organiser les pilotes logiquement. On peut appliquer des **Filtres** pour contrôler leur déploiement :
  - **Filtres Client** : Définissent **QUI** reçoit les pilotes (ex: *Manufacturer* = Dell, *Model* = Optiplex 7080).
  - **Filtres Fichier** : Définissent **QUOI** (quels fichiers du groupe) est installé (ex: uniquement les pilotes *Net* ou *Video*).

- **Injection dans l'Image de Démarrage (Boot Image)** :
  - **Indispensable** : Pour que l'installateur Windows (WinPE) puisse voir le disque dur ou accéder au réseau, les pilotes critiques (Stockage et Réseau) doivent être injectés directement dans l'image de boot (`boot.wim`).
  - **Cas de la Virtualisation (VirtIO)** : Sur des hyperviseurs comme Proxmox/KVM, il faut injecter les pilotes **VirtIO** :
    - **NetKVM** : Pour la carte réseau.
    - **viostor/vioScsi** : Pour le contrôleur de disque.
    - **Balloon** : Pour la gestion dynamique de la mémoire.
  - *Attention* : L'injection est une modification lourde de l'image `.wim`. En cas de mise à jour de pilote, il faut souvent reconstruire l'image.

#### 2. WDS : Automatisation (Unattend)

L'objectif est de réaliser une installation "zéro touche" (Zero Touch Installation) où l'administrateur n'a pas besoin de cliquer sur "Suivant" devant chaque poste.

- **Fichier de réponses (Unattend.xml)** :
  - C'est un fichier XML qui contient les réponses aux questions de l'installateur (Langue, Partitionnement du disque, Fuseau horaire, Mot de passe admin local, etc.).
  - Dans les propriétés du serveur WDS (onglet *Client*), on lie ce fichier XML aux architectures (x64/x86) pour qu'il soit chargé automatiquement.

- **Pré-staging (Approbation et Nommage)** :
  - Permet de sécuriser le WDS en demandant une approbation avant l'installation.
  - L'administrateur peut nommer la machine et définir dans quelle OU (Active Directory) elle sera créée avant même que l'installation ne commence.
  - **Droits de jointure** : On définit quel compte est utilisé pour joindre le domaine (souvent un compte de service ou administrateur) avec les droits complets pour créer l'objet ordinateur.

- **Avantage et Inconvénient** :
  - **Avantages** : Installation rapide d'OS natifs, standardisation du parc.
  - **Inconvénient** : Gère uniquement l'installation, pas la maintenance applicative post-install.

[Challenge A410](./challenges/Challenge_A410.md)

> 📚 **Ressources** :
>
> Convertir un fichier ESD en WIM <https://www.it-connect.fr/wds-convertir-un-fichier-esd-en-wim/>
>
> Serveurs WDS et DHCP : boot PXE BIOS et UEFI <https://www.it-connect.fr/serveurs-dhcp-wds-boot-pxe-bios-et-uefi/>
>
> Sur notre pfsense DHCP option 60 si UEFI et option 66 & 67 pour BIOS : "PXEClient" + Enable Network Booting avec l'addresse du server.
>
> Prise en charge de boot.wim <https://learn.microsoft.com/fr-fr/windows/deployment/wds-boot-support>
>
> WDS installation et configuration <https://rdr-it.com/wds-installation-et-configuration/>
>
> Déployer un Certificat <https://rdr-it.com/gpo-deployer-un-certificat/>
>
> Configurer le SSO <https://rdr-it.com/en/gpo-configure-sso-on-rds-connections/>

[Retour en haut](#-table-des-matières)

---

### 🖥️ A411. RDS (Remote Desktop Services)

> Ce cours introduit le rôle RDS (Services Bureau à Distance) pour la centralisation des environnements utilisateurs. Il couvre le déploiement rapide, la sécurisation via certificats et l'automatisation de la connexion via les GPO.

- **RDS (Remote Desktop Services)** :
  - Les Services Bureau à Distance permettent d'héberger des sessions utilisateurs sur un serveur centralisé (virtualisation de session).
  - **Fonctionnement** :
    - Le **Serveur Hôte** exécute les applications et le bureau.
    - Le **Client** (léger ou PC) se connecte via le protocole **RDP** (port 3389).
    - **mstsc.exe** : La commande qui lance l'application Connexion Bureau à distance (Remote Desktop Connection) sous Windows.
    - **Multi-session** : Plusieurs utilisateurs travaillent simultanément sur le même serveur, chacun dans sa bulle isolée.

- **Modes d'utilisation** :
  - **Bureau complet** : L'utilisateur accède à un bureau Windows distant classique.
  - **RemoteApp** : Seule la fenêtre de l'application est envoyée au client. L'application s'exécute sur le serveur mais semble tourner en local (intégration transparente).

- **Installation (Démarrage Rapide)** :
  - Via le Gestionnaire de serveur > "Installation des services Bureau à distance".
  - Choisir **"Démarrage rapide"** pour une installation sur un seul serveur (installe le Broker, l'Accès Web et l'Hôte de session en une seule opération).
  - Choisir "Déploiement de bureaux basés sur une session".

- **Gestion des Licences (RD Licensing)** :
  - Ce rôle est indispensable pour le déploiement en production. Il stocke et délivre les **CALs RDS** (licences d'accès client).
  - Lorsqu'un utilisateur se connecte, le serveur Hôte de session interroge le serveur de licences pour obtenir une CAL valide (distincte de la licence Windows Server de base). Sans ce rôle configuré, la période de grâce de 120 jours finira par bloquer les connexions.

- **Accès Web (RDWeb)** :
  - Permet aux utilisateurs d'accéder à leurs applications/bureaux via un navigateur (URL type : `https://serveur/RDWeb`).
  - **Sécurité (HTTPS)** : Nécessite impérativement un certificat SSL. En environnement de lab, on utilise souvent un certificat auto-signé qu'il faut lier au port 443 dans IIS.
  
- **Gestion des Certificats (MMC)** :
  - Pour que les clients acceptent la connexion sans erreur de sécurité, ils doivent faire confiance au certificat du serveur RDS.
  - **Export du certificat** : Sur le serveur, ouvrir la console `mmc.exe` > Ajouter un composant > Certificats > **Compte d'ordinateur** > Ordinateur Local. Exporter le certificat (sans la clé privée) pour le déployer ensuite.

- **Déploiement Automatisé via GPO** :
  - Une GPO permet de distribuer le certificat et de configurer automatiquement la connexion RemoteApp sur les postes clients.
  - **1. Distribution du Certificat (Confiance)** :
    - *Chemin* : Configuration Ordinateur > Stratégies > Paramètres Windows > Paramètres de sécurité > Stratégies de clé publique > **Autorités de certification racines de confiance**.
    - *Action* : Importer le certificat exporté précédemment.
  - **2. Configuration du flux RemoteApp** :
    - *Chemin* : Configuration Utilisateur > Stratégies > Modèles d'administration > Composants Windows > Services Bureau à distance > Connexions aux programmes RemoteApp et aux services Bureau à distance.
    - *Paramètre* : **Spécifier l'URL de connexion par défaut**.
    - *Valeur* : `https://ws2025.oclock.lan/rdweb/Feed/webfeed.aspx` (URL du flux RSS/Webfeed).

- **Avantages et Inconvénients** :
  - **Avantages** : Centralisation des données, maintenance simplifiée (1 seule installation d'app pour 50 utilisateurs), accès à distance sécurisé.
  - **Inconvénients** : **SPOF** (Single Point of Failure) - si le serveur RDS plante, tous les utilisateurs sont bloqués. Nécessite une infrastructure serveur robuste (RAM/CPU).

[Challenge A411](./challenges/Challenge_A411.md)

> 📚 **Ressources** :
>
> RDS overwiew <https://learn.microsoft.com/fr-fr/windows-server/remote/remote-desktop-services/overview>
>
> RDS déploiement <https://www.it-connect.fr/deploiement-rapide-dun-serveur-rds-avec-windows-server-2016/>

[Retour en haut](#-table-des-matières)

---

### ☁️ A412. VDI & Hyper-V

> Ce cours introduit la base de la VDI (Virtual Desktop Infrastructure) : l'hyperviseur. Sur Windows Server, le rôle **Hyper-V** permet de créer et gérer des machines virtuelles qui serviront de modèles ("Masters") pour les bureaux virtuels.

- **Installation du rôle Hyper-V** :
  - S'installe via "Ajouter des rôles et fonctionnalités" > **Hyper-V**.
  - **Configuration** :
    - **Ethernet** : Il est conseillé de ne pas cocher la carte réseau durant l'installation (pour configurer le switch virtuel manuellement plus tard).
    - **Migration** : Laisser par défaut (CredSSP).
    - **Emplacement** : Changer le chemin par défaut pour stocker les VM dans un dossier dédié (ex: `C:\VM`) pour une meilleure organisation.
  - **Redémarrage** : Obligatoire pour charger l'hyperviseur au niveau noyau.

- **Gestion du Réseau : Commutateurs Virtuels (vSwitch)** :
  - Une fois installé, on configure le réseau via le **Gestionnaire Hyper-V** > **Gestionnaire de commutateur virtuel**.
  - Il existe 3 types de commutateurs :
    1. **Externe (Bridge)** : La VM est connectée directement au réseau physique (comme si elle était branchée au switch réel). Elle obtient une IP du DHCP du réseau LAN.
    2. **Interne (NAT)** : La VM communique uniquement avec l'hôte physique et les autres VM. (Souvent utilisé avec du NAT).
    3. **Privé (Local Only)** : La VM communique uniquement avec les autres VM sur le même vSwitch. Isolation totale de l'hôte physique.
  - *Note* : La création d'un vSwitch externe crée une interface réseau virtuelle visible dans `ncpa.cpl`.

- **Création d'une VM "Master"** :
  - L'objectif est de créer une VM modèle (Master) propre, qui servira de base pour le déploiement de masse.
  - **Installation de l'OS** : On configure la VM pour démarrer via le réseau ("Installer à partir d'un serveur d'installation réseau") afin de récupérer l'image Windows via **WDS**.

- **Générations de VM : Gen 1 vs Gen 2** :
  - C'est un choix crucial à la création de la VM.
  - **Génération 1 (Gen 1)** :
    - Simule un matériel ancien.
    - **BIOS** classique (Legacy).
    - Disque IDE / Partition **MBR**.
    - Compatible avec les vieux OS (Windows 7, vieux Linux).
  - **Génération 2 (Gen 2)** :
    - Standard moderne (recommandé).
    - **UEFI**.
    - Disque SCSI / Partition **GPT**.
    - Supporte le **Secure Boot** (Démarrage sécurisé). *Attention : il faut parfois désactiver le Secure Boot pour certaines distributions Linux.*

[Challenge A412](./challenges/Challenge_A412.md)

> 📚 **Ressources** :
>
> Types d'Hyperviseurs <https://www.it-connect.fr/les-types-dhyperviseurs/>
>
> Installer Hyper-V sur Windows <https://www.it-connect.fr/installer-hyper-v-sur-windows-10-et-creer-sa-premiere-vm/>
>
> Créer une VM avec Hyper-V <https://learn.microsoft.com/fr-fr/windows-server/virtualization/hyper-v/get-started/create-a-virtual-machine-in-hyper-v?tabs=hyper-v-manager>

[Retour en haut](#-table-des-matières)

---

### 🏭 A413. Déploiement VDI & Sysprep

> Ce cours finalise la mise en place de la VDI (Virtual Desktop Infrastructure). L'objectif est de transformer une machine virtuelle Windows 10 "Master" en un modèle déployable massivement via les services RDS, offrant ainsi à chaque utilisateur son propre PC virtuel.

#### 1. Préparation du Master (Windows 10)

Avant de dupliquer une VM, il faut la "nettoyer" pour qu'elle soit neutre.

- **Nettoyage des comptes** :
  - On active le compte **Administrateur** intégré (via `lusrmgr.msc` ou Gestion de l'ordinateur).
  - On se connecte avec ce compte Admin.
  - On **supprime** le compte utilisateur initial (celui créé lors de l'installation) et son profil. *But : Avoir une image sans fichiers utilisateurs parasites.*

- **Sysprep (System Preparation Tool)** :
  - C'est l'outil indispensable pour l'autonomie matérielle et la duplication. Il se trouve dans `C:\Windows\System32\Sysprep\sysprep.exe`.
  - **Modes d'utilisation** :
    - **Mode Audit** : Permet de démarrer en mode administrateur spécial pour installer des logiciels, des drivers ou faire des mises à jour *avant* de sceller l'image.
    - **Mode OOBE (Out-Of-Box Experience)** : C'est le mode final. Au prochain démarrage, la machine lancera l'assistant de configuration (choix de la langue, clavier, création utilisateur...), comme un PC neuf sortant du carton.
  - **L'option "Généraliser" (Generalize)** : **Cruciale**. Elle supprime les informations spécifiques au matériel et surtout le **SID** (Security Identifier) unique de la machine. Si on ne généralise pas, on ne peut pas déployer l'image dans un domaine Active Directory (conflit d'identifiants).
  - **Action** : Pour le VDI, on choisit **OOBE** + Cocher **Généraliser** + Option d'extinction **Arrêter**.

#### 2. Déploiement VDI (Processus RDS)

Une fois le Master éteint (Syspreppé), le serveur RDS prend le relais pour créer la "Collection" de bureaux virtuels.

- **Rôle nécessaire** : Contrairement au RDS classique (Session), le VDI nécessite le rôle **Hôte de virtualisation des services Bureau à distance** (RD Virtualization Host) installé sur le serveur physique Hyper-V.
- **Processus d'installation (Théorique)** :
    1. Dans le Gestionnaire de serveur > Services Bureau à distance.
    2. Lancer l'assistant "Créer une collection de bureaux virtuels".
    3. **Type** : "Pooled" (Bureaux partagés, non persistants) ou "Personal" (Bureaux persistants, l'utilisateur garde ses modifs).
    4. **Source** : On sélectionne le fichier disque dur du Master (`C:\VM\Win10-MASTER.vhdx`).
    5. **Déploiement** : Le serveur va copier ce disque, et créer X machines virtuelles basées dessus.

- **Résultat** : Dans le portail web RDS (`/RDWeb`), l'utilisateur voit une icône "Windows 10 VDI". Quand il clique, le serveur allume une des VM disponibles et le connecte dessus.

#### Bonus : Optimisation Disque (Proxmox / QCOW2)

En bonus, voici la méthode pour réduire la taille d'un disque virtuel `qcow2` sur Proxmox (Linux). Les disques virtuels ont tendance à grossir même si on supprime des fichiers dedans. Cette manip permet de récupérer l'espace vide (sparsify).

- **Condition** : La VM doit impérativement être **éteinte**.
- **Procédure (Shell Proxmox)** :
    1. Passer en root :
        `sudo su -`
    2. Aller dans le dossier de stockage des images (adapter l'ID `9000` à votre VM) :
        `cd /var/lib/vz/images/9000`
    3. Vérifier la taille actuelle :
        `ls -lh`
    4. **Convertir et compresser** (Création d'une copie optimisée `newdisk`) :
        `qemu-img convert -f qcow2 -O qcow2 -o preallocation=off vm-9000-disk-1.qcow2 newdisk.qcow2`
        *(Cette commande réécrit le disque en ignorant les blocs vides).*
    5. Supprimer l'ancien disque (Attention, irréversible) :
        `rm vm-9000-disk-1.qcow2`
    6. Renommer le nouveau disque pour qu'il prenne la place de l'ancien :
        `mv newdisk.qcow2 vm-9000-disk-1.qcow2`

> 📚 **Ressources** :
>
> Erreurs sysrep : <https://neptunet.fr/error-sysprep/>
>
> Install & config VDI <https://rdr-it.com/vdi-installer-configurer-windows-serveur/>

[Retour en haut](#-table-des-matières)

---

### ☁️ A414. Microsoft Azure

> Ce cours introduit le Cloud Computing, une évolution majeure de l'informatique où les ressources (calcul, stockage, réseau) sont fournies à la demande via Internet. Il se concentre sur la pratique avec **Microsoft Azure**, de la théorie des modèles de service (XaaS) au déploiement concret de machines virtuelles.

- **Concepts Fondamentaux du Cloud** :

  - **Définition** : Mise à disposition de ressources informatiques via Internet avec une facturation à l'usage (Pay-as-you-go). On passe d'une dépense d'investissement (CapEx - acheter des serveurs) à une dépense de fonctionnement (OpEx - louer des services).
  - **Principaux Fournisseurs** : **AWS** (Amazon Web Services), **Azure** (Microsoft), **GCP** (Google Cloud Platform).

- **Modèles de Service (XaaS)** :

  - **IaaS (Infrastructure as a Service)** : Le fournisseur gère le matériel (datacenter, réseau physique, hyperviseur). Vous gérez tout à partir de l'OS (VM, middleware, data, apps).
    - *Exemple : Azure VM, Amazon EC2.*
  - **PaaS (Platform as a Service)** : Le fournisseur gère l'OS et le runtime. Vous ne gérez que vos applications et vos données. Idéal pour les développeurs.
    - *Exemple : Azure App Service, Google App Engine.*
  - **SaaS (Software as a Service)** : Le fournisseur gère tout. Vous utilisez simplement le logiciel.
    - *Exemple : Microsoft 365, Gmail, Salesforce.*
  - **FaaS (Function as a Service)** : "Serverless". Vous déployez uniquement des bouts de code (fonctions) qui s'exécutent sur événement.
    - *Exemple : Azure Functions, AWS Lambda.*

- **Déploiement d'une VM sous Azure (IaaS)** :
    La création d'une machine virtuelle nécessite de configurer plusieurs composants interdépendants :

  - **Image** : Le système d'exploitation de base (ex: Ubuntu 22.04, Windows Server 2022) ou une image Marketplace (ex: WordPress pré-installé).
  - **Taille (Size) & Coût** : Définit la puissance (vCPU, RAM). Le prix est affiché par mois mais facturé à la seconde/heure.
  - **Disques** :
    - *OS Disk* : Contient le système.
    - *Data Disk* : Pour les données (optionnel).
    - *Types* : HDD Standard (lent/pas cher), SSD Standard, SSD Premium (performant/cher).
  - **Réseau Virtuel (VNet)** : Le réseau logique dans le cloud. Il est segmenté en **Subnets** (sous-réseaux).
  - **Interface Réseau (NIC)** : Carte virtuelle connectée au VNet. Elle peut avoir une **IP Publique** (pour l'accès Internet) et une **IP Privée** (pour le LAN Azure).
  - **Sécurité (NSG - Network Security Group)** : C'est le pare-feu de la VM. Il contient des règles entrantes/sortantes (Inbound/Outbound rules).
    - *Indispensable* : Ouvrir le port **22** (SSH) pour Linux ou **3389** (RDP) pour Windows, et **80/443** pour un serveur Web.

> 📚 **Ressources** :
>
> Qu'est-ce que le Cloud <https://www.cloudflare.com/fr-fr/learning/cloud/what-is-the-cloud/>
>
> IaaS Paas Saas <https://www.redhat.com/fr/topics/cloud-computing/iaas-vs-paas-vs-saas>
>
> Microsoft Azure : <https://portal.azure.com/>
>
> Microsoft Azure pour Etudiants <https://azure.microsoft.com/fr-fr/free/students>
>
> Calculatrice Azure (Pour estimer les coûts avant déploiement) <https://azure.microsoft.com/fr-ca/pricing/calculator/>

[Retour en haut](#-table-des-matières)

---

### 💠 Fin Saison A4. Windows Server

[QCM Saison A4](https://forms.gle/ttL2fUrjdREAjsLh7)

![Résultat QCM](/images/2025-12-09-09-51-18.png)

[Retour en haut](#-table-des-matières)

---

## **🐧 Saison A5. Linux**

> Cette saison introduit l'environnement **GNU/Linux**, système d'exploitation incontournable pour les serveurs, le Cloud et la sécurité. Elle se concentre sur la compréhension de son architecture, de son histoire, et sur la maîtrise fondamentale de l'administration système via l'interface en ligne de commande.

### 🖥️ A501. Introduction à GNU/Linux

> Ce cours pose les bases de l'environnement Linux, de ses origines historiques (Unix, GNU) à son architecture actuelle (distributions, système de fichiers), en passant par la philosophie du logiciel libre.

- **Un peu d'Histoire : De Multics à Linux**
  - **Multics (1964)** : Projet ambitieux (MIT, Bell Labs, GE) visant à créer un système en "temps partagé". Trop complexe et coûteux, il fut abandonné par les Bell Labs, mais a inspiré la suite.
  - **Unix (1969)** : Créé par Ken Thompson et Dennis Ritchie (inventeur du langage C) sur un PDP-7. Philosophie KISS (*Keep It Simple, Stupid*) : faire une seule chose, mais la faire bien. Il devient portable grâce à sa réécriture en C.
  - **BSD (1977)** : La *Berkeley Software Distribution* est une branche universitaire d'Unix, améliorée par Bill Joy (créateur de l'éditeur `vi`). Elle a donné naissance aux systèmes modernes comme FreeBSD ou macOS.
  - **GNU (1983)** : Richard Stallman lance le projet GNU (*GNU's Not Unix*) avec pour but de créer un système d'exploitation entièrement libre. Il crée les outils essentiels (compilateur GCC, éditeur Emacs, shell Bash) et la licence **GPL**, mais il manque le cœur du système : le noyau.
  - **Minix (1987)** : Système éducatif créé par Andrew Tanenbaum. C'est en l'utilisant que Linus Torvalds décidera de créer son propre noyau.
  - **Linux (1991)** : Linus Torvalds développe un noyau (kernel) monolithique. En le combinant avec les outils du projet GNU, le système d'exploitation complet **GNU/Linux** est né.

- **Les Distributions Linux**
  - **Définition** : Linux est un noyau, pas un OS complet. Une distribution est un assemblage comprenant le noyau Linux, les outils GNU, un gestionnaire de paquets et souvent un environnement graphique.
  - **Grandes Familles** : Elles se distinguent principalement par leur gestionnaire de paquets :
    - **Debian** (et ses dérivés Ubuntu, Kali, Mint) : Utilise le format `.deb` et le gestionnaire `apt`. Très populaire et stable.
    - **Red Hat** (RHEL, Fedora, CentOS/Alma) : Utilise le format `.rpm` et le gestionnaire `dnf`/`yum`. Standard dans le monde de l'entreprise.
    - **Slackware** : La plus ancienne encore active, philosophie minimaliste.
    - **Arch Linux** : Modèle "Rolling release" (mise à jour continue), utilise `pacman`. Pour utilisateurs avancés.
    - **Android** : Utilise le noyau Linux mais pas les outils GNU (remplacés par des bibliothèques Java/Google).

- **Notions de Base**
  - **CLI (Ligne de Commande)** : Interface privilégiée sous Linux pour sa puissance et sa rapidité d'administration. Le **Shell** (souvent Bash) interprète les commandes saisies dans le terminal.
  - **Le Prompt** : Invite de commande indiquant qui on est (`user`), où on est (machine/dossier) et le niveau de privilège (`$` pour utilisateur, `#` pour root).
  - **Système de Fichiers** :
    - **Arborescence unique** : Tout commence à la racine `/`. Il n'y a pas de lettres de lecteur (C:, D:) comme sous Windows.
    - **Tout est fichier** : Documents, dossiers, mais aussi matériel (disque dur, souris), processus... tout est représenté sous forme de fichier.
    - **Sensible à la casse** : `Fichier.txt` et `fichier.txt` sont deux fichiers différents.
  - **Dossiers Clés** :
    - `/home` : Dossiers personnels des utilisateurs.
    - `/root` : Dossier personnel de l'administrateur.
    - `/etc` : Fichiers de configuration du système.
    - `/bin` & `/usr/bin` : Exécutables (programmes) essentiels.
    - `/var` : Données variables (logs, sites web, bases de données).
    - `/tmp` : Fichiers temporaires (vidé à chaque redémarrage).

- **Commandes Linux essentielles**

  - `sudo` : **S**uper **U**ser **DO**, permet d'exécuter une commande avec les droits d'administrateur (root).
  - `apt` : **A**dvanced **P**ackaging **T**ool, outil pour gérer les paquets (logiciels) : rechercher, mettre à jour, installer ou supprimer (ex: `sudo apt update`, `sudo apt upgrade`).
  - `ls` : **L**i**S**t, liste les fichiers et dossiers présents dans le répertoire courant.
  - `cd` : **C**hange **D**irectory, permet de changer de répertoire.
  - `pwd` : **P**rint **W**orking **D**irectory, affiche le chemin absolu du dossier dans lequel vous vous trouvez.
  - `man` : **MAN**ual, affiche la documentation d'une commande (ex: `man ls` pour voir les options de liste).
  - `mkdir` : **M**a**K**e **DIR**ectory, pour créer un dossier.
  - `touch` : Permet de créer un fichier vide.
  - `rm` : **R**e**M**ove, pour supprimer un ou plusieurs fichiers.
  - `mv` : **M**o**V**e, pour déplacer ou renommer des fichiers/dossiers.
  - `cat` : Affiche le contenu d'un fichier dans la sortie standard (le terminal).
  
[Challenge A501](./challenges/Challenge_A501.md)

> 📚 **Ressources** :
>
> Temps partagé <https://fr.wikipedia.org/wiki/Temps_partag%C3%A9>
>
> Multitâche Préemptif <https://fr.wikipedia.org/wiki/Multit%C3%A2che_pr%C3%A9emptif>
>
> Minix <https://fr.wikipedia.org/wiki/Minix>
>
> Noyau OS <https://fr.wikipedia.org/wiki/Noyau_de_syst%C3%A8me_d%27exploitation>
>
> Liste des distributions Linux <https://upload.wikimedia.org/wikipedia/commons/9/96/Liste_des_distributions_Linux.svg>
>
> Cheatsheet Linux cmd  [cheatsheetlinux](./ressources/Linux-Commands-Cheatsheet-FR.pdf)
>
> Jeu Terminus <https://luffah.xyz/bidules/Terminus/>

![Linus original mail](/images/2025-12-10-10-57-25.png)

[Retour en haut](#-table-des-matières)

---

### 🧱 A502. Composants d'un système GNU/Linux

> Ce cours détaille l'anatomie d'un système Linux en passant en revue les différentes briques logicielles qui, assemblées autour du noyau, forment un système d'exploitation complet et fonctionnel.
>
> - Chargeur d'amorçage
> - Init : Gestionnaire de services
> - Drivers : Pilotes de périphériques
> - Shell
> - Gestionnaire de paquets
> - Éditeur de texte
> - Serveur graphique
> - Gestionnaire d'affichage
> - Gestionnaire de fenêtres
> - Environnement de bureau
> - Bibliothèques d'interface graphique
> - Explorateur de fichiers
> - Outil de configuration réseau
> - Serveur & sous-système audio

---

#### 1. Les Fondations du Système (Bas niveau)

- **Le Chargeur d'amorçage (Bootloader)** :

  - **Rôle** : C'est le tout premier logiciel lancé au démarrage de la machine (par le BIOS ou l'UEFI). Il permet de choisir sur quel système d'exploitation démarrer (si vous avez un dual-boot Windows/Linux) et charge le noyau en mémoire.
  - *Exemple célèbre :* **GRUB** (GRand Unified Bootloader).

- **Le Système d'Init (Gestionnaire de services)** :

  - **Rôle** : Une fois le noyau chargé, `init` est le **premier programme** lancé (il porte le PID 1). Il est le "père" de tous les autres processus. Il est chargé de démarrer les services (réseau, son, cron, etc.).
  - *Standard actuel :* **systemd**. Bien que controversé pour sa complexité, il est aujourd'hui le standard sur la majorité des distributions. Il se gère avec la commande `systemctl`.

- **Pilotes de Périphériques (Drivers)** :

  - **Rôle** : Permettent au système de communiquer avec le matériel. Sous Linux, ils sont généralement intégrés directement au noyau sous forme de **modules** chargés dynamiquement.

#### 2. Les Outils d'Administration

- **Le Shell (Interpréteur de commandes)** :

  - **Rôle** : C'est l'interface textuelle qui permet de dialoguer avec le système. Il interprète vos commandes et lance les programmes.
  - *Les stars :*
    - **Bash** : Le standard historique, présent presque partout.
    - **Zsh** : Très populaire et moderne (par défaut sur macOS), souvent utilisé avec des plugins pour l'autocomplétion.

- **Le Gestionnaire de Paquets** :

  - **Rôle** : Il automatise l'installation, la mise à jour et la suppression des logiciels. Contrairement à Windows où l'on télécharge des `.exe` manuellement, ici on demande au gestionnaire de récupérer le logiciel et toutes ses **dépendances** (les bibliothèques nécessaires) depuis un dépôt sécurisé.
  - *Exemples :* **apt** (Debian/Ubuntu), **dnf/rpm** (Red Hat), **pacman** (Arch).

- **Éditeur de texte** :

  - **Rôle** : Indispensable pour modifier les fichiers de configuration.
  - *Les incontournables :* **Nano** (simple pour débuter), **Vim** (puissant mais nécessite un apprentissage), **Emacs**.

---

#### 3. L'Interface Graphique (La couche visible)

C'est là que Linux diffère le plus de Windows/macOS, car l'interface graphique est une "pile" de plusieurs logiciels distincts :

- **Serveur Graphique** :

  - C'est la fondation qui permet de dessiner des fenêtres et de gérer la souris/clavier. C’est un composant technique, invisible pour l’utilisateur.
  - **X11 (X.Org)** : Le standard historique (depuis 1987), robuste mais vieillissant.
  - **Wayland** : Le remplaçant moderne, plus sécurisé et performant, mais qui nécessite que les applications soient adaptées.

- **Gestionnaire d'Affichage (Display Manager)** :

  - C'est simplement votre **écran de connexion** (Login screen). Il lance le serveur graphique et vous demande votre mot de passe.

- **Gestionnaire de Fenêtres (Window Manager - WM)** :

  - Il s'occupe uniquement de "décorer" et placer les fenêtres (bordures, réduction, déplacement). Il peut être utilisé seul (pour les configurations minimalistes comme *i3* ou *Openbox*).

- **Environnement de Bureau (Desktop Environment - DE)** :

  - C'est une suite complète qui inclut un Gestionnaire de Fenêtres + un Explorateur de fichiers + des applications (calculatrice, paramètres, terminal) + une barre des tâches. C'est ce qui donne l'apparence globale (le "look & feel").
  - *Exemples :*
    - **GNOME** : Moderne, épuré (utilisé par Ubuntu, Fedora).
    - **KDE Plasma** : Très personnalisable, ressemble un peu à Windows.
    - **XFCE** : Léger et performant pour les vieux PC.

- **Bibliothèques Graphiques** :

  - Ce sont les "boîtes à outils" utilisées par les développeurs pour créer les boutons et menus. **GTK** est utilisé par GNOME, **Qt** est utilisé par KDE.

---

#### 4. Les Outils Complémentaires

- **Bibliothèques d'interface graphique** :
  - **Rôle** : Ce sont des ensembles de code (librairies) qui fournissent aux développeurs les "briques visuelles" prêtes à l'emploi (boutons, menus, fenêtres) pour créer des logiciels.
  - *Les principales :* **GTK** (utilisée par les environnements GNOME, XFCE, Mate) et **Qt** (utilisée par KDE Plasma, LXQt).

- **Explorateur de fichiers** :
  - **Rôle** : L'équivalent de l'Explorateur Windows ou du Finder macOS, il permet de naviguer graphiquement dans l'arborescence.
  - *Exemples Graphiques (GUI) :* **Nautilus** (Gnome), **Dolphin** (KDE), **Thunar** (léger, souvent avec XFCE).
  - *Exemples Ligne de commande (CLI) :* **Ranger** ou **Midnight Commander** (pour naviguer efficacement dans les dossiers sans souris).

- **Outil de configuration réseau** :
  - **Rôle** : Permet de gérer les interfaces réseau (IP statique, DHCP, DNS). La méthode varie beaucoup selon la distribution.
  - *Exemple :* **Netplan** est l'outil standard utilisé sur Ubuntu pour configurer le réseau via des fichiers YAML.

- **Serveur & sous-système audio** :
  - **Rôle** : C'est la couche logicielle qui gère la carte son et permet à plusieurs applications de jouer du son en même temps (mixage).
  - *Contexte :* Bien que le support soit bref à ce sujet, on retient souvent **PulseAudio** (créé par le même auteur que systemd) ou plus récemment **PipeWire** comme standards actuels.

[Challenge A502](./challenges/Challenge_A502.md)

> 📚 **Ressources** :
>
> Shebang <https://fr.wikipedia.org/wiki/Shebang>
>
> Ajouter chemin au Path <https://www.malekal.com/ajouter-chemin-path-linux/>
>
> Bootloaders <https://wiki.archlinux.org/title/Arch_boot_process#Feature_comparison>
>
> X window System <https://fr.wikipedia.org/wiki/X_Window_System>
>
> Le Display manager <https://wiki.archlinux.org/title/Display_manager>
>
> Métaphore du Bureau <https://fr.wikipedia.org/wiki/Environnement_de_bureau#M%C3%A9taphore_du_bureau>
>
> Qt <https://www.d-booker.fr/content/43-qt-une-bibliotheque-dediee-au-developement-multiplate-forme>
>
> Netplan <https://doc.ubuntu-fr.org/netplan>
>
> Son <https://doc.ubuntu-fr.org/utilisateurs/darkjam/son>
>
> Learn VIM via Game <https://vim-adventures.com/> ou `vimtutor`

[Retour en haut](#-table-des-matières)

---

### 🔐 A503. Utilisateurs, Groupes, Permissions & Sudo

> Ce cours aborde la gestion des comptes utilisateurs, l'organisation en groupes, et la sécurité du système de fichiers via les permissions. Il détaille également l'utilisation de `sudo` pour l'élévation de privilèges.

#### Gestion des Utilisateurs

Les utilisateurs sont identifiés par un **UID** (User ID) et un **GID** (Group ID) principal.

- **Fichiers de configuration** :

  - `/etc/passwd` : Liste les comptes utilisateurs.
    - *Format* : `user:x:UID:GID:Commentaire:/home/user:/bin/bash`.
  - `/etc/shadow` : Stocke les mots de passe chiffrés et les règles d'expiration (accessible uniquement par root).

- **Commandes principales** :

  - **Créer** : `useradd`
    - `sudo useradd -m -s /bin/bash -c "Jean Dupont" jean`.
    - `-m` : Crée le dossier personnel (`/home/user`).
    - `-s` : Définit le shell par défaut (ex: `/bin/bash`).
    - `-c` : Ajoute un commentaire (Nom complet, GECOS).
    - `-u` / `-g` : Imposer un UID ou un GID spécifique.
  - **Modifier** : `usermod`
    - `sudo usermod -s /bin/zsh jean` : Change le shell.
    - `sudo usermod -l nouveau_nom ancien_nom` : Renomme le compte.
    - `sudo usermod -L jean` / `-U jean` : Verrouille / Déverrouille le compte.
    - `sudo usermod -d /home/new -m jean` : Change le dossier home et déplace les fichiers existants.
  - **Supprimer** : `userdel`
    - `sudo userdel -r jean` : Supprime l'utilisateur **et** son dossier personnel (`-r`).
  - **Mot de passe** : `passwd jean` pour définir/changer le mot de passe.

---

#### Gestion des Groupes

Les groupes permettent de rassembler des utilisateurs pour simplifier la gestion des droits. Un utilisateur a un groupe primaire et peut avoir plusieurs groupes secondaires.

- **Fichier de configuration** :

  - `/etc/group` : Liste les groupes et leurs membres secondaires.

- **Commandes principales** :

  - **Créer** : `groupadd`
    - `sudo groupadd reseau`.
    - `-g` : Imposer un GID spécifique.
  - **Supprimer** : `groupdel nom_groupe`.
  - **Gérer les membres** :
    - `sudo usermod -aG sudo,reseau jean` : Ajoute (`-a`) l'utilisateur aux groupes secondaires (`-G`) spécifiés.
    - `sudo gpasswd --delete jean reseau` : Retire un utilisateur d'un groupe.
    - `sudo usermod -g devops jean` : Change le groupe **primaire** de l'utilisateur.
    - `groups jean` : Affiche dans quel groupes est l'utilisateur jean.

---

#### Permissions et Propriétaires

Chaque fichier/dossier appartient à un **Propriétaire (u)** et un **Groupe propriétaire (g)**. Les permissions sont définies pour eux et pour les **Autres (o)**.

- **Visualiser** : `ls -l` affiche les permissions (ex: `-rw-r--r--`).

  - 1er caractère : Type (`-` fichier, `d` dossier, `l` lien).
  - Suivants : 3 blocs de droits `rwx` (User, Group, Others).

- **Signification des droits** :

  - `r` (Read) : Lire le fichier / Lister le dossier.
  - `w` (Write) : Modifier le fichier / Créer ou supprimer dans le dossier.
  - `x` (Execute) : Exécuter le fichier (script/programme) / Traverser le dossier (indispensable pour y accéder).

- **Changer le propriétaire** : `chown` (Change Owner)

  - `sudo chown user:group fichier` : Change le propriétaire et le groupe.
  - `sudo chown -R user:group dossier/` : Applique récursivement au dossier et son contenu (`-R`).

- **Changer les permissions** : `chmod` (Change Mode)

  - **Méthode Symbolique** (`u/g/o` + `+/-/=` + `r/w/x`) :
    - `chmod u+x script.sh` : Ajoute l'exécution pour le propriétaire.
    - `chmod o-w file` : Retire l'écriture aux autres.
  - **Méthode Octale** (r=4, w=2, x=1) :
    - `7` (4+2+1) : `rwx` (Lecture, écriture, exécution).
    - `6` (4+2) : `rw-` (Lecture, écriture).
    - `5` (4+1) : `r-x` (Lecture, exécution).
    - `chmod 644 fichier` : rw- (proprio), r-- (groupe), r-- (autres).
    - `chmod 755 dossier` : rwx (proprio), r-x (groupe), r-x (autres).

      ![octal](/images/2025-12-12-14-38-23.png)

---

#### Sudo (SuperUser DO)

`sudo` permet à un utilisateur autorisé d'exécuter des commandes en tant qu'administrateur (root) ou un autre utilisateur, sans se connecter directement en root.

- **Configuration** :

  - Fichier principal : `/etc/sudoers`.
  - Dossier pour ajouts : `/etc/sudoers.d/`.
  - **Outil obligatoire** : Toujours utiliser `sudo visudo` pour éditer la configuration (vérifie la syntaxe avant d'enregistrer pour éviter de casser le système).

- **Syntaxe d'une règle sudo** :
    `QUI OÙ=(EN_TANT_QUE) QUOI`

  - Exemple : `%sudo ALL=(ALL:ALL) ALL` (Le groupe sudo peut tout faire, partout, en tant que n'importe qui).
  - Exemple ciblé : `jean ALL=(root) /usr/bin/systemctl restart nginx` (Jean peut seulement redémarrer Nginx en tant que root).

- **Commandes utiles** :

  - `sudo -l` : Liste les droits sudo de l'utilisateur courant.
  - `sudo -i` ou `sudo -s` : Ouvre un shell root interactif (à éviter pour des tâches ponctuelles).

[Challenge A503](./challenges/Challenge_A503.md)

> 📚 **Ressources** :
>
> Gestion des groupes sous Linux <https://www.it-connect.fr/la-gestion-des-groupes-sous-linux/>

[Retour en haut](#-table-des-matières)

---

### 📦 A504. Gestion des Paquets, Compilation & Logs

> Ce cours couvre la gestion du cycle de vie des logiciels sous Linux (installation via paquets ou compilation) ainsi que la surveillance du système (logs et ressources matérielles).

#### 1. Gestion des Paquets

Un gestionnaire de paquets automatise l'installation, la mise à jour et la suppression de logiciels. Il gère les **dépendances** (bibliothèques nécessaires au fonctionnement d'un programme) et vérifie l'intégrité des fichiers via des dépôts officiels.

Il existe toujours une distinction entre l'outil **bas niveau** (gère le fichier paquet local) et l'outil **haut niveau** (gère les dépôts et les dépendances).

##### A. Debian / Ubuntu (et dérivés)

- **Outils** : `dpkg` (bas niveau) et **`apt`** (haut niveau).
- **Fichiers de config** : `/etc/apt/sources.list`.

| Action | Commande `apt` (Recommandé) |
| :--- | :--- |
| Rafraîchir la liste des dépôts | `sudo apt update` |
| Mettre à jour les paquets | `sudo apt upgrade` |
| Installer un paquet | `sudo apt install <nom>` |
| Désinstaller un paquet | `sudo apt remove <nom>` |
| Rechercher un paquet | `sudo apt search <nom>` |
| Installer un fichier `.deb` local | `sudo dpkg -i fichier.deb` |

##### B. Arch Linux / Manjaro

- **Outil** : **`pacman`** (gère tout : synchro, install, cache).
- **Fichiers de config** : `/etc/pacman.conf`.

| Action | Commande `pacman` |
| :--- | :--- |
| Mettre à jour tout le système | `sudo pacman -Syu` |
| Installer un paquet | `sudo pacman -S <nom>` |
| Rechercher un paquet | `sudo pacman -Ss <nom>` |
| Désinstaller (+ dépendances inutiles) | `sudo pacman -Rns <nom>` |

##### C. Red Hat / Fedora / CentOS

- **Outils** : `rpm` (bas niveau) et **`dnf`** (haut niveau, remplace yum).
- **Fichiers de config** : `/etc/yum.repos.d/`.

| Action | Commande `dnf` |
| :--- | :--- |
| Vérifier les mises à jour | `sudo dnf check-update` |
| Mettre à jour le système | `sudo dnf upgrade` |
| Installer un paquet | `sudo dnf install <nom>` |
| Installer un fichier `.rpm` local | `sudo rpm -ivh fichier.rpm` |

---

#### 2. Compiler un programme (Depuis les sources)

Parfois nécessaire pour avoir une version très récente, activer des options spécifiques ou être sûr que le programme n'a pas été altéré.

- **Prérequis** : Il faut les outils de développement (compilateur `gcc`, `make`, etc.).
  - Debian/Ubuntu : `sudo apt install build-essential`.
  - RHEL : `sudo dnf groupinstall "Development Tools"`.

**Workflow classique (La trinité de la compilation) :**

1. **Extraction** : `tar xf logiciel.tar.gz` puis `cd logiciel`.
2. **Configuration** : `./configure` (Vérifie les prérequis et prépare la compilation. On peut ajouter `--prefix=/usr/local` pour choisir le dossier d'install).
3. **Compilation** : `make` (Transforme le code source en binaire. Option `-j$(nproc)` pour aller plus vite).
4. **Installation** : `sudo make install` (Copie les binaires dans le système).

---

#### 3. Journaux du Système (Logs)

Les logs sont essentiels pour le dépannage. Ils sont soit centralisés par **systemd** (binaire), soit stockés dans des fichiers texte.

##### A. Fichiers logs classiques (`/var/log/`)

On les lit avec `cat`, `less` ou `tail`.

- `/var/log/syslog` ou `/var/log/messages` : Logs généraux.
- `/var/log/auth.log` : Logs d'authentification (sudo, ssh, login).
- `/var/log/dmesg` : Messages du noyau au démarrage.

##### B. Journald (systemd)

Commande unique : **`journalctl`**.

- `journalctl -f` : Suivre les logs en direct (équivalent à tail -f).
- `journalctl -xe` : Voir les dernières erreurs détaillées.
- `journalctl -u ssh` : Voir les logs d'un service précis (ici ssh).
- `journalctl -k` : Messages du noyau (kernel).
- `journalctl --since "10 min ago"` : Logs des 10 dernières minutes.

---

#### 4. Périphériques, Hardware & Surveillance

Pour surveiller les ressources et identifier le matériel.

##### Surveillance des ressources

- **CPU / RAM** : `top` ou `htop` (vue temps réel).
- **Mémoire** : `free -h` (affiche la RAM libre/utilisée).
- **Disques** :
  - `df -h` : Affiche l'espace disque occupé/libre (**-h** = human readable, lisible par l'homme en Go/Mo).
  - `lsblk` : Affiche l'arborescence des partitions.

##### Identification Matériel

- `lspci` : Liste les périphériques PCI (cartes graphiques, réseau...).
- `lsusb` : Liste les périphériques USB.
- `dmesg` : Affiche les messages du noyau (très utile pour voir si un périphérique est détecté au branchement).
- `/dev/` : Dossier contenant les fichiers représentant le matériel (ex: `/dev/sda` pour un disque).

---

#### ⌨️ Récapitulatif des commandes

> Voici les commandes essentielles à retenir pour ce module :

- **Infos utilisateur & commandes**
  - `whoami` : Affiche le nom de l'utilisateur courant.
  - `which <commande>` : Affiche le chemin complet de l'exécutable d'une commande (ex: `which python`).
  - `man <commande>` : Affiche le manuel d'utilisation.

- **Paquets**
  - `sudo apt update && sudo apt upgrade` : Mettre à jour (Debian/Ubuntu).
  - `sudo apt install <paquet>` : Installer.

- **Disques & Fichiers**
  - `df -h` : Espace disque libre (en format lisible).
  - `lsblk` : Liste des blocs/partitions.

- **Logs**
  - `tail -f /var/log/syslog` : Suivre les logs en continu.
  - `journalctl -xe` : Debugger une erreur récente systemd.

[Challenge A504](./challenges/Challenge_A504.md)

> 📚 **Ressources** :
>
> Cheatsheet Linux <https://cheatography.com/davechild/cheat-sheets/linux-command-line/>

[Retour en haut](#-table-des-matières)

---

### 🪔 A505. Atelier LAMP

> Dans cet atelier, vous allez découvrir comment installer et configurer les différents logiciels nécessaire à la mise en place d'une stack LAMP.
> LAMP pour Linux, Apache, MySQL et PHP : ce sont les briques de bases nécessaires pour un serveur web hébergeant des applications web codées en PHP !

![LAMP](/images/2025-12-18-16-12-11.png)

[Atelier A505](./challenges/Challenge_A505.md)

> 📚 **Ressources** :
>
> GLPI 11 sur Debian 13 <https://www.it-connect.fr/installation-pas-a-pas-de-glpi-10-sur-debian-12/>
> Apache config <https://glpi-install.readthedocs.io/en/latest/prerequisites.html#apache-configuration>
> Apache Virtual Hosts <https://www.linuxtricks.fr/wiki/apache-les-virtual-hosts>

[Retour en haut](#-table-des-matières)

---

### 📁 A506. Atelier SAMBA

> L'intéret d'utiliser un serveur Linux à la place d'un Windows Server avec Active Directory ? On économise le coût des licences ! Pas besoin de CAL pour nos postes/utilisateurs.
> Pour remplacer Active Directory sur GNU/Linux, il existe plusieurs solutions. L'une des plus populaires est le logiciel Samba.

![SAMBA](/images/2025-12-18-16-12-30.png)

[Atelier A506](./challenges/Challenge_A506.md)

> 📚 **Ressources** :
>
> Installer et configurer SAMBA <https://www.it-connect.fr/serveur-de-fichiers-debian-installer-et-configurer-samba-4/>
> Lier un lecteur réseau avec une GPO <https://activedirectorypro.com/map-network-drives-with-group-policy/>
> Samba et Systemd <https://wiki.samba.org/index.php/Managing_the_Samba_AD_DC_Service_Using_Systemd>

[Retour en haut](#-table-des-matières)

---

### 🐧 A507. Arch Linux

> Ce cours introduit **Arch Linux**, une distribution indépendante connue pour sa philosophie minimaliste, son modèle de mise à jour continue (*Rolling Release*) et sa gestion de paquets communautaire (AUR). C'est le système idéal pour comprendre en profondeur le fonctionnement de Linux.

#### 1. Philosophie & Concepts Clés

Contrairement à Debian (stabilité avant tout) ou Ubuntu (facilité d'utilisation), Arch Linux repose sur des principes différents :

- **KISS (Keep It Simple, Stupid)** :
- Le système est conçu pour être **simple techniquement** (pas de surcouche inutile, pas de patchs complexes), mais pas forcément simple à utiliser pour un débutant.
- L'utilisateur a le contrôle total : rien n'est installé par défaut sans que vous l'ayez décidé.

- **Rolling Release (Publication Continue)** :
- Il n'y a **pas de versions** majeures (pas de "Arch 22.04" ou "Arch 11").
- Vous installez le système une seule fois, et vous le mettez à jour continuellement. Vous aurez toujours la toute dernière version des logiciels (noyau, drivers, applications) quelques jours après leur sortie.
- *Avantage* : Toujours à jour ("Bleeding Edge").
- *Inconvénient* : Risque d'instabilité si une mise à jour casse une configuration (nécessite de lire les news du site officiel).

- **DIY (Do It Yourself)** :
- Après l'installation, vous vous retrouvez avec un écran noir et un curseur clignotant. C'est à vous d'installer l'interface graphique, le son, le réseau, etc..

#### 2. Gestion des Paquets : Pacman & AUR

Arch Linux utilise un gestionnaire de paquets très rapide et une communauté immense.

- **Pacman (Package Manager)** :
- C'est l'équivalent de `apt` ou `dnf`. Il gère les dépôts officiels (Core, Extra).
- Il utilise des fichiers binaires `.pkg.tar.zst`.

- **AUR (Arch User Repository)** :
- C'est la grande force d'Arch. Si un logiciel n'est pas dans les dépôts officiels (ex: Google Chrome, Spotify, ou un petit outil obscur), il est à 99% dans AUR.
- C'est un dépôt communautaire contenant des scripts (`PKGBUILD`) qui téléchargent les sources et compilent le logiciel pour vous.
- Pour l'utiliser facilement, on installe un **"AUR Helper"** comme `yay` ou `paru` (non installés par défaut).

#### 3. Anatomie de l'Installation

L'installation classique se fait en ligne de commande. Voici les étapes logiques :

1. **Clavier & Réseau** : Mettre le clavier en FR (`loadkeys fr`) et vérifier la connexion internet (indispensable car l'installateur télécharge tout en direct).
2. **Partitionnement** : Utiliser `cfdisk` ou `fdisk` pour créer les partitions (EFI, Root, Swap).
3. **Formatage & Montage** :

- Formater les partitions (`mkfs.ext4`, `mkswap`).
- Monter la partition Root dans `/mnt` (le système temporaire).

1. **Installation du système de base** : La commande magique est **`pacstrap`**.

- Exemple : `pacstrap /mnt base linux linux-firmware vim`.

1. **Configuration du système (Chroot)** :

- Générer le fichier fstab (`genfstab`).
- Entrer dans le nouveau système (`arch-chroot /mnt`) pour devenir "root" à l'intérieur de votre nouvelle installation.
- Configurer la langue, l'heure, le nom de la machine et le mot de passe root.

1. **Bootloader** : Installer et configurer **GRUB** pour que le PC puisse démarrer.

> **Note :** Il existe désormais un script officiel nommé `archinstall` qui automatise tout cela via des menus, mais savoir le faire à la main est un excellent exercice pédagogique.

#### ⌨️ Commandes Essentielles (Pacman)

Voici les équivalences pour vous repérer par rapport à Debian/Ubuntu :

| Action | Commande Arch (`pacman`) | Équivalent Debian (`apt`) |
| --- | --- | --- |
| Mettre à jour tout le système | `sudo pacman -Syu` | `apt update && apt upgrade` |
| Installer un paquet | `sudo pacman -S <nom>` | `apt install <nom>` |
| Chercher un paquet | `pacman -Ss <mot>` | `apt search <mot>` |
| Supprimer un paquet | `sudo pacman -Rs <nom>` | `apt autoremove <nom>` |
| Nettoyer le cache | `sudo pacman -Sc` | `apt clean` |

[Challenge A507](./challenges/Challenge_A507.md)

> 📚 **Ressources** :
>
> Les liens symboliques <https://www.it-connect.fr/creer-un-lien-symbolique-sous-linux/>
> L'umask sous Linux <https://www.it-connect.fr/gestion-de-lumask-sous-linux/>
> Install Arch <https://wiki.archlinux.org/title/Installation_guide>

[Retour en haut](#-table-des-matières)

---

### 📞 A508. Introduction à la VoIP et Asterisk

> Ce cours marque la transition de la téléphonie traditionnelle vers la téléphonie moderne sur IP. Il aborde l'évolution des réseaux, les protocoles de communication et la mise en place d'un standard téléphonique logiciel (IPBX) avec Asterisk.

#### 1. L'Évolution des Réseaux Téléphoniques

Avant la VoIP, la téléphonie reposait sur la **commutation de circuits** (une ligne physique est réservée entre deux interlocuteurs pendant toute la durée de l'appel).

- **RTC (Réseau Téléphonique Commuté)** :
  - Aussi appelé **PSTN** (Public Switched Telephone Network).
  - C'est le réseau analogique historique (la prise en T murale).
  - *Technologie* : Commutation de circuits.
  - *Inconvénient* : Coûteux, peu flexible, une ligne = un appel.

- **RNIS (Réseau Numérique à Intégration de Services)** :
  - Aussi appelé **ISDN** (Integrated Services Digital Network) ou **Numéris** en France.
  - C'est une évolution du RTC permettant de transporter de la voix et des données en numérique sur les lignes téléphoniques classiques.
  - *Avantage* : Qualité supérieure, plusieurs appels simultanés sur une même ligne physique (canaux B).

- **VoIP (Voice over IP)** :
  - C'est la technologie actuelle. La voix est numérisée, compressée et découpée en **paquets** de données (comme pour un email ou une page web).
  - Elle transite par le réseau Internet ou un réseau local (LAN).
  - *Avantages* : Réduction des coûts (pas de câblage téléphonique dédié), mobilité, intégration avec l'informatique.

#### 2. PABX vs IPBX

C'est le cœur du système téléphonique d'une entreprise (le standard).

- **PABX (Private Automatic Branch Exchange)** :
  - L'ancien standard téléphonique "physique".
  - Gère les lignes internes et l'accès au réseau public (RTC/RNIS).
  - Nécessite souvent un câblage téléphonique séparé du réseau informatique.

- **IPBX (Internet Protocol Private Branch Exchange)** :
  - C'est la version moderne, souvent logicielle (comme Asterisk).
  - Il gère les téléphones IP via le réseau informatique existant (câbles Ethernet RJ45).
  - Il offre des fonctionnalités avancées : messagerie unifiée, conférences, serveur vocal interactif (IVR) .

#### 3. Les Protocoles VoIP

Pour téléphoner sur Internet, on a besoin de deux choses : un protocole pour *établir* la connexion (signalisation) et un protocole pour *transporter* la voix.

- **SIP (Session Initiation Protocol)**  :

  - C'est le standard mondial (RFC 3261) pour la **signalisation**.
  - **Rôle** : Il ne transporte pas la voix ! Il sert à **initier** (faire sonner), **modifier** (mettre en attente) et **terminer** (raccrocher) les sessions multimédia .
  - **Fonctionnement** : Architecture Client-Serveur (similaire au HTTP du web).

- **Autres protocoles** :
  - **RTP** (Real-time Transport Protocol) : C'est lui qui transporte réellement la voix (le flux audio) une fois que SIP a établi la connexion.
  - **IAX** (Inter-Asterisk eXchange) : Protocole spécifique à Asterisk, plus efficace pour relier deux serveurs Asterisk entre eux.
  - **H.323** : Ancien standard, plus complexe, aujourd'hui supplanté par SIP.

#### 4. Architecture Technique et Qualité

Pour qu'un appel VoIP fonctionne correctement, le protocole SIP ne suffit pas. Il faut une infrastructure matérielle et une gestion fine du réseau.

- **Composants SIP** :
  - **User Agent (UA)** : Le téléphone (physique ou logiciel) utilisé par le client.
  - **Proxy SIP** : Serveur qui achemine les requêtes d'un utilisateur à l'autre (le "facteur").
  - **Registrar** : Serveur de base de données qui note où se trouve chaque utilisateur (son adresse IP) quand il s'enregistre.
  - **Gateway (Passerelle)** : L'équipement indispensable pour sortir vers le réseau classique (appeler un fixe ou un mobile via le RTC).

- **Numérisation et Codecs** :
  - Le **Codec** (Coder-Decoder) transforme la voix analogique en données numériques compressées.
  - **G.711** : Qualité standard (HD), aucune compression, consomme **64 kbps**.
  - **G.729** : Forte compression, qualité légèrement dégradée, idéal pour petits débits (**8 kbps**).

- **Qualité de Service (QoS)** :
  - La VoIP est du temps réel : on ne peut pas mettre la voix en "pause" le temps que le réseau charge. Il faut configurer la QoS sur les routeurs pour prioriser la voix sur les téléchargements.
  - **Les 4 critères vitaux** :
    - **Bande passante** : Le débit doit être suffisant.
    - **Latence** : Le délai doit être faible (< 150ms) pour éviter l'effet "écho".
    - **Gigue (Jitter)** : La variation du délai (le pire ennemi de la VoIP).
    - **Perte de paquets** : Entraîne des coupures de son (hachures).

#### 5. Zoom sur Asterisk

**Asterisk** est la solution de référence pour créer son propre IPBX.

- **Définition** : C'est une plateforme Open Source (créée en 1999 par Mark Spencer) qui transforme un ordinateur en serveur de communication complet .

- **Fonctionnalités** : Il agit comme un PBX, une passerelle VoIP, un serveur de conférence et un serveur vocal (IVR) .

**Architecture et Dialplan**
L'intelligence d'Asterisk réside dans son **Dialplan** (Plan de numérotation). C'est le cerveau qui décide "qui appelle qui" et "que faire quand ça sonne" .

- **Fichier de configuration** : Le dialplan se configure dans le fichier `/etc/asterisk/extensions.conf`.

- **Structure d'une règle (Dialplan)**  :
Une règle se compose de 4 éléments :

  - **Contexte** (`[internal]`) : Groupe logique (ex: appels internes vs appels externes).
  - **Extension** (`100`) : Le numéro appelé.
  - **Priorité** (`1`, `2`, `n`) : L'ordre d'exécution des étapes.
  - **Application** (`Dial`, `Answer`) : L'action à effectuer.

- **Exemple de syntaxe**  :

  [internal]                ; Nom du contexte

  exten => 100,1,Answer()   ; Étape 1 : Si on appelle le 100, Asterisk décroche

  exten => 100,2,Playback(hello-world) ; Étape 2 : Il joue le son "hello-world"

  exten => 100,3,Hangup()   ; Étape 3 : Il raccroche

**Terminologie importante** :

- **Softphone** : Logiciel installé sur PC ou Smartphone qui simule un téléphone (ex: Zoiper, Linphone).
- **Trunk SIP** : Le "tuyau" qui relie votre IPBX Asterisk au monde extérieur (via un opérateur VoIP) pour passer des appels sur les fixes/mobiles.

[Challenge A508](./challenges/Challenge_A508.md)

> 📚 **Ressources** :
>
> Code Chappe <https://fr.wikipedia.org/wiki/Code_Chappe>
> Qu'est-ce que la VoIP <https://www.it-connect.fr/quest-ce-que-la-voip/>
> Qu'est-ce qu'un PBX <https://www.cisco.com/c/fr_ca/solutions/small-business/resource-center/collaboration/what-is-a-pbx.html>
> Installing Asterisk <https://docs.asterisk.org/Getting-Started/Installing-Asterisk/>
> Ubuntu Asterisk <https://doc.ubuntu-fr.org/asterisk>
> Debian Asterisk <https://doc.clementperrin.fr/application/asterisk/installation-asterisk-18-debian>

[Retour en haut](#-table-des-matières)

---

### ☎️ A509. Atelier Asterisk

> IPBX Asterisk sur Debian 13

[Challenge A509](./challenges/Challenge_A509.md)

> 📚 **Ressources** :
>
> <https://berenger-benam.over-blog.com/2023/06/mise-en-place-de-la-telephonie-sur-ip-avec-asterisk-pjsip.html>

[Retour en haut](#-table-des-matières)

---

### 🐧 Fin Saison A5. Linux

[QCM Saison A5](https://forms.gle/S27i3URSAbpBPg6T9)

![Résultat QCM](/images/2025-12-23-10-05-41.png)

- **🐧 Mémo Linux - L'essentiel à retenir**

- Les Commandes de Survie (Navigation & Fichiers)

| Commande | Action | Exemple / Option utile |
| --- | --- | --- |
| **`ls`** | **Lister** le contenu | `ls -l` (détails), `ls -a` (fichiers cachés) |
| **`cd`** | **Changer** de dossier | `cd ..` (remonter), `cd ~` (aller à la maison) |
| **`pwd`** | **Afficher** où on est | Affiche le chemin absolu actuel |
| **`mkdir`** | **Créer** un dossier | `mkdir -p A/B` (crée tout le chemin) |
| **`cp`** | **Copier** | `cp -r source/ dest/` (pour un dossier complet) |
| **`mv`** | **Déplacer** ou **Renommer** | `mv ancien.txt nouveau.txt` |
| **`rm`** | **Supprimer** | `rm -r dossier/` (supprime un dossier) |
| **`cat`** | **Lire** tout le fichier | Affiche tout le texte d'un coup |
| **`man`** | **Manuel** d'aide | `man ls` (pour quitter : touche `q`) |

- Administration & Système

| Commande / Concept | Rôle | Détails importants |
| :--- | :--- | :--- |
| **`sudo`** | **Super-utilisateur** | Exécute une commande en tant qu'admin (root) |
| **`chmod`** | Changer les **Permissions** | `chmod +x script.sh` (rend exécutable) |
| **`chown`** | Changer le **Propriétaire** | `chown user:group fichier` |
| **`\|`** (Pipe) | **Chaîner** deux commandes | `ls \| grep "test"` (la sortie de l'un va dans l'autre) |
| **`>`** | **Rediriger** vers un fichier | `echo "coucou" > fichier.txt` (écrase le contenu) |
| **`apt`** | Gestionnaire de **Paquets** | Pour Debian/Ubuntu (`apt install vlc`) |

- Les Dossiers Clés de l'Arborescence

| Dossier | Contenu |
| --- | --- |
| **`/`** | La **Racine** (le début de tout) |
| **`~`** | Le dossier **Home** de l'utilisateur (`/home/moi`) |
| **`/etc`** | Les fichiers de **Configuration** système |
| **`/bin`** | Les **Binaires** (programmes essentiels comme `ls`) |
| **`/home`** | Les dossiers personnels des utilisateurs |
| **`/tmp`** | Fichiers temporaires (vidé au redémarrage) |

- Culture Générale & Histoire

  - **Multics** (1964) : L'ancêtre complexe.
  - **Unix** (1969) : La version simplifiée (KISS), base de tout.
  - **GNU** (1983 - **R. Stallman**) : Le projet libre ("Free as in speech"), mais sans noyau.
  - **Linux** (1991 - **L. Torvalds**) : Le noyau qui a complété GNU.
  - **Philosophie Unix** : "Faire une seule chose et la faire bien" + "Tout est fichier".
  - **Distributions** : Définies par leur **gestionnaire de paquets** (Debian=`apt` / RedHat=`rpm` / Arch=`pacman`).

Le nombre de VM Linux sur Proxmox à la fin de la saison

![VM](/images/2025-12-23-11-07-15.png)

[Retour en haut](#-table-des-matières)

---

## **☁️ Saison B1. Virtualisation**

> Cette saison introduit la Virtualisation, socle technologique indispensable au Cloud Computing et au DevOps. Elle se concentre sur la compréhension des hyperviseurs, l'optimisation des ressources matérielles et la gestion d'infrastructures virtuelles via les solutions standards comme VMware et Proxmox.

### 💽 B101. Introduction à la Virtualisation

> Ce cours introduit les concepts fondamentaux de la virtualisation, son histoire, et distingue les différents types d'hyperviseurs. Il présente également les deux outils qui seront utilisés durant la semaine : **VMware Workstation** et **Proxmox VE**.

#### 1. Qu'est-ce que la Virtualisation ?

- **Définition** : C'est une technologie permettant de créer des versions virtuelles de ressources informatiques (serveurs, stockage, réseaux) sur un matériel physique unique.

- **Objectif** : Faire tourner plusieurs systèmes d'exploitation (OS) et applications sur un seul serveur physique, comme s'ils avaient chacun leur propre machine.

- **Avantages clés** :

  - **Consolidation** : On passe de "1 serveur = 1 application" à "1 serveur = 10 VMs".
  - **Réduction des coûts** : Moins de matériel à acheter (CapEx) et moins d'électricité/clim à payer (OpEx).
  - **Flexibilité** : Déploiement rapide de nouveaux serveurs.
  - **Isolation** : Si une VM plante, les autres continuent de fonctionner.

#### 2. L'Hyperviseur : La pièce maîtresse

L'hyperviseur est le logiciel qui rend la virtualisation possible. Il s'intercale entre le matériel et les machines virtuelles pour distribuer les ressources (CPU, RAM, Disque). Il en existe deux familles distinctes :

- **Type 1 : Bare Metal (Natif)**

  - **Installation** : S'installe **directement sur le matériel** (le serveur physique), à la place de l'OS.
  - **Usage** : Production, Data Centers, Entreprises.
  - **Avantages** : Performance maximale, sécurité accrue, accès direct au hardware.
  - *Exemples* : **VMware ESXi**, **Proxmox VE**, Microsoft Hyper-V, Xen.

- **Type 2 : Hosted (Hébergé)**

  - **Installation** : S'installe **sur un système d'exploitation** existant (Windows, Linux, macOS), comme une application classique.
  - **Usage** : Tests, développement, pédagogie (ce que vous faites sur vos PC).
  - **Inconvénients** : Moins performant car il doit passer par l'OS hôte pour accéder au matériel.
  - *Exemples* : **VMware Workstation**, Oracle VirtualBox, Parallels.

#### 3. Les outils de la semaine

##### A. VMware Workstation (Hyperviseur Type 2)

C'est la référence professionnelle pour la virtualisation de bureau.

- **Fonctionnalités clés** :

  - **Snapshots** : Permet de "geler" l'état d'une VM à un instant T. Idéal avant de faire une manipulation risquée pour revenir en arrière en cas d'erreur.
  - **Clonage** : Dupliquer une VM rapidement (Clone complet ou Clone lié pour économiser de l'espace).

- **Modes Réseau (Crucial pour les TPs)** :

  - **Bridged (Pont)** : La VM est connectée directement au réseau physique. Elle reçoit une IP de votre box/routeur (ex: 192.168.1.x). Elle est vue comme une machine indépendante sur le réseau.
  - **NAT (Network Address Translation)** : La VM partage l'IP de l'hôte. Elle a accès à Internet, mais elle est "cachée" derrière votre PC.
  - **Host-Only** : Réseau privé et isolé entre l'hôte et la VM. Pas d'accès Internet, idéal pour des labos sécurisés.

##### B. Proxmox VE (Hyperviseur Type 1)

C'est une solution **Open Source** basée sur **Debian**, de plus en plus populaire en entreprise comme alternative à VMware ESXi (devenu très cher).

- **Caractéristiques** :

  - **Gestion** : Tout se gère via une interface Web (GUI).
  - **Polyvalence** : Il gère à la fois :

    1. **KVM (Kernel-based Virtual Machine)** : Virtualisation complète (pour Windows, Linux, etc.).
    2. **LXC (Linux Containers)** : Conteneurs légers (partage le noyau de l'hôte), beaucoup plus rapides et économes en RAM.

  - **Fonctionnalités Enterprise** : Supporte la Haute Disponibilité (HA), le Clustering et les sauvegardes natives.

#### 4. Autres types de virtualisation

Outre la virtualisation de serveurs, le concept s'applique ailleurs :

- **Réseau (SDN)** : Création de VLANs, switchs virtuels (ex: NSX).
- **Stockage (SDS)** : Regrouper plusieurs disques physiques en un pool virtuel (ex: vSAN, Ceph).
- **Poste de travail (VDI)** : L'utilisateur accède à son PC Windows à distance, l'OS tourne en réalité dans le datacenter.

[Challenge B101](./challenges/Challenge_B101.md)

> 📚 **Ressources** :
>
> C'est quoi la virtualisation des réseaux ? <https://www.linkedin.com/pulse/cest-quoi-la-virtualisation-des-r%C3%A9seaux-academy-zegus/>
> Qu'est-ce qu'un Hyperviseur (Red hat) <https://www.redhat.com/en/topics/virtualization/what-is-a-hypervisor>
> Proxmox <https://pve.proxmox.com/wiki/Main_Page>
> VMware Workstation : comment virtualiser Proxmox VE <https://www.it-connect.fr/vmware-workstation-comment-virtualiser-proxmox-ve/>

[Retour en haut](#-table-des-matières)

---

### ☁️ B102. Proxmox VE & Infrastructure Haute Disponibilité

> Ce cours est purement pratique et se concentre sur l'administration d'un hyperviseur de Type 1 (**Proxmox VE**). L'objectif est de passer de la gestion d'un simple serveur à la gestion d'un **Cluster** de serveurs, capable d'assurer la continuité de service (HA) et la mobilité des machines (Migration).

#### 1. Tour du Propriétaire : L'Interface Proxmox

L'interface web de Proxmox est hiérarchique. Comprendre cette structure est essentiel pour savoir où appliquer les configurations.

- **Le Datacenter** (Niveau Racine) :

  - C'est le point d'entrée global. Les configurations faites ici (Stockage, Sauvegardes, Utilisateurs) peuvent s'appliquer à tous les nœuds.
  - C'est ici qu'on visualise l'état de santé global du cluster (« Est-ce que tout est vert ? »).

- **Les Nœuds (Nodes)** :

  - Ce sont les serveurs physiques (vos machines *Bare-Metal*).
  - Chaque nœud gère ses propres ressources locales (Disques, CPU, RAM, Réseau).
  - On y crée et gère les **VMs** (Machines Virtuelles) et **CTs** (Conteneurs LXC).

- **Gestion des Utilisateurs & Permissions** :

  La sécurité dans Proxmox repose sur plusieurs briques :

  - **Realms (Domaines)** : La méthode d'authentification.
    - *Linux PAM* : Utilise les comptes système de l'OS Debian sous-jacent (ex: `root`).
    - *Proxmox VE (pve)* : Utilisateurs gérés uniquement par Proxmox, indépendants du système.
  - **Rôles** : Des ensembles de privilèges prédéfinis (ex: `PVEAdmin` pour tout faire, `PVEVMUser` pour juste utiliser une VM).
  - **Permissions** : L'association **Qui + Quoi + Où** (Utilisateur X a le Rôle Y sur la VM Z).

#### 2. Le Clustering

Un **Cluster** consiste à regrouper plusieurs serveurs physiques (nœuds) pour qu'ils fonctionnent comme une seule entité logique.

- **Intérêt** : Administration centralisée (une seule interface web pour gérer 10 serveurs) et activation des fonctions avancées (Migration, HA).
- **Quorum** : Concept vital. Pour qu'un cluster fonctionne (et puisse modifier des fichiers), la majorité des nœuds doit être en ligne (Vote > 50%).
  - *Exemple* : Sur un cluster de 3 nœuds, si 1 tombe, il en reste 2 (Majorité OK). Si 2 tombent, le dernier se met en sécurité (Read-only) pour éviter la corruption de données (*Split-brain*).

#### 3. Fonctions Avancées (La "Magie" de la Virtualisation)

C'est ici que la virtualisation prend tout son sens par rapport à des serveurs physiques classiques.

- **La Migration (Live Migration)**

  - **Le concept** : Déplacer une VM d'un nœud A vers un nœud B **sans éteindre la machine** et sans coupure de service pour l'utilisateur.
  - **Comment ça marche ?** : La RAM de la VM est copiée à chaud via le réseau vers le nouveau serveur. Une fois la copie finie, la bascule se fait instantanément.
  - **Prérequis** : Avoir un stockage partagé (NAS/SAN) ou utiliser la réplication de stockage.

- **La Réplication (ZFS Replication)**

  - **Le concept** : Copier régulièrement les données d'une VM d'un serveur vers un autre pour avoir une copie de secours prête à l'emploi.
  - **Fonctionnement** : Utilise la puissance du système de fichiers **ZFS**. Il envoie uniquement les différences (delta) depuis la dernière synchronisation, ce qui est très rapide (possible toutes les minutes).
  - **Usage** : Permet de migrer rapidement une VM même sans stockage partagé coûteux.

- **La HA (High Availability / Haute Disponibilité)**

  - **Le concept** : Le "Saint Graal" de l'infra. Si le serveur physique A tombe en panne (coupure élec, carte mère grillée), le cluster le détecte et **redémarre automatiquement** les VMs concernées sur le serveur B.
  - **Downtime** : Il y a une petite coupure de service (le temps du redémarrage de l'OS de la VM), mais aucune intervention humaine n'est nécessaire à 3h du matin !
  - **Fencing** : Mécanisme de sécurité pour s'assurer que le serveur en panne est bien "mort" (on lui coupe le courant via une prise connectée ou IPMI) avant de relancer ses VMs ailleurs, pour éviter que deux serveurs ne lancent la même VM en même temps (corruption de données).

- 💡 En résumé

  - **Hyperviseur Type 1** = Installé direct sur le métal (Proxmox, ESXi).
  - **Cluster** = Plusieurs nœuds qui discutent ensemble.
  - **Migration** = Je bouge ma VM (maintenance planifiée).
  - **HA** = Le cluster sauve ma VM (panne imprévue).

[Challenge B202](./challenges/Challenge_B202.md)

> 📚 **Ressources** :
>
> Proxmox : configuration du quorum avec un cluster de 2 serveurs <https://rdr-it.com/proxmox-configuration-du-quorum-avec-un-cluster-de-2-serveurs/>
> Community Scripts pour Proxmox VE <https://community-scripts.github.io/ProxmoxVE/scripts>

[Retour en haut](#-table-des-matières)

---

[Challenge B203](./challenges/Challenge_B203.md)

> 📚 **Ressources** :
>

[Retour en haut](#-table-des-matières)

---
