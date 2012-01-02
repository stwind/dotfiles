export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colors="set | egrep 'COLOR_\\w*'"  # lists all the colors

#export PS1="${COLOR_YELLOW}[\t]${COLOR_NC} ${COLOR_CYAN}\u@\h${COLOR_NC}:${COLOR_GREEN}\W${COLOR_NC} $ "

alias ls="ls -Gahlp"
alias ..="cd .."
alias ...="cd ../.."
alias lsd='ls -l | grep "^d"'
alias lsf='ls -l | grep "^-"'
alias c="clear"

alias v="vim"
alias m="mvim"
alias g="git"

alias php-cgi="php-cgi -b 127.0.0.1:9000 &"
alias mysqld="sudo mysqld_safe"

alias http="python -m SimpleHTTPServer"
alias ducks="du -cks * | sort -rn | head -10"
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias df="df -h"

# Trim new lines and copy to clipboard
alias pbc="tr -d '\n' | pbcopy"

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 

export PROMPT_COMMAND='echo -ne "\\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\\007"'
