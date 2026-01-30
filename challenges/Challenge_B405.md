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
# Création de l'UO "Employes" à la racine du domaine
New-ADOrganizationalUnit -Name "Employes" -Path "DC=TECHSECURE,DC=LOCAL"

# Conversion du mot de passe en chaîne sécurisée
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

Avec Get-ADUser on aura toute la liste des utilisateurs, on filtre avec Selec Object pour que ce soit lisible

![users](/images/2026-01-30-12-48-43.png)

Pour chercher un utilisateur avec son login on utilise simplement -Identity

![identity](/images/2026-01-30-12-49-35.png)

Pour trouver ceux dont le nom commence par B on utilise le filtre avec l'opérateur -like et l'astérisque * (wildcard) qui veut dire "n'importe quoi après"

![B](/images/2026-01-30-12-50-56.png)

Pour ceux qui sont Administrateurs, par défaut, Get-ADUser ne charge pas la propriété "Title". On doit forcer son chargement avec -Properties Title pour pouvoir l'afficher

![title](/images/2026-01-30-12-52-23.png)

Pour le nombre total un `(Get-ADUser -Filter *).Count` nous donne les 6

Pour modifier un utilisateur on utilise Set-ADUser, on ajoute les infos et on vérifie

![Set](/images/2026-01-30-12-58-31.png)

Si un utilisateur part en vacances on peut le désactiver

![disable](/images/2026-01-30-13-02-40.png)

Pour supprimer un utilisateur on nous demande de valider

![remove](/images/2026-01-30-13-04-25.png)

![fired](/images/2026-01-30-13-01-50.png)

## 3. Gestion des groupes

![groups](/images/2026-01-30-13-24-07.png)

```ps1
# Définition du chemin (OU)
$OU = "OU=Employes,DC=TECHSECURE,DC=LOCAL"

# GRP_Developpeurs
New-ADGroup -Name "GRP_Developpeurs" -GroupScope Global -GroupCategory Security -Description "Équipe de développement" -Path $OU

# GRP_Admins_Systeme
New-ADGroup -Name "GRP_Admins_Systeme" -GroupScope Global -GroupCategory Security -Description "Administrateurs système" -Path $OU

# GRP_Chefs_Projet
New-ADGroup -Name "GRP_Chefs_Projet" -GroupScope Global -GroupCategory Security -Description "Chefs de projet" -Path $OU

# GRP_IT
New-ADGroup -Name "GRP_IT" -GroupScope Global -GroupCategory Security -Description "Ensemble du département IT" -Path $OU
```

On va ajouter Alice et Bob dans leur groupes

```ps1
Add-ADGroupMember -Identity "GRP_Developpeurs" -Members "amartin"
Add-ADGroupMember -Identity "GRP_Admins_Systeme" -Members "bdubois"
```

On va créer 2 nouveaux utilisateurs Dev, on doit les créer puis les ajouter au groupe

```ps1
# Patrice Maldi
New-ADUser -Name "Patrice Maldi" -GivenName "Patrice" -Surname "Maldi" `
    -SamAccountName "pmaldi" -UserPrincipalName "pmaldi@techsecure.local" `
    -EmailAddress "patrice.maldi@techsecure.fr" -Title "Developpeur" `
    -AccountPassword $SecurePass -Enabled $true -ChangePasswordAtLogon $true `
    -Path "OU=Employes,DC=TECHSECURE,DC=LOCAL"

Add-ADGroupMember -Identity "GRP_Developpeurs" -Members "pmaldi"

# Baptiste Delphin
New-ADUser -Name "Baptiste Delphin" -GivenName "Baptiste" -Surname "Delphin" `
    -SamAccountName "bdelphin" -UserPrincipalName "bdelphin@techsecure.local" `
    -EmailAddress "baptiste.delphin@techsecure.fr" -Title "Developpeur" `
    -AccountPassword $SecurePass -Enabled $true -ChangePasswordAtLogon $true `
    -Path "OU=Employes,DC=TECHSECURE,DC=LOCAL"

Add-ADGroupMember -Identity "GRP_Developpeurs" -Members "bdelphin"
```

Pour ajouter tous les membres dans le groupe IT

```ps1
Add-ADGroupMember -Identity "GRP_IT" -Members "amartin", "bdubois", "pmaldi", "bdelphin"
```

On peut lister pour vérifier

![list](/images/2026-01-30-13-55-58.png)

et afficher les groupes de amartin

![amartin](/images/2026-01-30-14-04-51.png)

Pour chaque groupe on va faire un (.Count)

![count](/images/2026-01-30-14-11-02.png)

Retrait d'Alice de GRP_IT et vérification

![remove](/images/2026-01-30-14-13-03.png)

On va créer un groupe GRP_Tous_Utilisateurs et y imbriquer le GRP_IT

```ps1
New-ADGroup -Name "GRP_Tous_Utilisateurs" -GroupScope Global -GroupCategory Security -Path "OU=Employes,DC=TECHSECURE,DC=LOCAL"
Add-ADGroupMember -Identity "GRP_Tous_Utilisateurs" -Members "GRP_IT"
```

On peut voir notre groupe IT bien ajouté, et en récursif on peut voir les utilisateurs qui en découlent

![liste](/images/2026-01-30-14-16-18.png)

## 4. Organisation avec les Unités Organisationnelles (OU)

TechSecure/
├── Utilisateurs/
│   ├── Informatique/
│   │   ├── Developpement/
│   │   └── Infrastructure/
│   ├── RH/
│   └── Commercial/
├── Groupes/
└── Ordinateurs/
