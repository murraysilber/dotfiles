#!/usr/bin/env zsh

# Install Homebrew
# Take note of comment below, taken from Homebrew docs:
# The one-liner installation method found on brew.sh uses the Bourne-again
# shell at /bin/bash. Notably, zsh, fish, tcsh and csh will not work.
# Using NONINTERACTIVE=1 for an unattended install (see Homebrew docs)
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Post Installation
# Note - I dont need to execute the commented line below as I already have a .zprofile with the command set up:
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$yourdevicename/.zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"

# test if Homebrew was installed
brew --version
brew doctor

# Brewfile
brew_dir="$HOME/.config/homebrew"

if [ ! -d "$brew_dir" ]; then
  echo "$brew_dir" does not exist.
  echo Creating "$brew_dir"
  mkdir -v "$brew_dir"
fi
ln -sf "$HOME/dotfiles/homebrew/Brewfile" "$brew_dir/Brewfile"
