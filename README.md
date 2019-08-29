# ChainTools GitLab

Ce projet à pour but de monter une chain tools à l'aide de Vagrant, Ansible et Docker : 

- Un serveur barre métal en Debian 10
- Des VirtualMachine générés à l'aide de Vagrant et Ansible :
    - Une VM Serveur GitLab
    - Une VM de Runners GitLab
- Des VM pour la partie production :
    - Les VM sont créé avec Docker Machine
    - Elles sont organisé en cluster avec Docker Swarm : 1 Manager et 2 Workers
    - Deployement de services (micro-service) à l'aide de Docker Stack 
