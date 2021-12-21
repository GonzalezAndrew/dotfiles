#
#   .zshrc
#
#   @author Andrew Gonzalez
#
#
export PATH=/opt/homebrew/bin:$PATH
export GOPATH=$HOME/go 
export PATH=$HOME/bin:/usr/local/bin:/home/$USER/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/share
export ZSH="$HOME/.oh-my-zsh"
export GOBIN="$HOME/go/bin"
export GO111MODULE="on"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

# source global settings
if test -r "$HOME/.bash_aliases"; then
    source "$HOME/.bash_aliases"
fi

# Source the functions directory
if test -d ~/.functions; then
    for F in ~/.functions/*; do
        source $F
    done
fi

# source virtualenvwrapper
if test -r "$(which virtualenvwrapper.sh)"; then
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    export VIRTUALENV_PYTHON="$(which python3)"
    source "$(which virtualenvwrapper.sh)"
fi

if [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi

if [ -d ~/.zsh ]; then
    for F in ~/.zsh/*.zsh; do
        source $F
    done
fi

eval "$(bw completion --shell zsh); compdef _bw bw;"
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"