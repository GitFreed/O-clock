# Atelier A409 02/12/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Challenge A409

Tester l'installation d'une machine par déploiement de service (PXE)

[Cours A409.](/RESUME.md#-a409-windows-deployment-services-wds)

---

## 1. Création de la VM

On ajoute une nouvelle VM dans proxmox, sans aucun OS, vu qu'on a mis l'option 60 dans le DHCP de notre pfsense notre VM doit être en UEFI.

## 2. Démarrage et installation

Lors du démarrage on peut voir le PXE en action

![PXE](/images/2025-12-02-15-16-33.png)

Chargement de l'image

![Loading](/images/2025-12-02-15-44-34.png)

Installation de Windows OK

![Windows install](/images/2025-12-02-15-44-51.png)
