#!/bin/sh
#
# Visual Studio Code
#

if [[ -n $(find /Applications -type d -name "Visual Studio Code.app") ]]
then
  exit
fi

brew cask install --appdir="/Applications" visual-studio-code
