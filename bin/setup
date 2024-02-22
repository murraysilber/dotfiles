#!/bin/sh

my_dir="$HOME/.config/bin"

if [ ! -d "$my_dir" ]; then
  echo "$my_dir" does not exist.
  echo Creating "$my_dir"
  mkdir "$my_dir"
fi

ln -sf "$PWD/b" "$HOME/.config/bin/b"
ln -sf "$PWD/pomo" "$HOME/.config/bin/pomo"
