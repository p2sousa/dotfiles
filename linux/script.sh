#!/bin/bash

sudo apt update
sudo apt upgrade

# install packages
echo "Installing shell essentials..."
sudo apt-get install -y zsh tmux coreutils openssl wget curl tree cmake dirmngr apt-transport-https ca-certificates gnupg2 software-properties-common

echo "Installing essential tools..."
sudo apt-get install -y htop ncdu silversearcher-ag

download_and_install_binary https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping prettyping # prettyping
download_and_install_binary https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy diff-so-fancy # diff-so-fancy

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing development tools..."
sudo apt-get install -y gcc llvm python python-pip python3 python3-pip

# docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

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

install_oh_my_zsh
install_zsh_theme
revert_zsh_file
reload_zsh
install_tweak_tool

# links
source "${DIR}/links.sh"

echo "Setting up zsh as default shell..."
chsh -s $(which zsh)


function install_oh_my_zsh {
  echo "Installing oh-my-zsh..."
  if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
  fi

  # install zplugin
  if [ ! -d "${HOME}/.zplugin" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
  fi
}

function install_zsh_theme {
  echo "Installing zsh theme..."
  ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/themes"
  mkdir -p $ZSH_CUSTOM
  curl -l https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme > "${ZSH_CUSTOM}/dracula.zsh-theme"
}

function revert_zsh_file {
  echo "Reverting .zshrc file..."
  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
}

function reload_zsh {
  echo "Reloading shell..."
  exec zsh
}

function install_tweak_tool {
  sudo add-apt-repository universe
  sudo apt install gnome-tweak-tool
}
