#!/bin/sh

# test type tmux >/dev/null 2>&1 && echo "TMUX isn't installed. Skipping." && exit 1

tmux_dir="$HOME/.config/tmux"

if [ ! -d "$tmux_dir" ]; then
  echo "$tmux_dir" does not exist.
  echo Creating "$tmux_dir"
  mkdir -v "$tmux_dir"
fi

ln -sf "$HOME/dotfiles/tmux/tmux.conf" "$tmux_dir/tmux.conf"
