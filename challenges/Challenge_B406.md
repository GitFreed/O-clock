# Challenge B406 02/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-02-15-59-37.png)

Challenge B406 : <https://github.com/O-clock-Aldebaran/SB04E06-plusmoins-ps-GitFreed>

---

## Préparation de l'environnement

Pour les versionner le script il sera dans mon [REPO Scripts](./Scripts/PowerShell/)

Avec son [README](./Scripts/PowerShell/B406_PlusouMoins_README.md)

## Version 1.0 - Jeu basique

Script [B406_PlusOuMoins.ps1](./Scripts/PowerShell/B406_PlusOuMoins.ps1)

```ps1
# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 1.0

Clear-Host # Nettoie la console au démarrage

$Rejouer = "oui"

# Boucle principale du jeu
while ($Rejouer -eq "oui") {
    
    # L'ordinateur choisit un nombre aléatoire (Maximum est exclusif, donc 101 pour avoir 100)
    $NombreSecret = Get-Random -Minimum 1 -Maximum 101
    $Essais = 0

    # Message de début
    Write-Host "Eh toi là ! Tu dois me retrouver un nombre entre 1 et 100 pour pouvoir passer ! (o㇃o)" -ForegroundColor Cyan

    # Boucle de recherche
    while ($true) {
        $Essais++
        
        # On demande le nombre et on force le type [int] pour être sûr que c'est un nombre
        try {
            $Saisie = Read-Host "Alors ? (⚆᭹⚆) "
            $Nombre = [int]$Saisie
        }
        catch {
            Write-Host "Heu... j'ai dit un nombre..." -ForegroundColor Red
            continue # On recommence la boucle si ce n'est pas un nombre
        }

        # On fait la comparaison si, ou si, alors
        if ($Nombre -eq $NombreSecret) {
            Write-Host "Pas mal larbin, t'as trouvé le nombre mystère en $Essais essais ! (•_•)" -ForegroundColor Green
            break # On sort de la boucle de recherche
        }
        elseif ($Nombre -lt $NombreSecret) {
            Write-Host "C'est plus !" -ForegroundColor Yellow
        }
        else {
            Write-Host "C'est moins !" -ForegroundColor Yellow
        }
    }

    # On demande pour rejouer
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Gray
```
