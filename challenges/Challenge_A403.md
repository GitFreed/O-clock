# Challenge A403 19/11/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge A403](/images/⌨️%20Tester%20les%20stratégies%20de%20GPO.png)

[Cours A403. Stratégies de Groupe (GPO)](https://github.com/GitFreed/O-clock/blob/main/RESUME.md#️-a403-stratégies-de-groupe-gpo)

---

## 1. Utilisateurs et Groupes

Utilisateurs et Groupes : Membres / Membre de, gestion en arborescence

![Groupes](/images/2025-11-21-14-08-32.png)

## 2. GPO

Gestion de Stratégie de Groupe (dans Outils)

![GPO](/images/2025-11-21-14-06-56.png)

En faisant clic droit:modifier sur la Stratégie Default Domain Policy, on peut éditer les règles GPO

![Edit des règles](/images/2025-11-21-14-22-16.png)

On peut créer une nouvelle Stratégie, et décider de l'appliquer seulement à la promo Andromede en y glissant le lien de la GPO dans l'Unité d'Organisation

![appliquer](/images/2025-11-21-15-46-03.png)

90min de délais si on change, pour le forcer :  GPUpdate /force puis déco/reco l'utilisateur

![gpudate](/images/2025-11-21-15-00-08.png)

## 3. GPO Fond d'écran locked

On crée un dossier partagé à tout le monde (en lecture seule) sur le domaine dans le serveur

![shared folder](/images/2025-11-21-22-01-28.png)

Pour mettre le fond d'écran on va activer le Modèle d'administration : Bureau : Bureau : Papier Peint Bureau et spécifier l'emplacement de celui ci (chemin réseau UNC : \\WS2025\Users\Administrateur\Pictures\Shared\FreedexploreTunnel.jpg)

![desktop](/images/2025-11-21-22-14-11.png)

Pour interdire aux utilisateurs de le changer on va dans Modèles d'administration : Panneau de configuration : Personnalisation : Empêcher de modifier l'arrière plan du bureau

![lockeddesk](/images/2025-11-21-22-38-58.png)

Une fois les règles déterminées on déplace ma GPO au dessus des Unités d'organisation pour leur appliquer

![GPO](/images/2025-11-21-23-07-52.png)

En se connectant à une session des promos, on a effectivement le nouveau Fond d'écran et pas la possibilité de le modifier !
