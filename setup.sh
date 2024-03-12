#!/bin/sh
############################
# This script creates symlinks from the home directory to any desired dotfiles in $HOME/dotfiles
# And also installs MacOS Software
# And also installs Homebrew Packages and Casks (Apps)
# And also sets up VS Code
# And also sets up Sublime Text
############################

set -e

# ln -sf "$PWD/.inputrc" "$HOME/.inputrc"
# ln -sf "$PWD/scripts" "$HOME/Scripts"

# for i in bash tmux alacritty neofetch rectangle starship wallpaper bin; do
#   cd $i && ./setup
#   cd -
# done

# Need to create base directory for housing symlinks and scripts.
mkdir -v "${HOME}"/.config

for i in macos wallpaper; do
  cd $i && ./setup
  cd -
done
