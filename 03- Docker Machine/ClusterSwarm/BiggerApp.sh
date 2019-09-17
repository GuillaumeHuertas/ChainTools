# L'exemple est pris sur un serveur Azure
# Se placer dans un cluster
# Clone le repository git de l'application
git clone https://github.com/EditionsENI/mortgage.git
# Se déplace dans le repository de l'application
cd mortgage
# Changement de version 
git checkout v2.0

# Générer les images pour chaque Dockerfile
# Se placer dans le dossier du Dockerfile
cd calculator
# Compile l'image
docker build -t jpgouigoux/calculator .
