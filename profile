# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Set private environment variables
if [ -f ~/.env ]; then
  . ~/.env
fi

# Gvim
if type gvim >/dev/null 2>&1; then
  alias vim='gvim -v'
fi

# MacVim
if [ `uname` = "Darwin" ]; then
  if [[ -d /Applications/MacVim.app ]]; then
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  fi
fi

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# Golang
export GOPATH="$HOME/work/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

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

# Nokogiri
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

# AWS CLI
export PATH=~/.local/bin:$PATH
