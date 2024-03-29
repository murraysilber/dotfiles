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

# Default Locations
export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES="$HOME/dotfiles"

#ASDF
export ASDF_CONFIG_FILE="$HOME/.config/asdf/.asdfrc"
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=.tool_versions

# zsh history
export HISTSIZE=10000 # Maximum events for internal history
export SAVEHIST=10000 # Maximum events in history file

# source my own paths
if [[ $SHLVL == 1 && ! -o LOGIN ]]; then
  source $HOME/.config/zsh/.zpath
fi
