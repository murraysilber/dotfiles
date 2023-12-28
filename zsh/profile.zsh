# Environment variables set everywhere
export EDITOR="code"
export TERMINAL="alacritty"
export BROWSER="brave"

# For QT Themes
# export QT_QPA_PLATFORMTHEME=qt5ct

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
