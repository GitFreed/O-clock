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

## Version 1.1 - Améliorations visuelles

```ps1
# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 1.1

Clear-Host
$Rejouer = "oui"

while ($Rejouer -eq "oui") {
    
    # --- AMELIORATION VISUELLE (TITRE) ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v1.1)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""
    
    # La phrase d'intro en Jaune
    Write-Host "RÈGLES : Eh toi là ! Tu dois me retrouver un nombre entre 1 et 100 ! (o㇃o)" -ForegroundColor Yellow
    Write-Host "Je te dirai si c'est plus ou moins." -ForegroundColor Yellow
    Write-Host ""

    $NombreSecret = Get-Random -Minimum 1 -Maximum 101
    $Essais = 0

    while ($true) {
        $Essais++
        
        try {
            # Ajout du compteur d'essais
            $Saisie = Read-Host "[Essai $Essais] Alors ? (⚆᭹⚆) "
            $Nombre = [int]$Saisie
        }
        catch {
            Write-Host "Heu... j'ai dit un nombre..." -ForegroundColor Red
            continue
        }

        # --- COULEURS IMPOSÉES ---
        if ($Nombre -eq $NombreSecret) {
            # La phrase de victoire (•_•) en CYAN
            Write-Host "Pas mal larbin, t'as trouvé le nombre mystère en $Essais essais ! (•_•)" -ForegroundColor Cyan
            break 
        }
        elseif ($Nombre -lt $NombreSecret) {
            # BLEU pour "Plus grand"
            Write-Host "C'est plus !" -ForegroundColor Blue
        }
        else {
            # VERT pour "Plus petit"
            Write-Host "C'est moins !" -ForegroundColor Green
        }
    }

    Write-Host ""
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta
```

![v1.1](/images/2026-02-02-19-24-17.png)

## Version 1.2 - Validation des entrées

```ps1
# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 1.2 - Validation des entrées

Clear-Host
$Rejouer = "oui"

while ($Rejouer -eq "oui") {
    
    # --- AMELIORATION VISUELLE (TITRE) ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v1.2)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""
    
    # La phrase d'intro en Jaune
    Write-Host "RÈGLES : Eh toi là ! Tu dois me retrouver un nombre entre 1 et 100 ! (o㇃o)" -ForegroundColor Yellow
    Write-Host "Je te dirai si c'est plus ou moins." -ForegroundColor Yellow
    Write-Host ""

    $NombreSecret = Get-Random -Minimum 1 -Maximum 101
    $Essais = 0

    while ($true) {
        $Essais++
        
        try {
            # Ajout du compteur d'essais
            $Saisie = Read-Host "[Essai $Essais] Alors ? (⚆᭹⚆) "
            
            # 1. Vérification si vide
            if ([string]::IsNullOrWhiteSpace($Saisie)) {
                throw "Vide"
            }

            # 2. Conversion en nombre (Si ça plante, ça va direct dans le catch)
            $Nombre = [int]$Saisie

            # 3. Vérification si hors limite (Entre 1 et 100)
            if ($Nombre -lt 1 -or $Nombre -gt 100) {
                Write-Host "Hep hep hep ! Entre 1 et 100 j'ai dit ! (o_O)" -ForegroundColor Red
                $Essais-- # On annule le compteur pour cet essai raté
                continue
            }
        }
        catch {
            # Ici on arrive si ce n'est pas un nombre ou si c'est vide
            Write-Host "Heu... j'ai dit un nombre valide..." -ForegroundColor Red
            $Essais-- # On annule le compteur pour cet essai raté
            continue
        }

        # --- COULEURS IMPOSÉES ---
        if ($Nombre -eq $NombreSecret) {
            # La phrase de victoire (•_•) en CYAN
            Write-Host "Pas mal larbin, t'as trouvé le nombre mystère en $Essais essais ! (•_•)" -ForegroundColor Cyan
            break 
        }
        elseif ($Nombre -lt $NombreSecret) {
            # BLEU pour "Plus grand"
            Write-Host "C'est plus !" -ForegroundColor Blue
        }
        else {
            # VERT pour "Plus petit"
            Write-Host "C'est moins !" -ForegroundColor Green
        }
    }

    Write-Host ""
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta
```

![v1.2](/images/2026-02-02-19-28-19.png)

## Version 2.0 - Fonctionnalités avancées

```ps1
# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 2.0 - Fonctionnalités avancées (Scores & Limites)

Clear-Host
$Rejouer = "oui"
$Historique = @() # Création d'une liste vide pour stocker les scores

while ($Rejouer -eq "oui") {
    
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v2.0)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""
    
    Write-Host "RÈGLES : Eh toi là ! Tu dois me retrouver un nombre entre 1 et 100 ! (o㇃o)" -ForegroundColor Yellow
    Write-Host "ATTENTION : T'as que 10 essais sinon t'es viré !" -ForegroundColor Red
    Write-Host ""

    $NombreSecret = Get-Random -Minimum 1 -Maximum 101
    $Essais = 0
    $MaxTentatives = 10

    while ($true) {
        $Essais++
        $Restant = $MaxTentatives - $Essais + 1 # Calcul des vies restantes
        
        try {
            # Affichage du compteur avec vies restantes
            $Saisie = Read-Host "[Essai $Essais / $MaxTentatives] Alors ? (⚆᭹⚆) "
            
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw "Vide" }
            $Nombre = [int]$Saisie

            if ($Nombre -lt 1 -or $Nombre -gt 100) {
                Write-Host "Hep hep hep ! Entre 1 et 100 j'ai dit ! (o_O)" -ForegroundColor Red
                $Essais-- 
                continue
            }
        }
        catch {
            Write-Host "Heu... j'ai dit un nombre valide..." -ForegroundColor Red
            $Essais-- 
            continue
        }

        # --- LOGIQUE DU JEU ---
        if ($Nombre -eq $NombreSecret) {
            # VICTOIRE
            Write-Host "Pas mal larbin, t'as trouvé le nombre mystère en $Essais essais ! (•_•)" -ForegroundColor Cyan
            $Historique += $Essais # On ajoute le score à l'historique
            $Gagne = $true
            break 
        }
        elseif ($Essais -ge $MaxTentatives) {
            # DEFAITE (Si on atteint 10 essais sans trouver)
            Write-Host "PERDU ! T'es nul, le nombre était $NombreSecret... (X_X)" -ForegroundColor Red
            break
        }
        elseif ($Nombre -lt $NombreSecret) {
            Write-Host "C'est plus ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Blue
        }
        else {
            Write-Host "C'est moins ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Green
        }
    }

    # --- FIN DE PARTIE & STATS ---
    Write-Host "------------------------------------------" -ForegroundColor Gray
    if ($Historique.Count -gt 0) {
        # On trie les scores du plus petit au plus grand et on prend le premier
        $MeilleurScore = $Historique | Measure-Object -Minimum
        Write-Host "🏆 Ton meilleur score pour l'instant : $($MeilleurScore.Minimum) essais" -ForegroundColor Yellow
    }
    else {
        Write-Host "Pas encore de victoire... Au boulot ! (¬_¬)" -ForegroundColor Gray
    }
    Write-Host "------------------------------------------" -ForegroundColor Gray

    Write-Host ""
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta
```

![v2.0](/images/2026-02-02-19-36-24.png)

## 