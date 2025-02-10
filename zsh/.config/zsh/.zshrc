# Source zsh additional functionality. Installed using Homebrew. I dont want a zsh plugin manager.
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Always start tmux when creating a shell. Attach to existing session if it exists or create a new one.
if command -v tmux &>/dev/null && [[ -z "$TMUX" ]]; then
  tmux new-session -A -s main
fi

# set location of .zcompdump
# Save the location of the current completion dump file.
if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${ZDOTDIR:-${ZSH}}/cache/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

# Load and initialise things
autoload -U zmv
# autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

# history setup
export HISTSIZE=50000
export HISTFILE=$HOME/.zhistory
export SAVEHIST=$HISTSIZE
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# completion using arrow keys (based on history)
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

setopt PROMPT_SUBST

# Load custom:
for file in $HOME/.config/zsh/.{zprompt,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Mise - polyglot tool version manager
eval "$(mise activate zsh)"

echo "Path: " $PATH
