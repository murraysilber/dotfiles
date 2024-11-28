#!/bin/sh

mise_dir="$HOME/.config/mise"

if [ ! -d "$mise_dir" ]; then
  echo "$mise_dir" does not exist.
  echo Creating "$mise_dir"
  mkdir -v "$mise_dir"
fi

ln -sf "$HOME/dotfiles/mise/config.toml" "$mise_dir/config.toml"

brew install mise

# Install Gleam Plugin
mise plugin install plugin https://github.com/asdf-community/asdf-gleam

# Install default languages from config.toml
mise install
