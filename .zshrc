if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$HOME/gocode/bin:$HOME/.prog/bin:$HOME/.cabal/bin:/Users/stwind/.rbenv/shims:/Users/stwind/.tmuxifier/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:/opt/local/bin:/usr/local/git/bin
export PYTHONPATH=/Library/Python/2.7/site-packages:/usr/local/Cellar/py2cairo/1.10.0/lib/python2.7/site-packages:$PYTHONPATH

export SCALA_HOME=~/.svm/current/rt
export PATH=$SCALA_HOME/bin:$PATH

# export LC_CTYPE="en_GB.UTF-8"
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

alias ll="ls -Gahlp"

alias pbc="tr -d '\n' | pbcopy"

alias v="vim"
alias m="mvim"

alias uuid='python -c "import uuid;print str(uuid.uuid4())" | tr -d "\n"'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='0;33'
export CLICOLOR=1 

# export PROMPT_COMMAND='echo -ne "\\033]0;`basename ${PWD}`"; echo -ne "\\007"'

export EDITOR="vim"

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

function mux {
    tmux new "tmuxifier s $1"
}

. `brew --prefix`/etc/profile.d/z.sh

disable r

genpasswd() { 
    pwgen -Bcyns $1 1 | pbc ; echo Has been copied to clipboard
}

source $(which virtualenvwrapper.sh)
source $(brew --prefix nvm)/nvm.sh
source $(brew --prefix)/lib/erlang/activate

export GOPATH=$HOME/gocode
eval "$(rbenv init -)"
