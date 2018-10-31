#!/bin/sh

# Files
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/editorconfig ~/.editorconfig
ln -sf ~/dotfiles/gemrc ~/.gemrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore ~/.gitignore
ln -sf ~/dotfiles/gvimrc ~/.gvimrc
ln -sf ~/dotfiles/ignore ~/.ignore # for ripgrep
ln -sf ~/dotfiles/inputrc ~/.inputrc
ln -sf ~/dotfiles/profile ~/.profile
ln -sf ~/dotfiles/pryrc ~/.pryrc
ln -sf ~/dotfiles/rspec ~/.rspec
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/tigrc ~/.tigrc

# Directories
rm -rf ~/.tmux
ln -sfn ~/dotfiles/tmux ~/.tmux
rm -rf ~/.vim
ln -sfn ~/dotfiles/vim ~/.vim
