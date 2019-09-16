#Il faut au préalable faire un cluster avec un Manager et deux Agents


#################################################################
echo "Déploiment manuel"
# Créer et se déplacer dans le dossier DevOps
mkdir DevOps && cd DevOps
# Copier le repository git avec le projet sample-app-
git clone https://github.com/EditionsENI/sample-app-1.git-1
# Se mettre en version 1.0 du projet
git checkout v1.0

# Vérifier que tous les noeuds sont bien présents
docker node ls

echo "Téléchargement et compilation des images"
# Récupérer l'image MongoDB
docker pull mongo:3.2
# Se déplace dans l'appli
cd node-app
# Compiler l'image correspandante en lui donner un nom (tag)
docker build -t node-app .

echo "Instanciation des services"
# Instanciation du service MongoDB
docker service create --name db mongo:3.2
# Instanciation du service node-app
docker service create --name app --publish 8080:80 node-app
# Liste les containers sur la VM qui lanec la commande
docker ps
# Liste tous les services 
docker service ls
# Inspecter un service
docker service inspect [ID service]

# Premier Test
curl -X DELETE http://localhost:8080/
# Pas de réponse ctrl+c
# Lister les service 
docker service ls
# Inspecter les logs
docker logs [ID Container]
# Suppression des services
docker service rm db app


# Création d'un network docker
docker network create --driver overlay reseau
# Recré les services avec le network docker
docker service create --name db --network reseau mongo:3.2
docker service create --name app --network reseau --publish 8080:80 node-app

# Relancer le test 
curl -X DELETE http://localhost:8080

# Passage à l'échelle
# Lance trois instance de app
docker service scale app=3
# Liste les services 
docker ps

#################################################################
echo "Déploiement automatisé"
# Supprime les containers et le network
docker service rm db app
docker network rm reseau

# Instancier la stack
docker stack deploy -c ./docker-compose.yml mastack

# tag l'image node-app-1
docker tag node-app guillaumehuertas/sample-app-1:1.0
# On vérifie que la stack est bien lancé 
docker stack ls
docker stack ps mastack

docker images 

# Connection au compte DockerHub
docker login

# Charge l'image dans le registre public
docker push guillaumehuertas/sample-app-1:1.0

# Modifier le Dockerfile pour préciser le registre

version: '3'
services:
  db:
    image: mongo:3.2
  app:
    build: guillaumehuertas/sample-app-1:1.0
    ports:
      - "8080:80"

# Déployer la stack
docker deploy -c ./docker-compose.yml mastack
# Vérifier que la stack a été instancié 
docker stack ls
# Voir l'état de fonctionnement de la stack 
docker stack ps mastack
# Voir plus en détail les services 
docker stack services mastack
















