for file in ~/.{bashrc,bash_prompt,aliases}; do
  [ -r "$file" ] && source "$file"
done

echo -e "Kernel Information: " `uname -smr`
echo -e "`bash --version`"
echo -ne "Uptime: "; uptime
echo -ne "Server time: "; date

export PATH=/usr/local/bin:$PATH
