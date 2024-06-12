#!/usr/bin/env zsh
############################
# This script sets up a Mac from scratch
# 1. Dotfiles - pulls them from github and sets up symlinks
# 2. Sets up MacOS defaults I prefer
# 3. Installs specific apps intentionally that I use.
# 4. And also installs other Apps using Homebrew
############################

#######################################
# Displays a nicely formatted message
# Outputs (Output to STDOUT or STDERR):
#   Formatted feedback to the user on stdout
#######################################
message() {

  # Color Outputs
  local GREEN="\033[0;32m"
  local RED="\033[0;31m"
  local YELLOW="\033[0;33m"
  local NC="\033[0m"
  local BLUE="\033[00;34m"

  if [[ "$1" = "success" ]]; then
    local msg="\n${NC}[${GREEN} OK ${NC}] ${2}${NC}"
  elif [[ "$1" = "warning" ]]; then
    local msg="\n${NC}[${YELLOW}WARN${NC}] ${2}${NC}"
  elif [[ "$1" = "fail" ]]; then
    local msg="\n${NC}[${RED}FAIL${NC}] ${2}${NC}"
  elif [[ "$1" = "info" ]]; then
    local msg="\n${NC}[${BLUE}INFO${NC}] ${2}${NC}"
  fi

  printf "$msg"
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

  message "info" "Checking if your Mac is supported..."
  message "info" "Supported Macs run v${os_major_version}.x on ${cpu_architecture} architecture"
  # TODO add check for Ventura as well, in fact, anything from Big Sur that supports ARM architecture (Apple Silcon). Need to decide Just how much testing I want to do and if I will ever need an OS older than Sonoma, or even a Mac with Intel CPU architecture.

  if [[ "${cpu_architecture}" == "arm64" && "${os_major_version}" -eq 14 ]]; then
    # TODO fix messaging if time permits. Make prettier and explain why
    message "success" "Your Mac is supported: v${mac_os_version} on ${cpu_architecture}"
  else
    message "warning" "Your Mac is unsupported: v${mac_os_version} on ${cpu_architecture}. Exiting the script now!!!!"
    exit 1
  fi
}

#######################################
# Run Pre-flight Checks
# Outputs (Output to STDOUT or STDERR):
#   Feedback to the user on stdout
#######################################
is_mac_supported

# Install Hombrew - This will install X-code tools
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

# install git (dont want to use macos provided git)
brew install git

# clone dotfiles repo from github
message "info" "Cloning git repo...."
git clone -b main https://github.com/murraysilber/dotfiles.git "$HOME"/dotfiles
if [ $? -eq 0 ]; then
  message "success" "Repo cloned successfully"
else
  message "fail" "Repo was not cloned successfully"
  message "warning" "Script will now exit..."
  exit 1
fi

# Exit immediately if a command exits with a non-zero status
set -e

# Need to create base directory for housing symlinks and scripts (.config)
config_dir="$HOME/.config"

if [ ! -d "$config_dir" ]; then
  echo "$config_dir" does not exist.
  echo Creating "$config_dir"
  mkdir -v "$config_dir"
fi

# Are we in the dotfiles directory?
cd "${HOME}"/dotfiles

# Install font of choice for Terminal and VS Code
brew install font-jetbrains-mono-nerd-font

# Run installers
for i in zsh macos wallpaper fastfetch alacritty starship rectangle tmux bin mise; do
  echo "$HOME/dotfiles/$i/setup.sh"
  source "$HOME/dotfiles/$i/setup.sh"
  # cd $i && ./setup.sh
  # cd -
done

# INSTALL APPS
# Install Apps using Homebrew & mas
# echo "Installing apps using Homebrew and mas"
# brew bundle --file="${HOME}"/.config/homebrew/Brewfile
