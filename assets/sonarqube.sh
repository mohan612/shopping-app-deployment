# Create volumes for persistence
sudo docker volume create sonarqube_data
sudo docker volume create sonarqube_logs
sudo docker volume create sonarqube_extensions

# Run SonarQube container
sudo docker run -d --name sonarqube \
  -p 9000:9000 \
  -v sonarqube_data:/opt/sonarqube/data \
  -v sonarqube_logs:/opt/sonarqube/logs \
  -v sonarqube_extensions:/opt/sonarqube/extensions \
  sonarqube:latest