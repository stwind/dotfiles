for file in ~/.{bashrc,bash_prompt,aliases}; do
  [ -r "$file" ] && source "$file"
done

#echo -e "Kernel Information: " `uname -smr`
#echo -e "`bash --version`"
#echo -ne "Uptime: "; uptime
#echo -ne "Server time: "; date

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export LC_CTYPE="en_GB.UTF-8"

export PYTHONPATH=/Library/Python/2.7/site-packages:/usr/local/Cellar/py2cairo/1.10.0/lib/python2.7/site-packages:$PYTHONPATH
export NODE_PATH=$(npm root -g)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
