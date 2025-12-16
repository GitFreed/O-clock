# Atelier A505 16/12/2025

## Pitch de l’exercice 🧑‍🏫

![Atelier]()

[Atelier A505](https://github.com/O-clock-Aldebaran/SA5-atelier-LAMP)

---

## Installation d'une VM Debian

![deb](/images/2025-12-16-10-18-39.png)

On a pas besoin d'un environnement de bureau : il n'y a pas d'écran connecté à un serveur, on s'y connecte ultérieurement avec le protocole SSH

![ssh](/images/2025-12-16-10-29-46.png)

![debian](/images/2025-12-16-10-33-48.png)

## Création SUDO

On installe et on passe notre utilisateur en sudo

```bash
su -
apt update
apt install sudo
usermod -aG sudo freed
```

## Guest addition

`sudo apt install open-vm-tools`

![vmtools](/images/2025-12-16-10-54-44.png)

## Apache

`sudo apt install apache2`

On met notre VM par pont pour y avoir accès sur notre réseau, `sudo systemctl restart networking` pour renouveler notre IP, et `ip a` pour avoir l'IP du serveur et s'y connecter dessus.

![apache](/images/2025-12-16-10-59-32.png)
