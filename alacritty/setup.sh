#!/bin/sh

alacritty_dir="$HOME/.config/alacritty"

if [ ! -d "$alacritty_dir" ]; then
  echo "$alacritty_dir" does not exist.
  echo Creating "$alacritty_dir"
  mkdir -v "$alacritty_dir"
fi

ln -sf "$HOME/dotfiles/alacritty/alacritty.toml" "$alacritty_dir/alacritty.toml"
ln -sf "$HOME/dotfiles/alacritty/gruvbox_dark.toml" "$alacritty_dir/gruvbox_dark.toml"
