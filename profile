# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Set private environment variables
if [ -f ~/.env ]; then
  . ~/.env
fi

# Put /usr/local/bin and /usr/local/sbin in the PATH (e.g. Homebrew is installed in /usr/local/bin)
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

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

# Force Pipenv to create its own virtual environment for any project (allow nested virtual environments)
export PIPENV_IGNORE_VIRTUALENVS=1

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

# Suppress bash deprecation warning on MacOS
# ref: https://support.apple.com/en-gb/HT208050
if [ "$(uname)" == "Darwin" ]; then
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi
