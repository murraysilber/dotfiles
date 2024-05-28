# ZAP Plgin Manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/.aliases"
plug "$HOME/.env.sh"
# plug "$HOME/.config/bin/litra-automation.sh"

#plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/fzf"


# vim cursor
zle-line-finish zle-line-init zle-keymap-select () {
    if [ $TERM != linux ]; then
        if [ $KEYMAP = vicmd ]; then
            echo -ne "\e[2 q"
        else
            echo -ne "\e[5 q"
        fi
    fi
}


# Load and initialise things
autoload -U zmv
# autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

# Starship Prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# fzf
eval "$(fzf --zsh)"

echo "Path: " $PATH
