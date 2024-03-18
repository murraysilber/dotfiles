#!/bin/sh

rectangle_dir="$HOME/.config/rectangle"

if [ ! -d "$rectangle_dir" ]; then
  echo "$rectangle_dir" does not exist.
  echo Creating "$rectangle_dir"
  mkdir -v "$rectangle_dir"
fi

ln -sf "$PWD/RectangleConfig.json" "$HOME/.config/rectangle/RectangleConfig.json"

brew install --cask rectangle
