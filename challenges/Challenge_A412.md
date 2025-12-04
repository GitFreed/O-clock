# Atelier A412 04/12/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Challenge : Installation d'une VM Win10 via Hyper-V

[Cours A412.](/RESUME.md#️-a412-VDI)

---

## Installation d'un Windows 10 sur Hyper-V

![new](/images/2025-12-04-14-59-52.png)

On va choisir Gen2, attention Gen1 : BIOS classique, disque IDE, MBR, alors que Gen2 : UEFI, disque SCSI, GPT, Secure boot (il faudra le désactiver pour certaines machines Linux)

![gen](/images/2025-12-04-15-00-20.png)

On utilise le commutateur Virtuel qu'on a créé

![network](/images/2025-12-04-15-03-12.png)

On va faire une installation via WDS et le PXE

![WDS](/images/2025-12-04-15-07-49.png)

Installation PXE

![PXE](/images/2025-12-04-15-19-11.png)

C'est OK

![OK](/images/2025-12-04-15-36-10.png)

---
