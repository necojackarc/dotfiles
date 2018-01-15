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

# ghq list to peco
function ghqp {
    local dir="$( ghq list -p | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}

# all directory under current one to peco
function dirp {
    local dir="$( find -type d | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/necojackarc/.ndenv/versions/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/necojackarc/.ndenv/versions/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/necojackarc/.ndenv/versions/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/necojackarc/.ndenv/versions/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash