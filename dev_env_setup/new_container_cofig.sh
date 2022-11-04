#!/bin/bash

# to build the image
# docker build -t my-dev-container

# in case we are running without the Dockerfile
# docker run --name my-container -it ubuntu bash

apt update &&
apt upgrade -y &&
apt install git build-essential curl -y &&
curl -LO https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
dpkg -i nvim-linux64.deb
git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim/













