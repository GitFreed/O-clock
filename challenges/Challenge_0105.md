# Challenge 0105 10/10/2025

## Pitch de l’exercice

### S01 : Atelier découverte virtualisation

- Installez VirtualBox et configurez le BIOS
- Création de la VM windows 10
- Installez Mozilla Firefox, VLC, Adobe Reader, 7zip et LibreOffice.
- Créer un deuxième utilisateur n'ayant pas les droits Admin
- Bonus : Installez une seconde machine virtuelle, sur Windows 11 cette fois-ci !
- Bonus dans le bonus :  Trouvez comment installer Windows 11 sans devoir utiliser un compte Microsoft (en créant un utilisateur local, comme sur Windows 10 pro).
- Méga-bonus : Installez une troisième machine virtuelle, avec le système Ubuntu 24.04.

---

## Screen & Tips

- VM Windows 10 avec un user2 local

![Windows 10](../images/VM-Win10.png)

- VM Windows 11 sans compte Microsoft

![Windows 11](../images/VM-Win11.png)

- VM Ubuntu

![Ubuntu](../images/VM-Ubuntu.png)

- VirtualBox avec les 3 VM installées

![VirtualBox](../images/VM-Menu.png)

- Les 3 VM lancées en simultané

![3 Machines sur une](../images/VM-Triple.png)

Il y à eu plusieurs erreurs ou instabilités me poussant à réinstaller plusieurs fois. Comme renommer une VM sur VirtualBox, ou oublier l'image disque d'installation.

Pour l'installation de Win11 sans compte Microsoft j'ai été dans les paramètres de la VM Win11 et désactivé la carte réseau. Puis effectué cette commande

![Bypass Win11 Compte Microsoft](../images/VM-BypassWin.png)
