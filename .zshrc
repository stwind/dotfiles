setopt EXTENDED_GLOB
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source `brew --prefix`/etc/profile.d/z.sh

disable r

alias ll="ls -Gahlp"
alias pbc="tr -d '\n' | pbcopy"
alias v="vim"
alias uuid='python -c "import uuid;print str(uuid.uuid4())" | tr -d "\n"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias bu='brew upgrade --ignore-pinned --cleanup'

genpasswd() {
    pwgen -Bcyns $1 1 | pbc
    echo Has been copied to clipboard
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

export VIRTUALENVWRAPPER_PYTHON=$(which python)
source $(which virtualenvwrapper.sh)

export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
