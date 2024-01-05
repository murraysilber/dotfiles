#!/bin/zsh

# bootstrap.sh installs things and does some general setup to get us ready to go.

install_command_line_tools() {
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
}

# Are we using ZSH? Not writing any fancy check yet, just a visual guide
echo "We are using SHELL: ""$SHELL"

# ------------------------------ 1 ------------------------------------- #
# Install Command Line Tools for Xcode.
# Necessary for using git clone
# Could I just create releases of my dotfiles using zip and then just get
# the zip?? Then I can install Command Line Tools for Xcode as part of the
# Homebrew install. Simpler?  Need to test this.
install_command_line_tools

# ------------------------------ 2 ------------------------------------- #
# Clone the git repo
# Now that we have the Command Line Tools for Xcode installed, we can
# clone the full repo.
echo ''
echo "Cloning git repo"
git clone -b main https://github.com/murraysilber/dotfiles.git "$HOME"/dotfiles
echo ''

echo "Bootstrapping done!! - Time to install and configure things"
caffeinate zsh "${HOME}"/dotfiles/install/bin/install.sh
