# Challenge B102 06/01/2026

## Pitch de l’exercice 🧑‍🏫

>⌨️ Pitch de l'exercice :
>
> Installer ESXi (l'hyperviseur), qui est la brique de base de la suite vSphere

[Cours B102.](/RESUME.md#️-b102-proxmox-ve--infrastructure-haute-disponibilité)

---

## Définitions / compréhension du système

ESXi est à VMware ce que Proxmox VE est à Linux.

- C'est un **Hyperviseur de Type 1** (Bare-Metal). Il s'installe directement sur le matériel (ici simulé par VMware Workstation).

- **Son rôle** : Il ne fait que gérer des VMs. Il n'a pas d'interface graphique locale (juste un écran jaune et gris moche). Tout se gère via une page web depuis un autre PC.

- **La différence** : Contrairement à Proxmox qui est libre et très flexible, ESXi est un système propriétaire "fermé", ultra-stable mais très strict.

- Un seul serveur ESXi est "Standalone", si on installe un deuxième ESXi et qu'on les relies avec vCenter, on aura une "Infrastructure vSphere".

## Attention

Lors de l'installation, depuis ESXi 7.0 il y a un "piège" à éviter.

Avant (ESXi 6.x), le système prenait 1 Go et laissait tout le reste. Aujourd'hui, ESXi crée une partition système unifiée appelée ESX-OSData (VMFSL).

Le problème : Par défaut, cette partition système est programmée pour réserver jusqu'à 120 Go d'espace disque pour elle toute seule (pour les logs, le cache, etc.) !

En suivant cette méthode, on peut utiliser une commande de démarrage (Boot Option) pour forcer ESXi avec l'option systemMediaSize=min (Small). Cela force la partition système à faire 33 Go maximum, libérant tout le reste pour les VMs.

<https://williamlam.com/2020/05/changing-the-default-size-of-the-esx-osdata-volume-in-esxi-7-0.html>

![mediasize](/images/2026-01-07-00-20-59.png)

## Création de la VM

Lors de la création de la VM on sélectionne VMware ESX comme système :

![ESX](/images/2026-01-06-23-41-35.png)

Disque, on peut réduire à 100 Go, cela devrait être suffisant : 33 Go pour le système, 67 Go pour les VM

![disque](/images/2026-01-06-23-45-26.png)

Paramètres matériel : 2 vCPU, 4 à 8 Go de RAM, et surtout la virtualisation Intel VT-x/AMD-V, et l'image d'installation

![matériel](/images/2026-01-06-23-47-32.png)

## Lancement

C'est ici qu'il faut être attentif, lors dud démarrage on doit faire `MAJ+O` pour atteindre les options de boot, et on peut ajouter `systemMediaSize=min`

![mediasize](/images/2026-01-07-00-14-43.png)

On valide quelques questions puis on entre le mot de passe root et l'installation se termine

![Done](/images/2026-01-07-00-18-46.png)

Après reboot on arrive bien sur le DCUI (Direct Console User Interface)

![DCUI](/images/2026-01-07-00-23-44.png)

On peut entrer dans la configuration réseau avec F2

![log](/images/2026-01-07-11-11-38.png)

On passe en IP Static

![menu](/images/2026-01-07-11-12-47.png)

On peut maintenant se connecter à l'interface via <https://192.168.1.66/> et on arrive sur notre fenêtre de log

![log](/images/2026-01-07-00-25-22.png)

Une fois connecté avec notre password root :

![OK](/images/2026-01-07-00-26-23.png)

## Espace Disque

Apparemment l'option n'a pas fonctionné, on a pas de disque de stockage disponible dans Stockage / Banque de données / Nouvelle banque de données > Pas de périphérique disponible.

C'est rageant.

On va donc devoir ajouter un second disque à notre VM :

![ajout disque](/images/2026-01-07-00-48-26.png)

![esxi disque](/images/2026-01-07-00-47-17.png)

Une fois que c'est fait on peut y télécharger une image disque pour une future VM

![image](/images/2026-01-07-00-55-36.png)

Et lancer la création nd'une nouvelle VM

![ajout VM](/images/2026-01-07-00-58-23.png)

![VM](/images/2026-01-07-00-59-03.png)
