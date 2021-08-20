#
#   .bashrc
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
export GOBIN="$HOME/go/bin"
export GO111MODULE="on"
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

# ------------------------------------------------------------
# dircolors
# ------------------------------------------------------------
if command -v dircolors &>/dev/null; then
  if test -r ~/.dircolors; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(gdircolors ~/.dircolors)"
  fi
fi

# ------------------------------------------------------------
# Source functions
# ------------------------------------------------------------
if [ -d ~/.functions ]; then
  for F in ~/.functions/*; do
    source $F
  done
fi

# ------------------------------------------------------------
# Aliases
# ------------------------------------------------------------
if test -r "$HOME/.bash_aliases"; then
    source "$HOME/.bash_aliases"
fi

# ------------------------------------------------------------
# Python
# ------------------------------------------------------------
if test -r "/usr/local/bin/virtualenvwrapper.sh"; then
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    export VIRTUALENV_PYTHON="$(which python3)"
    source "$(which virtualenvwrapper.sh)"
fi

# ------------------------------------------------------------
# Completion
# ------------------------------------------------------------
if command -v brew &>/dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    else
        echo "git-prompt.sh not found. Installing git-prompt.sh"
        curl -o ~/.git-prompt.sh \
            https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
        source ~/.git-prompt.sh
fi

# ------------------------------------------------------------
# Prompt
# ------------------------------------------------------------
parse_git_bg() {
  if [[ $(git status -s 2> /dev/null) ]]; then
    echo -e "\033[0;31m"
  else
    echo -e "\033[0;32m"
  fi
}

PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;34m\]@\[\033[0;34m\]\h \w\[$(parse_git_bg)\]$(__git_ps1)\n\[\033[0;32m\]\$\[\033[0m\] '
