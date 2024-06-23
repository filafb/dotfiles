#!/bin/sh

# Check if nvm is already installed
if [ -d "$HOME/.nvm" ]; then
    echo "nvm is already installed."
else
    echo "Installing nvm..."

git clone --recursive git@github.com:nvm-sh/nvm.git $HOME/nvm
$HOME/nvm/install.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

rm -rf $HOME/nvm

nvm install --lts

    echo "nvm and Node.js LTS version installed successfully."
fi