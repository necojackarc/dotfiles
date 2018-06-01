# Terminal
export TERM=xterm-256color

# Locale
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Prompt
source ~/dotfiles/git-prompt.sh
source ~/dotfiles/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto

export PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname): $(dirs +0)\a"'

export PS1='\[\033[32m\]\u@\h\[\033[00m\]: \[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]'
export PS1+=$'\n'
export PS1+='\[\e[36;1m\]\t \[\e[0m\]\$ '

# aliases
alias sudo='sudo -E'
alias vi='vim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'
alias be='bundle exec'
alias ctrb='ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .'
alias ctjs='ctags -R --exclude=node_modules --exclude=tmp --exclude=dist'

# cd to a repo listed with ghq using peco
function cdr {
  local dir="$( ghq list -p | peco )"
  if [ ! -z "$dir" ] ; then
    cd "$dir"
  fi
}

# git checkout a branch using peco
function gco {
  local branch="$( git branch | sed s/\*/\ /g | awk '{ print $1 }' | peco)"
  if [ ! -z "$branch" ] ; then
    git checkout "$branch"
  fi
}
