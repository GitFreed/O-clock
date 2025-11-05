# Challenge A303 05/11/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Challenge

### Au programme du challenge de ce soir ? La création d’un plan d’adressage 💪

**Pitch de l’exercice :**

Vous êtes recruté par une grande entreprise qui souhaite refaire complètement son réseau informatique.

L’entreprise est basé sur plusieurs sites : Montpellier et Bordeaux.

Sur **Montpellier**, le parc est composé de :

>- 200 PC fixes
>- 70 PC portables
>- 20 serveurs
>- 15 copieurs

Sur **Bordeaux**, le parc est composé de :

>- 100 PC fixes
>- 40 PC portables
>- 5 serveurs
>- 5 copieurs

Sur les deux sites, il faudra **deux réseaux WiFi** :

- un public, pour les visiteurs
- un privé, pour les PC portables des collaborateurs (quand ceux-ci ne seront pas connecté en filaire)

Pour des raisons de sécurité, l’entreprise souhaite que les machines soient cloisonnées dans des **sous-réseaux indépendants.**

Pour chaque site, il faut donc un sous-réseau pour :

- les PC fixes ou portables en filaire
- les serveurs
- les copieurs
- le WiFi public
- le WiFi privé

Proposez un plan d’adressage permettant de répondre à ce besoin !

Mais **attention** ⚠️ Vous devez, pour vos différents sous-réseaux, utiliser les réseaux privés de la RFC 1918.

On en reparlera de l’utilité de ces adresses et de cette RFC bientôt, mais en attendant, un petit tour sur la [page wikipédia](https://fr.wikipedia.org/wiki/R%C3%A9seau_priv%C3%A9) nous indique qu’on peut utiliser les plages d’adresses ci-dessous :

| - | -
| --- | ---
| 10.0.0.0/8 | 10.0.0.0 – 10.255.255.255
| 172.16.0.0/12 | 172.16.0.0 – 172.31.255.255
| 192.168.0.0/16 |192.168.0.0 – 192.168.255.255

💡 Vous pouvez redécouper les plages ci-dessus, par exemple avoir un sous-réseau en 192.168.1.0/24 et un autre en 192.168.2.0/24.

**Seul impératif : vos sous-réseaux ne doivent pas se chevaucher** !

Chaque sous-réseau doit être au format X.X.X.X/Y (par exemple, 192.168.1.0/24)


Précisez aussi le nombre d’adresses utilisables pour des machines sur chaque sous-réseau !

Voici le rendu qui est attendu (bossez dans le bloc-note, ça suffit amplement) :

- Montpellier/PC    : 192.168.1.0/24 (254 adresses)
- Montpellier/SRV   : 192.168.7.0/24 (254 adresses)
- Montpellier/COPY  : X.X.X.X/Y      (Z adresses)
- Montpellier/pubW  : X.X.X.X/Y      (Z adresses)
- Montpellier/privW : X.X.X.X/Y      (Z adresses)
- Bordeaux/PC       : 192.168.1.0/24 (254 adresses)
- Bordeaux/SRV      : 192.168.7.0/24 (254 adresses)
- Bordeaux/COPY     : X.X.X.X/Y      (Z adresses)
- Bordeaux/pubW     : X.X.X.X/Y      (Z adresses)
- Bordeaux/privW    : X.X.X.X/Y      (Z adresses)

### Bonus

Vérifiez avec la commande ping si les postes peuvent bien communiquer. Vous l’avez normalement vue en saison 2, mais cherchez sur Internet comment utiliser cette commande si nécessaire (votre formateur n’a peut-être pas eu le temps d’en reparler, la journée était suffisamment chargée 😅)

---

## Challenge A303
