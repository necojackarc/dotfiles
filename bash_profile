# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Locale
LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

# Prompt
source ~/dotfiles/git-prompt.sh
source ~/dotfiles/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
export PS1='\[\033[32m\]\u@\h\[\033[00m\]: \[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\[\e[36;1m\]\t \[\e[0m\]\$ '

# alias
alias sudo='sudo -E'
alias vi='vim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -FG'
alias la='ls -a'
alias ll='ls -l'
alias be='bundle exec'

# MacVim
if [ `uname` = "Darwin" ]; then
    if [[ -d /Applications/MacVim.app ]]; then # If "MacVim" is existed
      export PATH="/Applications/MacVim.app/Contents/MacOS/:$PATH"
      alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    fi
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export RBENV_ROOT="$HOME/.rbenv"
if which rbenv 2>/dev/null >/dev/null; then eval "$(rbenv init -)"; fi

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv 2>/dev/null >/dev/null; then eval "$(pyenv init -)"; fi

# scalaenv
export PATH="${HOME}/.scalaenv/bin:${PATH}"
export SCALAENV_ROOT="$HOME/.scalaenv"
if which scalaenv 2>/dev/null >/dev/null; then eval "$(scalaenv init -)"; fi

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
