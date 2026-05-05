#!/bin/bash
# Script de création automatique de dossiers de cours

if [ $# -ne 1 ]
then
    echo "Usage: $0 nom_du_cours"
    exit 1
fi
# Récupération du nom du cours
nom_cours=$1
# Vérification si le dossier existe déjà
if [ -e "$nom_cours" ]
then
    echo "Erreur: Le dossier $nom_cours existe déjà"
    exit 1
fi
mkdir "$nom_cours"
for semestre in $(seq 1 6)
do
    mkdir "$nom_cours/Semestre$semestre"
    mkdir "$nom_cours/Semestre$semestre/TD"
    mkdir "$nom_cours/Semestre$semestre/TP"
    mkdir "$nom_cours/Semestre$semestre/CM"
done

echo "Dossier $nom_cours créé avec succès avec 6 semestres (TD, TP, CM)"
exit 0