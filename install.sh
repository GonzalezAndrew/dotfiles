#!/bin/bash

set -e

cd "$(dirname "${BASH_SOURCE}")"

_help() {
    echo "Usage: $0 { update | brew | all }"
    echo "  update | --update | -u : Update dotfiles."
    echo "  brew | --brew | -b : Install Homebrew and packages."
    echo "  all | --all | -a : Update dotfiles and install Homebrew and packages."
    echo "  help | --help | -h: Show this message."
}

_pre() {
    git pull origin master
}

_install_brew() {
    _pre
    echo "Install brew formulas from Brewfile located in this repository."
    if [ -f ./Brewfile ]; then
        brew bundle
    else
        echo "Brewfile not found."
        exit 1
    fi
}

_dotFiles() {
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        continue
    else
        exit 0
    fi;

    _pre
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

    chmod 700 ~/.ssh
    echo 'done... :-)'
}

case "$1" in
update | --update | -u)
    _dotFiles;
    ;;
brew | --brew | -b)
    _install_brew;
    ;;
all | --all | -a)
    _dotFiles;
    _install_brew;
    ;;
help | --help | -h)
    _help
    ;;
*)
    _help
    ;;
esac
