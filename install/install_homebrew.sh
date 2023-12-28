#!/usr/bin/env zsh

# Install Homebrew
# Take note of comment below, taken from Homebrew docs:
# The one-liner installation method found on brew.sh uses the Bourne-again
# shell at /bin/bash. Notably, zsh, fish, tcsh and csh will not work.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Post Installation
# Note:  I dont need to execute this line as I already have a .zprofile set up
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$yourdevicename/.zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"

# test if Homebrew was installed
brew --version
brew list
