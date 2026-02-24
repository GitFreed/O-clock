# Challenge C302 23/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-24-15-57-51.png)

[Challenge C302](https://github.com/O-clock-Aldebaran/SC3E02-radius)

[Cours C302.](/RESUME.md#-c302-contrôle-daccès-et-sécurité-sans-fil-acl-nac-wifi)

---

## Préparation de l’environnement

### Création des 2 serveurs

On installe 2 machines virtuelles, Debian 13 pour le Serveur LDAP et le Serveur RADIUS, puis on les passe en IP fixe

![radius](/images/2026-02-24-17-19-32.png)

![IPradius](/images/2026-02-24-17-29-10.png)

![ldap](/images/2026-02-24-17-19-44.png)

![IPldap](/images/2026-02-24-17-27-05.png)

Un ping entre les 2 pour voir si tout est fonctionnel et on peut faire la suite

![ping](/images/2026-02-24-17-31-56.png)

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



## Connecter RADIUS à LDAP (ou AD)

## Configurer le client RADIUS

## Tester l’authentification

## Documentation
