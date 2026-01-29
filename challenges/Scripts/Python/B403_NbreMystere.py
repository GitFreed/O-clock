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