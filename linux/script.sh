#!/usr/bin/env bash
cd "$(dirname "$0")"
set -e
DIR=$(pwd)

sudo apt update
sudo apt upgrade

# install packages
echo "Installing shell essentials..."
sudo apt-get install -y zsh tmux coreutils openssl wget curl tree cmake dirmngr apt-transport-https ca-certificates gnupg2 software-properties-common

echo "Installing essential tools..."
sudo apt-get install -y htop ncdu silversearcher-ag

echo "Installing development tools..."
sudo apt-get install -y gcc llvm python python-pip python3 python3-pip

# node
sudo apt install nodejs
sudo apt install npm

# php

# java 8
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
sudo apt-get update && sudo apt-get install -y oracle-java8-installer && sudo apt-get install oracle-java8-set-default

# ant maven
sudo apt-get install ant maven

# scala
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update && sudo apt-get install -y sbt scala

# ctop
wget https://github.com/bcicen/ctop/releases/download/v0.4.1/ctop-0.4.1-linux-amd64 -O ctop
sudo mv ctop /usr/local/bin/
sudo chmod +x /usr/local/bin/ctop

echo "Installing oh-my-zsh..."
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

echo "Installing zplugin..."
# install zplugin
if [ ! -d "${HOME}/.zplugin" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

echo "Installing zsh theme..."
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/themes"
mkdir -p $ZSH_CUSTOM
curl -l https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme > "${ZSH_CUSTOM}/dracula.zsh-theme"

echo "Reverting .zshrc file..."
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

# links
source "${DIR}/links.sh"

echo "Setting up zsh as default shell..."
chsh -s $(which zsh)

echo "Installing tweak..."
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

echo "Installing slack..."
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb
cat /etc/apt/sources.list.d/slack.list

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
