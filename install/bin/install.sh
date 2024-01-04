#!/bin/zsh

#===============================================================================
# PRE-LAUNCH SETUP & CHECKS
#===============================================================================
# PARENT_PATH=$(dirname ${BASH_SOURCE[0]-$0}) # relative script path from execution location, same as "${BASH_SOURCE%/*}" or "${BASH_SOURCE}"

source ${DOTFILES}/install/lib/globals
source ${DOTFILES}/install/lib/functions
# source ${PARENT_PATH}/install/install_homebrew.sh

# Set up install logging
loggers
# verify is your mac and macOS are supported.
source ${DOTFILES}/install/bin/verify_mac_supported.sh
pre_flight_checks

# handle_getopts "$@"

#===============================================================================
# START RUNNING SETUP
#===============================================================================
welcome
#header

# SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]-$0})
# SCRIPT_DIR=$(cd $SCRIPT_DIR && pwd)

# Configure my macOS defaults
# Lets setup macOS defaults. This is the way I like things.
# Your preferences might differ
echo "Setting up macOS defaults"
source ${DOTFILES}/install/bin/macos_defaults.sh

# DOTFILES
# Copy dotfiles file system to home directory and configure symlinks
#cp -R ${PARENT_PATH}/dotfiles ${HOME}
# Change directory to the parent directory.
# cd $HOME/dotfiles
# # # Set the DOTFILES_ROOT to the parent directory of the bootstrap script.
# DOTFILES=$(pwd -P)
# echo "Dotfiles location: " $DOTFILES

# # Exit immediately if a simple command exits with a non-zero status, unless
# # the command that fails is part of an until or while loop, part of an
# # if statement, part of a && or || list, or if the command's return status
# # is being inve
# set -e

# echo "Configuring Dotfiles"
# source $HOME/dotfiles/install/configure_dotfiles.sh
