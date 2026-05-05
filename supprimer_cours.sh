#!/bin/bash
# Script de suppression automatique de dossiers de cours
# L'étudiant donne un nom de cours et le script supprime 
# automatiquement le dossier de ce cours.

if [ $# -ne 1 ]
then
    echo "Usage: $0 nom_du_cours"
    exit 1
fi
nom_cours=$1
if [ ! -e "$nom_cours" ]
then
    echo "Erreur: Le dossier $nom_cours n'existe pas"
    exit 1
fi
if [ ! -d "$nom_cours" ]
then
    echo "Erreur: $nom_cours n'est pas un répertoire"
    exit 1
fi
echo "Voulez-vous vraiment supprimer le dossier $nom_cours ? (oui/non)"
read reponse
if [ "$reponse" == "oui" ]
then
    rm -r "$nom_cours"
    echo "Le dossier $nom_cours a été supprimé avec succès"
    exit 0
else
    echo "Suppression annulée"
    exit 0
fi