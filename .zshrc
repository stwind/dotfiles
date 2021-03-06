setopt EXTENDED_GLOB
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# source `brew --prefix`/etc/profile.d/z.sh

disable r

alias ll="ls -Gahlp"
alias pbc="tr -d '\n' | pbcopy"
alias v="vim"
alias k="kubectl"
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

pngopt () {
    pngquant -f $1 -o $1
    optipng -o7 $1
    zopflipng -ym $1 $1
}

## export VIRTUALENVWRAPPER_PYTHON=$(which python)
## source $(which virtualenvwrapper.sh)

#export NVM_DIR="$HOME/.nvm"
#source "$(brew --prefix nvm)/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(pyenv init -)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/stwind/lib/js/serverless-mono-example/packages/sls-random/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/stwind/lib/js/serverless-mono-example/packages/sls-random/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/stwind/lib/js/serverless-mono-example/packages/sls-random/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/stwind/lib/js/serverless-mono-example/packages/sls-random/node_modules/tabtab/.completions/sls.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stwind/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stwind/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stwind/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stwind/google-cloud-sdk/completion.zsh.inc'; fi
