# Challenge C302 23/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-24-15-57-51.png)

[Challenge C302](https://github.com/O-clock-Aldebaran/SC3E02-radius)

[Cours C302.](/RESUME.md#-c302-contrôle-daccès-et-sécurité-sans-fil-acl-nac-wifi)

---

## Préparation de l’environnement

### 🗺️ Topologie du Labo (LAN : `10.0.0.0/24`)

| Machine | IP | Rôle Réseau | Service & Port |
| --- | --- | --- | --- |
| **pfSense** | `10.0.0.1` | Passerelle & Client NAS | Initiateur AAA |
| **srv-radius** | `10.0.0.81` | Routeur d'authentification | FreeRADIUS (**UDP 1812**) |
| **srv-ldap** | `10.0.0.82` | Backend d'annuaire | OpenLDAP (**TCP 389**) |
| **Lubuntu** | `DHCP` | Poste de management | Client SSH / Web |

### Création des 2 serveurs

On installe 2 machines virtuelles Debian (debian-13.1.0-amd64-netinst.iso), pour le Serveur LDAP et le Serveur RADIUS, puis on les passe en IP statique

![radius](/images/2026-02-24-17-19-32.png)

![IPradius](/images/2026-02-24-17-29-10.png)

![ldap](/images/2026-02-24-17-19-44.png)

![IPldap](/images/2026-02-24-17-27-05.png)

Un ping entre les 2 pour voir si tout est fonctionnel et on peut faire la suite

![ping](/images/2026-02-24-17-31-56.png)

Les 2 VM ayant des erreurs de résolutions DNS lors d'apt upgrade on va edit le fichier de résolutions et rajouter les DNS

`nano /etc/resolv.conf`

      nameserver 10.0.0.1
      nameserver 8.8.8.8

### Installation de LDAP

- Installation du moteur ldap

`sudo apt install slapd ldap-utils -y`

- Configuration du domaine

`sudo dpkg-reconfigure slapd`

      Omettre de configurer le serveur maintenant : Non
      Nom de domaine DNS : example.com
      Nom de l’organisation : Example Inc.
      Mot de passe admin : un mot de passe fort.
      Base de données : généralement MDB (default).
      Supprimer la base existante : Non
      Déplacer l'ancienne base : Oui

`sudo systemctl status slapd`

![ok](/images/2026-02-24-17-43-12.png)

Commande de test pour interroger l'annuaire

`ldapsearch -x -LLL -H ldap:// -b dc=example,dc=com`

![search](/images/2026-02-24-17-44-41.png)

### Créer une "OU"

`nano base_users.ldif`

```sh
dn: ou=users,dc=example,dc=com
objectClass: organizationalUnit
ou: users
```

On injecte ce fichier dans la base LDAP

`sudo ldapadd -x -D cn=admin,dc=example,dc=com -W -f base_users.ldif`

### Créer un "USER"

Hash du mot de passe avec `slappasswd`

![hash](/images/2026-02-24-17-55-43.png)

Puis `nano newuser.ldif`

```sh
dn: uid=jdupont,ou=users,dc=example,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: jdupont
sn: Dupont
givenName: Jean
cn: Jean Dupont
displayName: Jean Dupont
uidNumber: 1001
gidNumber: 1001
userPassword: {SSHA}le_hash_ici
loginShell: /bin/bash
homeDirectory: /home/jdupont
```

On injecte l'utilisateur dans la base

`sudo ldapadd -x -D cn=admin,dc=example,dc=com -W -f newuser.ldif`

![inject](/images/2026-02-24-18-00-05.png)

### Le test de validation

ldapsearch -x -LLL -b dc=example,dc=com uid=jdupont

![ok](/images/2026-02-24-18-01-25.png)

## Installer le serveur RADIUS

> Il faut voir FreeRADIUS non pas comme un lourd serveur d'application, mais comme un simple "routeur de paquets AAA" (Authentication, Authorization, Accounting). Son seul travail sera de recevoir des trames sur le port UDP 1812, de lire ce qu'il y a dedans, et de router cette demande vers l'annuaire LDAP (10.0.0.82) pour vérifier si les credentials sont bons.

On installe le moteur FreeRADIUS, son module LDAP, et les outils de test réseau associés

```sh
apt update
apt install freeradius freeradius-ldap freeradius-utils -y
```

![ok](/images/2026-02-24-18-09-54.png)

## Connecter RADIUS à LDAP (ou AD)

Activer le module LDAP (Créer la route vers le backend)

Par défaut, FreeRADIUS possède de nombreux modules désactivés. On va "allumer" l'interface vers LDAP en créant un lien symbolique

`ln -s /etc/freeradius/3.0/mods-available/ldap /etc/freeradius/3.0/mods-enabled/`

Configurer le "Next Hop" (Le serveur LDAP) :

On va maintenant indiquer l'adresse IP de destination et les identifiants pour interroger la base.

`nano /etc/freeradius/3.0/mods-enabled/ldap`

![ldap](/images/2026-02-24-18-19-04.png)

Insérer le LDAP dans le flux AAA

Il faut maintenant dire au moteur principal d'utiliser cette nouvelle route LDAP lorsqu'une requête arrive sur le port UDP 1812

`nano /etc/freeradius/3.0/sites-enabled/default`

Section authorize { ... } on décommente devant -ldap

authenticate { ... } on décommente devant ldap

![ldap](/images/2026-02-24-18-21-47.png)

## Configurer le client RADIUS

Par défaut, FreeRADIUS rejette silencieusement les trames UDP 1812 provenant d'IP inconnues. Il faut "déclarer" qui a le droit de l'interroger

Déclarer le réseau autorisé (Le Client)

`nano /etc/freeradius/3.0/clients.conf`

Tout en bas on va ajouter :

```sh
client lab_pfsense {
    ipaddr = 10.0.0.0/24
    secret = pfsense_secret
}
```

ipaddr = 10.0.0.0/24 : On autorise tout le LAN Segment (dont notre pfSense)

secret = pfsense_secret : C'est le mot de passe réseau (shared secret) qui chiffrera les échanges RADIUS.

On reboot `systemctl restart freeradius`

## Tester l’authentification

On va simuler la requête que ferait le routeur pfSense ou le switch pour vérifier que toute la chaîne (Client -> RADIUS -> LDAP) fonctionne

`radtest jdupont LE_MOT_DE_PASSE 10.0.0.81 0 pfsense_secret`

![test](/images/2026-02-24-18-36-56.png)

Succès ✅

- L'outil de test a généré une trame Access-Request chiffrée grâce à la secret partagé pfsense_secret.

- FreeRADIUS l'a interceptée sur le port UDP 1812, a identifié que le client était autorisé, et a routé la demande d'authentification vers ton annuaire en suivant le "Next Hop" LDAP.

- Le serveur LDAP (10.0.0.82) a reçu la requête, a interrogé sa base de données pour trouver l'utilisateur jdupont, et a validé que le mot de passe correspondait bien à "XXX".

- Le LDAP a donné son feu vert, et FreeRADIUS a encapsulé le tout pour te renvoyer cet Access-Accept.

## Déclarer le serveur RADIUS dans pfSense

pfSense va maintenant pouvoir déléguer la vérification des identifiants à ton "routeur AAA" (FreeRADIUS), qui lui-même ira interroger l'annuaire

On va ajouter un serveur d'authentification

![auth](/images/2026-02-24-18-49-35.png)

![auth](/images/2026-02-24-18-57-21.png)

Pour tester et valider on va dans la partie Diagnostics de pfSense

![test](/images/2026-02-24-18-52-21.png)

![ok](/images/2026-02-24-19-01-00.png)

L'architecture pfSense -> RADIUS -> LDAP est maintenant 100% fonctionnelle et validée en conditions réelles ✅

### 🚦 Le routage des trames (Résumé Couche 4/7)

1. **pfSense (`10.0.0.1`)** reçoit une tentative de connexion.
2. Il encapsule la requête (`Access-Request`) et l'envoie à **`10.0.0.81:1812`**.
3. Le **RADIUS** vérifie l'ACL (réseau autorisé) et route la vérification vers le Next Hop LDAP **`10.0.0.82:389`**.
4. Le **LDAP** confirme la validité du mot de passe.
5. Le **RADIUS** renvoie l'`Access-Accept` final au **pfSense** pour ouvrir le port ou le tunnel.
