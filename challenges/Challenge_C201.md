# Challenge C201 16/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-16-17-46-10.png)

[Cours C201.](/RESUME.md#️-c201-introduction-au-cloud-computing)

> - Comparaison des 3 : <https://docs.cloud.google.com/docs/get-started/aws-azure-gcp-service-comparison?hl=fr>

---

## Les 3 principaux fournisseurs Cloud

- **Google Cloud Platform**

![Google](/images/2026-02-16-17-40-41.png)

- **Amazon Web Service**

![Amazon](/images/2026-02-16-17-41-59.png)

- **Microsoft Azure**

![Microsoft](/images/2026-02-16-17-41-17.png)

Avis personnel, Azure parait plus ergonomique à première vue

### 1. Les Similitudes 🤝

Peu importe le fournisseur, le concept reste identique : **On loue la puissance de calcul de quelqu'un d'autre.**

- **Le modèle économique :** "Pay-as-you-go" (on paie uniquement ce qu'on consomme).
- **L'Infrastructure :** Ils sont tous organisés géographiquement en **Régions** (ex: Paris, Francfort) et en **Zones de Disponibilité** (Datacenters physiques séparés pour la sécurité).
- **Les 3 Piliers Techniques :** On retrouve partout la même base :
    1. **Compute :** Louer des ordinateurs virtuels (VM).
    2. **Storage :** Stocker des fichiers (un espace de stockage programmable).
    3. **Network :** Créer des réseaux privés virtuels (VPC/VNet).

### 2. Les Différences 🥊

Voici comment on peut les distinguer rapidement :

- **AWS (Amazon Web Services) - Le Pionnier 👑**
  - **C'est quoi ?** Le plus ancien (2006) et le plus utilisé mondialement.
  - **Points forts :** Un catalogue de services immense et une documentation infinie. C'est le standard du marché.
  - **Point faible :** L'interface peut parfois sembler austère et complexe pour un débutant.

- **Azure (Microsoft) - Le Corporatiste 💼**
  - **C'est quoi ?** Le Cloud parfaitement intégré à l'écosystème Microsoft.
  - **Points forts :** Si on utilise déjà Windows Server, Active Directory ou Office 365, c'est le choix naturel. Très performant sur l'hybride (mélange Cloud + Serveurs locaux).
  - **Point faible :** Les noms des services ont tendance à changer régulièrement.

- **GCP (Google Cloud Platform) - L'Innovateur 🤓**
  - **C'est quoi ?** Le Cloud construit sur l'infrastructure technique de Google.
  - **Points forts :** Souvent considéré comme le meilleur pour la **Data**, l'**IA** et les **Conteneurs** (Kubernetes vient de chez eux). L'interface est souvent jugée plus propre et rapide.
  - **Point faible :** Moins de services "legacy" (anciens systèmes d'entreprise) qu'AWS ou Azure.

### 3. Tableau des équivalences 🗺️

| Service | **AWS** (Amazon) 🟧 | **Azure** (Microsoft) 🟦 | **GCP** (Google) 🟥 |
| --- | --- | --- | --- |
| **Machine Virtuelle** | EC2 (Elastic Compute Cloud) | Azure Virtual Machines | Compute Engine |
| **Stockage Fichiers** | S3 (Simple Storage Service) | Azure Blob Storage | Cloud Storage |
| **Base de Données** | RDS | Azure SQL Database | Cloud SQL |
| **Serverless (Code)** | Lambda | Azure Functions | Cloud Functions |

### 💡 Le "Free Tier"

Il faut rester vigilant sur les conditions des offres gratuites :

- **AWS :** Crédit de 100$ jusqu'à 200$ en complétant des tutos + certains services gratuits.
- **Azure :** Crédit de 200$ (valable 30 jours) + certains services gratuits.
- **GCP :** Crédit de 300$ (valable 90 jours) + un programme "Always Free" assez généreux.
