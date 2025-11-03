# Challenge A301 03/11/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Challenge

### Et si on découvrait Packet Tracer par la pratique ? 💪

Vous allez devoir ajouter dans un projet Packet Tracer tous les “end devices” (ordinateurs fixes, portables, copieurs, serveurs, etc.) ainsi que les premiers appareils d’interconnexion d’une entreprise fictive, dont le réseau et le parc informatique sont décrits ci-dessous.

Pour l’instant, on oublie le WiFi : on considère que tous les postes sont connectés en filaire.

Pour toutes les adresses IP, on utilise le masque de sous-réseau 255.0.0.0 soit /8 en notation classless/CIDR.

Voici la liste des end devices avec leurs adresses IP (on appelle ça un plan d’adressage !) :

- Paris (site principal) :

- - Accueil :

- - - 2 PC fixes, adresses IP en 10.1.1.X (X étant le numéro du poste, de 1 à 2)

- - - 1 copieur, adresse IP 10.1.123.1

- - Compta :

- - - 3 PC fixes, adresses IP en 10.1.2.X (X étant le numéro du poste, de 1 à 3)

- - - 1 copieur, adresse IP 10.1.123.2

- - Direction :

- - - 2 PC portables, adresses IP en 10.1.3.X (X étant le numéro du poste, de 1 à 2)

- - - 1 imprimante, adresse IP 10.1.123.3

- Salle 4 / open-space N°1 :

- - - 8 PC fixes, adresses IP en 10.10.4.X (X étant le numéro du poste, de 1 à 8)

- - - 1 copieur, adresse IP 10.10.123.4

- - - 1 switch dédié (utilisez un Cisco 2960 !)

- - Salle 5 / open-space N°2 :

- - - 12 PC fixes, adresses IP en 10.10.5.X (X étant le numéro du poste, de 1 à 12)

- - - 1 switch dédié

- - Service Informatique :

- - - 1 PC fixe et 2 PC portables, adresses IP en 10.1.42.X (idem pour le X)

- - - 1 switch dédié

- - Salle serveur :

- - - 1 switch pour les PC de l’Accueil, la Compta et la Direction

- - - 1 switch “cœur de réseau”, sur lequel tous les autres sont connectés !

- Lyon :

- - Accueil :

- - - 2 PC fixes, adresses IP en 10.2.1.X (X étant le numéro du poste, de 1 à 2)

- - - 1 copieur, adresse IP 10.2.123.1

- - - 1 switch partagé avec la salle 2

- - Salle serveur :

- - - 1 switch “cœur de réseau”, sur lequel tous les autres sont connectés !

- - Salle 2 / open-space :

- - - 12 PC fixes, adresses IP en 10.20.2.X (X étant le numéro du poste, de 1 à 12)

- - - 1 imprimante, adresse IP 10.20.123.2

- - - 1 switch partagé avec l’accueil

Pour l’instant, même si les sites sont géographiquement éloignés, reliez les deux switchs “cœur du réseau” entre eux.

### Bonus

Vérifiez avec la commande ping si les postes peuvent bien communiquer. Vous l’avez normalement vue en saison 2, mais cherchez sur Internet comment utiliser cette commande si nécessaire (votre formateur n’a peut-être pas eu le temps d’en reparler, la journée était suffisamment chargée 😅)

---

## Challenge A301 : Packet Tracer 🖥️
