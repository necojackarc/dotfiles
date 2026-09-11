#!/bin/sh
set -e

# ln -sfn cannot replace a real directory. Do not rm -rf it.
link_dir() {
  dest=$1
  src=$2
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "skip $dest: exists and is not a symlink" >&2
    return 1
  fi
  ln -sfn "$src" "$dest"
}

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
link_dir ~/.vim ~/dotfiles/vim

# tmux
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
link_dir ~/.tmux ~/dotfiles/tmux

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

# claude — copy, not symlink: a host-path link is broken in the Dev Container
mkdir -p ~/.claude
rm -f ~/.claude/CLAUDE.md
cp ~/dotfiles/ai/AGENTS.md ~/.claude/CLAUDE.md
