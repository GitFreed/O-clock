# Challenge C104 12/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-12-22-54-12.png)

**Challenge C104 :** <hhttps://gist.github.com/stephdl/8b39256712f17ec1c183ea9aee2c3266#%C3%A9nonc%C3%A9-e4>

[Cours C104.](/RESUME.md#️-c104-sécurité-et-continuité-dactivité)

---

## 🛡️ Mini-PRA/PCA : Projet Infra Campus

### 1. Le Scénario de Crise : "Ransom-Chocolatine" 🥐

**L'Incident :** Lundi matin, 8h30. Une secrétaire ouvre une pièce jointe nommée `Facture_Croissants.exe`. Le ransomware **"Ransom-Chocolatine"** se déploie.

**Les Symptômes :**
    - Tous les fichiers du NAS (Dossiers Admin & Pédago) sont chiffrés et renommés en `.miam`.
    - Le fond d'écran des PC affiche : *"Pas de bras, pas de chocolat. Payez 5 Bitcoins ou vos cours disparaissent"*.
    - Le serveur d'authentification (Active Directory) est tombé : plus personne ne peut se loguer ni accéder au Wi-Fi.

**Impact :** Arrêt total de l'activité numérique du campus (500 personnes bloquées).

---

### 2. Mesures Préventives

Basé sur la Fiche 1 (Maîtriser ses SI) et Fiche 2 (Socle de résilience)  du guide ANSSI.

| Type | Mesure | Détail Technique |
| --- | --- | --- |
| **Technique** | **Stratégie de Sauvegarde 3-2-1** | C'est la règle d'or. 3 copies des données (Prod + Local + Cloud), 2 supports différents (NAS Synology + Stockage Objet) et 1 copie hors site (Cloud chiffré et Immuable). |
| **Technique** | **Sauvegardes Déconnectées** ("Cold Backup") | Chaque nuit, le NAS envoie une copie chiffrée vers un Cloud souverain (ex: OVH/Scaleway) avec l'option "Lock" activée. Même si l'admin est piraté, personne ne peut supprimer ces backups avant 30 jours. |
| **Technique** | **Segmentation Réseau (VLAN)** | Comme vu dans le Challenge précédent, les VLANs "Admin" et "Étudiants" sont séparés par le Firewall. Si un étudiant infecte le réseau, l'Admin est protégé (et inversement). |
| **Humain** | **Sensibilisation** | Formation des 15 salariés permanents à ne pas ouvrir les pièces jointes douteuses (Phishing). |
| **Orga.** | **Documents "Papiers"** | Une copie papier de l'annuaire de crise (numéros des profs, du directeur, du support FAI) est stockée dans le bureau de la Direction. |

---

### 3. Procédure de Reprise

Basé sur la Phase 2 (Réagir) et Phase 3 (Relancer).

#### Phase A : Réaction Immédiate (0h - 4h)

* **Action 1 (Endiguement) :** **DÉBRANCHER TOUT !** L'alternant court en salle serveur et débranche les câbles réseaux des switchs pour empêcher la propagation. Le Wi-Fi est coupé.

* **Action 2 (Mode Dégradé) :** La Direction annonce le passage en mode "Papier". Les profs font cours au tableau blanc. Les émargements se font sur feuille.

* **Action 3 (Diagnostic) :** Le Responsable IT identifie la souche du virus et confirme que la sauvegarde Cloud n'est pas touché (grâce à l'immuabilité).

#### Phase B : Reconstruction & Reprise (4h - 48h)

Suivant la Fiche 16 de l'ANSSI.

1. **Isolement :** On ne réutilise PAS les disques infectés tout de suite. On installe un environnement propre.
2. **Restauration Prioritaire (Tier 1) :**
    * Téléchargement prioritaire de la sauvegarde Cloud de la veille (J-1) pour :
        * Réinstallation du Serveur d'Authentification (pour que les gens puissent se loguer).
        * Restauration du **Dossier "Admin/Compta"** depuis la sauvegarde froide (pour payer les factures et salaires).

3. **Restauration Secondaire (Tier 2) :**
    * Restauration des dossiers "Pédagogie/Cours".
    * Réouverture progressive du Wi-Fi (VLAN par VLAN) après scan antivirus des postes.

---

### 4. Responsables & Délais (RTO / RPO)

Définitions issues du glossaire ANSSI.

| Indicateur | Valeur Cible | Description |
| --- | --- | --- |
| **RPO** (Perte de données max acceptée) | **24 Heures** | On accepte de perdre le travail de la journée en cours, mais on récupère tout ce qui a été sauvegardé la veille au soir sur le Cloud. |
| **RTO** (Durée max d'interruption) | **48 Heures** | L'école peut fonctionner 2 jours en mode "papier". Au-delà, l'impact administratif devient critique. |
| **Responsable IT** | | Décide de la coupure, valide la sauvegarde, lance la restauration depuis le Cloud coordonne la crise. |
| **Exécutant** | **L'Alternant** | Débranche les câbles, réinstalle les OS, passe sur les postes pour scanner. |

---

### 5. Indicateurs de Succès (KPI)

Comment saura-t-on que le PRA a réussi ?

1. **Intégrité des données critiques :** 100% des fichiers comptables et administratifs sont récupérés et lisibles.
2. **Respect du RTO :** Le réseau Admin est opérationnel en moins de 48h grace à la Fibre et au Cloud.
3. **Non-Réinfection :** Aucune nouvelle alerte "Ransom-Chocolatine" dans les 7 jours suivant la remise en route (preuve que la faille est bouchée).

---

### *"Conformément à la Fiche 11 du guide ANSSI, nous déclarerons l'incident sur la plateforme cybermalveillance.gouv.fr et déposerons plainte, car il s'agit d'un acte de viennoiserie criminelle"*
