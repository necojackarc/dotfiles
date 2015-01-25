#!/bin/sh
ln -sfn ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

mkdir -p ~/dotfiles/.vim/undo 2>/dev/null
