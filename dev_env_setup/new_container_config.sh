#!/bin/bash

# Here are some notes about setting up a docker container for development
# The notes are based on astro vim

# here is a page for basic usage of astro vim
# https://astronvim.github.io/Basic%20Usage/walkthrough

apt update &&
apt upgrade -y &&
apt install git build-essential curl wget unzip vim -y

apt install npm -y &&
npm install -g nodemon &&
npm install -g n &&
n stable
apt install lua5.4 -y

curl -LO https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb &&
dpkg -i nvim-linux64.deb &&
rm nvim-linux64.deb

git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim/
# nvim +PackerSync
# nvim +TSUpdate
# add option to init.lua
# use bash instead of sh as the default terminal
echo 'vim.opt.shell="/bin/bash"' >> ~/.config/nvim/init.lua
echo 'vim.cmd([[ set mouse= ]])' >> ~/.config/nvim/init.lua
# echo 'vim.cmd([[ inoremap kj <Esc> ]])' >> ~/.config/nvim/init.lua

git config --global user.email "wllmszk@gmail.com" &&
git config --global user.name "williamszk" &&
git config pull.rebase false

# docker cp ~/.ssh/id_rsa study-container:/root/.ssh/id_rsa &&
# docker exec -it study-container bash
git clone git@github.com:williamszk/go_study.git /root/go_study
git clone git@github.com:williamszk/statistical-learning.git /root/statistical-learning
git clone git@github.com:williamszk/webdev_study.git /root/webdev_study

if [ $1 = "default" ]
then
    # ======================================================================================= #
    # Linters in general:
    # codespell # check english spelling errors

    # ======================================================================================= #
    # Working with Python.
    # We can install the LSP:
    # apt install npm -y &&
    # nvim +LspInstall pyright

    # ======================================================================================= #
    # Working with JavaScript

    # not sure if it is necessary, need to confirm
    npm install -g typescript typescript-language-server
    # LspInstall typescript-language-server
    

    # ======================================================================================= #
    # Working with Python 
    apt install python3-venv -y
    # LspInstall pyright

    # ======================================================================================= #
    # Working with Go
    # We need to install Go here before install the LSP. 
    # https://go.dev/doc/install 
    curl -LO https://go.dev/dl/go1.19.3.linux-amd64.tar.gz &&
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz &&
    rm go1.19.3.linux-amd64.tar.gz &&
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
    # Check if Go is installed and in the path:
    echo go version
    # nvim +LspInstall gopls

    # ======================================================================================= #
    # Working with Ruby
    apt install ruby-full
fi

if [ $1 = "kotlin" ]
then
    # ======================================================================================= #
    # Working with Kotlin
    # I need to install a JDK
    # do this inside the ~/ directory
    curl -LO https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz &&
    tar -C /usr/local -xzf amazon-corretto-17-x64-linux-jdk.tar.gz &&
    rm amazon-corretto-17-x64-linux-jdk.tar.gz &&
    echo "export JAVA_HOME=/usr/local/amazon-corretto-17.0.5.8.1-linux-x64" >> ~/.bashrc &&
    source .bashrc &&
    echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc &&
    source .bashrc
    # check if java is installed:
    java --version

    # to install the kotlinc compiler
    # I'm looking to use kotlinc-jvm
    curl -LO https://github.com/JetBrains/kotlin/releases/download/v1.7.21/kotlin-compiler-1.7.21.zip &&
    mkdir /usr/local/kotlin-compiler-1.7.21 &&
    unzip -d /usr/local/kotlin-compiler-1.7.21 kotlin-compiler-1.7.21.zip &&
    rm kotlin-compiler-1.7.21.zip &&
    source .bashrc
    # create KOTLIN_PATH
    echo "export KOTLIN_PATH=/usr/local/kotlin-compiler-1.7.21/kotlinc" >> ~/.bashrc &&
    source .bashrc &&
    echo "export PATH=$PATH:$KOTLIN_PATH/bin" >> ~/.bashrc &&
    source .bashrc
    kotlinc-jvm -version

    # and then install the LSP for Kotlin
    # the LSP for Kotlin doesn't need the JDK
    # nvim +LspInstall kotlin
    # nvim +LspInstall kotlin_language_server
    # nvim +TSInstall kotlin
    # How do we compile a kotlin code then?
fi








