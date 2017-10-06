#!/bin/bash

FILES=(.spacemacs .zlogin .zlogout .zpreztorc .zprofile .zshenv .zshrc .bashrc .bash_profile .bash_prompt .ctags .gitconfig)

for f in "${FILES[@]}";do
  ln -s ~/dotfiles/"$f" ~/"$f" 
done
