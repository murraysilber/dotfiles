# +----+
# | ls |
# +----+
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lahF --color=auto'
alias lls='ls -lahFtr'
alias la='ls -A'
alias lc='ls -CF'
alias lla='ls -la --color=auto'

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
alias vim="nvim"
# alias vi="nvim"

# +-------+
# | fonts |
# +-------+
alias fonts='fc-cache -f -v'
alias ffonts='fc-list | grep -i '

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# +----+
# | cd |
# +----+
alias dboot='cd ~/Developer/boot.dev'
