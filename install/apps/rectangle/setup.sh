#!/bin/sh

rectangle_dir="$HOME/.config/rectangle"

if [ ! -d "$rectangle_dir" ]; then
  echo "$rectangle_dir" does not exist.
  echo Creating "$rectangle_dir"
  mkdir -v "$rectangle_dir"
fi

ln -sf "$HOME/dotfiles/apps/rectangle/RectangleConfig.json" "$rectangle_dir/RectangleConfig.json"
