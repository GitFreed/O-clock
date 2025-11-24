# Challenge A404 24/11/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge A404](/images/⌨️%20Tester%20les%20stratégies%20de%20GPO.png)

[Cours A404.](https://github.com/GitFreed/O-clock/blob/main/RESUME.md)

---

## 1. Créer un nouveau dossier accessible à chaque promotion

Dans la partie Partages du Gestionnaire de Serveur > Services de fichiers de stockage

![Partages](/images/2025-11-24-15-32-29.png)

On reste en SMB Rapide, on définit sur quel volume, on ne met pas le chemin d'accès on va créer le dossier après.

![1](/images/2025-11-24-15-33-34.png)

On indique le nom du dossier qui va le créer.

![2](/images/2025-11-24-15-34-13.png)

Pour le moment on active pas l'énumération qui masquerait les dossiers aux utilisateurs sans autorisations, ils peuvent voir mais ne peuvent pas y accéder.

![3](/images/2025-11-24-15-34-33.png)

Au niveau des Autorisations on va personnaliser.

![4](/images/2025-11-24-15-37-27.png)

On va désactiver l'héritage (supprimer toutes) et refaire manuellement les autorisations.

![5](/images/2025-11-24-15-38-17.png)

![6](/images/2025-11-24-15-39-30.png)

![7](/images/2025-11-24-15-40-03.png)

On valide !

![8](/images/2025-11-24-15-40-50.png)

![9](/images/2025-11-24-15-41-09.png)

![10](/images/2025-11-24-15-44-46.png)

On refait pareil pour l'autre promo.

## 2. Test des partages

En tapant \\WS2025 dans l'explorateur, Bob de la promo Andromède accède bien au dossier partagé et peur y créer des documents.

![11](/images/2025-11-24-15-49-30.png)

Par contre il ne peut pas accéder à celui de la promo Aldébaran.

![12](/images/2025-11-24-15-51-03.png)
