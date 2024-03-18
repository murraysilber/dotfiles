# .zshenv is always sourced.
# Most ${ENV_VAR} variables should be saved here.
# It is loaded before .zshrc
# https://www.baeldung.com/linux/zsh-configuration-files

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# default apps
export EDITOR="vim"
export TERMINAL="Alacritty"
export BROWSER="brave"

export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES="$HOME/dotfiles"

# zsh history
export HISTSIZE=10000 # Maximum events for internal history
export SAVEHIST=10000 # Maximum events in history file

# source my own paths
if [[ $SHLVL == 1 && ! -o LOGIN ]]; then
  source $HOME/.config/zsh/.zpath
fi
