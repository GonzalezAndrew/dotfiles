#!/bin/bash

_help() {
    echo "Usage: $0 { list | change | sync }"
    echo "  list   | --list   | -ls: list all alacritty themes."
    echo "  change | --change | -c: change all alacritty themes."
    echo "  sync   | --sync   | -s: sync all alacritty themes."
}

_ls_themes() {
    cat ~/.config/alacritty/schemes.yml | grep '[[:blank:]]*&'
}

_change_theme() {
    sed -i "" "/^\([[:space:]]*colors: \).*/s//\1*$1/" ~/.config/alacritty/schemes.yml
}

_sync() {
    curl -L https://raw.githubusercontent.com/eendroroy/alacritty-theme/master/schemes.yaml --output ~/.config/alacritty/schemes.yml
}

case "$1" in
list | --list | -ls )
    _ls_themes
    ;;
change | --change | -c)
    _change_theme "$2"
    ;;
sync | --sync | -s)
    _sync
    ;;
help | --help | -h)
    _help
    ;;
*)
    _help
    ;;
esac