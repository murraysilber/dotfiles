#!/usr/bin/env bash
############################
# This script sets up a Mac from scratch
# 1. Dotfiles - pulls them from github and sets up symlinks
# 2. Sets up MacOS defaults I prefer
# 3. Installs specific apps intentionally that I use.
# 4. And also installs other Apps using Homebrew
############################

# util functions for user friendly output
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

# Install x-code cli tools. (Needed for homebrew and git installs)
install_xcode() {
  info "Installing Apple's x-code CLI tools (prerequisites for Git and Homebrew)..."
  if xcode-select -p >/dev/null; then
    warning "x-code CLI tools are already installed"
  else
    xcode-select --install
    sudo xcodebuild -license accept
  fi
}

# Install Homebrew
# Make the install non-interactive using NONINTERACTIVE=1
install_homebrew() {
  info "Installing Homebrew..."
  # `command -v brew` will output nothing if Homebrew is not installed
  if [[ $(command -v brew) == "" ]]; then
    sudo --validate # request sudo upfront
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    warning "Homebrew already installed"
  fi
}

# dotfiles directory
dotfile_dir="$HOME/dotfiles"
# XDG_CONFIG_HOME="$HOME/.config"

# clone dotfiles repo from github
clone_git_repo() {
  if [[ -d "$dotfile_dir" ]]; then
    info "Dotfiles Directory exists"
    info "Checking if git repo exists....."
    # Check if a git repo exists in the Dotfiles directory
    if git rev-parse --git-dir >/dev/null 2>&1; then
      # This is a valid git repository (but the current working
      # directory may not be the top level.
      # Check the output of the git rev-parse command if you care)
      warning "Git repo exists"
      # TODO: get input from user and based on input, determine if we exit here or not
      warning "Should you rather be running the update script?......"
      # exit 1
    fi
  else
    info "Cloning git repo...."
    git clone -b main https://github.com/murraysilber/dotfiles.git "$dotfile_dir"
    if [[ $? -eq 0 ]]; then
      info "Repo cloned successfully"
    else
      error "Repo was not cloned successfully"
      error "Script will now exit..."
      exit 1
    fi
  fi
}

# Exit immediately if a command exits with a non-zero status
set -e

install_xcode
install_homebrew
clone_git_repo

# TODO: install apps using homebrew and sync dotfiles.

# if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
#     echo "$XDG_CONFIG_HOME" does not exist.
#     echo Creating "$XDG_CONFIG_HOME"
#     mkdir -v "$XDG_CONFIG_HOME"
# fi

# Are we in the dotfiles directory?
cd "${HOME}"/dotfiles

# symink dotfiles using GNU stow (https://www.gnu.org/software/stow/) - there are many ways to use stow, this is just one way.
for i in wallpaper zsh uv tmux scripts nvim mise ghostty; do
  info "Stowing $i"
  stow $i
done

# symlink dotfiles for vscode and Rectangle....they have specific targets that differ from the rest
for i in vscode rectangle; do
  stow -v -t ~/Library/Application\ Support/ "$i"
done

# INSTALL APPS
# Install Apps using Homebrew & mas
# echo "Installing apps using Homebrew and mas"
# brew bundle --file="${HOME}"/.config/homebrew/Brewfile
