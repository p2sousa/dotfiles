#!/bin/sh
#
# MacOS provision
#

cd "$(dirname "$0")"
set -e
DIR=$(pwd)

# install apps
for file in ${DIR}/../macos/*.sh; do
  bash -c $file;
done

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
