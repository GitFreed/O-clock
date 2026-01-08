# Challenge B103 07/01/2026

## Pitch de l’exercice 🧑‍🏫

>⌨️ Pitch de l'exercice :
>
> Installer vCenter et le configurer

[Cours B103.](/RESUME.md#-b103-vmware-esxi--vcenter)

---

## Définitions / compréhension du système

- Le Duo VMware

  - ESXi : C'est l'hyperviseur. Il s'installe sur le serveur et fait tourner les VMs.

  - vCenter :  C'est une machine virtuelle complète (basée sur Linux Photon OS) qui contient :

      Une énorme base de données (PostgreSQL) pour stocker l'historique de tout ce qui se passe. Des dizaines de services Java (très gourmands en RAM). Des outils d'analyse, de mise à jour, de sécurité, etc. C'est conçu pour gérer 2000 hôtes ESXi et 35 000 machines virtuelles. Du coup, même la version "Minuscule" (Tiny) garde cette architecture lourde.

  - Sans lui : Pas de déplacement de VM à chaud (vMotion), pas de redémarrage auto en cas de panne (HA).

- L'Architecture "Poupées Russes"

  - On fait de la Virtualisation Imbriquée (Nested) :

    - Niveau 1 : Proxmox (Hôte principal).

    - Niveau 2 : ESXi (VM dans Proxmox).

    - Niveau 3 : vCenter (VM dans ESXi).

## Création de la VM

On va installer une VM Windows 10, pour la rapidité et légèreté sur notre serveur.

> - Guest OS : Microsoft Windows / Version : 11/10/2016/2019
> - QEMU agent : Enabled
> - Système : Graphic card : VirtIO-GPU
> - Disque : ISO Win10 + ISO VirtIO
> - Machine : q35
> - BIOS : "OVMF (UEFI) (+"EFI Disk"")"
> - Disque,Bus/Device,SCSI (plus performant que IDE ou SATA)
> - Taille : 32Go
> - CPU : Cores 2x2
> - Type : host
> - Réseau : Intel E1000E

## Installation vCenter Stage 1

Pour installer vCenter on monte l'image le disque de la VM et on va lancer installer.exe dans vcsa-ui-installer/win32

![CD](/images/2026-01-07-15-05-35.png)

![install](/images/2026-01-07-15-17-14.png)

![deploy](/images/2026-01-07-15-22-57.png)

On doit se connecter à la cible (le serveur ESXi)

![target](/images/2026-01-07-15-27-34.png)

On valide les certificats pour avoir une connexion sécurisée (certificat SSL + certificat auto-signé ESXi)

![certifs](/images/2026-01-07-15-28-15.png)

On choisit le nom de notre serveur vCenter et un mot de passe complexe

![vCenter](/images/2026-01-07-15-30-31.png)

On choisit la taille du déploiement ici, Tiny (2 CPU, 14 Go de RAM) qui sera suffisant ici pour notre installation.

![déploiement](/images/2026-01-07-15-34-18.png)

Pour le choix du disque "datastore" il faut surtout cocher la case "Enable Thin Disk Mode" (Disque dynamique), sinon, il va réserver 500 Go d'espace disque d'un coup et saturer notre stockage !

![datastore](/images/2026-01-07-15-51-46.png)

Maintenant on passe aux paramètres réseau, il faut une IP statique, il demande également un nom de domaine, on peut lui mettre notre adresse IP fixe. On ajouter notre subnet en /16, notre default gateway (la pfsense), et DNS.

![network](/images/2026-01-07-15-57-24.png)

On est prêt à lancer l'installation du stage 1 !

![stage 1](/images/2026-01-07-16-01-45.png)

Déploiement

![déploiement](/images/2026-01-07-16-03-00.png)

On peut voir l'avancement dans VSXi également

![ESXi](/images/2026-01-07-16-06-10.png)

Successfully deployed

![OK](/images/2026-01-07-16-11-50.png)

## Paramétrage vCenter Stage 2

![stage2](/images/2026-01-07-16-18-35.png)

On choisis Synchronize time with the ESXi host. Si l'heure du vCenter se décale de celle de l'ESXi de plus de 5 minutes, on aura un problème de certificats SSL. En les synchronisant, ils restent toujours synchrones.

![synchro](/images/2026-01-07-16-32-22.png)

Maintenant on va créer le domaine d'administration de VMware (Single Sign-On)

On ne peut pas changer administrator, pour se connecter ce sera donc <administrator@vsphere.local> / password

![SSO](/images/2026-01-07-16-37-33.png)

Ici on peut décocher la CEIP

![CEIP](/images/2026-01-07-16-38-50.png)

Prêt

![stage 2](/images/2026-01-07-16-39-22.png)

![warn](/images/2026-01-07-16-40-47.png)

Complete !

![done](/images/2026-01-07-17-24-50.png)

On peut maintenant se connecter à vSphere via l'interface web <https://10.0.0.70:443>

![vsphere](/images/2026-01-07-17-26-06.png)

![client](/images/2026-01-07-17-29-48.png)

## vSphere Client

