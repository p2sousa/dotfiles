#!/bin/bash

#!/usr/bin/env bash
cd "$(dirname "$0")"
set -e
DIR=$(pwd)

# install homebrew if it's missing
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install mac configuration
bash -c "./brew.sh"

configure_vscode
configure_terminal
install_oh_my_zsh
install_zsh_theme
revert_zsh_file
reload_zsh

# links
source "${DIR}/links.sh"

# zsh as default shell
chsh -sf $(which zsh)

function configure_vscode {
  PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
  fi
  export PATH

  DOTFILES="${HOME}/.dotfiles"
  VSCODE_DIR="${HOME}/.vscode"

  # ensure we have .vim directory
  if [ ! -d $VSCODE_DIR ]; then
    mkdir $VSCODE_DIR
  fi

  while read EXTENSION
  do
    echo "Install VSCode Extension: $EXTENSION"
    code --install-extension $EXTENSION
  done < $DOTFILES/vscode/extensions.txt

  ln -sf $DOTFILES/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
  ln -sf $DOTFILES/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
}


function configure_terminal {
  # Increase keyboard speed
  defaults write -g KeyRepeat -int 1
  defaults write -g InitialKeyRepeat -int 10

  # Install font
  if [ ! -f "${HOME}/Library/Fonts/FiraCode.ttf" ]; then
    wget https://raw.githubusercontent.com/tonsky/FiraCode/master/distr/ttf/FiraCode-Retina.ttf -O "${HOME}/Library/Fonts/FiraCode.ttf"
  fi

  # install iterm profile
  if [ ! -d "${DIR}/../macos/themes/iterm" ]; then
    mkdir -p $DIR/../macos/themes/iterm/
    git clone https://github.com/denysdovhan/spaceship-prompt.git $DIR/../macos/themes/iterm/spaceship-prompt
  fi

  defaults write com.apple.terminal FocusFollowsMouse -bool true
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false
  defaults write com.googlecode.iterm2 HideTab -bool true
  defaults write com.googlecode.iterm2 "FiraCode" -string "SourceCodePro-Retina"
}

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
