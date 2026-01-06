# Challenge B102 06/01/2026

## Pitch de l’exercice 🧑‍🏫

>⌨️ Pitch de l'exercice :
>
>Installer ESXi (l'hyperviseur), qui est la brique de base de la suite vSphere

[Cours B102.](/RESUME.md#️-b102-proxmox-ve--infrastructure-haute-disponibilité)

---

## Définitions / compréhension du système

ESXi est à VMware ce que Proxmox VE est à Linux.

- C'est un **Hyperviseur de Type 1** (Bare-Metal). Il s'installe directement sur le matériel (ici simulé par VMware Workstation).

- **Son rôle** : Il ne fait que gérer des VMs. Il n'a pas d'interface graphique locale (juste un écran jaune et gris moche). Tout se gère via une page web depuis un autre PC.

- **La différence** : Contrairement à Proxmox qui est libre et très flexible, ESXi est un système propriétaire "fermé", ultra-stable mais très strict.

- Un seul serveur ESXi est "Standalone", si on installe un deuxième ESXi et qu'on les relies avec vCenter, on aura une "Infrastructure vSphere".

## Installation

