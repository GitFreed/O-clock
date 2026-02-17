# Challenge C202 17/02/2026

## Pitch de l’exercice 🧑‍🏫

[Challenge C202](https://github.com/O-clock-Aldebaran/SC2E02-consulting-GitFreed)

---

Consulting Cloud pour PME — Énoncé simplifié :

## Contexte

Vous êtes consultant chez **TechConseil**. Votre client **MediCare+** (PME de services de santé) veut moderniser son IT. L’infrastructure est 100% on‑premises et l’équipe est peu à l’aise avec le cloud.

Votre mission : **proposer une stratégie cloud simple, cohérente et réaliste**.

---

## Le client en bref

- 50 employés, siège à Lyon, agences à Marseille et Paris
- Application métier interne (PHP/MySQL), critique pour l’activité
- Site web vitrine WordPress
- Données sensibles mais **pas** de dossiers médicaux complets
- Un administrateur système à mi‑temps

---

## Infrastructure actuelle (résumé)

- Active Directory + DNS/DHCP sur un serveur Windows
- Application métier + base MySQL + fichiers sur un serveur Windows
- Site web sur un petit serveur Linux
- NAS + sauvegardes manuelles
- VPN inter‑sites

Coût annuel estimé : **~46 000 €**

---

## Problèmes constatés

- Coûts élevés et matériel à renouveler
- Disponibilité limitée, sauvegardes manuelles
- Accès distant difficile pour le télétravail
- Montée en charge compliquée
- RGPD pas assez cadré

---

## Objectifs du client

- Réduire les coûts et la maintenance
- Améliorer disponibilité et collaboration
- Sécuriser et cadrer la conformité RGPD
- Préparer la croissance

---

> [Cours C202.](/RESUME.md#-c202-les-fournisseurs-cloud-providers)

---

C'est un cas pratique  représentatif de la réalité des PME françaises aujourd'hui. Le piège ici, c'est de vouloir faire du "tout cloud" complexe alors que le client a un admin à mi-temps et des besoins simples.

Pour la bureautique (mails, fichiers, collaboration), il est très difficile de battre Microsoft 365 (SaaS) en termes d'efficacité.

Voici la proposition basée sur une approche **Hybride**

---

## 📄 Recommandation Stratégique Cloud - MediCare+

### 1. Architecture Cible

L'idée est de décharger l'administrateur de la gestion matérielle (serveurs physiques) et d'utiliser des services gérés là où c'est possible.

| Composant | Proposition | Modèle | Provider | Justification courte |
| --- | --- | --- | --- | --- |
| **Identités** | Microsoft Entra ID (ex-Azure AD) | **SaaS** | Microsoft | Inclus avec Office. Gère les accès sécurisés (MFA) simplement. |
| **Messagerie + Bureautique** | Microsoft 365 Business Standard | **SaaS** | Microsoft | Le standard du marché. Fiabilité 99.9%, plus de serveur Exchange à gérer. |
| **Fichiers partagés** | SharePoint / OneDrive | **SaaS** | Microsoft | Remplace le NAS. Accès natif en télétravail, gestion des versions, sécurisé. |
| **App métier (PHP)** | Public Cloud Instance (Calcul) | **IaaS** | **OVHcloud** | Flexibilité totale pour configurer l'environnement PHP spécifique. |
| **Base de données** | Managed Cloud Database for MySQL | **PaaS** | **OVHcloud** | OVH gère les backups et la maintenance. Haute dispo incluse. |
| **Sauvegardes** | Veeam Enterprise (Managed) | **BaaS** | **OVHcloud** | Sauvegarde externalisée et immuable (protection ransomware). |
| **Site web** | Hébergement Web Pro (Mutualisé) | **PaaS** | **OVHcloud** | Suffisant pour un WordPress vitrine, coût dérisoire, maintenance nulle. |

---

### 2. Schéma d'Architecture Simplifié

Voici à quoi ressemble le flux de données :

```text
       UTILISATEURS (Siège, Agences, Télétravail)
            │
            ▼
    [ INTERNET SÉCURISÉ (HTTPS / VPN optionnel) ]
            │
    ┌───────┴──────────────────────────────┐
    │                                      │
    ▼                                      ▼
[ MICROSOFT 365 (SaaS) ]           [ OVHCLOUD (IaaS / PaaS) ]
(Identité, Mails, Fichiers)        (Zone Hébergement Santé - HDS)
                                           │
                                           ├─► Serveur App Métier (Instance)
                                           ├─► Base de Données (Managed SQL)
                                           └─► Sauvegardes (Object Storage)

```

---

### 3. Choix du Provider

Comparatif axé sur les besoins de MediCare+ (PME Santé).

| Critère | Azure (Microsoft) | AWS (Amazon) | **OVHcloud (Retenu)** |
| --- | --- | --- | --- |
| **Localisation / Souveraineté** | Data centers en France, mais soumis au Cloud Act (USA). | Idem Azure. | **France & Europe**. Souveraineté totale, pas de Cloud Act. |
| **Certification Santé** | HDS (Hébergeur Données Santé). | HDS. | **HDS**. Très populaire chez les acteurs de santé français. |
| **Services managés (PaaS)** | Catalogue immense, très complexe. | Le leader, mais usine à gaz pour une PME. | **Offre ciblée**. Suffisante pour du Web/SQL (Simple). |
| **Coût estimé** | Élevé (facturation à la minute/ressource complexe). | Élevé et difficile à prédire (frais de trafic sortant). | **Modéré et prédictible**. Pas de frais cachés de bande passante. |
| **Support / Simplicité** | Support payant cher. Interface complexe. | Support payant. Courbe d'apprentissage raide. | Support standard inclus. Interface plus simple. |

**Conclusion :**
Nous retenons **OVHcloud** pour l'hébergement de l'application métier et des données.
**Pourquoi ?** C'est le seul acteur garantissant une **souveraineté totale des données (RGPD/HDS)** sans risque juridique US, tout en offrant des coûts **2 à 3 fois inférieurs** aux hyperscalers américains pour ce type de charge simple. L'administrateur à mi-temps s'y retrouvera plus facilement.

*(Note : Nous conservons Microsoft uniquement pour la bureautique car OVH ne propose pas d'équivalent crédible à la suite Office/Teams).*

---

### 4. Estimation Budgétaire (Mensuelle)

*Comparé aux ~3 800 € / mois actuels (46k€ / 12).*

- **Licences Utilisateurs (Microsoft 365)** : 50 utilisateurs x 11,70€ = **585 €**
- **Infrastructure App (OVHcloud)** :
  - Instance Public Cloud (b2-15 - 4 vCores, 15GB RAM) : **~45 €**
  - Managed Database MySQL (Business plan) : **~50 €**

- **Hébergement Web (OVHcloud)** : Offre Pro : **~6 €**
- **Sauvegarde & Réseau** : Stockage S3 + Trafic : **~50 €**
- **Marge de sécurité (10%)** : **~75 €**

**TOTAL ESTIMÉ : ~811 € / mois** (soit ~9 700 € / an).

📉 **Gain :** Division par 4 des coûts annuels par rapport à l'infrastructure on-premise vieillissante.

---

### 5. Points d'attention (Risques & Solutions)

- **Dépendance à la connexion Internet** :

  - *Risque :* Plus de serveurs locaux = plus de travail si internet coupe.
  - *Solution :* Installer une **fibre pro garantie (GTR)** et garder une ligne 4G/5G de secours (Failover) au siège.

- **Adoption Utilisateur (Changement)** :

  - *Risque :* Les employés sont habitués à leur vieux serveur de fichiers ("Lecteur Z:"). Passer sur SharePoint peut frustrer.
  - *Solution :* Formation obligatoire d'une demi-journée et synchronisation OneDrive pour garder l'aspect "Explorateur de fichiers".

- **Sécurité des Identités** :

  - *Risque :* Avec l'accès à distance facilité, un mot de passe volé est critique.
  - *Solution :* Activer obligatoirement le **MFA (Authentification Multi-Facteurs)** pour tous les comptes via Microsoft 365.

- **Compétence de l'admin** :

  - *Risque :* L'admin connait Windows Server, pas Linux/Cloud.
  - *Solution :* Lui payer une formation "OVH Public Cloud" et l'infogérance partielle (Support OVH niveau Business) pour les premiers mois.
