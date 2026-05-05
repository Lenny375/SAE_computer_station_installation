# Ajout à faire dans le fichier ~/.bashrc
# Ces lignes affichent des consignes simples au lancement du terminal

echo "=========================================="
echo "Bienvenue sur votre poste de développement"
echo "=========================================="
echo ""
echo "Date et heure: $(date)"
echo ""
echo "Répertoire courant: $(pwd)"
echo ""

# Affichage de l'espace disque disponible
echo "Espace disque disponible:"
df -h ~ | tail -1 | awk '{print "  Utilisé: " $3 " / " $2 " (" $5 ")"}'
echo ""
echo "Scripts disponibles:"
echo "  - creer_cours.sh : Créer un nouveau cours"
echo "  - supprimer_cours.sh : Supprimer un cours"
echo "  - rechercher_fichiers.sh : Rechercher les fichiers volumineux"
echo "  - sauvegarder.sh : Sauvegarder un dossier"
echo "  - nettoyer.sh : Nettoyer les fichiers temporaires"
echo "  - compiler.sh : Compiler et exécuter un fichier C++"
echo ""
echo "=========================================="
echo ""