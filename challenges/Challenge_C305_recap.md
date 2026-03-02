# Récapitulatif des configurations firewall 🧱 C305 02/03/2026

Ce document présente des configurations de firewall simples et sécurisées pour un serveur exposé uniquement en SSH, avec trois outils différents : iptables, nftables et UFW.

[Challenge C305](./Challenge_C305.md)

[Cours C305.](/RESUME.md#-c305)

---

## Notes et bonnes pratiques

- Tester toujours la connexion SSH avant d'appliquer des règles DROP, sinon risque blocage.
- Les connexions établies sont gérées automatiquement par nftables et UFW.
- Pour plus de sécurité, on peut ajouter un blocage des paquets invalides ou limiter les tentatives SSH (anti-bruteforce).

---

## SSH sur machine locale

```sh
# Sur le serveur
sudo sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo systemctl restart ssh
ip a

# en Local (se connecter en utilisant le mot de passe root)
ssh -o PubkeyAuthentication=no root@10.0.0.99
```

---

## 1️⃣ iptables

### Installation de la persistance

```bash
# Installer le paquet pour sauvegarder les règles iptables au redémarrage
apt install -y iptables-persistent
```

### Nettoyage des règles existantes

```bash
# Vider toutes les chaînes de la table filter (INPUT, OUTPUT, FORWARD)
iptables -F

# Supprimer les chaînes personnalisées
iptables -X

# Vider les chaînes de la table nat
iptables -t nat -F
iptables -t nat -X
```

### Politique par défaut

```bash
# Bloquer tout le trafic entrant par défaut
iptables -P INPUT DROP

# Bloquer le transit de paquets entre interfaces
iptables -P FORWARD DROP

# Autoriser tout le trafic sortant
iptables -P OUTPUT ACCEPT

# Vérifier les politiques par défaut
iptables -L -n --line-numbers -v
```

### Autoriser le loopback

```bash
# Autoriser les communications internes (127.0.0.1)
iptables -A INPUT -i lo -j ACCEPT
```

### Autoriser les connexions déjà établies

```bash
# Permettre les réponses aux connexions déjà initiées (ex: réponses HTTP, DNS...)
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

### Autoriser SSH uniquement depuis une IP spécifique

```bash
# Remplacer 10.42.0.2 par l'adresse IP autorisée (ex: poste administrateur)
iptables -A INPUT -p tcp -s 10.42.0.2 --dport 22 -m conntrack --ctstate NEW -j ACCEPT
```

### Autoriser les connexions HTTP/HTTPS (optionnel, si besoin d'exposer un service web)

```bash
# Autoriser HTTP (port 80) et HTTPS (port 443) depuis n'importe quelle IP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
```

### Optionnel : drop des paquets invalides

```bash
# Rejeter les paquets dans un état de connexion invalide (protection supplémentaire)
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
```

### Vérification et sauvegarde

```bash
# Afficher les règles actives avec statistiques
iptables -L -n -v

# Sauvegarder les règles pour qu'elles persistent après redémarrage
netfilter-persistent save
```

---

## 2️⃣ nftables

### Installation et activation nftables

```bash
# Installer nftables
apt install -y nftables

# Activer et démarrer le service nftables
systemctl enable nftables
systemctl start nftables
```

### Exemple de configuration (`/etc/nftables.conf`)

```conf
#!/usr/sbin/nft -f

# Supprimer toutes les règles existantes avant d'appliquer la nouvelle configuration
flush ruleset

table inet filter {

    chain input {
        # Politique par défaut : bloquer tout le trafic entrant
        type filter hook input priority 0; policy drop;

        # Autoriser le trafic loopback (communications internes)
        iif lo accept

        # Autoriser les connexions déjà établies ou liées
        ct state established,related accept

        # Autoriser SSH uniquement depuis l'IP 10.42.0.2 (remplacer par l'IP réelle)
        tcp dport 22 ip saddr 10.42.0.2 ct state new accept

        # Autoriser les connexions HTTP/HTTPS (optionnel)
        tcp dport { 80, 443 } accept

        # Rejeter les paquets avec un état de connexion invalide
        ct state invalid drop
    }

    chain forward {
        # Politique par défaut : bloquer le transit de paquets
        type filter hook forward priority 0; policy drop;
    }

    chain output {
        # Politique par défaut : autoriser tout le trafic sortant
        type filter hook output priority 0; policy accept;
    }
}
```

### Vérification et persistance nftables

```bash
# Afficher le ruleset actif
nft list ruleset

# Charger la configuration depuis le fichier
nft -f /etc/nftables.conf

# Sauvegarder le ruleset actuel dans le fichier de configuration
nft list ruleset > /etc/nftables.conf
```

---

## 3️⃣ UFW

### Installation et activation UFW

```bash
# Installer UFW (Uncomplicated Firewall)
apt install -y ufw

# Activer UFW au démarrage et appliquer les règles
ufw enable
```

### Réinitialiser les règles existantes UFW

```bash
# Supprimer toutes les règles existantes et désactiver UFW temporairement
ufw reset
```

### Politique par défaut UFW

```bash
# Bloquer tout le trafic entrant par défaut
ufw default deny incoming

# Bloquer le routage/transit de paquets
ufw default deny routed

# Autoriser tout le trafic sortant
ufw default allow outgoing
```

### Autoriser le loopback (optionnel, géré par défaut) UFW

```bash
# Autoriser explicitement le trafic sur l'interface loopback
ufw allow in on lo
```

### Autoriser SSH uniquement depuis une IP spécifique UFW

```bash
# Remplacer 10.42.0.2 par l'adresse IP autorisée (ex: poste administrateur)
ufw allow from 10.42.0.2 to any port 22 proto tcp
```

### Autoriser les connexions HTTP/HTTPS (optionnel, si besoin d'exposer un service web) UFW

```bash
# Autoriser HTTP (port 80) et HTTPS (port 443) depuis n'importe quelle IP
ufw allow 80/tcp
ufw allow 443/tcp
```

### Vérification UFW

```bash
# Afficher le statut d'UFW et toutes les règles actives
ufw status verbose
```

![ufw](/images/2026-03-02-12-25-35.png)

---
