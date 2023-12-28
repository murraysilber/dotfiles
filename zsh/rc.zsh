# Created by Zap installer
# [ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
plug "$HOME/dotfiles/zsh/aliases.zsh"
plug "$HOME/dotfiles/zsh/exports.zsh"
plug "$HOME/.env.sh"

#plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "MAHcodes/distro-prompt"
plug "zap-zsh/fzf"

# Source files if they exist
# source_if_exists() {
#     if test -r "$1"; then
#         source "$1"
#         echo "Sourced " "$1"
#     fi
# }

# source_if_exists $DOTFILES/zsh/aliases.zsh
# source_if_exists $DOTFILES/zsh/exports.zsh
# source_if_exists $HOME/.env.sh
# source_if_exists $DOTFILES/zsh/git.zsh
# source_if_exists ~/.fzf.zsh

# Load and initialise things

autoload -U zmv
# autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

echo "Path is currently: " $PATH
