#!/usr/bin/env zsh
############################
# This script sets up a Mac from scratch
# 1. Dotfiles - pulls them from github and sets up symlinks
# 2. Sets up MacOS defaults I prefer
# 3. Installs specific apps intentionally that I use.
# 4. And also installs other Apps using Homebrew
############################

# dotfiles directory
dotfiledir="${HOME}/dotfiles"

# Install Hombrew - This will also install X-code tools as part of the Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Attempt to set up Homebrew PATH automatically for this session
if [ -x "/opt/homebrew/bin/brew" ]; then
  For Apple Silicon Macs
  echo "Configuring Homebrew in PATH for Apple Silicon Mac..."
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# test if Homebrew was installed
brew --version
brew doctor

# clone dotfiles repo from github
echo "Cloning git repo...."
git clone -b main https://github.com/murraysilber/dotfiles.git "$dotfiledir"
if [ $? -eq 0 ]; then
  echo "Repo cloned successfully"
else
  echo "Repo was not cloned successfully"
  echo "Script will now exit..."
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
