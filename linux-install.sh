#!/bin/bash
cp profile ~/.bash_aliases
source ~/.bash_aliases
cp vimrc ~/.vimrc
mkdir -p ~/.vim
cp coc-settings.json ~/.vim/
cp tmux.conf ~/.tmux.conf
