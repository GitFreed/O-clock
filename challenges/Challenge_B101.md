# Challenge B101 05/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-05-16-48-38.png)

[Challenge](https://github.com/O-clock-Aldebaran/SB1E01-challenge-virtualisation)

[Cours B101.](/RESUME.md#-b101-introduction)

---

## Installer et configurer un hyperviseur Type 2 (VMware Workstation Pro) sur une machine locale

J'avais déjà utilisé et donc installé / configuré VMware Workstation Pro 25H2 à titre personnel pour tester d'autres solutions de virtualisation lors de notre première saison.

![VMware](/images/2026-01-05-17-25-28.png)

---

## Installer et configurer un hyperviseur Type 1 (Proxmox) dans une VM sur le Type 2

Après avoir téléchargé la dernière image de Proxmox (Hyperviseur type 1) sur <https://www.proxmox.com/en/downloads/proxmox-virtual-environment/iso> on va la monter dans VMware (hyperviseur type 2)

On doit impérativement cocher 'Virtualize Intel VT-x/EPT or AMD-V/RVI' car Proxmox est un hyperviseur de type 1

![install](/images/2026-01-05-17-54-51.png)

On paramètre le compte Root à l'installation (son password, et mail), puis son Hostname 'pve1.local' et on lance l'installation, une fois terminée on retire l'image disque et le serveur démarre :

![done](/images/2026-01-05-18-02-33.png)

on se log en root et on peux vérifier notre IP et si on ping bien sur internet

![log](/images/2026-01-05-18-08-38.png)

En me connectant sur l'ip 192.168.1.33 avec le port 8006 on peut accéder à l'interface du serveur Proxmox <https://192.168.1.33:8006/>

![serveur](/images/2026-01-05-18-15-03.png)

Depuis le shell on met à jour nos paquets, et on va installer Open VM Tools pour que Proxmox soit mieux géré sur VMware. On va aussi installer le Qemu Guest Agent si on a besoin de futures VM sur ce Proxmox.

```bash
apt update
apt upgrade
apt install open-vm-tools
apt install qemu-guest-agent
```

On peut aussi se log en SSH via Powershell

![ssh](/images/2026-01-05-18-23-51.png)

---

## Installer un deuxième Proxmox dans une deuxième VM

---
