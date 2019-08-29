
Installation manuelle

# Supprime les services 
$ docker services rm db app
# Montre les container même arrêté 
$ docker ps -a
# Créé un overlay de réseau (surcouche)
$ docker network create --driver overlay reseau
# Instancie service conteneur db basé sur l'image mongo:3.2 qui se connecte sur l'overlay reseau
$ docker service create --name db --network reseau mongo:3.2
# Instancie service conteneur app basé sur l'image node-app qui se connecte sur l'overlay reseau
$ docker service create --name app --network reseau -- publish 8080:80 node-app

# Vérification du bon fonctionnement de l'ensemble 

# Récupérer l'id du container avec docker ps
$ docker ps
# Envoi la requête REST DELETE
$ curl -X DELETE http://localhost:8080/
# Vérifie que la requête est bien passé
$ docker logs <idContainer>

DELETE / 200 63.408 ms - -
GET / 200 18.609 ms - 1
DELETE / 200 39.585 ms - -

# Liste les services 
$ docker service ls
  
# Changement d'échelle
$ docker service scale app=3
  
# Supprime les containers 
$ docker service rm db app
# Supprime le réseau
$ docker network rm reseau
  
Installation automatisé

# Lancer une stack 
$ docker stack deploy -c ./docker-compose.yml mastack
# taguer l'image node-app
$ docker tag node-app guillaumehuertas/sample-app-1:1.0
# Vérifier la présence de l'image taguer 
$ docker images 

REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
guillaumehuertas/sample-app-1   1.0                 733d09a235c6        22 hours ago        726MB
node-app                        latest              733d09a235c6        22 hours ago        726MB
mongo                           3.2                 fb885d89ea5c        9 months ago        300MB
node                            0.12.4              bc8475902924        4 years ago         712MB

# Se connecter à DockerHub
$ docker login 
# Entrez vos ID DockerHub

Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: guillaumehuertas
Password:
WARNING! Your password will be stored unencrypted in /home/docker/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

# Envoyer l'image sur DockerHub
$ docker push guillaumehuertas/sample-app-1:1.0


















