#!/bin/sh

nvim_dir="$HOME/.config/nvim"

if [ ! -d "$nvim_dir" ]; then
  echo "$nvim_dir" does not exist
  echo Creating "$nvim_dir"
  mkdir -v "$nvim_dir"
fi

ln -sf "$HOME/dotfiles/neovim/init.lua" "$nvim_dir/init.lua"

brew install neovim
