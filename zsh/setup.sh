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
ln -sf "$HOME/dotfiles/zsh/.zprompt" "$HOME/.config/zsh/.zprompt"

# install hombrew zsh and use
brew install zsh

# Add the Homebrew zsh to allowed shells
echo "Changing default shell to Homebrew zsh"
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew zsh as default shell
chsh -s "$(brew --prefix)/bin/zsh"
