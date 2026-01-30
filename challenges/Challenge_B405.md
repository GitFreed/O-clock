# Challenge B405 30/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-30-09-53-28.png)

![conseils](/images/2026-01-30-09-55-40.png)

**Atelier B405** : <https://github.com/O-clock-Aldebaran/SB04E05-Atelier-Powershell-et-AD/blob/master/README.MD>

### Ressources utiles

**Documentation Microsoft :**

* Module ActiveDirectory : <https://docs.microsoft.com/powershell/module/activedirectory/>
* Gestion des utilisateurs AD : <https://docs.microsoft.com/windows-server/identity/ad-ds/>

**Cmdlets essentielles :**

* **Utilisateurs :** `Get-ADUser`, `New-ADUser`, `Set-ADUser`, `Remove-ADUser`
* **Groupes :** `Get-ADGroup`, `New-ADGroup`, `Add-ADGroupMember`, `Get-ADGroupMember`
* **OU :** `Get-ADOrganizationalUnit`, `New-ADOrganizationalUnit`, `Move-ADObject`
* **Domaine :** `Get-ADDomain`, `Get-ADForest`, `Get-ADDomainController`

---

## 1. Module ActiveDirectory

On vérifie le module ActiveDirectory dans PowerShell

![PS](/images/2026-01-30-11-58-11.png)

Avec `Get-Command -Module ActiveDirectory` on aura tous les cmdlets

![cmdlets](/images/2026-01-30-11-59-14.png)

`(Get-Command -Module ActiveDirectory).Count` nous donne le total : 151 !

On cherche les cmdlets pour AdUser

![ADuser](/images/2026-01-30-12-02-58.png)

Avec Get-Help on peut voir toutes les syntaxes

![Help](/images/2026-01-30-12-09-49.png)

On va regarder notre Domaine

![domain](/images/2026-01-30-12-18-50.png)

Pour afficher spécifiquement : Nom, Niveau fonctionnel, Contrôleurs; on utilise Select-Object pour filtrer (Note : ReplicaDirectoryServers liste les contrôleurs de domaine connus par le domaine).

![ok](/images/2026-01-30-12-19-37.png)

On va récupérer les informations de notre compte "Administrateur"

![identity](/images/2026-01-30-12-26-53.png)

En détail avec -Properties la liste est conséquente

![properties](/images/2026-01-30-12-28-05.png)

Donc on va utiliser un Pipe pour filtrer précisément

![select](/images/2026-01-30-12-30-13.png)

## 2. Gestion des utilisateurs

On va créer une Unité d'Organisation "Employes"

```ps1
# 1. Création de l'UO "Employes" à la racine du domaine
New-ADOrganizationalUnit -Name "Employes" -Path "DC=TECHSECURE,DC=LOCAL"

# 2. Conversion du mot de passe en chaîne sécurisée
$SecurePass = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force
```

On va ajouter nos utilisateurs en entrant tout les détails

```ps1
    # Alice Martin
New-ADUser -Name "Alice Martin" `
    -GivenName "Alice" `
    -Surname "Martin" `
    -SamAccountName "amartin" `
    -UserPrincipalName "amartin@techsecure.local" `
    -EmailAddress "alice.martin@techsecure.fr" `
    -Title "Développeuse" `
    -AccountPassword $SecurePass `
    -Enabled $true `
    -ChangePasswordAtLogon $true `
    -Path "OU=Employes,DC=TECHSECURE,DC=LOCAL"

    # Bob Dubois
New-ADUser -Name "Bob Dubois" -GivenName "Bob" -Surname "Dubois" `
    -SamAccountName "bdubois" -UserPrincipalName "bdubois@techsecure.local" `
    -EmailAddress "bob.dubois@techsecure.fr" -Title "Administrateur Système" `
    -AccountPassword $SecurePass -Enabled $true -ChangePasswordAtLogon $true `
    -Path "OU=Employes,DC=TECHSECURE,DC=LOCAL"

# Claire Bernard
New-ADUser -Name "Claire Bernard" -GivenName "Claire" -Surname "Bernard" `
    -SamAccountName "cbernard" -UserPrincipalName "cbernard@techsecure.local" `
    -EmailAddress "claire.bernard@techsecure.fr" -Title "Chef de Projet" `
    -AccountPassword $SecurePass -Enabled $true -ChangePasswordAtLogon $true `
    -Path "OU=Employes,DC=TECHSECURE,DC=LOCAL"
    ```

