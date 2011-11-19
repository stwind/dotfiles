for file in ~/.{bash_prompt,bashrc,aliases}; do
  [ -r "$file" ] && source "$file"
done

echo -e "Kernel Information: " `uname -smr`
echo -e "`bash --version`"
echo -ne "Uptime: "; uptime
echo -ne "Server time: "; date

##
# Your previous /Users/stwind/.bash_profile file was backed up as /Users/stwind/.bash_profile.macports-saved_2011-09-30_at_01:24:23
##

# MacPorts Installer addition on 2011-09-30_at_01:24:23: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

