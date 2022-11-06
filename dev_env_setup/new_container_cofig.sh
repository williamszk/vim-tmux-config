#!/bin/bash

# to build the image
# docker build -t my-dev-container

# in case we are running without the Dockerfile
# docker run --name my-container -it ubuntu bash

apt update &&
apt upgrade -y &&
apt install git build-essential curl wget -y &&
apt install npm -y &&
npm install -g tree-sitter-cli

curl -LO https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
dpkg -i nvim-linux64.deb
rm nvim-linux64.deb
git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim/
nvim +PackerSync

# add option to init.lua
# use bash instead of sh as the default terminal
echo 'vim.opt.shell="/bin/bash"' >> ~/.config/nvim/init.lua
echo 'vim.cmd([[ set mouse= ]])' >> ~/.config/nvim/init.lua
echo 'vim.cmd([[ inoremap kj <Esc> ]])' >> ~/.config/nvim/init.lua


# Problem with Git asking for password everytime...
git config --global user.email "william.suzuki@alumni.usp.br"
git config --global user.name "William Suzuki"

# do not use https to clone
# git clone https://github.com/williamszk/go_study.git

# instead use ssh
git clone git@github.com:williamszk/go_study.git

# we need to pass the public and private keys to the container














