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
alias cp='cp -i'
alias ls='ls -FG'
alias la='ls -a'
alias ll='ls -l'
alias vi='vim'
alias be='bundle exec'

if which pyenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if [[ -s ~/.nvm/nvm.sh ]];
 then source ~/.nvm/nvm.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
