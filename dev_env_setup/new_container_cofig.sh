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

# add option to init.lua
# use bash instead of sh as the default terminal
echo 'vim.opt.shell="/bin/bash"' >> ~/.config/nvim/init.lua


# Problem with Git asking for password everytime...
# https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git
# install gcm - git credential manager
curl -LO https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.785/gcm-linux_amd64.2.0.785.deb
dpkg -i gcm-linux_amd64.2.0.785.deb

# https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md
git config --global credential.credentialStore gpg

git config --global user.email "william.suzuki@alumni.usp.br"
git config --global user.name "William Suzuki"

# an experiment with using gpg 
git clone https://github.com/williamszk/go_study.git





