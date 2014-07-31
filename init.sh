#!/bin/bash

FILES=".bash_profile .bash_prompt .bashrc .gemrc .gitconfig .gvimrc .tmux.conf .vimrc .zshrc"

for f in $FILES;do
    ln -s `pwd`/$f $HOME/$f
done
