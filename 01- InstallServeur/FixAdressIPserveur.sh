# Ces commandes permettent de fixer l'adresse IP du serveur Debian

# root
$ su
# Modification adresse IP
$ nano /etc/network/interfaces
# Vérifier si l'adresse ip est disponible
$ ping <adresse ip/serveur>


Fichier de base : 

# The loopback network interface
auto lo
iface lo inet loopback
 
# The primary network interface
auto eth0
iface eth0 inet dhcp

On remplace par : 

auto eth0
iface eth0 inet static
    address 192.168.1.101 
    netmask 255.255.255.0
    gateway 192.168.1.1
    
# Redémarrer le system
$ systemctl reboot