On peut créer un nouveau centre de donnée (**datacenter**) et y ajouter notre **hôte** (l'EXSi)

![ajout](/images/2026-01-08-11-37-34.png)

On ajoute notre utilisateur root pour se connecter à cet EXSi, on peut voir les VM qui y sont installées

![hôte](/images/2026-01-08-11-39-08.png)

Ici on va extraire l'image, vCenter "copie" la configuration exacte (version ESXi, pilotes) qui tourne déjà sur notre serveur physique pour en faire le modèle de référence.

Pourquoi : Cela évite d'écraser le système par une version incompatible et garantit que l'hôte est importé tel quel, sans forcer de mise à jour risquée immédiatement.

![image](/images/2026-01-08-11-40-39.png)

Le mode de verrouillage permet de sécuriser, en tant que pro on passerait en mode Strict, mais on va le laisser désactivé en cas de problème pour nous.

![verrouillage](/images/2026-01-08-11-44-42.png)

Tout en bas on a une barre des tâches (comme Proxmox) ou on peut voir les tâches en cours.

![tâches](/images/2026-01-08-11-48-36.png)

Une fois terminé on a notre **HCI** (Hyper-Converged Infrastructure : Infrastructure Hyper-Convergée), qui permet de tout regrouper et gérer simultanément.

![HCI](/images/2026-01-08-11-51-34.png)

On va faire de même pour l'autre serveur EXSi, avec les mêmes configurations.

![second hôte](/images/2026-01-08-12-02-06.png)

- *Petit bonus*

On peut se connecter depuis **VMware Workstation Pro** à notre serveur vSphere pour y avoir accès directement via Workstation, il suffit de faire Fichier :

![co](/images/2026-01-08-13-23-12.png)

![vmwarevsphere](/images/2026-01-08-16-02-26.png)

- *Info*

On peut également migrer (à froid) nos VM entre les 2 serveurs EXSi sans créer de Cluster dans vSphere.

## Ajout d'un Cluster

On va créer un Cluster dans notre Datacenter

![Cluster](/images/2026-01-08-13-35-54.png)

- vSphere DRS (Distributed Resource Scheduler) : C'est l'équilibrage de charge automatique qui déplace vos VMs d'un serveur surchargé vers un serveur libre pour garantir les meilleures performances.

- vSphere HA (High Availability) : C'est la haute disponibilité qui redémarre automatiquement vos VMs sur un autre serveur survivant si leur serveur physique tombe en panne.

- vSAN (Virtual Storage Area Network) : Combine automatiquement les disques locaux de chaque hôte ESXi pour créer un seul datastore partagé.

![Cluster](/images/2026-01-08-13-42-44.png)

On sélectionne l'image et on termine la création du Cluster.

![Done](/images/2026-01-08-13-46-59.png)

On a maintenant un Cluster, on peut ajouter les hôtes avec clic droit ou en les faisant glisser directement, on nous propose 2 options, le pool racine ou tout est au même niveau (plus simple pour un petit lab) ou créer un pool pour garder une arborescence

![déplacer](/images/2026-01-08-13-48-00.png)

![Cluster](/images/2026-01-08-13-56-22.png)

Les VM sont au même niveau mais on peut toujours voir quel est leur Hôte

![hôte](/images/2026-01-08-14-01-06.png)

Le Mode Maintenance

On va activer le vMotion (fonctionnalité VMware) pour la Migration à chaud, ça va se passer au niveau des cartes réseau. On va créer un DS et un DSM qui vont gérer un réseau cluster

![vMotion](/images/2026-01-08-14-02-17.png)

Trafic vMotion, on peut configurer/changer nos IP en statique etc mais on va laisser tel quel

![trafic vmotion](/images/2026-01-08-14-17-04.png)

terme Quorum est souvent utilisé un peu vite, mais il est fondamental pour la Haute Disponibilité (HA).

![trafic](/images/2026-01-08-14-25-02.png)

On finit la configuration et on peut terminer, en allant dans la configuration, on peut voir le commutateur virtuel (DSwitch)

![DSwitch](/images/2026-01-08-14-29-41.png)

Maintenant que le DSwitch est créé il faut ajouter notre second EXSi dessus, dans la partie réseau, clic droit sur DSwitch et Ajouter-gérer des hôtes

![DSwitch](/images/2026-01-08-16-04-31.png)

![Ajout](/images/2026-01-08-16-05-28.png)

Pour l'adaptateur réseau physique, on choisir le même uplink que l'autre serveur (uplink1)

Maintenant on doit assigner l'adaptateur  réseau VMkernel à un groupe de ports (le DSwitch-Management Network)

![vmk0](/images/2026-01-08-16-21-26.png)

On doit migrer la gestion réseau des VM et attribuer le port DSwitch-VM Network

![mise reseau VM](/images/2026-01-08-16-28-35.png)

DSwitch Ok pour celui-ci également

![OK](/images/2026-01-08-19-43-48.png)

![OK](/images/2026-01-08-15-03-15.png)

- *Info*

Le vSwitch Distribué (DSwitch) est mieux pour la production, mais le vSwitch Standard fonctionne parfaitement pour vMotion. il suffit donc d'activer le service vMotion" sur le switch. Dans Adaptateurs VMkernel > Modifier > Cocher la case vMotion

## Migration à chaud

On peut directement faire glisser une VM (ici Alpine du 10.0.0.63) sur l'autre Hyperviseur

![move](/images/2026-01-08-19-52-19.png)

![migrer](/images/2026-01-08-19-50-03.png)

On sélectionne l'hôte cible

![ressource de calcul](/images/2026-01-08-19-52-46.png)

On choisi le stockage cible

![stockage](/images/2026-01-08-20-27-53.png)

On sélectionne l'adaptateur réseau

![network](/images/2026-01-08-20-28-13.png)

Sélectionner la priorité de vMotion

![priorité](/images/2026-01-08-20-28-29.png)

Terminer

![fin](/images/2026-01-08-20-28-51.png)

On peut voir que notre VM a bien été migrée sans interruption !

![OK](/images/2026-01-08-20-29-48.png)
