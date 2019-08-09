# Installation de l'open JDL 8 

# Télécharge l'archive du JDK 8 
$ wget https://download.java.net/openjdk/jdk8u40/ri/openjdk-8u40-b25-linux-x64-10_feb_2015.tar.gz
# Décompresse l'archive
$ tar xzf openjdk-8u40-b25-linux-x64-10_feb_2015.tar.gz
# Déplace le contenu du jdk 8 dans /opt/
$ su -c 'mv java-se-8u40-ri /opt/'
# Créé un lien symbolique 
$ su -c 'ln -s /opt/java-se-8u40-ri/ /opt/jdk-8'
# Vérifie la version de Java
$ /opt/jdk-8/bin/java -version
# Vérifie la version de Javac
$ /opt/jdk-8/bin/javac -version
