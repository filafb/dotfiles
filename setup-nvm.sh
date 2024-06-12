#!/bin/sh

echo "Installing nvm..."

git clone --recursive git@github.com:nvm-sh/nvm.git $HOME/nvm
$HOME/nvm/install.sh
rm -rf $HOME/nvm
