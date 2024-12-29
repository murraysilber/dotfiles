#!/bin/sh

ghostty_dir="$HOME/.config/ghostty"

if [ ! -d "$ghostty_dir" ]; then
  echo "$ghostty_dir" does not exist.
  echo Creating "$ghostty_dir"
  mkdir -v "$ghostty_dir"
fi

ln -sf "$HOME/dotfiles/apps/ghostty/config" "$ghostty_dir/config"
