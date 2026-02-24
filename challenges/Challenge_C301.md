# Challenge C301 23/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-23-14-44-03.png)

[Challenge C301](https://github.com/O-clock-Aldebaran/SC03E01-VLAN)

[Cours C301.](/RESUME.md#️-c301-introduction--gouvernance-outils--bases-réseau)

> - ACL : <https://www.it-connect.fr/les-listes-de-controle-dacces-acl-avec-cisco/>

[Fichier Packet Tracer](./Challenge_C301.pkt)

---

## Topologie Réseau et configuration de base

### Topologie "Routeur-on-a-stick"

                    [Routeur Inter-VLAN]
                          │
                    Trunk (802.1Q)
                          │
                     [Switch L2]
                    ┌──┬──┬──┬──┐
                    │  │  │  │  │
                  DIR RH CPT VIS SRV

![topo](/images/2026-02-24-00-47-03.png)

### Switch : Création de chaque VLAN

```sh
Switch> enable
Switch# conf t
Switch(config)# vlan 10
Switch(config-vlan)# name DIRECTION
Switch(config-vlan)# exit
```

### Switch : Assignation des ports pour chaque VLAN

On doit configurer chaque port du switch en mode ACCESS pour chaque VLAN

```sh
Switch(config)# interface fa0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 10
Switch(config-vlan)# exit
```

`Switch# vlan brief`

![vlanbrief](/images/2026-02-24-01-12-28.png)

### Switch : Assignation du port inter-VLAN

On doit configurer le port qui va communiquer avec le Routeur en mode TRUNK

```sh
Switch(config-if)#interface g0/1
Switch(config-if)#switchport mode trunk
Switch(config-if)#swichport trunk allowed vlan 10,20,30,40,99
Switch(config-vlan)# exit
```

Il faut aussi allumer l'interface sur le Routeur à laquelle on connecte le Switch

```sh
Routeur(config)# interface gigabitEthernet 0/0
Routeur(config-if)# no shutdown
Routeur(config-if)# exit
```

On vérifie notre interface Trunk sur le switch

`Switch#show interfaces trunk`

![interftrunk](/images/2026-02-24-01-37-02.png)

## Routage inter-VLAN

On a déjà activé l'interface G0/1, maintenant on va créer les passerelles pour chaque VLAN

```sh
Routeur(config)# interface gigabitEthernet 0/1.10
Routeur(config-subif)# encapsulation dot1Q 10
Routeur(config-subif)# ip address 192.168.10.1 255.255.255.0
Routeur(config-subif)# exit
```

`Routeur#show ip interface brief`

![brief](/images/2026-02-24-01-55-56.png)

`Routeur#show running-config`

![runconf](/images/2026-02-24-02-03-17.png)

Test de ping du PC Direction (Vlan10) au Serveur RH (Vlan99)

![ping](/images/2026-02-24-02-05-02.png)

C'est bon, le routage fonctionne. Le premier ping ne passe pas le temps de la requête ARP

On peut également faire un show IP route pour voir toutes les routes connectées (C)

Routeur#show ip route

![route](/images/2026-02-24-02-07-50.png)

![OK](/images/2026-02-24-02-14-40.png)

## ACL standard (restriction de l'administration)

Seul le réseau Direction doit pouvoir accéder aux lignes VTY (Telnet/SSH) du routeur.
Tous les autres réseaux doivent être refusés.

```sh
Routeur(config)#access-list 10 permit 192.168.10.0 0.0.0.255
Routeur(config)#line vty 0 4
Routeur(config-line)#access-class 10 in
Routeur(config-line)#password `password`
Routeur(config-line)#login
Routeur(config-line)#exit
```

Pour vérifier `Routeur#show access-lists`

![list](/images/2026-02-24-02-19-12.png)

Pour sécuriser notre routeur on va également ajouter un mot de passe d'accès au Routeur en direct

```sh
Routeur(config)#enable secret `password`
```

## ACL étendues (filtrage inter-VLAN)

### Pour le VLAN 20 (RH)

Il ne doit accéder qu'au serveur Serveur RH (`192.168.99.10`).

```sh
Router(config)#access-list 120 permit ip 192.168.20.0 0.0.0.255 host 192.168.99.10
Router(config)#interface GigabitEthernet0/1.20
Router(config-subif)#ip access-group 120 in
```

### Pour le VLAN 30 (Compta)

Il ne doit accéder qu'au serveur Serveur COMPTA (`192.168.99.20`).

```sh
Router(config)#access-list 130 permit ip 192.168.30.0 0.0.0.255 host 192.168.99.20
Router(config)#interface GigabitEthernet0/1.30
Router(config-subif)#ip access-group 130 in
```

### Pour le VLAN 40 (Visiteurs)

Ils ont accès à Internet mais sont isolés du LAN interne.

```sh
# On autorise tout SAUF vers les réseaux internes 192.168.0.0/16
Router(config)#access-list 140 deny ip 192.168.40.0 0.0.0.255 192.168.0.0 0.0.255.255
Router(config)#access-list 140 permit ip 192.168.40.0 0.0.0.255 any
Router(config)#interface GigabitEthernet0/1.40
Router(config-subif)#ip access-group 140 in
```

Pour vérifier `Router#show access-lists`

![aclist](/images/2026-02-24-02-46-01.png)

`show running-config` pour tout vérifier.

## Tests de Validation

![ping](/images/2026-02-24-02-50-20.png)

![telnet](/images/2026-02-24-02-58-54.png)

| # | Test | Résultat |
| --- | --- | --- |
| 1 | Ping de Direction vers SRV-RH | ✅ Succès |
| 2 | Ping de Direction vers SRV-COMPTA | ✅ Succès |
| 3 | Ping de RH vers SRV-RH | ✅ Succès |
| 4 | Ping de RH vers SRV-COMPTA | ❌ Échec |
| 5 | Ping de Comptabilité vers SRV-COMPTA | ✅ Succès |
| 6 | Ping de Comptabilité vers SRV-RH | ❌ Échec |
| 7 | Ping de Visiteur vers n'importe quel serveur | ❌ Échec |
| 8 | Ping de Visiteur vers la passerelle Internet (simulée) | ✅ Succès |
| 9 | Telnet/SSH vers le routeur depuis Direction | ✅ Succès |
| 10 | Telnet/SSH vers le routeur depuis RH ou Visiteur | ❌ Échec |
