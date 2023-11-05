#!/bin/bash

fichier_csv="$1"
while IFS=',' read -r Id Prenom Nom Mdp Role; do

# On vérifie le rôle de l'utilisateur et donne les permissions correspondantes
  if [ "$Role" = "User" ]; then

# Ici on crée l'utilisateur et avec l'option p on associe le mot de passe correspondant
    sudo useradd -m -p "$(openssl passwd -1 "$Mdp")" "$Prenom"
    echo "Création de l'utilisateur $Prenom en tant que User"
  elif [ "$Role" = "Admin" ]; then


# On crée l'utilisateur et on lui donne les permissions d'un superadministrateur
    sudo useradd -m -p "$(openssl passwd -1 "$Mdp")" "$Prenom"
    sudo usermod -aG sudo "$Prenom"
    echo "Création de l'utilisateur $Prenom en tant que admin"
  else
    echo "Rôle non reconnu pour $Prenom."
  fi
done < "$fichier_csv"


