# +----+
# | ls |
# +----+

alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias lla='ls -la'
alias lc='ls -CF'

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

# +-------+
# | fonts |
# +-------+

alias fonts='fc-cache -f -v'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'
