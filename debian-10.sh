#! /bin/bash

# checkout ansible

# set a password
sudo passwd $USER

# install utilities
sudo apt-get update
sudo apt-get install -y git git-lfs htop atop mc wget zip jq python3-pip python docker

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# install docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# dont prepend docker commands with sudo
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker 

# zsh + oh-my-zsh
sudo apt-get install -y zsh
zsh --version
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
