#!/bin/sh

wezterm_dir="$HOME/.config/wezterm"

if [ ! -d "$wezterm_dir" ]; then
  echo "$wezterm_dir" does not exist.
  echo Creating "$wezterm_dir"
  mkdir -v "$wezterm_dir"
fi

ln -sf "$HOME/dotfiles/apps/wezterm/wezterm.lua" "$wezterm_dir/wezterm.lua"
