sudo apt update -y
sudo apt install fontconfig openjdk-21-jre -y
java -version

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins


sudo apt update -y
sudo apt install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo addgroup docker
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker.service
sudo systemctl start containerd.service
sudo systemctl status docker.service
sudo systemctl status containerd.service
docker ps



# Connect ACR to AKS using Azure CLI:
az aks update \
  --name ac-demo-aks-001 \
  --resource-group ac-demo-rg-001 \
  --attach-acr acdemoacr001




# Test


kubectl exec -it <pod-name> -- apt update
kubectl exec -it <pod-name> -- apt install -y stress
kubectl exec -it <pod-name> -- stress --cpu 1 --timeout 300


hey -z 5m -c 50 http://4.255.46.31
-z 5m: run for 5 minutes
-c 50: 50 concurrent requests
If hey is not installed, install it:
brew install hey           # macOS
sudo snap install hey  