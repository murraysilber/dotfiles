#!/usr/bin/env zsh
############################
# This script updates apps on a Mac based on your github dotfiles repo
# 1. Dotfiles - assumes you have your local and remote git repos in sync
# 2. Updates Homebrew
# 3. Installs apps etc. that are currently not installed (Homebrew).
############################

# dotfiles directory
dotfile_dir="${HOME}/dotfiles"

if [[ -d "$dotfile_dir" ]]; then
  read "response?Have you checked that your local and remote git repos are aligned?. Continue (y/n)?"

  if [[ "$response" =~ ^[Yy]$ ]]; then
    # Update Homebrew
    # Clean up any orphaned configs etc.
    brew update
    brew cleanup

    # Exit immediately if a command exits with a non-zero status
    set -e

    # Are we in the dotfiles directory?
    cd "${HOME}"/dotfiles

    # Run updates
    echo "Updating macOS defaults and wallpaper"
    source "$dotfile_dir/macos/setup.sh"

    # Install new apps and upgrade existing casks and formulae installed by Homebrew
    source "$dotfile_dir/apps/setup.sh"

    #Update Shell stuff
    source "$dotfile_dir/zsh/setup.sh"

  else
    echo "fix this before running the update script...."
    exit 1
  fi

else
  echo "No dotfiles directory found..."
  echo "Are you sure you should be updating?.."
  echo "Perhaps you should be running hte bootstrap script instead?"
fi
