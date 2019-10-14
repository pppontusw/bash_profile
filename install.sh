#!/bin/bash
if [ ! -L ~/.bash_profile ]; then ln -s profile ~/.bash_profile; fi
if [ ! -L ~/.vimrc ]; then ln -s vimrc ~/.vimrc; fi
mkdir -p ~/.vim
if [ ! -L ~/.vim/coc-settings.json ]; then ln -s coc-settings.json ~/.vim/coc-settings.json; fi
if [ ! -L ~/.tmux.conf ]; then ln -s tmux.conf ~/.tmux.conf; fi
if [ ! -L ~/.zshrc ]; then ln -s zshrc ~/.zshrc; fi

