#!/bin/bash
if [ ! -L ~/.bash_aliases ]; then ln -s ~/git/bash_profile/profile ~/.bash_aliases; fi
if [ ! -L ~/.vimrc ]; then ln -s ~/git/bash_profile/vimrc ~/.vimrc; fi
mkdir -p ~/.vim
if [ ! -L ~/.vim/coc-settings.json ]; then ln -s ~/git/bash_profile/coc-settings.json ~/.vim/coc-settings.json; fi
if [ ! -L ~/.tmux.conf ]; then ln -s ~/git/bash_profile/tmux.conf ~/.tmux.conf; fi
