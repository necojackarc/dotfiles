PS1='\w $ '

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
eval "$(rbenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# scalaenv
export PATH="${HOME}/.scalaenv/bin:${PATH}"
export SCALAENV_ROOT="$HOME/.scalaenv"
eval "$(scalaenv init -)"

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
export NDENV_ROOT="$HOME/.ndenv"
eval "$(ndenv init -)"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
