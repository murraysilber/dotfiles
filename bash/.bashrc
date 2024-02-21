# ---------------------- local utility functions ---------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
fi

# Starship Prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"

# Aliases

# +----+
# | ls |
# +----+
alias l='ls -l'
alias la='ls -A'
alias lc='ls -CF'
alias ll='ls -al --color=auto'
alias lls='ls -lahFtr'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# +----+
# | cp |
# +----+
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# +-----+
# | Vim |
# +-----+
alias v="vim"

# +-------+
# | fonts |
# +-------+
alias fonts='fc-cache -f -v'
alias ffonts='fc-list | grep -i '

# +----+
# | cd |
# +----+
alias boot='cd ~/Developer/boot.dev'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
