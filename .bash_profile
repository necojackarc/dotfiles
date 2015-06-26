if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Git branch
function length()
{
  echo -n ${#1}
}

function init-prompt-git-branch()
{
  git symbolic-ref HEAD 2>/dev/null >/dev/null &&
  echo "($(git symbolic-ref HEAD 2>/dev/null | sed 's/^refs\/heads\///'))"
}

GIT_PS1_SHOWDIRTYSTATE=true
source /etc/git-prompt.sh
source /etc/git-completion.bash

if which git 2>/dev/null >/dev/null
then
  export PS1_GIT_BRANCH='\[ \e[ $[COLUMNS]D \] \[ \e[1;31m\] \[\e[$[COLUMNS-$(length $(init-prompt-git-branch)) ] C\]$(init-prompt-git-branch)\[\e[$[COLUMNS]D\]\[\e[0m\]'
else
  export PS1_GIT_BRANCH=
fi

export PS1="\[\e[32;1m\]\u@\H \[\e[33;1m\]\w $PS1_GIT_BRANCH\n\[\e[36;1m\]\t \[\e[0m\]\$ "

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -FG'
alias la='ls -a'
alias ll='ls -l'
alias vi='vim'
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
if which rbenv 2> /dev/null > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv 2> /dev/null > /dev/null; then eval "$(pyenv init -)"; fi

# scalaenv
export PATH="${HOME}/.scalaenv/bin:${PATH}"
export SCALAENV_ROOT="$HOME/.scalaenv"
if which scalaenv 2> /dev/null > /dev/null; then eval "$(scalaenv init -)"; fi

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
export NDENV_ROOT="$HOME/.ndenv"
if which ndenv 2> /dev/null > /dev/null; then eval "$(ndenv init -)"; fi

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
