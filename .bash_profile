for file in ~/.{bashrc,bash_prompt,aliases}; do
  [ -r "$file" ] && source "$file"
done

echo -e "Kernel Information: " `uname -smr`
echo -e "`bash --version`"
echo -ne "Uptime: "; uptime
echo -ne "Server time: "; date

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export LC_CTYPE="en_GB.UTF-8"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
