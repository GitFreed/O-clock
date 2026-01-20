# 🛡️ CHALLENGE LAB : Maîtrise du flux DNS et Sécurisation

**Rôle :** Administrateur Réseau
**Mission :** Intercepter, analyser et filtrer tout le trafic de résolution de noms (DNS) du réseau local pour bloquer les trackers, le phishing et accélérer la navigation.

---

## L'intérêt technique 🎯

1. **Visibilité Réseau (Layer 7) :** Voir en détail ce qui se passe sur mon réseau, qui y fait quoi, et ou ça va.
2. **Performance (Caching) :** AdGuard garde en mémoire les réponses DNS. Réponse en **1ms** (local) au lieu de **20ms** (Internet).
3. **Sécurité :** Bloquer les domaines malveillants avant même que le pare-feu n'ait à traiter le paquet IP. C'est la première ligne de défense.

---

## 🛠️ Architecture du Lab

* **Matériel :** Raspberry Pi (J'utiliserai un Raspberry pi 3B que j'ai déjà).
* **OS :** Raspberry Pi OS (Lite).
* **Position :** Remplacer le serveur DNS par défaut de mon FAI
* **Réseau :** 192.168.1.0/24
* **Passerelle FAI :** 192.168.1.254
* **Cible Raspberry Pi :** On va lui donner l'IP 192.168.1.XXX

---

### 1. Configuration du Bail Statique (Sur la Box)

Avant même d'installer le logiciel, on verrouille l'IP.

* Sur ma Box `192.168.1.254` dans **Services de la box** > **DHCP** > **Attribution d'adresse IP statique**

* **Action requise :** Redémarrer le Raspberry Pi (ou débrancher/rebrancher le câble réseau) pour qu'il récupère sa nouvelle identité.

* **Vérification :** Ping

### 2. Installation (SSH)

Connexion au Pi en SSH

```bash
ssh user@192.168.1.XXX

```

Je lance le script d'installation automatique :

```bash
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

```

### 3. Initialisation (Web)

1. J'ouvre mon navigateur sur : `http://192.168.1.XXX:3000`
2. Clique sur **"C'est parti"**.
3. **Interfaces d'écoute (Attention piège classique)** :

* **Interface Web Admin :** Sur le port **80** (ou 8080 si on a déjà un serveur web dessus).
* **Serveur DNS :** Doit impérativement être sur le port **53** (UDP/TCP).

* Config du premier compte admin.

### 4. Bascule DNS

Sur l'interface Box > **DHCP** > **Serveurs DNS**.

* **DNS 1 :** `192.168.1.XXX`
* **DNS 2 :** *Vide* (Pour forcer le passage par AdGuard)
* Sauvegarde et redémarre la Bbox.

### 💡 Le petit truc

Je vais créer un petit alias DNS local dans AdGuard Home.

Dans > **Filtres** > **Réécritures DNS**, j'ajoute une règle :

* Domaine : `adguard.home`
* Réponse IP : `192.168.1.XXX`

Désormais, on peut taper `http://adguard.home` pour accéder à l'interface !
