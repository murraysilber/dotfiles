#!/bin/sh

zsh_dir="$HOME/.config/zsh"

if [ ! -d "$zsh_dir" ]; then
  echo "$zsh_dir" does not exist.
  echo Creating "$zsh_dir"
  mkdir -v "$zsh_dir"
fi

ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$HOME/dotfiles/zsh/.zprofile" "$HOME/.config/zsh/.zprofile"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.aliases" "$HOME/.config/zsh/.aliases"
