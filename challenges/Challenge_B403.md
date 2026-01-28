# Challenge B403 28/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-28-15-30-44.png)

Challenge B403 : <https://github.com/O-clock-Aldebaran/SB04E03-cplus-cmoins-GitFreed>

[Cours B403.](/RESUME.md#-b403-python-les-fondamentaux)

---

## Logique

Pour créer le jeu en script python, on va se baser ce qu'on a fait sur Scratch : <https://scratch.mit.edu/projects/1271197767/editor/>

## Script

[Nombre Mystère](./Challenge_B403_NbreMystere.py)

```py
# Challenge : recréer le jeu du Nombre Mystère, c'est plus, c'est moins.
import random # Active la fonction aléatoire dans python
rejouer = "oui" # Variable rejouer sur oui pour débuter la partie

# Boucle pour rejouer, on utilise while "tant que", plutôt que "for"
while rejouer == "oui":

    # Création du nombre aléatoire
    nombre_secret = random.randint(1, 50)
    # Affichage du message de début 
    print ("Eh toi là ! Tu dois me retrouver un nombre entre 0 et 50 pour pouvoir passer ! (o㇃o)")

    # Boucle pour redemander le nombre, 1000 essais
    for essai in range(1,1000):

    # Demande du nombre
        nombre = int(input ("Alors ? (⚆᭹⚆) "))

        if nombre == nombre_secret:
            print (f"Pal mal larbin, t'as trouvé le nombre mystère en", essai, "essais ! (ꔷ_ꔷ)")
            break # On utilise break pour sortir de cette boucle et pas exit() qui quitte tout
        elif nombre < nombre_secret: #elif pour else if
            print ("C'est plus !")
        else:
            print ("C'est moins !")

    rejouer = input ("Une petite dernière ? (oui/non) ")

print ("Dégonflé ! (◡＿◡)")
```

![script](/images/2026-01-28-17-42-08.png)
