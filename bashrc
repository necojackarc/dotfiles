export TERM=xterm-256color


# Locale settings
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


# Configure the title of the terminal
export PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname): $(dirs +0)\a"'


# Configure the first prompt message PS1
source ~/dotfiles/git-prompt.sh
source ~/dotfiles/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto

# To display the danger message in the prompt, set `export IS_DANGER=true` in a .envrc file.
function _danger_message {
  if [ ${IS_DANGER} ]; then
    echo '***DANGER***'
  else
    echo ''
  fi
}

function _whitespace_after_danger_message {
  if [ ${IS_DANGER} ]; then
    echo ' '
  else
    echo ''
  fi
}

export PS1='\[\033[32m\]\u@\h\[\033[00m\]: \[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]'
export PS1+=$'\n'
export PS1+='\[\e[30m\e[101m\]$(_danger_message)\[\e[0m\]$(_whitespace_after_danger_message)'
export PS1+='\[\e[36;1m\]\t \[\e[0m\]\$ '


# History settings
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups

function _share_history_between_terminals {
  history -a # Append the previous command to .bash_history
  history -c # Clear the history in memory
  history -r # Load the history from .bash_history
}

shopt -u histappend # Disable histappend as history -a does this job

# Save multi-line commands nicely
# ref: https://unix.stackexchange.com/questions/109032/how-to-get-a-history-entry-to-properly-display-on-multiple-lines
shopt -s cmdhist
shopt -s lithist

export PROMPT_COMMAND="_share_history_between_terminals; $PROMPT_COMMAND"


# fzf settings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'


# PostgreSQL default settings
export PGHOST="localhost"
export PGDATABASE="postgres"
export PGUSER="postgres"


# aliases
alias sudo='sudo -E'
alias vi='vim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -FG'
alias la='ls -a'
alias ll='ls -l'
alias less='less -R'
alias rg='rg -p' # Use pretty format when piping like 'rg -p foo | less -R'
alias fzf='fzf --height 40% --reverse' # Use top-down layout
alias be='bundle exec'
alias ctrb='ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .'
alias ctjs='ctags -R --exclude=node_modules --exclude=tmp --exclude=dist'
alias tmux='direnv exec / tmux' # Make sure direnv is loaded when tmux starts
# Use AWS CLI Docker image (https://github.com/necojackarc/aws-cli-with-plugins)
alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v "$(pwd)":/aws necojackarc/aws-cli-with-plugins'

#ref: https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
if command -v powershell.exe &> /dev/null; then
  alias open='powershell.exe /c start'
elif command -v xdg-open &> /dev/null; then
  alias open='xdg-open'
fi


# find files by pattern for file paths and names
function rgf {
  local pattern=$1
  shift 1
  command rg --files -g *$pattern* "$@"
}

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

# Enable direnv
eval "$(direnv hook bash)"
