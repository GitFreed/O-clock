# Liste de tous les Challenges et Ateliers réalisés pour valider les concepts techniques abordés en cours 💻

Commande utilisée pour extraire la liste du fichier [Resume.md](/RESUME.md)

```ps1
(Get-Content .\RESUME.md | Where-Object { $_ -like "*challenges/*" }) -join "`r`n`r`n" | Set-Clipboard
```

---

[Challenge A102](/challenges/Challenge_A102.md) : Exercice de recherche pour achat de périphériques

[Challenge A103](/challenges/Challenge_A103.md) : Description de notre Hardware

[Challenge A104](/challenges/Challenge_A104.md) : Configuration de 3 Setups selon les besoins.

[Challenge A105](/challenges/Challenge_A105.md) : Découverte de la Virtualisation, Virtualbox et VM Windows.

[Challenge A106](/challenges/Challenge_A106.md) : Agents invités (Guest addition) pour la virtualisation et VM Linux.

[Challenge A107](/challenges/Challenge_A107.md) : Gestionnaire de mots de passe.

[Challenge A108](/challenges/Challenge_A108.md) : Création d'un Diagramme Réseau.

[Challenge A109](/challenges/Challenge_A109.md) : Calculs d'adresses IP, réseau, broadcast, plage et masque.

[Challenge A201](/challenges/Challenge_A201.md) : Test et comparatif de Microsoft / Libreoffice.

[Challenge A202](/challenges/Challenge_A202.md) : Mise en réseau de VM.

[Challenge A203](/challenges/Challenge_A203.md) : Memtest, Anydest, Teamviewer.

[Challenge A204](/challenges/Challenge_A204.md) : Atelier "Mme Michu", dépannage d'une VM simulant un labtop en panne.

[Challenge A206](/challenges/Challenge_A206.md) : Test BIOS, et partitions sur USB.

[Challenge A207](/challenges/Challenge_A207.md) : QCM certification ITIL.

[Challenge A208](/challenges/Challenge_A208.md) : Installation GLPI Agent et test de ticketing.

[Challenge A301](/challenges/Challenge_A301.md) : Mise en place d'un réseau et ping sur Packet Tracer.

[Challenge A303](/challenges/Challenge_A303.md) : Création d’un plan d’adressage

[Challenge A304](/challenges/Challenge_A304.md) : Config de Routeurs et LANs sur Packet Tracer

[Atelier A305](/challenges/Challenge_A305.md) : Atelier Packet Tracer, de la création du plan d'adressage, à la config switch, routeurs, routes, DHCP, etc.

[Challenge A306](/challenges/Challenge_A306.md) : DNS et SSH dans Packet Tracer

[Challenge A307](/challenges/Challenge_A307.md) : Self Hosting, NAT et redirection dans Packet Tracer.

[A308. Atelier proxmox](/challenges/Challenge_A308.md) : Installation de Proxmox sur un serveur OVH, configuration du NAT, installation et configuration du routeur pfSense, et VPN.

[Challenge A309](/challenges/Challenge_A309.md)

[Challenge A401](./challenges/Challenge_A401.md) : Installation de Windows Server 2022 sur VMware.

[Challenge A402](./challenges/Challenge_A402.md) : Installation WS2025 sur Proxmox, AD DS Gestion d'utilisateurs.

[Challenge A403](./challenges/Challenge_A403.md) : Utilisateurs, Groupes, et GPO Fond d'écran.

[Challenge A404](./challenges/Challenge_A404.md) : Création de partages et droits.

[Challenge A405](./challenges/Challenge_A405.md) : Mappage de lecteurs, ressources, quotas, filtres, et audit.

[Challenge A406](./challenges/Challenge_A406.md) : Atelier de mise en place et gestion de GPO.

[Challenge A408](./challenges/Challenge_A408.md) : Enregistrement DNS, IIS et index.html

[Challenge A409](./challenges/Challenge_A409.md) : Supression et récupération utilisateur dans l'AD.

[Challenge A410](./challenges/Challenge_A410.md) : Test de Windows Deployment Services (WDS) et boot PXE.

[Challenge A411](./challenges/Challenge_A411.md) : Installation et test du RDS (Remote Desktop Services).

[Challenge A412](./challenges/Challenge_A412.md) : Installation d'une VM sur Hyper-V.

