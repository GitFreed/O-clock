# Challenge A405 25/11/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge A405](/images/2025-11-25-15-29-34.png)

[Cours A405.](https://github.com/GitFreed/O-clock/blob/main/RESUME.md#️-a405-gestion-du-stockage--filtres-quotas--audit)

> Audit des accès aux Fichiers et Dossiers - RDR-IT : <https://rdr-it.com/serveur-fichiers-windows-enregistrer-acces-fichiers-dossiers/>
>
> Audit des Groupes de Sécurité de l'AD - ITconnect : <https://www.it-connect.fr/audit-des-groupes-de-securite-de-lactive-directory/>

---

## 1. Mappage de lecteurs

![Mappage](/images/2025-11-25-11-52-24.png)

![Propriétés](/images/2025-11-25-11-55-00.png)

## 2. Ressource Manager

Installation

![Installation](/images/2025-11-25-13-24-09.png)

Outils : Gestionnaire de ressources du serveur de fichiers

- **Quotas**

Modèles : permet de voir les différents Quotas, attention Inconditionnel bloque totalement, Conditionnel est plus souple.

![Modèles](/images/2025-11-25-14-12-26.png)

Ajout de Quota sur un Disque

![Quota](/images/2025-11-25-14-05-47.png)

![Quota disque](/images/2025-11-25-14-07-09.png)

![Test](/images/2025-11-25-14-33-20.png)

- **Filtres**

Types de fichiers et ajout règle personnalisée

![fichiers](/images/2025-11-25-14-36-59.png)

Ajout de filtres, et paramètre des alertes

![modèles](/images/2025-11-25-14-22-25.png)

Création du filtre sur le disque

![filtres](/images/2025-11-25-14-26-44.png)

![test](/images/2025-11-25-14-39-06.png)

## 3. Appliquer un Quota et Filtre aux 2 lecteurs des Promos

On va limiter le Disque Commun à 10 Go strict, et chaque Promo à 5 Go.

![Quotas](/images/2025-11-25-15-10-57.png)

![OK](/images/2025-11-25-15-11-38.png)

On va créer un Filtre pour bloquer les fichier exécutables ET audios/vidéos

![filtre perso](/images/2025-11-25-15-16-46.png)

![filtres](/images/2025-11-25-15-17-24.png)

## 4. Audit des fichiers et dossiers

**Création de l'audit sur le dossier cible**, on va faire le dossier commun et l'activer pour tous les sous-dossiers & fichiers pour ne pas à avoir à le faire pour chaque promo

![create](/images/2025-11-25-17-09-23.png)

Configuration de l'audit

![config](/images/2025-11-25-17-10-33.png)

![OK](/images/2025-11-25-17-11-33.png)

**Configuration de la stratégie d’audit sur le serveur**, on va activer l’audit d’accès aux objets sur le serveur avec gpedit.msc. On configure puis gpupdate /force pour mettre à jour les stratégies

![pgedit](/images/2025-11-25-17-18-41.png)

Maintenant on peut visualiser les journaux Windows dans l’observateur d’événements

![obsrv](/images/2025-11-25-17-31-58.png)

Vu le nombre d'évènements (risque d'impacter les perfs du serveur) on va plutôt Auditer les Échecs pour monitorer les tentatives d'accès seulement

![Refus](/images/2025-11-25-17-33-35.png)

## 5. Audit des Groupes de Sécurité de l'AD

Activation de la GPO en question

![GPO](/images/2025-11-25-17-40-06.png)

![infos](/images/2025-11-25-17-42-46.png)

Création d'un affichage personnalisé dans l'Observateur d'évènements

- Par source : Microsoft Windows security auditing

- ID : 4727, 4728, 4729, 4730, 4731, 4732, 4733, 4734, 4735, 4737, 4754, 4755, 4756, 4757, 4758, 4764

![obsrv](/images/2025-11-25-18-00-22.png)

On peut maintenant voir  les modifications sur nos Groupes de Sécurité, ici l'administrateur a créé un groupe GS_TEST sur le domaine OCLOCK.
