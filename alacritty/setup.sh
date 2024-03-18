#!/bin/sh

alacritty_dir="$HOME/.config/alacritty"

if [ ! -d "$alacritty_dir" ]; then
  echo "$alacritty_dir" does not exist.
  echo Creating "$alacritty_dir"
  mkdir -v "$alacritty_dir"
fi

ln -sf "$PWD/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -sf "$PWD/gruvbox_dark.toml" "$HOME/.config/alacritty/gruvbox_dark.toml"

brew install alacritty
