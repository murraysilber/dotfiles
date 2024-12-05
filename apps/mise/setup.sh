#!/bin/sh

mise_dir="$HOME/.config/mise"

if [ ! -d "$mise_dir" ]; then
  echo "$mise_dir" does not exist.
  echo Creating "$mise_dir"
  mkdir -v "$mise_dir"
fi

ln -sf "$HOME/dotfiles/apps/mise/config.toml" "$mise_dir/config.toml"

# Install Gleam Plugin
mise plugins install gleam https://github.com/asdf-community/asdf-gleam

# Install Elixir Plugin
mise plugin install elixir https://github.com/mise-plugins/mise-elixir.git

# Install default languages from config.toml
mise install
