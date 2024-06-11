#!/bin/sh

echo "Installing nvm..."

git clone --recursive git@github.com:nvm-sh/nvm.git $HOME
$HOME/nvm/install.sh
rm $HOME/nvm -r