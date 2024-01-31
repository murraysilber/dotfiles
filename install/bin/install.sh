#!/usr/bin/env zsh

#===============================================================================
# PRE-LAUNCH SETUP & CHECKS
#===============================================================================
# PARENT_PATH=$(dirname ${BASH_SOURCE[0]-$0}) # relative script path from execution location, same as "${BASH_SOURCE%/*}" or "${BASH_SOURCE}"

# Dotfiles location
DOTFILES="${HOME}"/dotfiles

# source "${DOTFILES}"/install/lib/globals
#source "${DOTFILES}"/install/lib/functions

# Set up install logging
# loggers

#===============================================================================
# START RUNNING SETUP
#===============================================================================
#welcome
#header

# CONFIGURE DOTFILES
# Change directory to the parent directory.
cd "$DOTFILES"

# Exit immediately if a simple command exits with a non-zero status, unless
# the command that fails is part of an until or while loop, part of an
# if statement, part of a && or || list, or if the command's return status
# is being inve
set -e

# Configure my macOS defaults
# Lets setup macOS defaults. This is the way I like things.
# Your preferences might differ
echo "Setting up macOS defaults"
source "${DOTFILES}"/install/bin/macos_defaults.sh

# INSTALL HOMEBREW
echo "Installing Homebrew"
source "${DOTFILES}"/install/bin/install_homebrew.sh

echo "Configuring Dotfiles"
source "${DOTFILES}"/install/bin/configure_dotfiles.sh

# INSTALL ZAP - ZSH PLUGIN MANAGER
echo "Installing Zap"
echo ''
source "${DOTFILES}"/install/bin/install_zap.sh

# Set Wallpaper
echo "Setting my wallpaper"
source "${DOTFILES}"/install/bin/set_wallpaper.sh

# INSTALL APPS
# Install Apps using Homebrew & mas
echo "Installing apps using Homebrew and mas"
brew bundle --file="${HOME}"/.config/homebrew/Brewfile

echo 'Lets check that we are good to go'
# finally, source the .z files
# echo "sourcing .zshenv"
# source $HOME/.zshenv
# echo ""

# echo "sourcing .zprofile"
# source $HOME/.zshenv
# echo ""

# echo "sourcing .zshenv"
# source $HOME/.zshenv
# echo ""
