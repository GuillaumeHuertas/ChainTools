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

# Supprimer la stack
docker stack rm mastack
# Déployer la stack
docker deploy -c ./docker-compose.yml mastack
# Vérifier que la stack a été instancié 
docker stack ls
# Voir l'état de fonctionnement de la stack 
docker stack ps mastack
# Voir plus en détail les services 
docker stack services mastack
# Si il n'y a qu'une stack équivalent
docker service ls

# Inspecter en détail un service 
docker service inspect mastack_app
# Pour vérifier les network disponible 
docker network ls
# Celui de la stack : mastack_default

# Appel de la fonction
curl -X DELETE http://localhost:8080/

# Vérifier l'overlay network par pont
docker network inspect docker_gwbridge
# Rechercher les adresse IP dans containers
# Il est pour le moment obligatoire de parcourir les différentes vm du cluster

# Vérifier que l'application fonctionne avec SON adresse IP
curl -X DELETE http://172.18.0.3/
curl -X POST http://172.18.0.3/
curl -X POST http://172.18.0.3/
curl -X POST http://172.18.0.3/
curl -X POST http://172.18.0.3/
curl http://172.18.0.3/
# Ces commandes devraient vous retourner 4

# Récupérez l'adresse IP ingress
docker network inspect docker_gwbridge
# Cette fois pn utilise bien le port 8080
curl -X POST http://172.18.0.2:8080/
curl -X POST http://172.18.0.2:8080/
curl -X POST http://172.18.0.2:8080/
curl http://172.18.0.2:8080/
# Ici si on ne spécifie pas le port une erreur sera levé : Connection refused

# Pour se connecter directement à la DB Mongo, il faut spécifier un port dans le docker-compose
db:
  image: mongo:3.2
  ports:
    - "27017:27017"
    
# On peut ensuite directement se connecter à la DB
mongo 172.18.0.2:27017

# PAssage à l'échelle de app
docker service scale mastack_app=3

# Refaites des POST
# Puis faites un docker ps pour obtenir l'ID d'un conteneur app (faites le tours de vos vm)
# Vérifier les logs pour voir si  le loadbalancing fonctionne
docker logs e40548782041

# Résultats après 6 POST 
App listening on port 80
POST / 200 110.229 ms - 13
POST / 200 16.498 ms - 13
GET / 200 10.139 ms - 2

# MAJ de la stack
docker stack deploy
# Rédupérer l'ip du manager 
ip addr
# Lancer un navigateur web 
192.168.206.2:8080


# On peut finallement détruire la stack 
docker stack rm mastack











































