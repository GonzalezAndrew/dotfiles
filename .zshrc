#
#   .zshrc
#
#   @author Andrew Gonzalez
#
#
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:/home/$USER/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$HOME/.local/share
export PATH=$PATH:~/bin
export ZSH="$HOME/.oh-my-zsh"
export GOPATH=$HOME/go 
export GOBIN="$HOME/go/bin"
export GO111MODULE="on"
export PATH=$PATH:$GOPATH/bin

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

# Source the binary directory
if test -d ~/bin; then
    for F in ~/bin/*; do
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

# source oh-my-zsh
if [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi

# source all .zsh custom scripts
if [ -d ~/.zsh ]; then
    for F in ~/.zsh/*.zsh; do
        source $F
    done
fi
