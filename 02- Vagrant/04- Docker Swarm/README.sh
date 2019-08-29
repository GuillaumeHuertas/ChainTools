# Créer un cluster avec Docker Swarm

  - Rendez-vous dans chacun des dossiers et lancez la commande : $ vagrant up 
  - Le vagrantfile permet d'installer une VM en ubuntu/xenial64 ainsi que Docker
  - Vous aurez donc trois VM en fonctionnement 
  - Rendez-vous sur la VM Manager :
    Récupérez l'adresse ip de votre VM : $ ifconfig
    Initialisation du cluster Swarm : docker swarm init --advertise-addr <VOTRE_IP>
    Docker vous indique la commande à saisir sur les autres VM pour les ajouter au cluster :
      $ docker swarm join --token
    Une fois que vous avez rentré la dites commande faite un : $ docker node ls
    cette commande permet de voir toutes les machines du cluster et leur statut
    
  # Création d'un service Docker 
  
  # Ajoute un service nginx au clusterdock
  $ docker service create --name web -p 80:80 nginx
  # Liste les services du cluster
  $ docker service ls
  # Voir le code de la page nginx
  $ curl http://localhost
  # Sur un navigateur 
  $ http://localhost
  
  # Liste les services 
  $ docker service ls
  
  # Changement d'échelle
  $ docker service scale app=3
    
