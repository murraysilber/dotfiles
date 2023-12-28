#!/bin/zsh

# bootstrap.sh installs things and does some general setup to get us ready to go.

# Are we using ZSH? Not writing any fancy check yet, just a visual guide
echo "We are using SHELL: "$SHELL

# ------------------------------ 1 ------------------------------------- #
# Install Command Line Tools for Xcode.
# Necessary for using git clone
# Could I just create releases of my dotfiles using zip and then just get
# the zip?? Then I can install Command Line Tools for Xcode as part of the
# Homebrew install. Simpler?  Need to test this.
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

# ------------------------------ 2 ------------------------------------- #
# Clone the git repo
# Now that we have the Command Line Tools for Xcode installed, we can
# clone the full repo.
echo ''
echo "Cloning git repo"
git clone -b main https://github.com/murraysilber/dotfiles.git $HOME/dotfiles
echo ''

# ------------------------------ 3 ------------------------------------- #
# Now that the repo is cloned, lets have some fun
# Lets setup macOS defaults. This is the way I like things.
# Your preferences might differ
echo "Setting up macOS defaults"
source $HOME/dotfiles/install/macos_defaults.sh

# ------------------------------ 4 ------------------------------------- #

# # Change directory to the parent directory of the bootstrap script.
cd $HOME/dotfiles
# # Set the DOTFILES_ROOT to the parent directory of the bootstrap script.
DOTFILES=$(pwd -P)
echo "Dotfiles location: " $DOTFILES

# Exit immediately if a simple command exits with a non-zero status, unless
# the command that fails is part of an until or while loop, part of an
# if statement, part of a && or || list, or if the command's return status
# is being inve
set -e

echo "Configuring Dotfiles"
source $HOME/dotfiles/install/configure_dotfiles.sh

# ------------------------------ 5 ------------------------------------- #
# Install Homebrew
echo "Installing Homebrew"
echo ''

source $HOME/dotfiles/install/install_homebrew.sh

# ------------------------------ 6 ------------------------------------- #
# Install ZAP plugin manager for zsh (a very simple plugin manager)
echo ''
echo "Installing ZAP Plugin Manager for zsh"
echo ''

# --keep will keep existing .zshrc
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

# finally, source the .zshrc
# echo "sourcing .zshrc"
# source $HOME/.zshrc
# echo ""
# ------------------------------ 7 ------------------------------------- #
# Install Apps using Homebrew
echo "Installing apps using Homebrew"
brew bundle --file=$HOME/dotfiles/homebrew/Brewfile

echo "Script done!! - Time to check things"