[Challenge A501](./challenges/Challenge_A501.md) : Installation d'une VM Linux sur VMware, et jeu Terminus Quest pour apprendre les commandes de base.

[Challenge A502](./challenges/Challenge_A502.md) : Jouer à VIM Adventures et VIM Tutor pour se familiariser avec VIM.

[Challenge A503](./challenges/Challenge_A503.md) : Création d'utilisateur, droits et dossiers sur Rocky Linux.

[Challenge A504](./challenges/Challenge_A504.md) : Compilation d'un Binaire.

[Atelier A505](./challenges/Challenge_A505.md) : Atelier mise en place d'une stack LAMP.

[Atelier A506](./challenges/Challenge_A506.md) : Atelier mise en place de SAMBA (AD).

[Challenge A507](./challenges/Challenge_A507.md) : Installation et test d'Arch Linux.

[Challenge A508](./challenges/Challenge_A508.md) : Installation et configuration d'un serveur Asterisk.

[Challenge A509](./challenges/Challenge_A509.md) : Atelier Installer et configurer un serveur Asterisk sur proxmox, fonctionnel via app VOIP du smartphone.

[Challenge B101](./challenges/Challenge_B101.md) : Installation d'Hyperviseurs Types 1 é 2, imbrication.

[Challenge B102](./challenges/Challenge_B102.md) : Installation ESXi (vSphere)

[Challenge B103](./challenges/Challenge_B103.md) : Installation de vCenter et le configurer.

[Challenge B201](./challenges/Challenge_B201.md) : Installation de TrueNAS (Proxmox), configuration ZFS, SMB et snapshots.

[Challenge B202](./challenges/Challenge_B202.md) : Installation Veeam Backup & Replication, configuration, restauration.

[Challenge B204](./challenges/Challenge_B204.md) : Installer Proxmox Backup Server, configurer, backup et restore.

[Challenge B301](./challenges/Challenge_B301.md) : Installation de Zabbix

[Challenge B302](./challenges/Challenge_B302.md) : Installation d'Agents Zabbix pour étendre la supervision à l’ensemble de l’infrastructure.

[Challenge B303](./challenges/Challenge_B303.md) : Exploration plus en détail des paramètres, alertes de Zabbix avec les Agents, configuration d'une alerte pour fichiers.

[Challenge B304](./challenges/Challenge_B304.md) : Installation de Nagios et de ses agents.

[Challenge B401](./challenges/Challenge_B401.md) : Pratiquer sur Scratch en créant un jeu du Nombre Mystère (Plus/Moins)

[Challenge B402](./challenges/Challenge_B402.md) : Pratiquer Git & Github

[Challenge B403](./challenges/Challenge_B403.md) : Recréer le jeu du Nombre Mystère (Plus/Moins) en script python

[Challenge B404](./challenges/Challenge_B404.md) : Créer des Scripts batch et Powershell d'Administration Système

[Atelier B405](./challenges/Challenge_B405.md)

[Challenge B406](./challenges/Challenge_B406.md) : Jeu du Nombre Mystère Plus ou Moins en PowerShell

[Challenge B407](./challenges/Challenge_B407.md) : une série d'exercices pour créer une suite d'outils Admin en Bash.

[Challenge B408](./challenges/Challenge_B408.md) : Atelier Bash - Automatisation de l'administration système

[Challenge B409](./challenges/Challenge_B409.md)

[Challenge C101](./challenges/Challenge_C101.md) : Effectuer la note de cadrage d'un projet.

[Challenge C102](./challenges/Challenge_C102.md) : Créer le WBS, matrice RACI et diagramme Gantt.

[Challenge C103](./challenges/Challenge_C103.md) : Analyser les risques pour notre projet.

[Challenge C104](./challenges/Challenge_C104.md) : Définir un scénario d’incident majeur et les mesures, procédures, PRA-PCA type.

[Challenge C201](./challenges/Challenge_C201.md) : Expérimenter les versions gratuites de Google Cloud, AWS et Azure.

[Challenge C202](./challenges/Challenge_C202.md) : Proposition d'une stratégie cloud simple, cohérente et réaliste pour une PME.

[Challenge C203](./challenges/Challenge_C203.md) : Atelier
