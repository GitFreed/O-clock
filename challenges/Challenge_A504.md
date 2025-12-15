# Challenge A504 15/12/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2025-12-15-15-51-46.png)

[Challenge A504](https://github.com/O-clock-Aldebaran/SA5-compiler-un-binaire)

[Cours A504.](/RESUME.md#-a504-gestion-des-paquets-compilation--logs)

---

## Créons un Hello World en C

Création du fichier `main.c`

![nano](/images/2025-12-15-16-19-35.png)

Compilation avec `build-essential` en précisant le nom du programme avec `-o` (Output)

![hello](/images/2025-12-15-16-23-51.png)

On va copier le binaire ainsi créer dans le dossier utilisateur `/bin` pour qu'il soit accessible depuis partout avec le `$PATH`.

![path](/images/2025-12-15-16-30-35.png)

## Créons un Hello World en C++

Compilation avec la variable `-lstdc++` : Link STandarD C++ : liaison à la biblio C++

![c++](/images/2025-12-15-16-34-46.png)

## Programme avec les bibliothèques `lib`

Simple DirectMedia Layer (SDL) est une bibliothèque logicielle libre : `sudo apt install libsdl2-dev`

Création et contenu du fichier main.cpp

![maincpp](/images/2025-12-15-18-17-53.png)

Compilation avec la commande suivante

![compilsdl](/images/2025-12-15-17-20-21.png)

Notre programme affiche un carré rouge à l'écran.

## Second programme avec SDL & SDL_Image

Création du fichier main c++ avec le code fourni. 

Installation d'une bibliothèque manquante `sudo apt install libsdl2-image-dev` 

Téléchargement de l'image Tux nécessaire `wget https://upload.wikimedia.org/wikipedia/commons/a/af/Tux.png`

![SDL](/images/2025-12-15-17-29-22.png)

Compilation :

![SDLano](/images/2025-12-15-17-30-45.png)

Notre programme affiche l'image de Tux qu'on a utilisé à l'écran et  qu'on peut bouger avec nos flèches.

On voit que les commandes de gcc se complexifient rapidement.

## Make & makefile

On va créer une fichier `makefile` et l'utiliser pour se simplifier les choses, exemple avec notre hello_world

![nano](/images/2025-12-15-17-34-12.png)

![make](/images/2025-12-15-17-33-29.png)

C'est beaucoup plus rapide et simple, tout se fait automatiquement.

## Compiler un programme existant : cmatrix

Téléchargement du programme via github : `wget https://github.com/abishekvashok/cmatrix/releases/download/v2.0/cmatrix-v2.0-Butterscotch.tar`

Décompression de l'archive : `tar -xvf cmatrix-v2.0-Butterscotch.tar`

`./configure` : Vérifie que toutes les dépendances sont là et génère le Makefile spécifique à notre système (Ubuntu).

![configure](/images/2025-12-15-17-44-53.png)

Il manque des bibliothèques, il faut les installer et relancer un ./configure

`sudo apt install autoconf`
`sudo apt install libncurses5-dev libncursesw5-dev`
`./configure`

On peut alors faire le complier grâce au `make` et l'installer `sudo make install`

On peut maintenant lancer notre programme `cmatrix`

![matrix](/images/2025-12-15-18-03-06.png)
