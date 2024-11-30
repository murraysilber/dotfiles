#!/bin/sh

uv_dir="$HOME/.config/uv"

if [ ! -d "$uv_dir" ]; then
  echo "$uv_dir" does not exist.
  echo Creating "$uv_dir"
  mkdir -v "$uv_dir"
fi

ln -sf "$HOME/dotfiles/apps/uv/uv.toml" "$uv_dir/uv.toml"
