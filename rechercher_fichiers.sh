#!/bin/bash
# Script de recherche des 3 fichiers les plus volumineux
# L'étudiant donne un mot (ex : « cpp ») et le script ressort 
# les trois fichiers les plus volumineux dont le nom contient ce mot
if [ $# -ne 1 ]
then
    echo "Usage: $0 mot_cle"
    exit 1
fi
mot_cle=$1
# Recherche des fichiers contenant le mot clé et tri par taille
# find : cherche les fichiers à partir du répertoire courant
# -type f : uniquement les fichiers (pas les répertoires)
# -name : dont le nom contient le mot clé
# -ls : liste les fichiers avec leurs informations
# sort : trie les résultats
# -k7 : tri sur la 7ème colonne (la taille)
# -n : tri numérique
# -r : tri dans l'ordre décroissant (reverse)
# head -3 : garde seulement les 3 premiers résultats
echo "Les 3 fichiers les plus volumineux contenant '$mot_cle' :"
find . -type f -name "*$mot_cle*" 2>/dev/null | while read fichier
do
    taille=$(ls -l "$fichier" | awk '{print $5}')
    echo "$taille $fichier"
done | sort -n -r | head -3 | while read taille nom
do
    echo "$nom ($taille octets)"
done
exit 0