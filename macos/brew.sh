#!/bin/sh

brew bundle --global

# initializing taps and support commands
brew "mas"

# shell essentials
brew "zsh"
brew "tmux"
brew "git"
brew "coreutils"
brew "openssl"
brew "wget"
brew "curl"
brew "tree"
brew "cmake"
brew "yadm"
brew "watch"

# tools
brew "prettyping"
brew "htop"
brew "ncdu"
brew "fzf"
brew "the_silver_searcher"
brew "diff-so-fancy"
brew "jq"

# development tools
brew "gcc"
brew "llvm"
brew "go"
brew "node"
brew "yarn"
brew "python"
brew "python3"
cask "adoptopenjdk/openjdk/adoptopenjdk8"
brew "ant"
brew "maven"
brew "scala"
brew "sbt"
cask "sequel-pro"

# editors
brew "vim"
cask "visual-studio-code"

# system essentials
cask "iterm2"
cask "docker"

# applications
cask "google-chrome"
cask "slack"
cask "spotify"
