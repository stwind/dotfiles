if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/texbin:/opt/local/bin
export PATH=$HOME/.tmuxifier/bin:$PATH
export PATH=$HOME/gocode/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export SCALA_HOME=$HOME/.svm/current/rt
export PATH=$SCALA_HOME/bin:$PATH

export PYTHONPATH=/Library/Python/2.7/site-packages:/usr/local/Cellar/py2cairo/1.10.0/lib/python2.7/site-packages:$PYTHONPATH


export LC_CTYPE="en_GB.UTF-8"
export LANG="en_GB.UTF-8"
# export LC_ALL=C

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

function mux {
    tmux new "tmuxifier s $1"
}

. `brew --prefix`/etc/profile.d/z.sh

disable r

function genpasswd() {
    pwgen -Bcyns $1 1 | pbc ; echo Has been copied to clipboard
}

source $(which virtualenvwrapper.sh)
# source $(brew --prefix)/lib/erlang/activate

export GOPATH=$HOME/gocode
eval "$(rbenv init -)"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export R_HOME=$(Rscript -e "cat(R.home())" --vanilla)

export NVM_DIR="/Users/stwind/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
