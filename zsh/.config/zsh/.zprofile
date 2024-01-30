# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# source my own paths
if [[ $SHLVL == 1 && ! -o LOGIN ]]; then
  source $HOME/.config/zsh/.zpath
fi

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
