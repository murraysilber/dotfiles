#!/bin/sh

bin_dir="$HOME/.config/bin"

if [ ! -d "$bin_dir" ]; then
  echo "$bin_dir" does not exist.
  echo Creating "$bin_dir"
  mkdir "$bin_dir"
fi

pomo_dir="$HOME/.config/bin/pomodoro"

if [ ! -d "$pomo_dir" ]; then
  echo "$pomo_dir" does not exist.
  echo Creating "$pomo_dir"
  mkdir "$pomo_dir"
fi

ln -sf "$HOME/dotfiles/bin/b" "$bin_dir/b"
ln -sf "$HOME/dotfiles/bin/pomodoro/init_pomo" "$bin_dir/pomodoro/init_pomo"
ln -sf "$HOME/dotfiles/bin/pomodoro/pomo" "$bin_dir/pomodoro/pomo"
