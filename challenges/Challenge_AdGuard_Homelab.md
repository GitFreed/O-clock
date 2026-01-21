# 🛡️ CHALLENGE LAB : Maîtrise du flux DNS et Sécurisation

**Rôle :** Administrateur Réseau

**Mission :** Intercepter, analyser et filtrer tout le trafic de résolution de noms (DNS) du réseau local pour bloquer les trackers, le phishing et accélérer la navigation.

![ADGUARD](/images/2026-01-21-00-31-34.png)
<https://github.com/AdguardTeam/AdguardHome>

---

## L'intérêt technique 🎯

1. **Visibilité Réseau (Layer 7) :** Voir en détail ce qui se passe sur mon réseau.
2. **Performance (Caching) :** AdGuard garde en mémoire les réponses DNS. Réponse en **1ms** (local) au lieu de **20ms** (Internet).
3. **Sécurité :** Bloquer les domaines malveillants avant même que le pare-feu n'ait à traiter le paquet IP. C'est la première ligne de défense.

---

## 🛠️ Architecture du Lab

* **Matériel :** Raspberry Pi (J'utiliserai un Raspberry pi 3B qui était au fond d'un tiroir).
* **OS :** Raspberry Pi OS (Lite).
* **Position :** Remplacer le serveur DNS par défaut de mon FAI
* **Réseau :** 192.168.1.0/24
* **Passerelle FAI :** 192.168.1.254
* **Cible Raspberry Pi :** On va lui donner l'IP 192.168.1.XXX

---

### Pré-requis Raspberry Pi OS

> 📚 **Ressources** :
>
> * Raspberry Pi OS Lite <https://www.raspberrypi.com/software/operating-systems/>
> * Raspberry Pi Imager <https://www.raspberrypi.com/software/>

Pour un serveur DNS comme AdGuard Home, la version **Lite** est impérative : pas d'interface graphique inutile qui mange de la RAM et du CPU. Le Raspberry Pi sera dédié à la performance réseau.

On lance Raspberry Pi Imager pour créer le support d'installation

![appareil](/images/2026-01-21-00-07-18.png)

![OS](/images/2026-01-21-00-08-30.png)

On personnalise le Hostname, l'user admin et le password, puis il faut activer le SSH

Et c'est parti pour le formatage et l'écriture de la carte micro SD

![done](/images/2026-01-21-00-20-36.png)

On peut enfin mettre la carte micro SD dans le Pi et le brancher à la Box puis le démarrer !

### 1. Configuration du Bail Statique

Avant même d'installer le AdGuard, on va passer l'IP en statique sur la Box `192.168.1.254` dans Réglages avancés > DHCP > Attribution d'adresse IP statique.

Pour trouver le Raspberry on va dans la liste des appareils et on cherche un appareil nommé adguard-pi ou dont l'adresse MAC commence par b8:27:eb ou dc:a6:32 (les identifiants constructeurs Raspberry).

![DHCP](/images/2026-01-21-11-45-54.png)

On débranche/rebranche le câble réseau pour qu'il récupère sa nouvelle identité.

Vérification : `Ping 192.168.1.XXX`

![ping](/images/2026-01-21-11-50-48.png)

### 2. Installation (SSH)

Connexion au Pi en SSH

```bash
ssh user@192.168.1.XXX

```

![ssh](/images/2026-01-21-11-56-15.png)

On lance le script d'installation automatique :

```bash
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

```

![install](/images/2026-01-21-11-57-41.png)

### 3. Initialisation (Web)

On va ouvrir le navigateur sur : `http://192.168.1.XXX:3000`

![web](/images/2026-01-21-11-59-24.png)

On peut voir et configurer les interfaces web et d'écoute

Attention le Serveur DNS Doit impérativement être sur le port **53** (UDP/TCP).

![interfaces](/images/2026-01-21-12-02-24.png)

Config compte admin

![admin](/images/2026-01-21-12-07-21.png)

Une fois la configuration terminée je peux me connecter directement sur son IP (port 80)

![login](/images/2026-01-21-12-14-17.png)

### 4. Bascule DNS

Sur l'interface Box > Réglages avancés > DHCP > Options

![options](/images/2026-01-21-12-28-03.png)

Le petit bonus 💡 On va créer un petit alias DNS local dans AdGuard Home.

Dans le menu en haut : Filtres > Réécritures DNS, et ajouter une réécriture DNS :

![dns](/images/2026-01-21-12-26-14.png)

Désormais, on peut taper `http://adguard.home` pour accéder à l'interface !
