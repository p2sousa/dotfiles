#!/usr/bin/env bash
cd "$(dirname "$0")"
set -e
DIR=$(pwd)

sudo apt update
sudo apt upgrade

function configure_vscode {

  DOTFILES="${HOME}/.dotfiles"
  VSCODE_DIR="${HOME}/.vscode"

  # verifica se existe o diretorio e cria ele
  if [ ! -d $VSCODE_DIR ]; then
    mkdir $VSCODE_DIR
  fi

  while read EXTENSION
  do
    echo "Install VSCode Extension: $EXTENSION"
    code --install-extension $EXTENSION
  done < $DOTFILES/vscode/extensions.txt

  ln -sf $DOTFILES/vscode/settings.json ${HOME}/.config/Code/User/settings.json
  ln -sf $DOTFILES/vscode/keybindings.json ${HOME}/.config/Code/User/keybindings.json
}

echo "congigurando vscode..."

configure_vscode
