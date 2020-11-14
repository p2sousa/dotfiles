#!/usr/bin/env bash
cd "$(dirname "$0")"
set -e
DIR=$(pwd)

sudo apt update
sudo apt upgrade

echo "Installing tweak..."
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

echo "Installing chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

echo "Installing insomnia..."
sudo snap install insomnia

echo "Installing slack..."
sudo snap install slack --classic

echo "Installing Jetbrain..."
sudo snap install phpstorm --classic

echo "Installing vscode..."
sudo snap install code --classic

echo "Installing mysql-workbench..."
sudo snap install mysql-workbench-community
