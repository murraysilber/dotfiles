# ZAP Plgin Manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/.aliases"
plug "$HOME/.env.sh"
# plug "$HOME/.config/bin/litra-automation.sh"
plug "$HOME/.asdf/asdf.sh"

#plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/fzf"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Load and initialise things
autoload -U zmv
# autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

# Starship Prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

echo "Path: " $PATH
