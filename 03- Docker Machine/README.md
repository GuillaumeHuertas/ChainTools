
# Télécharger Docker Machine
$ wget https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-Linux-x86_64
# Déplace le fichier dans bin
$ sudo mv docker-machine-Linux-x86_64 /usr/local/bin/docker-machine
# Se déplace dans le dossier
$ cd /usr/local/bin/
# Donne les droits pour éxecuter
$ chmod +x docker-machine
# Lance Docker Machine
$ chmod +x docker-machine

# Création d'une première VM avec Docker Machine
$ docker-machine create -d virtualbox testbox01
Afficher les variables d'environnemnt 
$ docker-machine env testbox01
user : docker
mdp : tcuser
Connection ssh 
$ docker-machine ssh NOM_DE_LA_MACHINE

@FOR /f "tokens=*" %i IN ('docker-machine env testbox01') DO @%i
