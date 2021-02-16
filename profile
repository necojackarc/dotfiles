# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Set private environment variables
if [ -f ~/.env ]; then
  . ~/.env
fi

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# Golang
export GOPATH="$HOME/work/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export RBENV_ROOT="$HOME/.rbenv"
eval "$(rbenv init -)"

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
export NDENV_ROOT="$HOME/.nodenv"
eval "$(nodenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# Suppress brew waring caused by pyenv
alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:?/} brew"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"
export TFENV_ROOT="$HOME/.tfenv"

# tgenv
export PATH="$HOME/.tgenv/bin:$PATH"
export TGENV_ROOT="$HOME/.tgenv"

# Nokogiri
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

# AWS CLI
export PATH=~/.local/bin:$PATH

# PostgreSQL
export PGUSER="postgres"
