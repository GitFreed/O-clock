# Challenge C102 10/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-10-16-04-23.png)

[Challenge C102]<https://kourou.oclock.io/ressources/recap-quotidien/aldebaran-administrateur-cybersecurite-sc01e02-agile-et-outils/>

[Cours C102.](/RESUME.md#-c102-agilité-scrum--outils-projet)

---

Suite à notre fiche de cadrage du projet hier on va effectuer le découpage en WBS, la matrice RACI et le diagramme de Gantt.

### 1. Le WBS (Work Breakdown Structure) 📊

Découpage du projet en Grands Lots (Niveau 1) puis en Tâches (Niveau 2/3)

```mermaid
graph LR
    %% Le Projet Global
    Project[🚀 Projet Modernisation Infra Campus]
    
    %% Les Grands Lots
    Lot1[1. Infrastructure Réseau]
    Lot2[2. Sécurité & Périmètre]
    Lot3[3. Systèmes & Stockage]
    Lot4[4. Gestion & Transverse]

    %% Liaisons Projet -> Lots
    Project --> Lot1
    Project --> Lot2
    Project --> Lot3
    Project --> Lot4

    %% Tâches Lot 1 (Réseau)
    Lot1 --> L1T1[1.1 Installation Physique<br/>Baie & Switchs]
    Lot1 --> L1T2[1.2 Config. Logique<br/>VLANs & Routage]
    Lot1 --> L1T3[1.3 Déploiement Wi-Fi<br/>Bornes & Portail]

    %% Tâches Lot 2 (Sécurité)
    Lot2 --> L2T1[2.1 Install. Physique<br/>Rackage Firewall]
    Lot2 --> L2T2[2.2 Règles de Filtrage<br/>Flux & URL]
    Lot2 --> L2T3[2.3 Accès Distants<br/>VPN Admin]

    %% Tâches Lot 3 (Stockage)
    Lot3 --> L3T1[3.1 Mise en service NAS<br/>RAID & Volumes]
    Lot3 --> L3T2[3.2 Droits & Accès<br/>ACL & Groupes]
    Lot3 --> L3T3[3.3 Migration<br/>Transfert Données]

    %% Tâches Lot 4 (Transverse)
    Lot4 --> L4T1[4.1 Documentation<br/>Plan IP & Schémas]
    Lot4 --> L4T2[4.2 Accompagnement<br/>Formation Alternant]
    Lot4 --> L4T3[4.3 Recette<br/>PV de fin]

    %% Styles
    style Project fill:#2c3e50,stroke:#34495e,stroke-width:4px,color:#fff
    style Lot1 fill:#3498db,stroke:#2980b9,color:#fff
    style Lot2 fill:#e74c3c,stroke:#c0392b,color:#fff
    style Lot3 fill:#f1c40f,stroke:#f39c12,color:#000
    style Lot4 fill:#9b59b6,stroke:#8e44ad,color:#fff
```

### 2. Matrice RACI (Alignée WBS) 📋

| WBS | Tâche / Activité | Responsable IT | Alternant | Direction | Staff & Profs |
| --- | --- | --- | --- | --- | --- |
| **1** | **LOT 1 : INFRA RÉSEAU** | | | | |
| 1.1 | Installation Physique (Baie, Câblage) | **A** | **R** | I | - |
| 1.2 | Config. Logique (VLANs, Routage) | **R/A** | C | I | - |
| 1.3 | Déploiement Wi-Fi (Bornes, Portail) | **A** | **R** | - | I |
| **2** | **LOT 2 : SÉCURITÉ (FIREWALL)** | | | | |
| 2.1 | Rackage & Branchement Firewall | **A** | **R** | - | - |
| 2.2 | Règles de Filtrage & URL | **R** | I | **A** | C |
| 2.3 | Config. VPN Admin | **R** | I | - | - |
| **3** | **LOT 3 : STOCKAGE (NAS)** | | | | |
| 3.1 | Mise en service (RAID, Volumes) | **A** | **R** | - | - |
| 3.2 | Gestion des Droits (ACL, Groupes) | **A** | **R** | I | C |
| 3.3 | Migration des Données | **A** | **R** | I | I |
| **4** | **LOT 4 : TRANSVERSE** | | | | |
| 4.1 | Documentation Technique | **A** | **R** | - | - |
| 4.2 | Formation / Transfert de compétences | **R** (Formateur) | **I** (Apprenant) | - | - |
| 4.3 | Recette & PV de fin | **A** | **R** (Exécute les tests) | **I** (Signe) | - |

**R**éalisateur - **A**pprobateur - **C**onsulté - **I**nformé

### 3. Diagramme de Gantt 🗓️

![Gantt](/images/2026-02-10-18-54-29.png)
