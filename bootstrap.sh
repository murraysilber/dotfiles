#!/bin/zsh

# bootstrap.sh installs things and does some general setup to get us ready to go.

# are we using ZSH? Not writing any fancy check yet, just a visual guide
echo "SHELL: "$SHELL

# 1. Install Command Line Tools for Xcode, necessary for using git clone
#    Such a pain to not have a more elegant setup (or is there?)
echo "Checking Command Line Tools for Xcode"
# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &>/dev/null
if [ $? -ne 0 ]; then
    echo "Command Line Tools for Xcode not found. Installing from softwareupdate…"
    # This temporary file prompts the 'softwareupdate' utility to list the Command Line Tools
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    PROD=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | sed 's/^[^C]* //')
    softwareupdate -i "$PROD" --verbose
    echo ""
    echo "Command Line Tools for Xcode have been installed at:"
    xcode-select -p
else
    # Should see the location of the installed tools. Something like this:
    # /Library/Developer/CommandLineTools
    echo ""
    echo "Command Line Tools for Xcode have already been installed at:"
    xcode-select -p
fi

# # Change directory to the parent directory of the bootstrap script.
# cd "$(dirname "$0")/.."
# # Set the DOTFILES_ROOT to the parent directory of the bootstrap script.
# DOTFILES_ROOT=$(pwd -P)
# echo "Dotfiles location: " $DOTFILES_ROOT

# Exit immediately if a simple command exits with a non-zero status, unless
# the command that fails is part of an until or while loop, part of an
# if statement, part of a && or || list, or if the command's return status
# is being inve
set -e

# Make sure we can access bootstrap_utils.sh
# source bootstrap_utils

# Install all my dotfiles, I know we dont need all of them yet
# but they can be there for when we need them. Otherwise I need to symlink each
# file - thats a damn nightmare
# install_dotfiles
# create_env_file

# echo ''
# echo ''
# success 'Dotfiles installed!'

# Now that we have the Command Line Tools for Xcode installed, we can
# clone the full repo.
cd ~
git clone git@github.com:murraysilber/dotfiles.git

# Install Homebrew and Zap in preparation for more
# 1. Install Homebrew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install ZAP plugin manager for zsh (a very simple plugin manager)
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
