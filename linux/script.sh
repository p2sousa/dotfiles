#!/usr/bin/env bash
cd "$(dirname "$0")"
set -e
DIR=$(pwd)

sudo apt update
sudo apt upgrade

# install packages
echo "Installing shell essentials..."
sudo apt-get install -y zsh vim tmux coreutils openssl wget curl tree cmake dirmngr apt-transport-https ca-certificates gnupg2 software-properties-common

echo "Installing essential tools..."
sudo apt-get install -y htop ncdu silversearcher-ag
sudo apt install snapd

echo "Installing development tools..."

echo "Installing ruby..."
# ruby
sudo apt install ruby-full

echo "Installing python..."
# python
sudo apt-get install python3
sudo apt-get install python3-pip

echo "Installing node,npm,yarn..."
# node
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
cat /etc/apt/sources.list.d/nodesource.list
sudo apt -y install nodejs
sudo apt -y install gcc g++ make
# npm
sudo apt install npm
# yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

echo "Installing php..."
# php
sudo apt-get install php-cli php-zip unzip
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php

echo "Installing Golang..."
wget  https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -O golang
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf golang
rm golang
export PATH=$PATH:/usr/local/go/bin

echo "Installing ctop..."
# ctop
wget https://github.com/bcicen/ctop/releases/download/v0.4.1/ctop-0.4.1-linux-amd64 -O ctop
sudo mv ctop /usr/local/bin/
sudo chmod +x /usr/local/bin/ctop

echo "Installing docker..."
# docker e docker-compose
sudo apt install docker.io
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo chown $USER /var/run/docker.sock
