# Challenge C101 09/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-09-14-46-28.png)

[Challenge C101]<https://gist.github.com/stephdl/8b39256712f17ec1c183ea9aee2c3266>

[Cours C101.](/RESUME.md#️-c101-les-fondamentaux-de-la-gestion-de-projet)

---

## 📄 Fiche de Cadrage : Modernisation Infrastructure du Campus

### 1. Contexte

L'établissement est un campus de formation professionnelle accueillant environ **500 personnes** (15 salariés, formateurs freelance, apprenants). L'infrastructure actuelle est vieillissante et ne permet plus de supporter les nouveaux usages pédagogiques. La direction a mandaté le service informatique (composé du Responsable IT et d'un alternant) pour moderniser l'ensemble du réseau et des services de stockage.

### 2. Objectifs du projet

Le but est de garantir un environnement de travail performant, sécurisé et collaboratif.

* **Centralisation :** Mettre en place un stockage partagé et sécurisé (NAS/Serveur de fichiers).
* **Sécurité :** Sécuriser les flux entrants/sortants et segmenter le réseau (Firewall, VLAN).
* **Connectivité :** Fournir un accès Wi-Fi sécurisé et performant pour la densité d'utilisateurs (500 pax).
* **Modernisation :** Remplacer les équipements obsolètes pour supporter la charge.

### 3. Périmètre et exclusions

* **✅ Inclus :**
  * Installation et configuration physique des nouveaux équipements (Switchs, Bornes Wi-Fi, NAS, Firewall).
  * Création de l'architecture réseau logique (Plan d'adressage IP, création des VLANs : Admin, Équipe, Invité).
  * Migration des données existantes vers le nouveau serveur de fichiers.
  * Documentation technique de la nouvelle infrastructure.
  * Formation basique des utilisateurs (comment se connecter au Wi-Fi, comment accéder au NAS).

* **❌ Exclus :**
  * Maintenance des ordinateurs personnels des étudiants.
  * Refonte du site web de l'école (c'est du dév/com, pas de l'infra).
  * Travaux de gros œuvre (câblage électrique dans les murs, percement de dalles béton) => à sous-traiter si nécessaire.

### 4. Parties Prenantes

* **Interne :**
  * **Commanditaire :** La Direction du campus.
  * **Chef de Projet / Réalisation :** Le Responsable Informatique.
  * **Équipe Projet :** L'alternant.
  * **Utilisateurs clés :** Les 15 salariés permanents (administration).

* **Externe :**
  * **Utilisateurs finaux :** Formateurs freelances et Apprenants.
  * **Fournisseurs :** Vendeurs de matériel, FAI.

#### Matrice RACI : Projet Infra Campus

| Phase / Tâche | Responsable IT | Alternant | Direction | Staff & Profs |
| --- | --- | --- | --- | --- |
| **1. CADRAGE** | | | | |
| Audit de l'existant & Inventaire | **A** | **R** | I | - |
| Définition des besoins & Budget | **R** | C | **A** | C |
| Conception Architecture (VLAN, IP) | **R** | I | I | - |
| **2. DÉPLOIEMENT** | | | | |
| Commande Matériel | **R** | I | **A** | - |
| Installation Physique (Rack, Bornes) | **A** | **R** | I | - |
| Config. Cœur (Firewall, Sécruité) | **R** | I | - | - |
| Config. Accès (Wi-Fi, Postes) | **A** | **R** | - | - |
| **3. CLÔTURE** | | | | |
| Tests & Recette | **A** | **R** | I | C |
| Documentation & Formation | **A** | **R** | I | I |

### 5. Livrables Principaux

1. **Dossier d'architecture technique (DAT) :** Schémas réseau, plan d'IP, règles de firewall.
2. **Infrastructure opérationnelle :** Baie de brassage câblée, Wi-Fi fonctionnel, NAS accessible.
3. **Documentation d'exploitation :** Procédures pour l'alternant (création compte, sauvegarde).
4. **PV de recette :** Document signé confirmant que tout fonctionne.

### 6. Contraintes QCD (Qualité - Coût - Délai)

* **Qualité :**
  * Haute disponibilité requise pendant les heures de cours (8h-18h).
  * Sécurité des données (RGPD) critique sur le serveur de fichiers (données administratives et notes).

* **Coût :**
  * Budget probablement contraint (secteur éducatif). Nécessité de comparer les devis.
  * Ressources humaines limitées (1 expert + 1 apprenti).

* **Délai :**
  * Les interruptions de service (coupure réseau pour installation) doivent se faire impérativement hors des heures de cours ou pendant les vacances scolaires.

---

### 7. Méthode Recommandée

Pour un projet d'infrastructure de cette taille avec une petite équipe, je recommande une approche **Hybride** :

1. **Structure globale en "Cycle en V" :**

* Pourquoi ? En infrastructure, on ne peut pas être 100% agile. On ne peut pas "installer la moitié d'un firewall". Il y a des dépendances physiques incontournables (Commande matériel -> Livraison -> Installation -> Config). On doit planifier l'achat.

1. **Gestion des tâches en Kanban (Agile) :**

* Pourquoi ? Pour le responsable et l'alternant au quotidien. Utiliser un tableau avec "À faire / En cours / Fait". C'est idéal pour gérer les imprévus du support utilisateur qui vont venir perturber le projet.

---

### 8. Commentaire sur le Manifeste Agile

![Manifeste](/images/2026-02-09-17-41-34.png)

[Manifeste Agile](https://agilemanifesto.org/iso/fr/principles.html)

Voici des pistes de réflexion à mettre dans ton fichier :

* **Point positif (Collaboration client) :** Le manifeste dit *"La collaboration avec les clients plus que la négociation contractuelle"*.
* *Application Infra :* Vrai. Il vaut mieux discuter avec les formateurs pour savoir s'ils ont besoin de beaucoup de bande passante pour de la vidéo, et savoir leur besoins réels plutôt que de suivre un cahier des charges rigide écrit il y a 6 mois.

* **Point critique (Documentation) :** Le manifeste dit *"Des logiciels opérationnels plus qu'une documentation exhaustive"*.
* *Critique Infra :* Attention ! En réseau/système, **la documentation est vitale**. Si on ne documente pas notre plan d'adressage IP ou nos mots de passe, le jour où le responsable est absent, l'alternant est perdu et le campus est en panne. Ici, l'infrastructure opérationnelle est la priorité, mais la documentation ne peut pas être sacrifiée.

* **Point critique (Changement) :** *"L'adaptation au changement plus que le suivi d'un plan"*.
* *Critique Infra :* Plus difficile en hardware. Si on a commandé 50 bornes Wi-Fi Cisco et qu'on décide de changer de marque au milieu, ça coûte très cher. L'infrastructure demande un peu plus de planification rigide que le développement d'une application.
