# Challenge C103 11/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-11-14-32-44.png)

**Challenge C103 :** <https://gist.github.com/stephdl/8b39256712f17ec1c183ea9aee2c3266>

[Cours C103.](/RESUME.md#-c103-gestion-des-risques)

---

## 🚦 Registre des Risques - Projet Infra Campus

Suite à notre fiche de cadrage, au découpage WBS, de la matrice RACI et du diagramme de Gantt on doit analyser les risques pour notre projet.

### 1. Légende de la Criticité (Matrice 3x3)

* **Probabilité (P) :** 1 (Faible), 2 (Moyenne), 3 (Forte)
* **Impact (I) :** 1 (Faible), 2 (Moyen), 3 (Critique)
* **Calcul :** Criticité = P × I

| Score | Zone | Signification |
| --- | --- | --- |
| **6 à 9** | 🟥 **CRITIQUE** | **Inacceptable.** Le projet ne peut pas réussir sans un plan d'action immédiat. |
| **3 à 4** | 🟧 **MAJEUR** | **À surveiller.** Il faut réduire la probabilité ou l'impact. |
| **1 à 2** | 🟩 **MINEUR** | **Acceptable.** On accepte le risque, pas d'action prioritaire requise. |

---

### 2. Tableau des Risques

| ID | Description du Risque | Type | Probabilité | Effet / Conséquence | Niveau d'Impact | Criticité | Plan d'Action (Mitigation) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| **R01** | **Retard livraison matériel** (Switch/Firewall) | Fournisseur | 3🟧 | **Projet Bloqué** (Impossible d'installer) | 3🟧 | **9**🟥 | Commander le matériel **J+1** après validation. Vérifier stock fournisseur avant commande. |
| **R02** | **Perte de données** (Migration NAS) | Technique | 2🟩 | **Critique** (Perte irréversible cours/notes) | 3🟧 | **6**🟥 | Sauvegarde "à froid" sur disque externe déconnecté avant toute intervention. |
| **R03** | **Coupure réseau pendant les cours** | Opérationnel | 2🟩 | **Service Interrompu** (Arrêt des cours) | 3🟧 | **6**🟥 | Interventions critiques (Cœur de réseau) planifiées **uniquement** le soir ou weekend. |
| **R04** | **Erreur de config critique** (Alternant) | Humain | 3🟧 | **Dysfonctionnement** (Retard de diagnostic) | 2🟩 | **6**🟥 | Supervision stricte. L'alternant propose la config, le Responsable IT **valide avant application**. |
| **R05** | **Incompatibilité vieux câblage** | Technique | 2🟩 | **Surcoût / Délai** (Travaux supplémentaires) | 2🟩 | **4**🟧 | Test de continuité des prises (Fluke) en semaine 1 (Audit). Prévoir budget recâblage partiel. |
| **R06** | **Dépassement budget** (imprévus) | Financier | 2🟩 | **Blocage Achats** (Négociation nécessaire) | 2🟩 | **4**🟧 | Bloquer une réserve de **10%** du budget global pour les aléas (câbles, goulottes). |
| **R07** | **Indisponibilité Responsable IT** | Humain | 1🟩 | **Blocage Décisionnel** (Perte de connaissance) | 3🟧 | **3**🟧 | Documentation au fil de l'eau. Tout mot de passe doit être dans le coffre-fort numérique accessible à la Direction. |
| **R08** | **Résistance au changement** (Profs) | Utilisateur | 3🟧 | **Adoption Lente** (Plaintes utilisateurs) | 1🟩 | **3**🟧 | Communication positive en amont. Atelier de démo "Café & Wi-Fi" pour les profs. |
| **R09** | **Zones d'ombre Wi-Fi** (Murs épais) | Technique | 1🟩 | **Service Dégradé** (Zone blanche locale) | 2🟩 | **2**🟩 | Étude de couverture rapide avant fixation définitive des bornes. |
| **R10** | **Bruit (Perçage) pendant examens** | Environnement | 2🟩 | **Nuisance Ponctuelle** (Perturbation) | 1🟩 | **2**🟩 | Synchronisation avec le planning scolaire. "Silence radio" durant les partiels. |

*La probabilité qu'un apprenti fasse une erreur est **Forte (3)** (c'est normal, il apprend). Même si l'impact est "Moyen" (2), le produit (3x2=6) le place en zone d'alerte.*
