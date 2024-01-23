# 2-App Basic
## Exercice 1
L'initialiseur List de SwiftUI attend un tableau d'éléments Identifiable et là c'est un tableau de String.

## Exercice 2
Ajout de la fonction "addItem()" pour ajouter un nouvel objet à l'inventaire + le bouton pour. 

"ForEach" est utilisé pour afficher chaque objet de l'inventaire.
Le bouton "Ajouter" est séparé de "ForEach" car il a une fonction différente : il ajoute un nouvel objet à l'inventaire, plutôt que d'agir sur un objet spécifique. S'il était dans "ForEach", un bouton serait créé pour chaque objet.

## Exercice 3

Il faut utiliser @State à var loot et aussi rename la fonction en addItem et pas addLoot et maintenant ça marche car on gere l'état mutable avec le @State

# 4-Ajout-item
## Exercice 1
Le bouton Ajouter ne fonctionne pas car il tente de modifier une structure de données immuable. on doit utilisez @State ou @Binding pour la variable inventory, ce qui permet de savoir que la variable peut changer et de mettre à jour l'interface utilisateur en conséquence.
