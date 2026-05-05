#!/bin/bash
# Script additionnel : Sauvegarde automatique des projets
# Crée une archive compressée d'un dossier de projet avec la date

if [ $# -ne 1 ]
then
    echo "Usage: $0 nom_du_dossier"
    exit 1
fi
dossier=$1
if [ ! -d "$dossier" ]
then
    echo "Erreur: Le dossier $dossier n'existe pas"
    exit 1
fi
# Création du nom de l'archive avec la date
date_actuelle=$(date +%Y-%m-%d_%H-%M-%S)
nom_archive="${dossier}_backup_${date_actuelle}.tar.gz"
# Création de l'archive
tar -czf "$nom_archive" "$dossier"
# Vérification de la création
if [ -e "$nom_archive" ]
then
    echo "Sauvegarde créée avec succès: $nom_archive"
    taille=$(ls -lh "$nom_archive" | awk '{print $5}')
    echo "Taille de l'archive: $taille"
    exit 0
else
    echo "Erreur lors de la création de l'archive"
    exit 1
fi