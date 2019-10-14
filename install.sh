#!/bin/bash
cp profile ~/.bash_profile
source ~/.bash_profile
cp vimrc ~/.vimrc
mkdir -p ~/.vim
cp coc-settings.json ~/.vim/
cp tmux.conf ~/.tmux.conf
cp zshrc ~/.zshrc
