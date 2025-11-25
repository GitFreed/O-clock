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

## 4. Audit
