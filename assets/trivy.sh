sudo apt-get update
sudo apt-get install -y wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install -y trivy

sudo apt install -y python3-pip

# Install globally or in Jenkins agent
pip install flake8 pytest pytest-cov pip-audit

# Verify installation
flake8 --version
pytest --version
pip-audit --version

sudo apt install nodejs
sudo apt install npm

# Install ESLint globally if needed
npm install -g eslint

# In your project directory
cd frontend
npm install --save-dev eslint eslint-plugin-react eslint-plugin-react-hooks

# Create ESLint config if needed
npm init @eslint/config