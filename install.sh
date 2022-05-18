#!/bin/bash

# 
#   Inspired by: https://github.com/mathiasbynens/dotfiles/blob/main/bootstrap.sh
#

set -e

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

_install_brew() {
    echo "Install brew from Brewfile."
    if [ -f ./Brewfile ]; then
        brew bundle
    else
        echo "Brewfile not found."
    fi
}

_update() {
    echo "Updating dotfiles at $HOME..."

    shell="bash"
    printf "bash or zsh? (%s): " "${shell}"
    read -r val
    test -n "${val}" && shell="${val}"

    if [ $shell = "bash" ]; then
        echo 'Configuring for bash'
        rsync --exclude ".git/" \
            --exclude ".DS_Store" \
            --exclude "install.sh" \
            --exclude "README.md" \
            --exclude ".zsh/" \
            --exclude "img/" \
            --exclude ".zshrc" \
            -avh --no-perms . ~;
        source ~/.profile;
    else
        echo 'Configuring for zsh'
        rsync --exclude ".git/" \
            --exclude ".DS_Store" \
            --exclude "install.sh" \
            --exclude "README.md" \
            --exclude ".bashrc" \
            --exclude ".bash_aliases" \
            --exclude ".profile" \
            --exclude "img/" \
            -avh --no-perms . ~;
            source ~/.zshrc;
    fi

    echo 'done... :-)'
}

_prompt() {
    if [ "$1" == "--force" -o "$1" == "-f" ]; then
        _update;
    else
        read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
        echo "";
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            _update;
        fi;
    fi;
    unset _update;
}

case "$1" in
update)
    _prompt "$2"
    ;;
brew)
    _install_brew
    ;;
all)
    _prompt "$2"
    _install_brew
    ;;
*)
    echo "Usage: $0 { update }"
    ;;
esac
