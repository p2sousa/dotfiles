#!/usr/bin/env bash
cd "$(dirname "$0")"
set -e
DIR=$(pwd)

sudo apt update
sudo apt upgrade

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
