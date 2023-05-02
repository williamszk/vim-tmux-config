
# ================================================================================ 
# Install Docker on a new machine
# https://docs.docker.com/engine/install/ubuntu/
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

# Stop docker to ask for sudo
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
# ================================================================================ 
# Install git and other things
sudo apt update
sudo apt upgrade -y
sudo apt install git build-essential curl wget unzip vim -y

git config --global user.email "wllmszk@gmail.com" &&
git config --global user.name "williamszk" &&
git config pull.rebase false
# ================================================================================ 
# install node
sudo apt install npm -y
sudo npm install -g nodemon
sudo npm install -g n
sudo npm install -g tsc ts-node
sudo n stable

# ================================================================================ 
# install go
# https://go.dev/doc/install
curl -LO https://go.dev/dl/go1.20.3.linux-amd64.tar.gz
rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.20.3.linux-amd64.tar.gz
# include this inside .bashrc
export PATH=$PATH:/usr/local/go/bin
go version

# ================================================================================ 
# Clone repositories
git clone https://github.com/williamszk/docker_kubernetes_study.git
git clone https://github.com/williamszk/go_study.git
git clone https://github.com/williamszk/django_study.git
git clone https://github.com/williamszk/react_study.git
git clone https://github.com/williamszk/statistical-learning.git
git clone https://github.com/williamszk/flask_study.git
git clone https://github.com/williamszk/fastapi_study
git clone https://github.com/williamszk/sql_study
git clone https://github.com/williamszk/python_study
git clone https://github.com/williamszk/design_pattern_study
git clone https://github.com/williamszk/c_cpp_study







