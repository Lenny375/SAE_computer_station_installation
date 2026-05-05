#!/bin/bash
# Script additionnel : Compilation rapide de fichiers C++
# Compile un fichier .cpp et l'exécute automatiquement
if [ $# -lt 1 ]
then
    echo "Usage: $0 fichier.cpp [arguments_pour_executable]"
    exit 1
fi
fichier_source=$1
shift
if [ ! -f "$fichier_source" ]
then
    echo "Erreur: Le fichier $fichier_source n'existe pas"
    exit 1
fi
# Extraction du nom sans extension
nom_executable="${fichier_source%.cpp}"
# Compilation
echo "Compilation de $fichier_source..."
g++ -Wall -o "$nom_executable" "$fichier_source"
if [ $? -eq 0 ]
then
    echo "Compilation réussie"
    echo "Exécution de $nom_executable..."
    echo "-----------------------------------"
    ./"$nom_executable" "$@"
    code_retour=$?
    echo "-----------------------------------"
    echo "Code de retour: $code_retour"
    exit 0
else
    echo "Erreur de compilation"
    exit 1
fi