if [ ! $DIR ]; then
  cd "$(dirname "$0")"
fi

echo "Symlinking things:"

DOTFILES=$(dirname "$(pwd)")
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/themes"

ln -s $DOTFILES/gitconfig.symlink ~/.gitconfig
ln -s $DOTFILES/editorconfig.symlink ~/.editorconfig
ln -s $DOTFILES/zshrc.symlink ~/.zshrc
ln -s $DOTFILES/macos/themes/iterm/spaceship-prompt/spaceship.zsh-theme "$ZSH_CUSTOM/spaceship.zsh-theme"
