# Instalaltion de Curl 
$ su -c 'apt-get install curl'

# Instalation de GitLab - Ajout des packets aux depot.
$ curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

#Installation de gitlab
$ sudo apt-get install gitlab-ce

# Configure  gitlab
$ sudo gitlab-ctl reconfigure

# Il faut modifier ce fichier pour les paths des repositories
$ nano /etc/gitlab/gitlab.rb
