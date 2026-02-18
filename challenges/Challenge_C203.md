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

**Économie potentielle : 11 000 €+**

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
