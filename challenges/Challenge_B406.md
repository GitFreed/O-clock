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

## Version 2.1 - Niveaux de difficulté

```ps1
# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 2.1 - Niveaux de difficulté

Clear-Host
$Rejouer = "oui"
$Historique = @() 

while ($Rejouer -eq "oui") {
    
    # --- TITRE ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v2.1)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""

    # --- MENU DIFFICULTÉ ---
    Write-Host "CHOISIS TON DESTIN LARBIN :" -ForegroundColor Yellow
    Write-Host "1. Facile    (1 à 50  | 15 vies) - Mode Noob" -ForegroundColor Green
    Write-Host "2. Moyen     (1 à 100 | 10 vies) - Mode Normal" -ForegroundColor Yellow
    Write-Host "3. Difficile (1 à 200 |  8 vies) - Mode Ultra-violence ☠️" -ForegroundColor Red
    Write-Host ""

    $ChoixValide = $false
    while (-not $ChoixValide) {
        $Choix = Read-Host "Ton choix (1/2/3)"
        switch ($Choix) {
            "1" { 
                $MaxNombre = 51; $MaxTentatives = 15; $NomNiveau = "FACILE"
                Write-Host "Pff... petit joueur !" -ForegroundColor Gray
                $ChoixValide = $true 
            }
            "2" { 
                $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "MOYEN"
                Write-Host "Ok, classique." -ForegroundColor Gray
                $ChoixValide = $true 
            }
            "3" { 
                $MaxNombre = 201; $MaxTentatives = 8; $NomNiveau = "DIFFICILE"
                Write-Host "Bonne chance, t'en auras besoin..." -ForegroundColor Red
                $ChoixValide = $true 
            }
            Default { Write-Host "1, 2 ou 3... c'est pas compliqué pourtant !" -ForegroundColor Red }
        }
    }
    
    Write-Host ""
    Write-Host "RÈGLES : Trouve le nombre entre 1 et $($MaxNombre - 1) ! (o㇃o)" -ForegroundColor Yellow
    Write-Host "Niveau : $NomNiveau | Vies : $MaxTentatives" -ForegroundColor Cyan
    Write-Host ""

    $NombreSecret = Get-Random -Minimum 1 -Maximum $MaxNombre
    $Essais = 0

    while ($true) {
        $Essais++
        
        try {
            $Saisie = Read-Host "[Essai $Essais / $MaxTentatives] Alors ? (⚆᭹⚆) "
            
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw "Vide" }
            $Nombre = [int]$Saisie

            if ($Nombre -lt 1 -or $Nombre -ge $MaxNombre) {
                Write-Host "Hep ! Entre 1 et $($MaxNombre - 1) stp ! (o_O)" -ForegroundColor Red
                $Essais-- 
                continue
            }
        }
        catch {
            Write-Host "Un nombre valide stp..." -ForegroundColor Red
            $Essais-- 
            continue
        }

        # --- LOGIQUE ---
        if ($Nombre -eq $NombreSecret) {
            Write-Host "Pas mal, t'as trouvé en $Essais essais ! (•_•)" -ForegroundColor Cyan
            $Historique += $Essais
            break 
        }
        elseif ($Essais -ge $MaxTentatives) {
            Write-Host "PERDU ! Le nombre était $NombreSecret... (X_X)" -ForegroundColor Red
            break
        }
        elseif ($Nombre -lt $NombreSecret) {
            Write-Host "C'est plus ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Blue
        }
        else {
            Write-Host "C'est moins ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Green
        }
    }

    # --- STATS ---
    Write-Host "------------------------------------------" -ForegroundColor Gray
    if ($Historique.Count -gt 0) {
        $MeilleurScore = $Historique | Measure-Object -Minimum
        Write-Host "🏆 Meilleur score : $($MeilleurScore.Minimum) essais" -ForegroundColor Yellow
    }
    Write-Host "------------------------------------------" -ForegroundColor Gray

    Write-Host ""
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta
```

