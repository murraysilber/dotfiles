# Source zsh additional functionality. Installed using Homebrew. I dont want a zsh plugin manager.
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/.config/zsh/.aliases"
# source "$HOME/.env.sh"

# Load and initialise things
autoload -U zmv
# autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Starship Prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Mise - polyglot tool version manager
eval "$(mise activate zsh)"

echo "Path: " $PATH
