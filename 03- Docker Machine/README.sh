
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


// Permet d'utiliser le client docker sur la barre métal pour controler le serveur Docker sur la VM 
$ docker-machine env testbox01
///Win10 >>>@FOR /f "tokens=*" %i IN ('docker-machine env testbox01') DO @%i
// Pour Linux
$ eval $(docker-machine env testbox01)
// Déterminer la machine Docker Machine active
$ docker-machine active

// Infos 

$ docker-machine config testbox01

$ docker-machine inspect testbox01

// Récupérer l'IP de la VM

$ docker-machine ip testbox01

$ docker-machine stop NOM_DE_LA_MACHINE

$ docker-machine start NOM_DE_LA_MACHINE

$ docker-machine restart NOM_DE_LA_MACHINE

$ docker-machine rm NOM_DE_LA_MACHINE

$ docker-machine upgrade
NOM_DE_LA_MACHINE
