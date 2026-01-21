# 🛡️ CHALLENGE LAB : Maîtrise du flux DNS et Sécurisation

**Rôle :** Administrateur Réseau

**Mission :**  AdGuard Home un DNS sinkhole.  Il fonctionne en redirigeant les domaines de publicité, de trackers et de malwares vers un « puits noir » (sinkhole), empêchant ainsi les appareils de notre réseau d’établir une connexion avec ces serveurs. Cette méthode bloque les requêtes DNS avant qu’elles n’atteignent le navigateur ou l’application, ce qui protège tous les appareils connectés — smartphones, tablettes, téléviseurs, IoT — sans nécessiter d’installation logicielle sur chaque appareil. Permet aussi d'accélérer la navigation.

![ADGUARD](/images/2026-01-21-00-31-34.png)
<https://github.com/AdguardTeam/AdguardHome>

---

## L'intérêt technique 🎯

1. **Visibilité Réseau (Layer 7) :** Intercepter, analyser et filtrer le trafic.
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

Par sécurité on va donner une IP statique côté client dans le network manager `sudo nmtui`

![nmt](/images/2026-01-21-16-17-15.png)

On met l'IPv4 en Manuel, on ajoute notre serveur, la passerelle et le DNS en 127.0.0.1 pour qu'il utilise son propre service, on valide et on reboot `sudo reboot`

![nmt](/images/2026-01-21-16-20-28.png)

On va installer Btop pour avoir un monitoring

```bash
sudo apt update
sudo apt install btop
```

![Btop](/images/2026-01-21-16-53-37.png)

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

### 4. Configuration et Bascule DNS

Sur l'interface Box > Réglages avancés > DHCP > Options

![options](/images/2026-01-21-12-28-03.png)

Le petit bonus 💡 On va créer un petit alias DNS local dans AdGuard Home

Dans le menu en haut : Filtres > Réécritures DNS, et ajouter une réécriture DNS :

![dns](/images/2026-01-21-12-26-14.png)

Désormais, on peut taper `http://adguard.home` pour accéder à l'interface !

![dash](/images/2026-01-21-13-33-19.png)

AdGuard ne sais pas résoudre certains noms locaux comme ma box ou lan, on va les ajouter dans DNS upstream dans Paramètres DNS. On a une liste d'exemple en dessous. On peux voir qu'il utilise de base Quad9 en version DoH : DNS over HTTPS, Port 443, les requêtes DNS sont cachées dans un flux HTTPS, on gagne en confidentialité. C'est la version 9.9.9.10 "Unsecured" qui laisse AdGuard gérer les restrictions

On ajoute notre box et lan en local comme dans les exemples

![DNS](/images/2026-01-21-15-23-13.png)

On va ajouter des DNS de repli en cas de problème sur le principal pour ne pas avoir de SPOF (Single Point Of Failure), Cloudflare et Quad9 classique (toujours en DoH)

![repli](/images/2026-01-21-15-35-39.png)

### 5. Configuration et Bascule DHCP

La Box ne permet pas le contrôle DNS sur tout le réseau, elle reste active et comme serveur DNS principal du réseau, c'est une  règle non modifiable du FAI

![DNS](/images/2026-01-21-15-52-31.png)

Il va donc falloir désactiver le service DHCP et activer celui de notre nouveau serveur AdGuard Home, ainsi aucun appareil ne pourra contourner le filtrage et on aura le contrôle total de notre réseau

Dans les paramètres DHCP de AdGuard, on sélectionne l'interface de notre serveur (eth0), on entre l'IP de notre passerelle (box), la range IP (.50 à .150), le masque de sous-réseau et la durée du bail (86400s = 24h)

On doit également ajouter le range pour l'IPv6 : fd00::10 à fd00::ff distribue les adresses Privées ULA de la 10 à la 255

![DHCP](/images/2026-01-21-16-00-59.png)

Maintenant qu'il est configuré, on va aller désactiver celui de la Box et revenir activer celui ci immédiatement après

![box](/images/2026-01-21-16-09-47.png)

On peu activer le DHCP d'AdGuard

### Problèmes

Problème rencontré, après un redémarrage mon PC n'a plus d'IP, c'est le seul appareil qui rencontre un problème a ce moment là, donc apparemment lié à Windows, après divers tests on voit une erreur NCB (Network Control Block)

![NCB](/images/2026-01-21-18-51-29.png)

Après de multiples essais, vidange du cache DNS, reset du catalogue Winsock, réinitialisation de la pile TCP/IP, désinstallation de la carte réseau, arrêt du matériel, reboot... rien n'y fait. Toujours impossible de renew l'IP, donc passage du PC en IP fixe.

Il s'avère qu'après un reboot de la box, la plupart des appareils en wifi n'arrivaient pas à se reconnecter non plus, depuis un PC et tél portable, après pas mal de temps j'ai passé le tél en IP Fixe, et après ça tout s'est mis à remonter. Le tél qui se reconnecte en Ip Fixe au Wifi pourrait avoir trigger un renouvellement de la table ARP ? Ou juste il fallait être patient et attendre des renouvellements de bails et reconnexions ?

Ajout des appareils principaux en IP fixe et/ou bail statique en dehors de la plage IP.

Bref, maintenant tout à l'air OK, IP fixe, DHCP maîtrisé, DNS filtrant et chiffré.
