# Challenge 0208 30/10/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Challenge

Aujourd’hui, votre mission est double :

1️⃣ Installer le GLPI Agent sur une machine virtuelle (ou plusieurs, si vous voulez aller plus loin).

L’objectif est que vos machines remontent correctement leurs informations dans votre instance GLPI (inventaire matériel, logiciels, etc.).

Vérifiez que la communication entre l’agent et le serveur GLPI fonctionne bien.

2️⃣ Tester la gestion des tickets dans GLPI :

Créez quelques tickets pour simuler des demandes utilisateurs.

Testez le cycle de vie complet d’un ticket : création, attribution, suivi, clôture.

Explorez les fonctionnalités utiles au support : ajout de commentaires, changement de statut, notifications, etc.

---

## Challenge 0208 📝

### Installer GLPI Agent sur des VM 💽

Je vais sur le site officiel GLPI Project qui me renvois sur le Github pour trouver [la dernière version de l'agent](https://github.com/glpi-project/glpi-agent/releases/tag/1.15)

![GLPI Agent Github](/images/2025-10-30-17-56-23.png)

Lors de l'installation de l'agent on doit pointer le serveur GLPI. Sous Linux tout se fait en ligne de commande.

![Install](/images/2025-10-30-18-35-37.png)

Une fois terminé je force l'agent à faire un premier inventaire.

![Force Agent](/images/2025-10-30-18-58-33.png)

Dans mon server GLPI je retrouve bien mes 2 machines !

![Inventaire done](/images/2025-10-30-19-02-24.png)

### Tester la gestion des tickets dans GLPI 🎫

