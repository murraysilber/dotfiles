#!/bin/sh

neofetch_dir="$HOME/.config/neofetch"

if [ ! -d "$neofetch_dir" ]; then
  echo "$neofetch_dir" does not exist.
  echo Creating "$neofetch_dir"
  mkdir -v "$neofetch_dir"
fi

ln -sf "$PWD/config.conf" "$HOME/.config/neofetch/config.conf"
