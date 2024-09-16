# .zshenv is always sourced.
# Most ${ENV_VAR} variables should be saved here.
# It's loaded before .zshrc
# https://www.baeldung.com/linux/zsh-configuration-files

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# default apps
export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="brave"

# Default Locations
export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES="$HOME/dotfiles"

export PATH="$HOME/.config/bin:$PATH"
export PATH="$HOME/.config/bin/pomodoro:$PATH"
