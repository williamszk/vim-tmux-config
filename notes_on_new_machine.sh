
# ================================================================================ 
# Install Docker on a new machine
# https://docs.docker.com/engine/install/ubuntu/
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get -y install \
    ca-certificates curl gnupg python3-venv python3-pip

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

git config --global user.email "wllmszk@gmail.com"
git config --global user.name "williamszk"
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
# Working with Rust
curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env


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
git clone https://github.com/williamszk/rust-study




# ================================================================================ 
# in repo
git config user.email "wllmszk@gmail.com"
git config user.name "williamszk"



# ================================================================================ 
# Install stuff for neovim
suod apt-get install lua5.4 -y

sudo curl -LO https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb &&
sudo dpkg -i nvim-linux64.deb &&
rm nvim-linux64.deb

rm -rf ~/.config/nvim
# git clone https://github.com/LunarVim/Neovim-from-scratch.git ~/.config/nvim
git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim/
nvim +PackerSync
nvim +TSUpdate
# add option to init.lua
# use bash instead of sh as the default terminal
echo 'vim.opt.shell="/bin/bash"' >> ~/.config/nvim/init.lua
# echo 'vim.cmd([[ set mouse= ]])' >> ~/.config/nvim/init.lua
# echo 'vim.cmd([[ inoremap kj <Esc> ]])' >> ~/.config/nvim/init.lua

# Create alias for some commands
echo 'alias gits="git status"' >> ~/.bashrc

# ================================================================================ 
# about tmux pane config
touch ~/.tmux.conf
echo 'set-option -g pane-base-index 1' >> ~/.tmux.conf