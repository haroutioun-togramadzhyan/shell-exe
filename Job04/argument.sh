#!/bin/bash

# Ici avec la fonction if on vérifie la présence de deux arguments
# si cela n'est pas respecté on echo qu'il faut saisir deux arguments

if [ $# -ne 2 ]; then
    echo "Comment ça marche: $0 <fichier_source> <fichier_destination>"
    exit 1
fi

# On définit les arguments à saisir

fichier_source=$1
fichier_destination=$2

# On vérifie l'existence du fichier dont on cherche à copier le contenu
# Si celui-ci n'existe pas on echo que le fichier source n'existe pas

if [ ! -e "$fichier_source" ]; then
    echo "Le fichier source '$fichier_source' n'existe pas."
    exit 1
fi

# On utilise la fonction cat pour récupérer le contenu du fichier source et l'envoyer dans le fichier destination
# j'utilise >> pour ajouter et non écraser le contenu dans le fichier destination

cat  "$fichier_source" >> "$fichier_destination"

# On utilise à nouveau un if pour cette fois vérifier que la copie du fichier a bien été réalisée
# dans le cas contraire on echo qu'il y a eu une erreur lors de la copie

if [ $? -eq 0 ]; then
    echo "Le contenu de '$fichier_source' a été copié dans '$fichier_destination'."
else
    echo "Une erreur s'est produite lors de la copie du fichier."
fi
