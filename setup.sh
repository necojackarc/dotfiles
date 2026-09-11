#!/bin/sh

# bash
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/profile ~/.profile
ln -sf ~/dotfiles/inputrc ~/.inputrc

# git
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore ~/.gitignore

# vim
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/gvimrc ~/.gvimrc
rm -rf ~/.vim
ln -sfn ~/dotfiles/vim ~/.vim

# tmux
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.tmux
ln -sfn ~/dotfiles/tmux ~/.tmux

# tig
ln -sf ~/dotfiles/tigrc ~/.tigrc

# ripgrep
ln -sf ~/dotfiles/ignore ~/.ignore

# ruby
ln -sf ~/dotfiles/gemrc ~/.gemrc
ln -sf ~/dotfiles/pryrc ~/.pryrc
ln -sf ~/dotfiles/rspec ~/.rspec

# postgres
ln -sf ~/dotfiles/psqlrc ~/.psqlrc

# claude
mkdir -p ~/.claude
ln -sf ~/dotfiles/ai/AGENTS.md ~/.claude/CLAUDE.md
