# Challenge A208 30/10/2025

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

## Challenge A208 📝

### Installer GLPI Agent sur des VM 💽

* Je vais sur le site officiel GLPI Project qui me renvois sur le Github pour trouver [la dernière version de l'agent](https://github.com/glpi-project/glpi-agent/releases/tag/1.15)

![GLPI Agent Github](/images/2025-10-30-17-56-23.png)

* Lors de l'installation de l'agent on doit pointer le serveur GLPI. Sous Linux tout se fait en ligne de commande.

![Install](/images/2025-10-30-18-35-37.png)

* Une fois terminé je force l'agent à faire un premier inventaire. On peut aussi le faire depuis un navigateur via ``http://localhost:62354``

![Force Agent](/images/2025-10-30-18-58-33.png)

* Dans mon server GLPI je retrouve bien mes 2 machines !

![Inventaire done](/images/2025-10-30-19-02-24.png)

---

### Tester la gestion des tickets dans GLPI 🎫

* Je vais créer un compte utilisateur et l'utiliser sur ma VM pour faire une demande d'aide.

![Dumb User](/images/2025-10-30-19-22-08.png)

* Sachant que notre service à livré la machine à cet utilisateur je l'enregistre.

![Utilisateur](/images/2025-10-30-19-37-37.png)

* Sur la VM je me log en tant qu'Utilisateur et je suis sur la page de service, je peux faire ma demande en créant un Ticket.

![Ticket Create](/images/2025-10-30-19-22-55.png)

* Sur le serveur GLPI je retrouve bien ce ticket.

![Ticket](/images/2025-10-30-19-20-34.png)

* Je peux retrouver sa machine en filtrant mon parc par Utilisateur contenant son nom.

![Filtre](/images/2025-10-30-19-35-54.png)

* Et trouver les ID pour le contrôle à distance.

![Remote desk](/images/2025-10-30-20-03-09.png)

* J'ai pu prendre le contrôle sur sa machine et refaire fonctionner le son qui était coupé dans les paramètres avancés.

![Done](/images/2025-10-30-19-52-09.png)

* Une fois validé par l'utilisateur, on peut cloturer le ticket.

![Clos](/images/2025-10-30-20-13-59.png)

* On peut voir le nombre de tickets qui ont été cloturés ou leurs status sur un utilisateur

![admin](/images/2025-10-30-20-16-22.png)

Je trouve l'outil simple et complexe à la fois, côté utilisateur c'est très facile, côté Admin c'est plus dense mais je pense que la prise en main est assez rapide, après quelques jours on doit être efficace. Les informations relevées grâce à l'agent, et la recherche dans les base de données permettent une résolution efficace.
