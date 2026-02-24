# Challenge C302 23/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-24-15-57-51.png)

[Challenge C302](https://github.com/O-clock-Aldebaran/SC3E02-radius)

[Cours C302.](/RESUME.md#-c302-contrôle-daccès-et-sécurité-sans-fil-acl-nac-wifi)

---

## Préparation de l’environnement

### LDAP

Installation du serveur ldap

sudo apt update
sudo apt install slapd ldap-utils -y
sudo dpkg-reconfigure slapd

OUI pour configurer le serveur maintenant.
Nom de domaine DNS : par exemple example.com
Nom de l’organisation : par exemple Example Inc.
Mot de passe admin : choisissez un mot de passe fort.
Base de données : généralement MDB (default).
Supprimer la base existante : NON si vous voulez garder d’anciennes données.

sudo systemctl status slapd
ldapsearch -x -LLL -H ldap:// -b dc=example,dc=com

CREER UNE "OU" (nano base_users.ldif)
dn: ou=users,dc=example,dc=com
objectClass: organizationalUnit
ou: users

sudo ldapadd -x -D cn=admin,dc=example,dc=com -W -f base_users.ldif

CREER UN "USER" (nano newuser.ldif)
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
userPassword: motdepasse
loginShell: /bin/bash
homeDirectory: /home/jdupont

slappasswd (puis remplacer le mot de passe dans le fichier)
sudo ldapadd -x -D cn=admin,dc=example,dc=com -W -f newuser.ldif

TEST LOCAL
ldapsearch -x -LLL -b dc=example,dc=com uid=jdupont

TEST DEPUIS LA MACHINE RADIUS (penser à remplacer l'IP)
ldapsearch -x -H ldap://10.0.0.80 -b dc=example,dc=com
ldapsearch -x -H ldap://10.0.0.80 -D "cn=admin,dc=example,dc=com" -W -b dc=example,dc=com

## Installer le serveur RADIUS

## Connecter RADIUS à LDAP (ou AD)

## Configurer le client RADIUS

## Tester l’authentification

## Documentation
