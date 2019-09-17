# Installer docker-compose si ce n'est pas fait
# Dans le dossier ou se trouve le fichier docker-compose.yml lancer la commande suivant pour générer le bundle
docker-compose bundle
# On obtient le message suivant si tout se passe bien : 
wrote bundle to sampleapp1.dab
# Si une erreur survient, passer la version de "3" à "2" dans le fichier docker-compose.yml
# Déployer le bundle 
docker deploy --bundle-file sampleapp1.dab mastack
# Ne pas confondre docker deploy avec docker stack deploy 
# Ajout de la redirection de port sur un service existant 
docker service update --publish-add [port:port] [nom du service]
