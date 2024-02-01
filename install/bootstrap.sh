#!/usr/bin/env bash
# bootstrap.sh installs things and does some general setup to get us ready to go.


#######################################
# Displays a nicely formatted message  
# Outputs (Output to STDOUT or STDERR):
#   Formatted feedback to the user on stdout
#######################################
message() {

  # Color Outputs
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
NC="\033[0m"

  if [[ "$1" = "info" ]]; then
    local msg="\n\n${EMOJI_INFO} - ${NC}${2}${NC}"
  elif [[ "$1" = "warning" ]]; then
    local msg="\n\n${EMOJI_WARNING} - ${YELLOW}${2}${NC}"
  elif [[ "$1" = "fail" ]]; then
    local msg="\n\n${EMOJI_FAIL} - ${RED}${2}${NC}"
  elif [[ "$1" = "error" ]]; then
    local msg="\n\n${EMOJI_ERROR} - ${RED}${2}${NC}"
  elif [[ "$1" = "stop" ]]; then
    local msg="\n\n${EMOJI_STOP}${RED}${2}${NC}"
  else
    local msg="\n\n${EMOJI_CHECKMARK}${GREEN}${1}${NC}"
  fi

  shift
  printf "${msg}"
}


#######################################
# Verifies if the script will run on the target Mac.
# Currently, only tested on Sonoma and on Apple Silicon.
# Outputs (Output to STDOUT or STDERR):
#   Feedback to the user on stdout
#######################################
is_mac_supported() {
  local cpu_architecture
  cpu_architecture=$(arch)
  local mac_os_version
  mac_os_version=$(sw_vers -productVersion)
  local os_major_version
  os_major_version=$(echo "$mac_os_version" | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\1/')
  # local os_minor_version
  # os_minor_version=$(echo "$mac_os_version" | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\2/')

  echo 'Checking if your Mac is supported'
  # TODO add check for Ventura as well, in fact, anything from Big Sur that supports ARM architecture (Apple Silcon). Need to decide Just how much testing I want to do and if I will ever need an OS older than Sonoma, or even a Mac with Intel CPU architecture.

  if [[ "${cpu_architecture}" == "arm64" && "${os_major_version}" -eq 14 ]]; then
    # TODO fix messaging if time permits. Make prettier and explain why
    printf 'You are good to go\n'
  else
    printf "Your Mac is unsupported\nExiting the script now!!!!"
    exit 1
  fi
}

#######################################
# Run Pre-flight Checks
# Outputs (Output to STDOUT or STDERR):
#   Feedback to the user on stdout
#######################################
pre_flight_checks() {
  printf "Running pre-flight checks"
  is_mac_supported
}

#######################################
# Install xcode command line tools
# Outputs (Output to STDOUT or STDERR):
#   Feedback to the user on stdout
#######################################
install_command_line_tools() {

  if ! xcode-select -p &>/dev/null; then
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
# TODO Expand on this and stop boiotstrap process if not zsh
echo "We are using SHELL: ""$SHELL"

pre_flight_checks

# ------------------------------ 1 ------------------------------------- #
# Install Command Line Tools for Xcode.
# Necessary for using git clone
# TODO Could I just create releases of my dotfiles using zip and then just get the zip?? Then I can install Command Line Tools for Xcode as part of the Homebrew install. Simpler?  Need to test this.
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
