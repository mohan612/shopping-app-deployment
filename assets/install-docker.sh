# Get resource group name and AKS cluster name
az aks list -o table

# Get SSH credentials
az aks install-cli
az aks get-credentials --resource-group <RESOURCE_GROUP> --name <AKS_CLUSTER_NAME>

# SSH into a node
az aks nodepool list --resource-group <RESOURCE_GROUP> --cluster-name <AKS_CLUSTER_NAME> -o table
az vm list -d -o table  # optional for public IP

# SSH into the node (you may need to enable SSH via VMSS/VM extension)
az aks ssh --resource-group <RESOURCE_GROUP> --name <AKS_CLUSTER_NAME> --nodepool-name <NODEPOOL_NAME>


# 

# Update packages
sudo apt-get update

# Install Docker
sudo apt-get install -y docker.io

# Enable Docker
sudo systemctl enable docker
sudo systemctl start docker

# Add current user (e.g., azureuser) to docker group if needed
sudo usermod -aG docker $USER


docker version
docker run hello-world
