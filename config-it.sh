#!/bin/sh

echo "Setting up your Mac..."

if ! command -v omz &> /dev/null; then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" || true
fi

echo "Oh My Zsh installation check complete."

if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || true
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Homebrew installation check complete."

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
# chmod +x ./setup-colima.sh
# ./setup-colima.sh

# Create a projects directories
if [ ! -d $HOME/Code ]; then
  mkdir $HOME/Code
fi

# Copy the .gitignore file to the home directory, since it's usuallyce set once and done
cp .gitignore_global $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory, although the source of truth is in the icloud directory
ln -s ./.dotfiles/.mackup.cfg $HOME/.mackup.cfg
