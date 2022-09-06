#!/bin/bash

# ------------------------- utility functions ------------------------

_command_exists() {
    command -v "$@" &> /dev/null
}



# ----------------------------- commands -----------------------------
_help() {
    echo "Usage: spellcheck.sh [ md ]..."
    echo "  md     | --markdown: spellcheck all markdown files in your current path."
    echo "  help: print this message."
    echo ""
    echo "  Examples:"
    echo "    spellcheck.sh md"
}

_md() {
    spellchecker -f "./**/*.md" -d ~/.config/spellchecker/dictionary.txt
}

if ! _command_exists "spellchecker"; then
    echo "spellchecker is not installed... exiting"
    exit 1
fi

case "$1" in
md | --markdown)
    _md
    ;;
*)
    _help
    exit 1
    ;;
esac
