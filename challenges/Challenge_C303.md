# Challenge C303 24/02/2026

## Pitch de l’exercice 🧑‍🏫

> **Challenge :**
>
> - Mise en place d'une zone DMZ isolée avec un serveur web, règles de pare-feu et redirection de port NAT.
> - Challenge VPN & Authentification Radius

[DMZ, Pare-feu & NAT avec pfSense sur Proxmox](https://github.com/O-clock-Aldebaran/SC03E03-DMZ)

[Challenge C303](https://github.com/O-clock-Aldebaran/E03-SC3E03-VPN-auth-radius-GitFreed/blob/master/README.md)

[Cours C303.](/RESUME.md#-c303-dmz-et-vpn)

---

## Création d'une DMZ avec un serveur Web

> Mise en place d'une zone DMZ isolée avec un serveur web, règles de pare-feu et redirection de port NAT.

Une DMZ (zone démilitarisée) est un réseau intermédiaire entre le LAN interne (de confiance) et le WAN/Internet (non fiable). On y place les serveurs qui doivent être accessibles depuis Internet (serveurs web, mail, DNS public…) tout en les isolant du LAN.

Principe de sécurité :

```
Internet ──── peut accéder ────> DMZ (serveur web)
DMZ     ──── NE PEUT PAS ─────> LAN (postes, données)
LAN     ──── peut accéder ────> DMZ (pour administrer)
LAN     ──── peut accéder ────> Internet
```

Si un attaquant compromet le serveur web en DMZ, il ne peut pas pivoter vers le LAN car le pare-feu l'en empêche. C'est tout l'intérêt de la séparation.

### Ajout d'une interface DMZ à pfSense

On ajoute une carte réseau qui permettra de créer un Lan DMZ et on reboot pour être sûr que la pfSense le détecte.

![carte réseau](/images/2026-02-25-14-30-55.png)

L'équivalent sur Proxmox est un Linux bridge / vmbr

### Configurer l'interface DMZ

On va se connecter à l'interface web de pfSense et assigner la nouvelle interface dans  Interfaces → Assignments. On trouve notre Available network port em2.

![em2](/images/2026-02-25-14-38-26.png)

On +Add, Save et on va la configurer.

| Champ | Valeur |
|---|---|
| Activer | ✅ Cocher « Enable interface » |
| Description | **DMZ** |
| Type de configuration IPv4 | Static IPv4 |
| Adresse IPv4 | 10.10.10.1 |
| Masque | /24 |

![dmz](/images/2026-02-25-14-40-46.png)

### Règles de pare-feu pfSense

Par défaut, pfSense bloque tout sur les nouvelles interfaces. Il faut ajouter les règles nécessaires

**Règle 1 — Bloquer DMZ vers LAN :**

On **⬆ Add**

| Champ | Valeur |
| --- | --- |
| Action | **Block** |
| Interface | DMZ |
| Protocole | Any |
| Source | DMZ subnets |
| Destination | LAN subnets |
| Description | Bloquer DMZ vers LAN |

**Save**

**Règle 2 — Autoriser DMZ vers Internet :**

On **⬇ Add** (ajouter en bas, après la règle de blocage).

| Champ | Valeur |
| --- | --- |
| Action | **Pass** |
| Interface | DMZ |
| Protocole | Any |
| Source | DMZ subnets |
| Destination | **any** |
| Description | Autoriser DMZ vers Internet |

**Save**

> **Pourquoi cet ordre ?** La règle 1 bloque d'abord le trafic vers le LAN. La règle 2 autorise tout le reste (= Internet). Si on inversait, la règle « any » autoriserait aussi le LAN avant d'atteindre le blocage. L'ordre est crucial.

![rulesDMZ](/images/2026-02-25-15-06-40.png)

**Règle — Autoriser LAN vers DMZ :**

| Champ | Valeur |
| --- | --- |
| Action | Pass |
| Interface | LAN |
| Protocole | Any |
| Source | LAN subnets |
| Destination | DMZ subnets |
| Description | Autoriser LAN vers DMZ |

> **💡 Note :** Dans un environnement de production, on serait encore plus restrictif : on n'autoriserait le LAN vers la DMZ que sur certains ports (SSH pour l'administration par exemple), pas sur « Any ».

![rulesLAN](/images/2026-02-25-15-09-58.png)

### Serveur Apache

On ajoute une VM Debian13 sur le segment DMZ-LAN

On la passe en ip statique `sudo nano /etc/network/interfaces`

```
allow-hotplug eth0
iface eth0 inet static
    address 10.10.10.10
    netmask 255.255.255.0
    gateway 10.10.10.1
    dns-nameservers 10.10.10.1
```

On reboot le réseau `sudo systemctl restart networking`

On peut tester les règles de pare-feu avec un ping vers la passerelle et 8.8.8.8

![pingOK](/images/2026-02-25-15-13-17.png)

On installe Apache avec `sudo apt install -y apache2`, `sudo systemctl enable apache2`, check avec `sudo systemctl status apache2`

![apache](/images/2026-02-25-15-52-06.png)

On se connecte à l'interface we Apache depuis une machine sur le LAN, c'est fonctionnel, on accède bien à la DMZ depuis le LAN

![dmzOK](/images/2026-02-25-16-02-09.png)

On va ping `10.0.0.1` la gateway du LAN depuis la DMZ, c'est un échec, c'est normal. Mais Ping vers le Wan fonctionne bien

![ping](/images/2026-02-25-16-08-44.png)

### NAT (Network Address Translation)

#### NAT Outbound — Permettre à la DMZ de sortir sur Internet

pfSense fait du NAT outbound automatiquement pour le LAN, mais pas forcément pour les nouvelles interfaces comme la DMZ.

Dans **Firewall** → **NAT** → onglet **Outbound**.

- Si **Automatic outbound NAT** : pfSense devrait gérer automatiquement. Si la DMZ ne sort pas sur Internet, on passe en mode **Hybrid** et on ajoute une règle manuellement.
- Si **Manual** ou **Hybrid** : on ajoute une règle.

**Ajouter une règle NAT outbound pour la DMZ (si nécessaire) :** : **⬇ Add**.

| Champ | Valeur |
| --- | --- |
| Interface | WAN |
| Source | 10.10.10.0/24 |
| Destination | any |
| Translation / Address | Interface Address |
| Description | NAT sortant DMZ |

**Save** → **Apply Changes**.

> **Explication du NAT outbound :** Quand SRV-WEB (10.10.10.10) veut accéder à Internet, ses paquets ont une IP source privée (10.10.10.10) qui n'est pas routable sur Internet. Le NAT outbound remplace cette IP par l'IP publique de l'interface WAN, ce qui permet la communication. C'est le même principe que le NAT de votre box Internet.

### NAT Port Forwarding — Rendre le serveur web accessible depuis le WAN

C'est le cœur de la DMZ : rendre le serveur web accessible depuis l'extérieur sans exposer le LAN.

dans **Firewall** → **NAT** → onglet **Port Forward** : **⬆ Add**.

**Redirection HTTP (port 80) :**

| Champ | Valeur |
| --- | --- |
| Interface | WAN |
| Protocole | TCP |
| Destination | WAN Address |
| Port de destination (range) | HTTP (80) |
| IP cible de redirection | 10.10.10.10 |
| Port cible de redirection | 80 |
| Description | NAT HTTP vers SRV-WEB |

On coche **⬜ Filter rule association: Add associated filter rule** (crée automatiquement la règle de pare-feu WAN correspondante). **Save** → **Apply Changes**.

> **Ce qui se passe :** Quand quelqu'un accède à l'IP WAN de votre pfSense sur le port 80, pfSense redirige le trafic vers 10.10.10.10:80 (SRV-WEB en DMZ). L'utilisateur externe voit le site web sans jamais savoir que le serveur est sur un réseau privé.

**Redirection HTTPS (port 443) — optionnel :**

On répète la même procédure avec le port **443 (HTTPS)** si vous configurez SSL sur le serveur web.

![NAT](/images/2026-02-25-16-24-39.png)

Dans Firewall → Rules → WAN. Une règle automatique a été créée pour autoriser le trafic entrant sur le port 80 vers 10.10.10.10.

![firewall](/images/2026-02-25-16-26-49.png)

### Installer le serveur web (SRV-WEB)

```bash
apt update && apt install -y nginx
```

Apache tournant déjà sur le port 80, on va le stopper pour nginx (en prod on devrait attribuer un autre port, et créer une nouvelle règle de port forward/firewall)

```bash
systemctl stop apache2
systemctl start nginx
systemctl status nginx
```

![nginx](/images/2026-02-25-16-35-01.png)

#### Créer une page de test personnalisée

```bash
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head><title>DMZ - SRV-WEB</title></head>
<body>
<h1>Serveur Web en DMZ</h1>
<p>Si vous voyez cette page, la DMZ fonctionne !</p>
<p>IP du serveur : 10.10.10.10</p>
</body>
</html>
EOF
```

#### Vérification locale

Depuis le LAN, directement sur l'IP de notre serveur web

![DMZ](/images/2026-02-25-16-38-09.png)

Depuis le WAN avec `curl http://192.168.2.132`

![curl](/images/2026-02-25-16-53-23.png)

Notre configuration et les règles pour la DMZ sont bonnes.

---

## Challenge VPN & Authentification Radius

![challenge](/images/2026-02-25-17-23-16.png)

### Créer un VPN client‑à‑site avec authentification RADIUS

On va utiliser OpenVPN, dans pfSense : VPN → OpenVPN → Wizard → Type of Server : Radius

![radius](/images/2026-02-26-00-18-48.png)

On sélectionne notre serveur déjà configuré (Challenge C302), OpenVPN a besoin de certificats pour chiffrer le tunnel. Certificate Authority (CA) : on remplis Descriptive Name (ex: VPN-CA) et on Valide, de même pour le server certificate : Add New (VPN-Cert).

Etape 9 **Server Setup**

```
Description : vpn-lab-access
Protocol : UDP on IPv4 only (Port par défaut 1194).
Interface : WAN (C'est par là que les clients arrivent).
Tunnel Network : On choisi un nouveau sous-réseau vierge pour les clients virtuels, par exemple 10.42.0.0/24. (Attention : ce réseau ne doit pas chevaucher le LAN).
Local Network : Réseau du Lab, 10.0.0.0/24, pour que pfSense pousse cette route dans la table de routage des clients VPN.
```

Etape 10 **Firewall Rule**

On coche Firewall Rule : Ça va ouvrir le port UDP 1194 sur l'interface WAN.

On coche OpenVPN Rule : Ça va créer une règle Allow All sur la nouvelle interface virtuelle OpenVPN (pour que le client puisse joindre le LAN).

![vpn](/images/2026-02-26-00-33-14.png)

### Exporter et tester le VPN

Pour tester la connexion depuis un client extérieur, ou exporter facilement les configurations (fichier `.ovpn`) pour nos utilisateurs du serveur VPN, on va devoir installer un paquet logiciel sur la pfSense.

On va dans System → Package Manager → Available Packages.

On installe le paquet `openvpn-client-export`, puis on va dans VPN → OpenVPN → Client Export.

On sélectionne notre serveur, et on télécharge le profil Inline Configurations (Most Clients).

![profil](/images/2026-02-26-00-40-22.png)

Une fois le fichier de config téléchargé, on l'ajoute en nouveau profil dans OpenVPN, on lance la connection et on met notre utilisateur LDAP (jdupont)

![vpn](/images/2026-02-26-00-46-21.png)

Et voilà

![OK](/images/2026-02-26-00-46-46.png)

On peut maintenant se connecter sur l'interface Web de la pfSense ou en SSH au serveur Radius, LDap etc

![OK](/images/2026-02-26-00-50-23.png)
