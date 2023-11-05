#!/bin/bash

# Ici avec la fonction if on vérifie la présence de deux arguments
# si cela n'est pas respecté on echo qu'il faut saisir deux arguments

if [ $# -ne 1 ]; then
  echo "Comment ça marche : $0 <argument> (petit indice utilise 'Hello' ou 'Bye')"
  exit 1
fi

# On définit notre argument

argument="$1"

# On utilise la fonction if pour echo Bonjour.. si en entrée on a 'Hello'
# sinon on realise un elif pour echo Au revoir.. si en entrée on a 'Bye' 

if [ "$argument" = "Hello" ]; then
	echo "Bonjour, je suis un script !"
elif [ "$argument" = "Bye" ]; then
	echo "Au revoir et bonne journée !"
fi
