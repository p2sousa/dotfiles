#!/bin/bash
set -e

if [ ! $DIR ]; then
  cd "$(dirname "$0")"
fi

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
