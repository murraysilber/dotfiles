#!/bin/sh

starship_dir="$HOME/.config/starship"

if [ ! -d "$starship_dir" ]; then
  echo "$starship_dir" does not exist.
  echo Creating "$starship_dir"
  mkdir -v "$starship_dir"
fi

ln -sf "$PWD/starship.toml" "$HOME/.config/starship/starship.toml"
