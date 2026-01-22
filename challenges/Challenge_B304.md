# Challenge B303 21/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-22-02-03-02.png)

[Cours B303.](/RESUME.md-b303-les-agents-zabbix)

---

## Création d'un Item (le capteur)

Dans le Dashboard je clic sur mon Host Windows : Item, il renvois sur Data Collection > Hosts et Create item, on va utiliser la clé native de l'agent Zabbix : vfs.file.exists

![item](/images/2026-01-22-02-08-22.png)

## Création d'un Trigger (l'alarme)

On retourne sur l'Host, on clic Trigger, Create Trigger. On ajoute notre item créé, avec result = 0 veut dire que l'objet n'existe pas

![trigger](/images/2026-01-22-02-11-59.png)

## Test

Sur mon Windows dans C: je crée un fichier test.txt. Dans Latest Data je sélectionne mon Host Windows et je cherche l'item créé, je vois qu'il est bien avec une value de 1 !

![test](/images/2026-01-22-02-19-14.png)

Pour vérifier le Trigger je supprime le fichier j'attend un peu et l'alerte pop bien sur le dashboard !

![oulala](/images/2026-01-22-02-22-28.png)

Si je restaure mon fichier je vois l'alerte disparaître du Dashboard et le Change +1 avec Last value 1 dans les datas

![data](/images/2026-01-22-02-24-27.png)
