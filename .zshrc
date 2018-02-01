if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#export PYTHONPATH=/Library/Python/2.7/site-packages:/usr/local/Cellar/py2cairo/1.10.0/lib/python2.7/site-packages:$PYTHONPATH

alias ll="ls -Gahlp"
alias pbc="tr -d '\n' | pbcopy"
alias v="vim"
alias uuid='python -c "import uuid;print str(uuid.uuid4())" | tr -d "\n"'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='0;33'
export CLICOLOR=1

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

source `brew --prefix`/etc/profile.d/z.sh

disable r

genpasswd() {
    pwgen -Bcyns $1 1 | pbc ; echo Has been copied to clipboard
}

notify() {
    terminal-notifier -sound Submarine
}

notifyme () {
    START=$(gdate +%s%3N)
    CMD="$@"
    END=$(gdate +%s%3N)
    eval $CMD
    if [ $? -ne 0 ];then
        TITLE="Failed"
    else
        TITLE="Success"
    fi
    echo "$CMD" | terminal-notifier -sound Submarine -title "$TITLE: $((END-START))ms"
}

export VIRTUALENVWRAPPER_PYTHON=$(which python2)
source $(which virtualenvwrapper.sh)

# eval "$(rbenv init -)"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/local/opt/erlang@19/bin:$PATH"
