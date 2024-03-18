#!/bin/sh

rectangle_dir="$HOME/.config/rectangle"

if [ ! -d "$rectangle_dir" ]; then
  echo "$rectangle_dir" does not exist.
  echo Creating "$rectangle_dir"
  mkdir -v "$rectangle_dir"
fi

ln -sf "$HOME/dotfiles/rectangle/RectangleConfig.json" "$rectangle_dir/RectangleConfig.json"

brew install --cask rectangle
