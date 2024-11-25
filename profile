# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Set private environment variables
if [ -f ~/.env ]; then
  . ~/.env
fi

# Put /usr/local/bin and /usr/local/sbin in the PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# mise (https://mise.jdx.dev/)
export PATH="$HOME/.local/share/mise/shims:$PATH"

# Golang
export GOPATH="$HOME/work/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if command -v pyenv >/dev/null 2>&1; then
  # Suppress brew waring caused by pyenv
  alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

  # Force Pipenv to create its own virtual environment for any project (allow nested virtual environments)
  export PIPENV_IGNORE_VIRTUALENVS=1
fi

# Nokogiri
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

# AWS CLI
export PATH=~/.local/bin:$PATH

# Granted (AWS Role Switcher)
alias assume='source $(mise which assume)'

# Suppress bash deprecation warning on MacOS
# ref: https://support.apple.com/en-gb/HT208050
if [ "$(uname)" == "Darwin" ]; then
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# Enable Homebrew only on MacOS
if [ "$(uname)" == "Darwin" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Enable direnv
eval "$(direnv hook bash)"
