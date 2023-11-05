#!/bin/bash

# Ici avec la fonction if on vérifie la présence de un argument
# si cela n'est pas respecté on echo qu'il faut saisir un argument

if [ $# -ne 1 ]; then
  echo "Comment ça marche : $0 <utilisateur>"
  exit 1
fi

# On définit l'argument à saisir

utilisateur="$1"

# On utilise la commande 'id' pour vérifier si l'utilisateur existe

if id "$utilisateur" &>/dev/null; then
    echo "L'utilisateur $utilisateur existe."

# On définit la variable fichier_log correspondante au chemin vers les logs

    fichier_log="/var/log/auth.log"

# On définit la varibale nombre_connexions qui correspond au nombre de connexions issues de nos logs
# que l'on a récupéré avec la fonction grep

    nombre_connexions=$(grep -c "sshd.*Accepted.*$utilisateur" "$fichier_log")

# On définit la variable date_actuelle on va associer à cette variable
# la date de création avec le jour le mois l'année avec l'heure et la minute

    date_actuelle=$(date +'%d-%m-%Y-%H:%M')

# Enfin on crée la variable nom_fichier à qui on va associer le nom number_connection
# et la variable date_actuelle que l'on a créée juste avant

    nom_fichier="number_connection-$date_actuelle"

# Maintenant on echo le nombre de connection de notre argument utilisateur
# avec la variable nombre_connexions que l'on envoie dans le fichier qu'on a créé juste avant

    echo "Voici le nombre de connexions de $utilisateur : $nombre_connexions" > "$nom_fichier"

# On définit notre sous_dossier dans la variable dossier_backup

    dossier_backup="JOB08_Backup"

# On crée notre directory

    mkdir -p "$dossier_backup"

# On archive notre fichier contenant notre fichier avec les nombres de connexions

    tar -cvf "$dossier_backup/$nom_fichier.tar" "$nom_fichier"

# On supprime le fichier vu que l'on garde que le fichier.tar

    rm "$nom_fichier"

# On echo que le fichier a été enregistré et archivé

    echo "Le fichier a bien été enregistré et est archivé dans $dossier_backup/$nom_fichier.tar"
else
    echo "L'utilisateur $utilisateur n'existe pas dans le système."
fi

# Pour automatiser cela toute les trentes minutes on doit d'abord changer le début du script
# on indique cette fois l'utilisateur dont on souhaite les logs puis on utilise la fonction cron
# pour cela on utilise la commande crontab -e pour éditer notre cron puis on ajoute la commande suivante
# */30 * * * * home/harou/Shell.exe/JOB08/get_logs.sh et on enregistre
