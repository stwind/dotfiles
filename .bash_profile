for file in ~/.{bashrc,bash_prompt,aliases}; do
  [ -r "$file" ] && source "$file"
done

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

export NODE_PATH=$(npm root -g)

# eval "$(rbenv init -)"

export LC_CTYPE="en_GB.UTF-8"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
