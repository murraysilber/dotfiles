#!/bin/sh

zsh_dir="$HOME/.config/zsh"

if [ ! -d "$zsh_dir" ]; then
  echo "$zsh_dir" does not exist.
  echo Creating "$zsh_dir"
  mkdir -v "$zsh_dir"
fi

ln -sf "$PWD/.zshenv" "$HOME/.zshenv"
ln -sf "$PWD/.zprofile" "$HOME/.config/zsh/.zprofile"
ln -sf "$PWD/.zshrc" "$HOME/.config/zsh/.zshrc"
ln -sf "$PWD/.zpath" "$HOME/.config/zsh/.zpath"
ln -sf "$PWD/.aliases" "$HOME/.config/zsh/.aliases"
