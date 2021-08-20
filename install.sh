#!/bin/sh
set -e

_update() {
    echo "Updating dotfiles at $HOME..."

    shell="bash"
    printf "bash or zsh? (%s): " "${shell}"
    read -r val
    test -n "${val}" && shell="${val}"

    if [ $shell = "bash" ]; then
        echo 'Configuring for bash'
        ln -sf "$PWD/.bashrc" "$HOME/.bashrc"
        ln -sf "$PWD/.profile" "$HOME/.profile"
        ln -sf "$PWD/.profile" "$HOME/.bash_profile"
    else
        echo 'Configuring for zsh'
        ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
        ln -sf "$PWD/.zsh" "$HOME/.zsh"

    fi

    echo 'linking shared dotfiles'
    ln -sf "$PWD/.dircolors" "$HOME/.dircolors"
    ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
    ln -sf "$PWD/.config" "$HOME/.config"
    ln -sf "$PWD/.aws" "$HOME/.aws"
    ln -sf "$PWD/.functions" "$HOME/.functions"
    mkdir -p "$HOME/.local/bin" || true

    echo 'done... :-)'
}

case "$1" in
update)
    _update
    ;;
*)
    echo "Usage: $0 { update }"
    ;;
esac
