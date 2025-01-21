# .zshenv is always sourced.
# Most ${ENV_VAR} variables should be saved here.
# It's loaded before .zshrc
# https://www.baeldung.com/linux/zsh-configuration-files

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# XDG Base directory specification
export XDG_CONFIG_HOME="$HOME/.config"         # Config files
export XDG_CACHE_HOME="$HOME/.cache"           # Cache files
export XDG_DATA_HOME="$HOME/.local/share"      # Application data
export XDG_STATE_HOME="$HOME/.local/state"     # Logs and state files

# Themes (gruvbox)
export TMUX_THEME="gruvbox"
export NVIM_THEME="gruvbox"

# default apps
export EDITOR="nvim"
export TERMINAL="ghostty"
export BROWSER="chrome"

# Default Locations
export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES="$HOME/dotfiles"


# Add /usr/local/bin to the beginning of the PATH environment variable.
# This ensures that executables in /usr/local/bin are found before other directories in the PATH.
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$HOME/.config/scripts/pomodoro:$PATH"
