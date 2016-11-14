# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

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

export PROMPT_COMMAND=""

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
alias ctags-r='ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .'


# MacVim
if [ `uname` = "Darwin" ]; then
  if [[ -d /Applications/MacVim.app ]]; then
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  fi
fi

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export RBENV_ROOT="$HOME/.rbenv"
if which rbenv 2>/dev/null >/dev/null; then eval "$(rbenv init -)"; fi

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
export NDENV_ROOT="$HOME/.ndenv"
if which ndenv 2>/dev/null >/dev/null; then eval "$(ndenv init -)"; fi

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv 2>/dev/null >/dev/null; then eval "$(pyenv init -)"; fi

# Suppress brew waring caused by pyenv
alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:?/} brew"

# scalaenv
export PATH="${HOME}/.scalaenv/bin:${PATH}"
export SCALAENV_ROOT="$HOME/.scalaenv"
if which scalaenv 2>/dev/null >/dev/null; then eval "$(scalaenv init -)"; fi

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Nokogiri
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1
