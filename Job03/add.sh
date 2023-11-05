#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Entrez les caracteres : $0 <nombre1> <nombre2>"
  exit 1
fi

nombre1="$1"
nombre2="$2"

# On réalise à nouveau une fonction if pour vérifier cette fois
# si l'argument ou les arguments sont bien des entiers compris entre 0 et 9
# si ce n'est pas le cas on echo que les arguments saisis doivent être des nombres entiers

if ! [[ "$nombre1" =~ ^[0-9]+$ ]] || ! [[ "$nombre2" =~ ^[0-9]+$ ]]; then
  echo "Les deux premiers paramètres doivent être des nombres entiers."
  exit 1
fi

# Enfin on réalise l'addition qu'on associe à la variable result et on echo le résultat
result=$((nombre1 + nombre2))

echo "Le résultat est : $result"
