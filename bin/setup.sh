#!/bin/sh

bin_dir="$HOME/.config/bin"

if [ ! -d "$bin_dir" ]; then
  echo "$bin_dir" does not exist.
  echo Creating "$bin_dir"
  mkdir "$bin_dir"
fi

ln -sf "$HOME/dotfiles/bin/b" "$bin_dir/b"
ln -sf "$HOME/dotfiles/bin/pomo" "$bin_dir/pomo"
