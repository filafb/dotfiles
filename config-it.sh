#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
 /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Install node via nvm
./setup-nvm.sh

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set up fzf key bindings and fuzzy completion after installation via brew
# source <(fzf --zsh)

# Configure docker using colima
# ./setup-colima.sh

# Create a projects directories
mkdir $HOME/Code

# TODO
# Download CodeWhisperer for command line (macOS only) https://docs.aws.amazon.com/codewhisperer/latest/userguide/command-line-getting-started-installing.html

# Symlink the Mackup config file to the home directory
ln -s ./.dotfiles/.mackup.cfg $HOME/.mackup.cfg

