
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
