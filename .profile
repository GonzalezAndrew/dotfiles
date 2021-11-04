#!/bin/bash

# source bashrc
if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# If set and if it exists, add LOCAL GO /bin directory to the path
if [ -d /usr/local/go/bin ]; then
    if [ -d "/usr/local/go/bin" ]; then
        export PATH="/usr/local/go/bin:$PATH"
		export GOPATH=$HOME/go
		export PATH=$GOPATH/bin:$PATH
		export PATH=$PATH:$GOPATH/bin
		export PATH=$PATH:/usr/local/go/bin
		export GOBIN="$HOME/go/bin"
		export GO111MODULE="on"
    fi
fi

# If set and if it exists, use GOPATH and add $GOPATH/bin to the path
if [ -n "$GOPATH" ]; then
    if [ -d "$GOPATH" ]; then
        export PATH="$GOPATH:$PATH"
    fi
fi