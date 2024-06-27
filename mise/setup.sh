#!/bin/sh

mise_dir="$HOME/.config/mise"

if [ ! -d "$mise_dir" ]; then
  echo "$mise_dir" does not exist.
  echo Creating "$mise_dir"
  mkdir -v "$mise_dir"
fi

ln -sf "$HOME/dotfiles/mise/config.toml" "$mise_dir/config.toml"

brew install libyaml #needed for installing Ruby
brew install xz      #needed for installing Python
brew install mise

# Install default languages
# mise use --global ruby@3.3
# mise use --global python
# mise use --global go@latest