![v2.1](/images/2026-02-02-19-44-38.png)

## Version 3.0 - Mode deux joueurs

```ps1
# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 3.0 - Mode 2 Joueurs

Clear-Host
$Rejouer = "oui"
$Historique = @() 

while ($Rejouer -eq "oui") {
    
    # --- TITRE ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v3.0)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""

    # --- MENU PRINCIPAL (MODE DE JEU) ---
    Write-Host "A QUI VEUX-TU T'ATTAQUER ?" -ForegroundColor Yellow
    Write-Host "1. Contre l'Ordinateur (Solo)" -ForegroundColor Green
    Write-Host "2. Contre un Pote (Duel)" -ForegroundColor Cyan
    Write-Host ""
    
    $ModeJeu = Read-Host "Ton choix (1 ou 2)"
    while ($ModeJeu -ne "1" -and $ModeJeu -ne "2") {
        $ModeJeu = Read-Host "1 ou 2... Fais un effort (o_O)"
    }

    # --- CONFIGURATION DE LA PARTIE ---
    if ($ModeJeu -eq "1") {
        # --- MODE SOLO (Choix difficulté) ---
        Clear-Host
        Write-Host "CHOISIS TA SOUFFRANCE :" -ForegroundColor Yellow
        Write-Host "1. Noob           (1 à 50  | 15 vies)" -ForegroundColor Green
        Write-Host "2. Normal          (1 à 100 | 10 vies)" -ForegroundColor Yellow
        Write-Host "3. Ultra-Violence (1 à 200 |  8 vies) ☠️" -ForegroundColor Red
        Write-Host ""

        $ChoixDiff = Read-Host "Ton choix (1/2/3)"
        switch ($ChoixDiff) {
            "1" { $MaxNombre = 51; $MaxTentatives = 15; $NomNiveau = "NOOB" }
            "2" { $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "MOYEN" }
            "3" { $MaxNombre = 201; $MaxTentatives = 8; $NomNiveau = "ULTRA-VIOLENCE" }
            Default { 
                # Par défaut si mauvais choix -> Moyen
                $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "MOYEN (Par défaut)" 
            }
        }
        
        # L'ordi choisit le nombre
        $NombreSecret = Get-Random -Minimum 1 -Maximum $MaxNombre
        $IntroMessage = "RÈGLES : Trouve le nombre entre 1 et $($MaxNombre - 1) !"

    } else {
        # --- MODE DUEL (Joueur 1 choisit) ---
        Clear-Host
        Write-Host "--- MODE DUEL ---" -ForegroundColor Cyan
        Write-Host "JOUEUR 1 : Ne laisse pas le Joueur 2 regarder !" -ForegroundColor Red
        
        # On force un nombre valide entre 1 et 100 pour le duel
        $MaxNombre = 101
        $MaxTentatives = 10
        $NomNiveau = "DUEL (1vs1)"
        $NombreSecret = 0

        while ($NombreSecret -lt 1 -or $NombreSecret -gt 100) {
            try {
                $SaisieJ1 = Read-Host "JOUEUR 1 > Entre le nombre mystère (1-100)"
                $NombreSecret = [int]$SaisieJ1
            } catch {
                Write-Host "Un nombre entier stp..." -ForegroundColor Red
            }
        }

        # ON EFFACE L'ECRAN POUR CACHER LE NOMBRE
        Clear-Host
        Write-Host "L'écran a été effacé pour la sécurité du secret..." -ForegroundColor Gray
        Write-Host "JOUEUR 2 : C'est à toi de jouer ! (o㇃o)" -ForegroundColor Yellow
        $IntroMessage = "RÈGLES : Joueur 2, trouve le nombre du Joueur 1 (1-100) !"
    }

    # --- LANCEMENT DU JEU (Commun aux deux modes) ---
    Write-Host ""
    Write-Host $IntroMessage -ForegroundColor Yellow
    Write-Host "Niveau : $NomNiveau | Vies : $MaxTentatives" -ForegroundColor Cyan
    Write-Host ""

    $Essais = 0
    while ($true) {
        $Essais++
        
        try {
            $Saisie = Read-Host "[Essai $Essais / $MaxTentatives] Alors ? (⚆᭹⚆) "
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw "Vide" }
            $Nombre = [int]$Saisie

            if ($Nombre -lt 1 -or $Nombre -ge $MaxNombre) {
                Write-Host "Hep ! Hors limites ! (o_O)" -ForegroundColor Red
                $Essais-- 
                continue
            }
        }
        catch {
            Write-Host "Un nombre valide stp..." -ForegroundColor Red
            $Essais-- 
            continue
        }

        if ($Nombre -eq $NombreSecret) {
            Write-Host "BRAVO ! T'as trouvé en $Essais essais ! (•_•)" -ForegroundColor Cyan
            $Historique += $Essais
            break 
        }
        elseif ($Essais -ge $MaxTentatives) {
            Write-Host "PERDU ! Le nombre était $NombreSecret... (X_X)" -ForegroundColor Red
            break
        }
        elseif ($Nombre -lt $NombreSecret) {
            Write-Host "C'est plus ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Blue
        }
        else {
            Write-Host "C'est moins ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Green
        }
    }

    # --- STATS ---
    Write-Host "------------------------------------------" -ForegroundColor Gray
    if ($Historique.Count -gt 0) {
        $MeilleurScore = $Historique | Measure-Object -Minimum
        Write-Host "🏆 Meilleur score session : $($MeilleurScore.Minimum) essais" -ForegroundColor Yellow
    }
    Write-Host "------------------------------------------" -ForegroundColor Gray

    Write-Host ""
    if ($ModeJeu -eq "2") {
        Write-Host "Astuce : Échangez les rôles pour la prochaine partie !" -ForegroundColor Gray
    }
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta
```

