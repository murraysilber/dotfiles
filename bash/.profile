# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/usr/local/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH"

# My scripts
export MY_SCRIPTS="$HOME/.config/bin"
export PATH="$PATH:$MY_SCRIPTS"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# This file is only here because some brain-dead
# applications require it.

if [[ -n "$BASH_VERSION" ]]; then
  # include .bashrc if it exists
  if [[ -f "$HOME/.bashrc" ]]; then
    . "$HOME/.bashrc"
  fi
fi
