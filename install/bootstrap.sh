#!/usr/bin/env bash
############################
# This script sets up a Mac from scratch
# 1. Dotfiles - pulls them from github and sets up symlinks
# 2. Sets up MacOS defaults I prefer
# 3. Installs specific apps intentionally that I use.
# 4. And also installs other Apps using Homebrew
############################

# util for user friendly output
default_color=$(tput sgr 0)
red="$(tput setaf 1)"
yellow="$(tput setaf 3)"
green="$(tput setaf 2)"
blue="$(tput setaf 4)"

info() {
    printf "%s==> %s%s\n" "$blue" "$1" "$default_color"
}

success() {
    printf "%s==> %s%s\n" "$green" "$1" "$default_color"
}

error() {
    printf "%s==> %s%s\n" "$red" "$1" "$default_color"
}

warning() {
    printf "%s==> %s%s\n" "$yellow" "$1" "$default_color"
}

# Install Homebrew
# Check if Homebrew has already been installed. 
# Make the install non-interactive using NONINTERACTIVE=1
install_homebrew() {
    info "Installing Homebrew..."
    # `command -v brew` will output nothing if Homebrew is not installed
	  if [[ $(command -v brew) == "" ]]; then
      sudo --validate
      NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
	  else
      warning "Homebrew already installed"
	  fi
}

# dotfiles directory
dotfile_dir="${HOME}/dotfiles"
# DOTFILES_DIR="$HOME/Repos/github.com/mischavandenburg/dotfiles"
XDG_CONFIG_HOME="$HOME/.config"

# Install Homebrew - First check if Homebrew has been installed.
# This will also install X-code tools as part of the Homebrew installation
# We need X-code tools for a number of things
install_homebrew()

# Test if Homebrew was installed
  brew --version

# clone dotfiles repo from github
if [[ -d "$dotfile_dir" ]]; then
  echo "Dotfiles Directory exists"
  echo "Checking if git repo exists....."
  # Check if a git repo exists in the Dotfiles directory
  if git rev-parse --git-dir >/dev/null 2>&1; then
    # This is a valid git repository (but the current working
    # directory may not be the top level.
    # Check the output of the git rev-parse command if you care)
    echo .git
    echo "Git repo exists"
    # TODO get input from user and based on input, determine if we exit here or not
    echo "Should you rather be running the update script?......"
    exit 1
  fi
else
  echo "Cloning git repo...."
  git clone -b main https://github.com/murraysilber/dotfiles.git "$dotfile_dir"
  if [[ $? -eq 0 ]]; then
    echo "Repo cloned successfully"
  else
    echo "Repo was not cloned successfully"
    echo "Script will now exit..."
    exit 1
  fi
fi

# Exit immediately if a command exits with a non-zero status
set -e

if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
  echo "$XDG_CONFIG_HOME" does not exist.
  echo Creating "$XDG_CONFIG_HOME"
  mkdir -v "$XDG_CONFIG_HOME"
fi

# Are we in the dotfiles directory?
cd "${HOME}"/dotfiles

# Run installers
for i in wallpaper macos zsh wezterm tmux shell-tools rectangle vscode mise uv apps; do
  echo "$HOME/dotfiles/$i/setup.sh"
  source "$HOME/dotfiles/$i/setup.sh"
  # cd $i && ./setup.sh
  # cd -
done

# INSTALL APPS
# Install Apps using Homebrew & mas
# echo "Installing apps using Homebrew and mas"
# brew bundle --file="${HOME}"/.config/homebrew/Brewfile