![v3.0](/images/2026-02-02-19-49-36.png)

![v3.0](/images/2026-02-02-19-49-13.png)

## Version 3.1 - Sauvegarde des scores

```ps1
# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Vers 3.1 - Sauvegarde des scores (CSV)

Clear-Host
$FichierScores = "scores.csv"

# Boucle du Menu Principal
while ($true) {
    
    # --- TITRE ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v3.1)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""

    # --- MENU PRINCIPAL ---
    Write-Host "QUE VEUX-TU FAIRE ?" -ForegroundColor Yellow
    Write-Host "1. Jouer contre l'Ordinateur (Solo)" -ForegroundColor Green
    Write-Host "2. Jouer contre un Pote (Duel)" -ForegroundColor Cyan
    Write-Host "3. Voir le Tableau des Scores (Hall of Fame)" -ForegroundColor Yellow
    Write-Host "4. Quitter (Fuir)" -ForegroundColor Gray
    Write-Host ""
    
    $ChoixMenu = Read-Host "Ton choix (1-4)"
    
    if ($ChoixMenu -eq "4") {
        Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta
        break
    }
    
    if ($ChoixMenu -eq "3") {
        # --- AFFICHAGE DES SCORES ---
        Clear-Host
        Write-Host "--- HALL OF FAME ---" -ForegroundColor Yellow
        if (Test-Path $FichierScores) {
            # On importe, on trie par essais (le plus petit en premier), et on affiche
            Import-Csv $FichierScores | Sort-Object {[int]$_.Essais} | Format-Table -AutoSize
        } else {
            Write-Host "Aucun score enregistré pour l'instant. Tout est à faire !" -ForegroundColor Gray
        }
        Write-Host ""
        Pause
        continue # Retour au menu
    }

    # Si on est ici, c'est qu'on joue (Choix 1 ou 2)
    if ($ChoixMenu -ne "1" -and $ChoixMenu -ne "2") { continue }

    # --- CONFIGURATION DE LA PARTIE ---
    if ($ChoixMenu -eq "1") {
        # --- MODE SOLO ---
        Clear-Host
        Write-Host "CHOISIS TA SOUFFRANCE :" -ForegroundColor Yellow
        Write-Host "1. Noob           (1 à 50  | 15 vies)" -ForegroundColor Green
        Write-Host "2. Normal          (1 à 100 | 10 vies)" -ForegroundColor Yellow
        Write-Host "3. Ultra-Violence (1 à 200 |  8 vies) ☠️" -ForegroundColor Red
        
        $ChoixDiff = Read-Host "Ton choix"
        switch ($ChoixDiff) {
            "1" { $MaxNombre = 51; $MaxTentatives = 15; $NomNiveau = "NOOB" }
            "2" { $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "NORMAL" }
            "3" { $MaxNombre = 201; $MaxTentatives = 8; $NomNiveau = "ULTRA-VIOLENCE" }
            Default { $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "NORMAL" }
        }
        $NombreSecret = Get-Random -Minimum 1 -Maximum $MaxNombre
        $IntroMessage = "RÈGLES : Trouve le nombre entre 1 et $($MaxNombre - 1) !"

    } else {
        # --- MODE DUEL ---
        Clear-Host
        Write-Host "--- MODE PVP ---" -ForegroundColor Cyan
        Write-Host "JOUEUR 1 : Cache ton écran !" -ForegroundColor Red
        $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "DUEL"
        $NombreSecret = 0
        while ($NombreSecret -lt 1 -or $NombreSecret -gt 100) {
            try { $NombreSecret = [int](Read-Host "JOUEUR 1 > Nombre mystère (1-100)") } catch {}
        }
        Clear-Host
        Write-Host "Secret verrouillé." -ForegroundColor Gray
        $IntroMessage = "RÈGLES : Joueur 2, trouve le nombre du Joueur 1 (1-100) !"
    }

    # --- JEU ---
    Write-Host "`n$IntroMessage" -ForegroundColor Yellow
    Write-Host "Niveau : $NomNiveau | Vies : $MaxTentatives`n" -ForegroundColor Cyan

    $Essais = 0
    $Victoire = $false

    while ($true) {
        $Essais++
        try {
            $Saisie = Read-Host "[Essai $Essais / $MaxTentatives] Alors ? (⚆᭹⚆) "
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw }
            $Nombre = [int]$Saisie
            if ($Nombre -lt 1 -or $Nombre -ge $MaxNombre) { throw }
        } catch {
            Write-Host "Invalide ! (o_O)" -ForegroundColor Red; $Essais--; continue
        }

        if ($Nombre -eq $NombreSecret) {
            Write-Host "BRAVO Larbin ! T'as trouvé en $Essais essais ! (•_•)" -ForegroundColor Cyan
            $Victoire = $true
            break 
        } elseif ($Essais -ge $MaxTentatives) {
            Write-Host "PERDU Larbin ! C'était $NombreSecret... (X_X)" -ForegroundColor Red
            break
        } elseif ($Nombre -lt $NombreSecret) {
            Write-Host "C'est plus !" -ForegroundColor Blue
        } else {
            Write-Host "C'est moins !" -ForegroundColor Green
        }
    }

    # --- SAUVEGARDE DU SCORE ---
    if ($Victoire) {
        $NomJoueur = Read-Host "Entre ton nom pour la légende (Vide pour ignorer)"
        if (-not [string]::IsNullOrWhiteSpace($NomJoueur)) {
            # Création de l'objet Score
            $NouveauScore = [PSCustomObject]@{
                Date    = Get-Date -Format "yyyy-MM-dd HH:mm"
                Joueur  = $NomJoueur
                Niveau  = $NomNiveau
                Essais  = $Essais
            }
            # Export vers CSV (Append pour ajouter à la suite)
            $NouveauScore | Export-Csv -Path $FichierScores -Append -NoTypeInformation -Encoding UTF8
            Write-Host "✅ Score sauvegardé !" -ForegroundColor Green
        }
    }
    
    Write-Host ""
    Pause
}
```

![v3.1](/images/2026-02-02-20-03-56.png)

![v3.1](/images/2026-02-02-20-04-05.png)


##
