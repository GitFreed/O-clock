# Challenge A304 06/11/2025

## Pitch de l’exercice 🧑‍🏫

![ChallengeA304](/images/2025-11-06-16-05-47.png)

---

## Challenge Config de Routeurs et LANs sur Packet Tracer ⌨️

### Etape 1, 2 et 3

J'ai mis en place les 3 LANs avec 2 PC, 1 Switch, 1 Server et le Router (PT Empty + 4 modules Gig).

J'ai tout câblé sauf les PC qui feront les requêtes DHCP.

Je choisi les IP de mes PC fixe en x.x.x.5 comme demandé, les servers DHCP en x.x.x.4, les vlan1 switch en x.x.x.254 (via CLI) et les GateWay vers le routeur en x.x.x.1 (via CLI).

Je config le DHCP sur les servers en IP Start : x.x.x.50 et max user 200, j'en profite pour ajouter les GW correspondantes.

Je branche les PC restants aux Switchs, active le protole DHCP dessus et ils récupèrent directement leur IP et la GW. Je Ping vers les autres LAN, c'est OK.

![Config 3 LAN](/images/2025-11-06-18-50-58.png)

### Etape 4

Je met en place et configure mon LAN 4 avec le Router 1941. Je vérifie avc un Ping du PC au Routeur.

Je relie et configure le LAN 5 des 2 Routeurs.

Il faut maintenant config la table de routage.

Routeur 1 : ip route 10.0.0.0 255.255.0.0 172.16.0.1

Routeur 2 : ip route 0.0.0.0 0.0.0.0 172.16.0.2

Puis je tente des Pings de part et d'autre et... c'est BON !! 🥳

![Config Routes OK](/images/2025-11-06-19-43-31.png)
