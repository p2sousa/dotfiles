if [ ! $DIR ]; then
  cd "$(dirname "$0")"
fi

echo "Symlinking things:"

DOTFILES=$(dirname "$(pwd)")
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/themes"

ln -sf $DOTFILES/gitconfig.symlink ~/.gitconfig
ln -sf $DOTFILES/editorconfig.symlink ~/.editorconfig
ln -sf $DOTFILES/zshrc.symlink ~/.zshrc
ln -sf $DOTFILES/linux/themes/iterm/spaceship-prompt/spaceship.zsh-theme "$ZSH_CUSTOM/spaceship.zsh-theme"
