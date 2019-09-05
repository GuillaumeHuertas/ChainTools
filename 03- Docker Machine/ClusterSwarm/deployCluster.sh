Il faut au préalable faire un cluster avec un Manager et deux Agents


# Créer et se déplacer dans le dossier DevOps
$ mkdir DevOps && cd DevOps
# Copier le repository git avec le projet sample-app-
$ git clone https://github.com/EditionsENI/sample-app-1.git-1
# Se mettre en version 1.0 du projet
$ git checkout v1.0

# Vérifier que tous les noeuds sont bien présents
$ docker node ls
# Récupérer l'image MongoDB
$ docker pull mongo:3.2
# Se déplace dans l'appli
 cd node-app

