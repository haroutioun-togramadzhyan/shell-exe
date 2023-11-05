#!/bin/bash

# Ici on définit la variable i égale à 1, cette variable va agir comme un compteur dans notre script
i=1

# On utilise une boucle while où l'on va réaliser l'action echo 'Je suis..'
# tant que notre compteur i est inférieur ou égal à 10
# on incrémente notre compteur de 1 à chaque fois
while [ $i -le 10 ]
do
   echo "Je suis un script qui arrive à faire une boucle $i"
    i=$((i + 1))
done
