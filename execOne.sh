#!/bin/bash
# Script de configuration pour rendre execOne accessible partout
# Ce script configure automatiquement le PATH pour l'exécutable execOne

echo "=========================================="
echo "Configuration de execOne"
echo "=========================================="
echo ""
# Vérification si execOne existe dans le répertoire courant
if [ ! -f "execOne" ]
then
    echo "Erreur: Le fichier execOne n'existe pas dans le répertoire courant"
    echo "Veuillez placer ce script dans le même répertoire que execOne"
    exit 1
fi
# Création du répertoire ~/bin s'il n'existe pas
if [ ! -d "$HOME/bin" ]
then
    echo "Création du répertoire ~/bin..."
    mkdir "$HOME/bin"
    echo "Répertoire ~/bin créé"
else
    echo "Le répertoire ~/bin existe déjà"
fi
# Copie de execOne dans ~/bin
echo "Copie de execOne dans ~/bin..."
cp execOne "$HOME/bin/"
# Vérification de la copie
if [ ! -f "$HOME/bin/execOne" ]
then
    echo "Erreur: La copie de execOne a échoué"
    exit 1
fi
# Rendre execOne exécutable
echo "Configuration des droits d'exécution..."
chmod +x "$HOME/bin/execOne"
# Vérification si ~/bin est déjà dans le PATH du .bashrc
if [ -f "$HOME/.bashrc" ]
then
    if grep -q "export PATH=\"\$HOME/bin:\$PATH\"" "$HOME/.bashrc"
    then
        echo "Le PATH est déjà configuré dans .bashrc"
    else
        echo "Ajout de ~/bin au PATH dans .bashrc..."
        echo "" >> "$HOME/.bashrc"
        echo "# Ajout du répertoire personnel bin au PATH" >> "$HOME/.bashrc"
        echo "export PATH=\"\$HOME/bin:\$PATH\"" >> "$HOME/.bashrc"
        echo "Configuration ajoutée à .bashrc"
    fi
else
    echo "Erreur: Le fichier .bashrc n'existe pas"
    exit 1
fi
echo ""
echo "=========================================="
echo "Configuration terminée avec succès!"
echo "=========================================="
echo ""
echo "Pour appliquer les changements immédiatement:"
echo "  source ~/.bashrc"
echo ""
echo "Ou fermez et rouvrez votre terminal"
echo ""
echo "Ensuite, vous pourrez exécuter 'execOne' depuis n'importe quel dossier"
echo ""
exit 0