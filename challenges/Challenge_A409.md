# Atelier A409 02/12/2025

## Pitch de l’exercice 🧑‍🏫

![challenge](/images/2025-12-03-13-56-02.png)

[Cours A409.](/RESUME.md#-a409-windows-deployment-services-wds)

---

## 1. Ajouter une image de démarrage Windows 10 dans WDS à partir d’un ISO

![IMAGE boot](/images/2025-12-03-14-09-01.png)

## 2. Ajouter une image d’installation Windows 10 et vérifier sa présence dans les groupes WDS

![IMAGE install](/images/2025-12-03-14-06-31.png)

## 3. Activer ou vérifier l’Option 60 si DHCP et WDS sont sur le même serveur

![DHCP option](/images/2025-12-03-13-58-21.png)

![network boot](/images/2025-12-03-14-00-45.png)

## 4. Tester un boot PXE sur une VM et observer les étapes de connexion au serveur WDS

On ajoute une nouvelle VM dans proxmox, sans aucun OS, vu qu'on a mis l'option 60 dans le DHCP de notre pfsense notre VM doit être en UEFI.

Lors du démarrage on peut voir le PXE en action

![PXE](/images/2025-12-02-15-16-33.png)

Chargement de l'image

![Loading](/images/2025-12-02-15-44-34.png)

Installation de Windows OK

![Windows install](/images/2025-12-02-15-44-51.png)

## 5. Bonus : Ajouter les pilotes VirtIO au boot PXE

![PILOTES](/images/2025-12-03-14-07-12.png)
