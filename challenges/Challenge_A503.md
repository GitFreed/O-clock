# Atelier A503 12/12/2025

## Pitch de l’exercice 🧑‍🏫

![challenge](/images/2025-12-12-16-02-30.png)

[Cours A503.](/RESUME.md#-a503)

---

## 1. Install Rocky Linux et update

<https://rockylinux.org/fr-FR>

Rocky Linux est basé sur RHEL, assure la compatibilité matérielle optimale avec la version  Red Hat Enterprise Linux 9 (64-bit). On va mettre la version minimale pour aller plus vite, et utiliser les lignes de commandes.

![vers](/images/2025-12-12-15-25-02.png)

![install](/images/2025-12-12-15-42-24.png)

Après avoir update, upgrade et install le vm-tool avec : ``sudo dnf check-update`` > ``sudo dnf upgrade -y`` > ``sudo dnf install open-vm-tools -y`` > ``sudo reboot``

## 2. Créer et permettre à cet utilisateur de lancer des commandes avec sudo

On crée l'utilisateur "usersudo" avec ``sudo adduser usersudo``

C'est le groupe wheel qui contient les administrateurs sur Rocky Linux, on l'ajoute avec ``sudo usermod -aG wheel utilisateur_admin``

![user](/images/2025-12-12-16-33-57.png)

## 3. Faire en sorte qu’aucun mot de passe ne soit demandé pour lancer la commande rpm

On va éditer le fichier de configuration sudoers à l'aide de la commande ``sudo visudo`` et de la gestion de VIM vu hier, il faut ajouter ``usersudo ALL=(ALL) NOPASSWD: /usr/bin/rpm`` et :wq pour write&quite.

![visudo](/images/2025-12-12-16-58-51.png)

Test en passant sur mon usersudo ``su - usersudo``, le rpm passe mais pas le dnf update, c'est bon.

![OK](/images/2025-12-12-17-11-48.png)

## 4. Créer le Groupe et y Ajouter les Utilisateurs

``sudo groupadd groupe_partage`` Crée le nouveau groupe.

``sudo usermod -aG groupe_partage usersudo`` Ajoute l'utilisateur usersudo au nouveau groupe.

``sudo usermod -aG groupe_partage freed`` Ajoute l'utilisateur initial (freed) au nouveau groupe.

``groups usersudo`` Vérification : Confirme que usersudo fait partie de groupe_partage.

![OK](/images/2025-12-12-17-29-29.png)

## 5. Créer le Dossier et Configurer les Permissions

``sudo mkdir /home/partage_fichier`` Crée le dossier.

``sudo chown -R :groupe_partage /home/partage_fichier`` Change le proprio du dossier.

``sudo chmod 760 /home/partage_fichier`` Applique les permissions complètes (7) au proprio, lecture et écriture (6) au groupe et rien (0) aux autres.

``ls -l /home/`` Pour vérifier les permissions.

![verif](/images/2025-12-12-17-50-10.png)

``drwxrws---`` correspond bien à 760.

## 6. Créer le Dernier Utilisateur pour Vérifier

``sudo adduser user0`` > ``su - user0`` > ``cd /home/partage_fichier``

![OK](/images/2025-12-12-17-55-52.png)

---
