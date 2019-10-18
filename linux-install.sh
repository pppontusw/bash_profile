#!/bin/bash
if [ ! -L ~/.bash_profile ]; then ln -s ~/git/bash_profile/profile ~/.bash_profile; fi
if [ ! -L ~/.vimrc ]; then ln -s ~/git/bash_profile/vimrc ~/.vimrc; fi
mkdir -p ~/.vim
if [ ! -L ~/.vim/coc-settings.json ]; then ln -s ~/git/bash_profile/coc-settings.json ~/.vim/coc-settings.json; fi
if [ ! -L ~/.tmux.conf ]; then ln -s ~/git/bash_profile/tmux.conf ~/.tmux.conf; fi
if [ ! -L ~/.zshrc ]; then ln -s ~/git/bash_profile/zshrc-linux ~/.zshrc; fi
mkdir -p ~/.config/alacritty
if [ ! -L ~/.config/alacritty/alacritty.yml ]; then ln -s ~/git/bash_profile/alacritty.yml ~/.config/alacritty/alacritty.yml; fi
