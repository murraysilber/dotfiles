#!/bin/sh

kitty_dir="$HOME/.config/kitty"

if [ ! -d "$kitty_dir" ]; then
  echo "$kitty_dir" does not exist.
  echo Creating "$kitty_dir"
  mkdir -v "$kitty_dir"
fi

ln -sf "$HOME/dotfiles/kitty/kitty.conf" "$kitty_dir/kitty.conf"

brew install --cask kitty
