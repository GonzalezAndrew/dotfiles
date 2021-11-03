#
#   .zshrc
#
#   @author Andrew Gonzalez
#
#
export PATH=$HOME/bin:/usr/local/bin:/home/$USER/.local/bin:$PATH
export GOPATH=$HOME/go 
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

# source dircolors
if command -v dircolors &>/dev/null; then
  if test -r ~/.dircolors; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi

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
if test -r "$HOME/.local/bin/virtualenvwrapper.sh"; then
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    export VIRTUALENV_PYTHON="$(which python3)"
    source "$(which virtualenvwrapper.sh)"
fi

# Source oh-my-zsh
if test -f $ZSH/oh-my-zsh.sh; then
    source $ZSH/oh-my-zsh.sh
fi

# set python repl
if test -f ~/.pythonrc.py; then
    export PYTHONSTARTUP=~/.pythonrc.py
fi

# Source zsh extensions
if test -d ~/.zsh; then
    for F in ~/.zsh/*; do
        source $F
    done
fi

# autocomplete for bitwarden cli
eval "$(bw completion --shell zsh); compdef _bw bw;"

# source starship
eval "$(starship init zsh)"
