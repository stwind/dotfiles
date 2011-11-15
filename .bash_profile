export PS1="\e[1;33m[\t]\e[m \e[0;36m\u@\h\e[m:\e[0;32m\W\e[m $ "

alias ls="ls -Gahl"
alias ..="cd .."
alias ...="cd ../.."
alias lsd='ls -l | grep "^d"'
alias lsf='ls -l | grep "^-"'

alias v="vim"
alias m="mvim"
alias g="git"

alias http="python -m SimpleHTTPServer"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

##
# Your previous /Users/stwind/.bash_profile file was backed up as /Users/stwind/.bash_profile.macports-saved_2011-09-30_at_01:24:23
##

# MacPorts Installer addition on 2011-09-30_at_01:24:23: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

