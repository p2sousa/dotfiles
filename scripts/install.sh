#!/usr/bin/env bash
cd "$(dirname "$0")"
set -e
DIR=$(pwd)

# install mac configuration
bash -c "./install-macos.sh"

# install vim configuration
source "./vim.sh"

# install tmux plugin
source "./tmux.sh"

# install oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

# links
source "${DIR}/links.sh"

ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/themes"

# clone theme
mkdir -p $ZSH_CUSTOM
curl -l https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme > "${ZSH_CUSTOM}/dracula.zsh-theme"

# zsh as default shell
chsh -s $(which zsh)
