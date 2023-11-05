#!/bin/bash

# Ici avec la fonction if on vérifie la présence de trois arguments
# si cela n'est pas respecté on echo qu'il faut saisir trois arguments

if [ $# -ne 3 ]; then
  echo "Comment ça marche : $0 <nombre1> <opérateur> <nombre2>"
  exit 1
fi

# On définit les arguments à saisir

nombre1="$1"
op="$2"
nombre2="$3"

# On réalise à nouveau une fonction if pour vérifier cette fois
# si l'argument ou les arguments sont bien des entiers compris entre 0 et 9
# si ce n'est pas le cas on echo que le premier et le troisième arguments saisis doivent être des nombres entiers

if ! [[ "$nombre1" =~ ^[0-9]+$ ]] || ! [[ "$nombre2" =~ ^[0-9]+$ ]]; then
  echo "Le premier et le troisième paramètres doivent être des nombres entiers."
  exit 1
fi

# On réalise un dernier if pour cette fois vérifier le deuxième argument
# on va comparer le deuxième argument aux opérateurs existants
# Si le deuxième argument correspond alors on réalise l'opération correspondante
# Sinon on echo que l'opérateur est invalide et on précise les opérateurs à utiliser

if [ "$op" = "/" ]; then

# Ici on realise un if dans if parce qu'il s'agit d'une division
# avec le cas de la division par zéro qu'il faut traiter
# de plus certaines divisions donne des résultats décimaux qu'on souhaite afficher
# dans notre cas on utilise la fonction awk pour formater notre résultat avec trois décimales après la virgule

	 if [ "$nombre2" -eq 0 ]; then
      		echo "Division par zéro impossible."
      		exit 1
    	else
		result=$(awk "BEGIN {printf \"%.3f\", $nombre1 / $nombre2}")
		echo "Le résultat est : $result"
	fi
elif [ "$op" =  "+" ]; then
	result=$((nombre1 + nombre2))
	echo "Le resulat est : $result"
elif [ "$op" =  "-" ]; then
        result=$((nombre1 - nombre2))
	echo "Le resulat est : $result"
elif [ "$op" =  "x" ]; then
        result=$((nombre1 * nombre2))
	echo "Le resulat est : $result"
else
	echo "Opérateur invalide, veuillez choisir un opérateur parmis les suivants  : x + - /"
	exit 1
fi
