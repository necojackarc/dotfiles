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

# History
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

shopt -s histappend
shopt -s cmdhist
shopt -s lithist

# Append history after each command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# aliases
alias sudo='sudo -E'
alias vi='vim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'
alias less='less -R'
alias rg='rg -p' # Use pretty format when piping like 'rg -p foo | less -R'
alias fzf='fzf --height 40% --reverse' # Use top-down layout
alias be='bundle exec'
alias ctrb='ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .'
alias ctjs='ctags -R --exclude=node_modules --exclude=tmp --exclude=dist'

# fzf settings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'

# wrap tig to add aliases of subcommands
function tig {
  local subcommand=$1

  case $1 in
    st)
      subcommand="status"
      ;;
  esac
  shift 1

  command tig $subcommand "$@"
}

# cd to a repo listed with ghq using fzf
function cdr {
  local dir="$(ghq list -p | fzf)"
  if [ ! -z "$dir" ] ; then
    cd "$dir"
  fi
}

# git checkout a branch using fzf
function gco {
  local branch="$( git branch | sed s/\*/\ /g | awk '{ print $1 }' | fzf)"
  if [ ! -z "$branch" ] ; then
    git checkout "$branch"
  fi
}

# direnv
eval "$(direnv hook bash)"
