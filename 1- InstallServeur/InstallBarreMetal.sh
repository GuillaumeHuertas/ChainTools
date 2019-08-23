# Installer VirtualBox sur Debian 10 Buster

# Installation logiciel tiers
# Met-à-jour les paquets
$ apt-get update && apt-get upgrade
# Installation de gnup et curl
$ apt-get install gnupg curl -y
# Installation de apt-key
$ apt-get install software-properties-common -y
# Installer rsync
$ apt-get install rsync -y

# Installation VBox
# Connection root
$ su
# Clés de vérifications
$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
# Ajout VBox au dépôt
$ add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
# Met-à-jour les paquets 
$ apt-get update
# Installe VirtualBox
$ apt install virtualbox-6.0
# Version de VBox
$ VBoxManage -v

# Installation Ansible
# Connection en root
$ su
# Installe Ansible
$ apt-get install ansible
# Version Ansible
$ ansible --version

# Installer Vagrant
# Télécharger le package (choisir la bonne version depuis https://www.vagrantup.com/downloads.html )
$ curl -O https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb
# Installer Vagrant
$ apt install ./vagrant_2.2.5_x86_64.deb -y
# Version Vagrant
$ vagrant --version
