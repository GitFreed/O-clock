# Challenge C203 18/02/2026

## Pitch de l’exercice 🧑‍🏫 : Atelier déploiement Nextcloud

[Atelier C203](https://github.com/O-clock-Aldebaran/SC2E02-consulting-GitFreed)

---

## Contexte professionnel

Vous êtes consultant(e) IT chez **TechConseil**.

**EduLearn**, une jeune startup EdTech de 15 personnes qui développe une plateforme d'apprentissage en ligne, vous mandate pour remettre à plat ses outils collaboratifs.

### Situation actuelle

**EduLearn** utilise :

- Gmail gratuit (@gmail.com)
- Dropbox gratuit (2 GB/user) — **saturé**
- Google Docs gratuit
- WhatsApp pour la communication interne
- Zoom gratuit (limite de session)

### Problèmes identifiés

- Pas d'emails professionnels
- Stockage insuffisant (fichiers vidéo pédagogiques)
- Budget très serré (startup en seed)
- Conformité RGPD nécessaire (données étudiants)
- Croissance prévue : 15 → 30 personnes

### Analyse économique (ordre de grandeur)

**Google Workspace Business Standard** : 10,80 €/user  
15 users : 1 944 €/an  
30 users : 3 888 €/an  
**Total estimé : 11 664 €**

**Microsoft 365 Business Standard** : 11,70 €/user  
15 users : 2 106 €/an  
30 users : 4 212 €/an  
**Total estimé : 12 636 €**

**Nextcloud auto‑hébergé** :

- VM Proxmox : déjà disponible
- Coût additionnel : ~0 €
- **Total estimé : 0 €** (infrastructure existante)

💰 **Économie potentielle : 11 000 €+**

---

## Objectifs

Déployer une solution Nextcloud complète pour remplacer les outils actuels :

1. Stockage et partage de fichiers (remplace Dropbox)
2. Suite bureautique collaborative (remplace Google Docs)
3. Chat et visioconférence (remplace WhatsApp + Zoom)
4. Calendriers et tâches partagés
5. Gestion d'équipe (15 utilisateurs, 5 groupes)

**Contraintes** :

- Infrastructure : VM Ubuntu sur Proxmox
- 15 utilisateurs à créer
- Organisation complète à structurer

---

## Environnement

**À créer** :

- VM Ubuntu 24.04 LTS
- RAM : 8 GB minimum
- CPU : 4 vCPU
- Disque : 80–100 GB
- Réseau : accès Internet

---

## Architecture cible

```schema
┌────────────────────────────────────┐
│   VM Ubuntu 24.04                  │
│   RAM: 8 GB | CPU: 4 vCPU          │
│                                    │
│  ┌──────────────────────────────┐  │
│  │   Nextcloud Hub              │  │
│  │                              │  │
│  │  • Files (Stockage)          │  │
│  │  • Talk (Chat + Visio)       │  │
│  │  • Calendar & Tasks          │  │
│  │  • OnlyOffice (Bureautique)  │  │
│  │  • Deck (Kanban)             │  │
│  └──────────────────────────────┘  │
└────────────────────────────────────┘

Organisation :
• 15 utilisateurs
• 5 groupes métiers
• Structure de dossiers partagés
```

---

---

## Infrastructure

> Création de la VM, configuration réseau (IP fixe, DNS) et installation du moteur Nextcloud.

Depuis le site officiel Ubuntu (<https://ubuntu.com/download/server>) on récupère le lien de l'ISO pour le télécharger sur notre serveur Proxmox.

![image](/images/2026-02-18-14-26-20.png)

Configuration de base pour une VM serveur Linux (8 GB RAM, 4 vCPU, 100 GB disque), et on passe le serveur en IP fixe lors de l'installation.

![IP](/images/2026-02-18-15-49-36.png)

Lors de l'installation du Live-server Ubuntu on nous propose plusieurs snaps pour auto-installer des serveurs dont Nextcloud.

![snaps](/images/2026-02-18-15-57-25.png)

On met tout à jour les paquets on reboot et nous voilà sur le serveur Nextcloud

![nextcloud](/images/2026-02-18-16-07-50.png)

On se connecte via le Navigateur sur son IP

![nextcloud](/images/2026-02-18-16-20-14.png)

## Services

> Activation des "Apps" clés : Files (Fichiers), Talk (Chat/Visio), OnlyOffice (Édition docx/xlsx en ligne), Calendar & Deck (Gestion de projet).

Installation des applications Nextcloud nécessaires

![applis](/images/2026-02-18-16-24-05.png)

Les nouveautés

![news](/images/2026-02-18-16-27-56.png)

Le Dashboard

![dashboard](/images/2026-02-18-16-29-04.png)

## Organisation

> Création de la structure humaine. 15 utilisateurs répartis en 5 pôles (Direction, Dev, Pédagogie, Marketing, Support) avec des quotas de stockage adaptés (5 à 10 Go).

Pour ajouter les utilisateurs, leur ID, leur Quota, on va créer un script sur notre serveur Nextcloud.

`nano userscript.sh`

```sh
#!/bin/bash

# 1. Configuration de l'exécutable
# Utilisation du wrapper Snap officiel. Il prépare l'environnement virtuel,
# monte les dossiers nécessaires (comme /utilities) et lance occ de manière sécurisée.
OCC_CMD="nextcloud.occ"

# 2. Sécurisation du mot de passe
# Exportation dans l'environnement pour éviter l'exposition dans la liste des processus.
export OC_PASS="ChangerCeMotDePasse!2026"

# 3. Création des groupes
# Définition des groupes sans caractères spéciaux pour garantir la compatibilité système.
groupes=("Direction" "Developpement" "Pedagogie" "Marketing" "Support")

echo "--- Initialisation de la création des groupes ---"
for groupe in "${groupes[@]}"; do
    $OCC_CMD group:add "$groupe"
    echo "Groupe traité : $groupe"
done

# 4. Liste des utilisateurs sous le format "identifiant:Nom complet:Groupe:Quota"
utilisateurs=(
    "alice.martin:Alice Martin:Direction:10 GB"
    "bob.durand:Bob Durand:Direction:10 GB"
    "charlie.dev:Charlie Dev:Developpement:5 GB"
    "diana.code:Diana Code:Developpement:5 GB"
    "ethan.tech:Ethan Tech:Developpement:5 GB"
    "fiona.web:Fiona Web:Developpement:5 GB"
    "greg.mobile:Greg Mobile:Developpement:5 GB"
    "hannah.prof:Hannah Prof:Pedagogie:8 GB"
    "ivan.teach:Ivan Teach:Pedagogie:8 GB"
    "julia.learn:Julia Learn:Pedagogie:8 GB"
    "kevin.edu:Kevin Edu:Pedagogie:8 GB"
    "laura.market:Laura Market:Marketing:5 GB"
    "michael.sales:Michael Sales:Marketing:5 GB"
    "nina.comm:Nina Comm:Marketing:5 GB"
    "oscar.help:Oscar Help:Support:5 GB"
)

echo "--- Initialisation de la création des utilisateurs ---"
for utilisateur in "${utilisateurs[@]}"; do
    # Séparation des informations de la chaîne de caractères
    IFS=':' read -r username displayname group quota <<< "$utilisateur"

    echo "Création et configuration de l'utilisateur : $username"
    
    # Création de l'utilisateur avec récupération sécurisée du mot de passe
    $OCC_CMD user:add --password-from-env --display-name="$displayname" --group="$group" "$username"

    # Application stricte du quota de stockage
    $OCC_CMD user:setting "$username" files quota "$quota"
done

# 5. Nettoyage
# Suppression de la variable d'environnement de la session courante
unset OC_PASS

echo "--- Le déploiement est terminé avec succès ---"
```

On lui donne les permissions : `chmod +x userscript.sh`

Et on lance le script : `sudo ./userscript.sh`

![script](/images/2026-02-18-22-55-06.png)

Résultat

![Comptes](/images/2026-02-18-23-00-34.png)

## Stockage & Droits

> Construction de l'arborescence de dossiers et application stricte des permissions (ACL).

On peut ici aussi utiliser un script pour créer les dossiers et leur arborescence

`nano filescript.sh`

```sh
#!/bin/bash

USER="freed"
DATA_DIR="/var/snap/nextcloud/common/nextcloud/data/$USER/files"

echo "=== Création de l'arborescence ==="

mk() {
    mkdir -p "$DATA_DIR/$1"
    echo "Créé : $1"
}

# --- Dossiers d'équipes ---
mk "Equipes/1. Direction/Administratif"
mk "Equipes/1. Direction/Finances"
mk "Equipes/1. Direction/Strategie"

mk "Equipes/2. Developpement/Code Sources"
mk "Equipes/2. Developpement/Documentation Technique"
mk "Equipes/2. Developpement/Tests"

mk "Equipes/3. Pedagogie/Contenus de Cours"
mk "Equipes/3. Pedagogie/Videos Pedagogiques"
mk "Equipes/3. Pedagogie/Exercices et Quiz"
mk "Equipes/3. Pedagogie/Templates"

mk "Equipes/4. Marketing/Campagnes"
mk "Equipes/4. Marketing/Assets"
mk "Equipes/4. Marketing/Presentations"

mk "Equipes/5. Support/Documentation Client"

# --- Commun ---
mk "Commun/Modeles Documents"
mk "Commun/Ressources Partagees"

echo "=== Application des permissions ==="
chown -R root:root "$DATA_DIR"

echo "=== Scan Nextcloud ==="
sudo nextcloud.occ files:scan "$USER"

echo "=== Arborescence créée avec succès ==="
```

On lui donne les permissions : `chmod +x filescript.sh`

Et on lance le script : `sudo ./filescript.sh`

![script](/images/2026-02-18-23-27-21.png)

Résultat

![dossiers](/images/2026-02-18-23-28-30.png)

Pour configurer les partages & permissions on fait depuis l'interface avec l'icône de partage

![partage](/images/2026-02-18-23-30-47.png)

```sh
#!/bin/bash

# Utilisateur propriétaire des dossiers
USER="freed"

# Fonction pour simplifier la commande de partage
# $1 = Chemin du dossier
# $2 = Nom du groupe Nextcloud
# $3 = Permissions (31 = Lecture/Écriture complet, 1 = Lecture seule)
partager() {
    echo "Partage de '$1' avec le groupe '$2' (Perm: $3)..."
    sudo nextcloud.occ share:create --user="$USER" --share-type=1 --share-with="$2" --permissions=$3 "$1"
}

echo "=== Début de la configuration des partages ==="

# 1. Direction
partager "Equipes/1. Direction" "Direction" 31

# 2. Developpement
partager "Equipes/2. Developpement" "Developpement" 31
partager "Equipes/2. Developpement" "Direction" 1

# 3. Pedagogie
partager "Equipes/3. Pedagogie" "Pedagogie" 31
partager "Equipes/3. Pedagogie" "Direction" 1

# 4. Marketing
partager "Equipes/4. Marketing" "Marketing" 31
partager "Equipes/4. Marketing" "Direction" 1

# 5. Support
partager "Equipes/5. Support" "Support" 31
partager "Equipes/5. Support" "Direction" 1

# Commun (Tout le monde en écriture)
echo "=== Configuration du dossier Commun ==="
for groupe in "Direction" "Developpement" "Pedagogie" "Marketing" "Support"; do
    partager "Commun" "$groupe" 31
done

echo "=== Permissions appliquées avec succès ! ==="
```

Pour gérer les partages et droits on le fait depuis l'interface web.

![droits](/images/2026-02-18-23-44-43.png)

## Communication et Planification

> Mise en place des discussions vocales/visio, des calendriers partagés (Congés, Réunions) et d'un tableau Kanban pour la roadmap.

On va créer les groupes de discussions reliés aux groupes d'utilisateurs dans Talk

![talk](/images/2026-02-18-23-49-39.png)

Ajout de Calendriers partagés

![agendas](/images/2026-02-19-00-03-14.png)

Pour ajouter un tableau Kanban (Deck) il faut aller dans les applications

![apps](/images/2026-02-19-00-09-16.png)

Une fois ajouté, on le partage aux groupes, et on peut assigner es tâches aux utilisateurs

![kanban](/images/2026-02-19-00-19-37.png)

## Sécurité

> Durcissement des accès (Mots de passe forts, expiration des liens de partage publics).

![mdp](/images/2026-02-19-00-21-33.png)

![partage](/images/2026-02-19-00-23-40.png)

## Recette

> Tests fonctionnels finaux (Co-édition, étanchéité des droits, accès externe).

On se connecte avec hannah.prof (Pédagogie), elle a bien accès aux dossiers Communs et Péda seulement > OK

![dossiers](/images/2026-02-19-00-27-25.png)

Test de co-édition > OK

![coed](/images/2026-02-19-00-31-55.png)

Test partage sécurisé > demande de mdp OK

![mdp](/images/2026-02-19-00-34-15.png)

Test de call Talk > OK

![talk](/images/2026-02-19-00-36-49.png)
