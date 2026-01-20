# Challenge B302 20/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-20-21-01-17.png)

[Cours B302.](/RESUME.md#-b302-présentation-de-zabbix)

---

## Installation d'un Agent Zabbix sur une machine Ubuntu

Préalablement on va vérifier notre IP sur cette machine, ping le serveur Zabbix, et update/upgrade les packets

![before](/images/2026-01-20-21-25-49.png)

On va directement installer l'agent via les packages du repo Zabbix comme pour le serveur hier.

![packages](/images/2026-01-20-21-08-56.png)

```bash
sudo wget https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.4+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_latest_7.4+ubuntu24.04_all.deb
sudo apt update
```

Installation de l'agent 2 `sudo apt install zabbix-agent2`

Configuration de l'agent `sudo nano /etc/zabbix/zabbix_agent2.conf`

On va modifier la configuration avec nano pour ajouter notre serveur

```bash
Server=10.0.0.90
ServerActive=10.0.0.90
Hostname=SRV-Zabbix-Fred
```

![nano](/images/2026-01-20-21-22-56.png)

On peut redémarrer et  enanlme l'agent

```bash
sudo systemctl restart zabbix-agent2
sudo systemctl enable zabbix-agent2
sudo systemctl status zabbix-agent2
```

![enable](/images/2026-01-20-21-28-37.png)

On peut vérifier l'écoute sur le port 10050 avec `sudo ss -tlnp | grep 10050`

![port](/images/2026-01-20-21-29-54.png)

## Ajout de l'hôte Ubuntu dans Zabbix

On va ajouter notre Host dans Data Collection : Hosts : Create host

![host](/images/2026-01-20-21-36-24.png)

Attention le Hostname doit être impérativement le même que celui de l'hôte (sensible aux majuscules), on peut voir si la disponibilité est OK avec l'icône ZBX verte.

![ok](/images/2026-01-20-21-39-08.png)

Je le retrouve sur mon Dashboard

![dash](/images/2026-01-20-21-41-47.png)

Et je vois que tout remonte correctement dans Latest Data

![datas](/images/2026-01-20-21-40-59.png)

## Installation d'un Agent Zabbix sur une machine Windows

Vérifications IP & Ping

![ping](/images/2026-01-20-21-46-13.png)

Cette fois ci on va télécharger l'agent <https://www.zabbix.com/fr/download_agents>

![DL](/images/2026-01-20-21-49-12.png)

![agent2](/images/2026-01-20-21-49-22.png)

On va lancer et configurer l'agent qu'on a téléchargé

![install](/images/2026-01-20-21-50-31.png)

On ajoute nos informations serveur ici, "Add agent location to the PATH" permet d'utiliser l'agent directement via le terminal

![serveur](/images/2026-01-20-21-52-36.png)

Je peux vérifier si mon agent est bien lancé et l'écoute du port dans Powershell

![test](/images/2026-01-20-21-57-37.png)

## Ajout de l'hôte Windows dans Zabbix

![host](/images/2026-01-20-22-00-31.png)

L'icône ZBX n'est pas verte, il doit y avoir un soucis, comme une règle de Pare-feu

![zbxfail](/images/2026-01-20-22-00-52.png)

On va ajouter un règle dans le Pare-feu Windows `New-NetFirewallRule -DisplayName "Zabbix Agent" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 10050`

![firewall](/images/2026-01-20-22-06-34.png)

Et voilà c'est passé en vert !

![OK](/images/2026-01-20-22-07-08.png)

![dash](/images/2026-01-20-22-08-02.png)

![data](/images/2026-01-20-22-10-50.png)

## Création d'un Dashboard
