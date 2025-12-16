export TERM=xterm-256color

# TTY for GPG - https://stackoverflow.com/questions/57619460/trying-to-sign-commits-on-git-using-gpg-on-wsl-but-does-not-work
export GPG_TTY=$(tty)

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


# Enable mise (https://mise.jdx.dev/)
eval "$($HOME/.local/bin/mise activate bash)"


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

# ref: https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
if command -v powershell.exe &> /dev/null; then
  alias open='powershell.exe /c start'
elif command -v xdg-open &> /dev/null; then
  alias open='xdg-open'
fi

# VS Code
if [ "$(uname)" == "Darwin" ]; then
  alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
fi


# find files by pattern for file paths and names
function rgf {
  local pattern=$1
  shift 1
  command rg --files -g *$pattern* "$@"
}

# wrap git to add aliases of subcommands
function git {
  if [[ "$1" == "add" && "$2" == "." && $# -eq 2 ]]; then
    command git add -p
  else
    command git "$@"
  fi
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
  local branch="$(git branch --format='%(refname:short)' | awk '{ print $1 }' | fzf)"

  if [ ! -z "$branch" ] ; then
    git checkout "$branch"
  fi
}

# git branch -D a branch using fzf
function gbd {
  local current_branch
  current_branch="$(git symbolic-ref --short HEAD)"
  local -a protected_branches=("main" "master" "$current_branch")

  # Build a regex pattern for protected branches
  local protected_pattern="$(IFS='|'; echo "${protected_branches[*]}")"

  # Show only deletable branches via fzf
  local branch
  branch="$(git branch --format='%(refname:short)' \
    | grep -vE "^(${protected_pattern})$" \
    | fzf)"

  if [ -z "$branch" ]; then
    return
  fi

  for protected in "${protected_branches[@]}"; do
    if [[ "$branch" == "$protected" ]]; then
      echo "Error: '$branch' is a protected branch and cannot be deleted." >&2
      return 1
    fi
  done

  git branch -D "$branch"
}

# git checkout a PR branch using fzf
function prco {
  local pr=`gh pr list | fzf --preview 'gh pr view {1}'`

  if [ ! -z "$pr" ] ; then
    gh pr checkout `echo "$pr" | cut -f1`
  fi
}
