# Instalaltion de GitLab et Docker sur une image Raspbian Buster Full

# Changer le clavier >> fr à la place de en
$ sudo nano /etc/default/keyboard

# Installer Docker 
$ curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
# Ajouter l'utilisateur au groupe Docker
$ sudo usermod -aG docker pi

# Installer GitLab
$ sudo apt install curl openssh-server ca-certificates postfix apt-transport-https
# Choisir "Site internet"
# Ajouter les clées de dépôt
$ curl https://packages.gitlab.com/gpg.key | sudo apt-key add -
# Ajout du dépôt 
$ sudo curl -o /etc/apt/sources.list.d/gitlab_ce.list "https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/config_file.list?os=debian&dist=jessie" && sudo apt-get update
# Installe GitLab Communauty Edition
$ sudo apt-get install gitlab-ce
# Reconfigure GitLab
$ sudo gitlab-ctl reconfigure
# Se connecter à votre adresse local 
# Par défaut le login est « root » et le mot de passe « 5iveL!fe »

# Installer GitLab Runner
$ sudo apt-get install gitlab-runner
# Modifier l'url par l'adresse ip du raspberry
$ sudo nano /etc/gitlab/gitlab.rb

