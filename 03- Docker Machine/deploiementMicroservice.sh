
# Créé un overlay de réseau (surcouche)
$ docker network create --driver overlay reseau
# Créé un service conteneur db basé sur l'image mongo:3.2 qui se connecte sur l'overlay reseau
$ docker service create --name db --network reseau mongo:3.2
# Créé un service conteneur app basé sur l'image node-app qui se connecte sur l'overlay reseau
$ docker service create --name app --network reseau -- publish 8080:80 node-app
