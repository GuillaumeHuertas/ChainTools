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

# Option 1
# Connection su
$ su
# Création du script javamaven.sh
$ touch /etc/profile.d/javamaven.sh
# Attribution des droits pour l'exécution 
$ chmod 755 /etc/profile.d/javamaven.sh
# Les lignes ajoutés au javamaven.sh
# JAVA_HOME=/opt/jdk-8
# PATH=${JAVA_HOME}/bin:${PATH}

# export JAVA_HOME PATH

# Option 2
# Comme Option 1 en une seule commande
su -c 'echo -e "JAVA_HOME=/opt/jdk-8 \nPATH=${JAVA_HOME}/bin:${PATH} \n\nexport JAVA_HOME PATH" \
| tee -a /etc/profile.d/javamaven.sh \
&& chmod 755 /etc/profile.d/javamaven.sh'

# Version de java 
$ java -version
# Version javac
$ javac -version


