# Challenge B103 07/01/2026

## Pitch de l’exercice 🧑‍🏫

>⌨️ Pitch de l'exercice :
>
> Installer vCenter

[Cours B103.](/RESUME.md#-b103-vmware-esxi--vcenter)

---

## Définitions / compréhension du système

- Le Duo VMware

 ESXi : C'est l'hyperviseur. Il s'installe sur le serveur et fait tourner les VMs.

 vCenter :  C'est une machine virtuelle complète (basée sur Linux Photon OS) qui contient :

    Une énorme base de données (PostgreSQL) pour stocker l'historique de tout ce qui se passe. Des dizaines de services Java (très gourmands en RAM). Des outils d'analyse, de mise à jour, de sécurité, etc. C'est conçu pour gérer 2000 hôtes ESXi et 35 000 machines virtuelles. Du coup, même la version "Minuscule" (Tiny) garde cette architecture lourde.

 Sans lui : Pas de déplacement de VM à chaud (vMotion), pas de redémarrage auto en cas de panne (HA).

- L'Architecture "Poupées Russes"

 On fait de la Virtualisation Imbriquée (Nested) :

 Niveau 1 : Proxmox (Hôte principal).

 Niveau 2 : ESXi (VM dans Proxmox).

 Niveau 3 : vCenter (VM dans ESXi).

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
