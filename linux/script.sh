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

echo "Installing development tools..."

# ruby
sudo apt install ruby-full

# python
sudo apt-get install python3
sudo apt-get install python3-pip

# node
sudo apt install nodejs
sudo apt install npm

# php
sudo apt-get install php-cli php-zip unzip
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php

# ctop
wget https://github.com/bcicen/ctop/releases/download/v0.4.1/ctop-0.4.1-linux-amd64 -O ctop
sudo mv ctop /usr/local/bin/
sudo chmod +x /usr/local/bin/ctop

# docker e docker-compose
sudo apt install docker.io
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Installing tweak..."
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

echo "Installing slack..."
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb

echo "Installing chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

echo "Installing vscode..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

echo "Installing oh-my-zsh..."
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

echo "Installing zinit..."
# install zinit
if [ ! -d "${HOME}/.zinit" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

echo "Installing zsh theme..."
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/themes"
mkdir -p $ZSH_CUSTOM
curl -l https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme > "${ZSH_CUSTOM}/dracula.zsh-theme"

# install iterm profile
if [ ! -d "${DIR}/../linux/themes/iterm" ]; then
  mkdir -p $DIR/../linux/themes/iterm/
  git clone https://github.com/denysdovhan/spaceship-prompt.git $DIR/../linux/themes/iterm/spaceship-prompt
fi

# links
source "${DIR}/links.sh"

echo "Setting up zsh as default shell..."
chsh -s $(which zsh)
