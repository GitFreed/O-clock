# Atelier A408 01/12/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge A408](/images/2025-12-01-17-40-16.png)

[Cours A408.](/RESUME.md#️-a408-pools-iis-authentification-et-backup)

---

## 1. Suppression d'un utilisateur AD

![delete](/images/2025-12-01-17-44-28.png)

N'étant plus dans l'AD l'utilisateur Roman Beldent ne peux plus se connecter, on va devoir restaurer son profil.

## 2. Récupération

On ne peux pas récupérer l'AD directement car c'est un système critique qui est utilisé en continu, il faut donc le faire en mode sans échec via MSconfig

![reboot](/images/2025-12-01-18-01-09.png)

Se connecter en Local vu que l'AD est désactivé

![local](/images/2025-12-01-18-09-31.png)

Sauvegarde Windows Server > Récupérer > Sauvegarde > Applications > AD

![old](/images/2025-12-01-17-51-18.png)

Récupération réussie

![récup](/images/2025-12-01-18-56-16.png)

Les fichiers de la récupération sont là, on peut remplacer les anciens fichiers par ces derniers, puis désactiver le mode sans échec et redémarrer, se reconnecter au domaine Oclock.

![restauration](/images/2025-12-01-17-56-04.png)

L'utilisateur Roman est de nouveau là et peut se connecter !

![Romanback](/images/2025-12-01-18-54-38.png)
