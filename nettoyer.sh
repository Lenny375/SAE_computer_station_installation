#!/bin/bash
# Script additionnel : Nettoyage des fichiers temporaires
# Supprime les fichiers temporaires et de compilation dans le répertoire courant
echo "Nettoyage des fichiers temporaires en cours..."
# Compteur de fichiers supprimés
nb_fichiers=0
# Suppression des fichiers .o (fichiers objets)
for fichier in $(find . -name "*.o" -type f 2>/dev/null)
do
    rm -f "$fichier"
    nb_fichiers=$((nb_fichiers + 1))
done
# Suppression des fichiers .tmp (fichiers temporaires)
for fichier in $(find . -name "*.tmp" -type f 2>/dev/null)
do
    rm -f "$fichier"
    nb_fichiers=$((nb_fichiers + 1))
done
# Suppression des fichiers ~ (sauvegardes d'éditeurs)
for fichier in $(find . -name "*~" -type f 2>/dev/null)
do
    rm -f "$fichier"
    nb_fichiers=$((nb_fichiers + 1))
done
# Suppression des fichiers .swp (fichiers temporaires vim)
for fichier in $(find . -name "*.swp" -type f 2>/dev/null)
do
    rm -f "$fichier"
    nb_fichiers=$((nb_fichiers + 1))
done
if [ $nb_fichiers -gt 0 ]
then
    echo "$nb_fichiers fichiers temporaires supprimés"
else
    echo "Aucun fichier temporaire trouvé"
fi

exit 0