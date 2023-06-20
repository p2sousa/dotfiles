#!/bin/sh

brew bundle --global

# initializing taps and support commands
brew install "mas"

# shell essentials
brew install "zsh"
brew install "tmux"
brew install "git"
brew install "coreutils"
brew install "openssl"
brew install "wget"
brew install "curl"
brew install "tree"
brew install "cmake"
brew install "yadm"
brew install "watch"

# tools
brew install "prettyping"
brew install "htop"
brew install "ncdu"
brew install "fzf"
brew install "the_silver_searcher"
brew install "diff-so-fancy"
brew install "jq"

# development tools
brew install "gcc"
brew install "llvm"
brew install "go"
brew install "node"
brew install "yarn"
brew install "python"
brew install "python3"
brew install --cask "adoptopenjdk/openjdk/adoptopenjdk8"
brew install "ant"
brew install "maven"
brew install "scala"
brew install "sbt"
brew install --cask "sequel-pro"

# editors
brew install "vim"
brew install --cask "visual-studio-code"

# system essentials
brew install --cask "iterm2"

# applications
brew install --cask "slack"
brew install --cask "spotify"
