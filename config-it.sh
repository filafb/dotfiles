#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sv $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Ensure setup-nvm.sh is executable
chmod +x ./setup-nvm.sh
# Install node via nvm
./setup-nvm.sh

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Configure docker using colima
# ./setup-colima.sh

# Create a projects directories
if [ ! -d $HOME/Code ]; then
  mkdir $HOME/Code
fi

# Copy the .gitignore file to the home directory, since it's usuallyce set once and done
cp .gitignore $HOME/.gitignore

# Symlink the Mackup config file to the home directory, although the source of truth is in the icloud directory
ln -s ./.dotfiles/.mackup.cfg $HOME/.mackup.cfg
