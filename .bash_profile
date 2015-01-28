PS1='\w $ '

# If "Mac OS X"
if [ `uname` = "Darwin" ]; then
    if [[ -d /Applications/MacVim.app ]]; then # If "MacVim" is existed
      export PATH="/Applications/MacVim.app/Contents/MacOS/:$PATH"
      alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    fi
fi

alias rm='rm -i'
alias mv='mv -i'
alias ls='ls -FG'
alias la='ls -a'
alias ll='ls -l'
alias vi='vim'
alias be='bundle exec'

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
