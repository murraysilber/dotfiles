# PATH
export PATH="$PATH:/usr/local/sbin:$DOTFILES_ROOT/bin:$HOME/.local/bin:$DOTFILES_ROOT/scripts/"

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=100000
