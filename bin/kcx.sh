#!/bin/bash

# ------------------------- utility functions ------------------------

_command_exists() {
    command -v "$@" >/dev/null 2>&1
}

_ls_namespace() {
    kubectl get namespaces
}

# ----------------------------- commands -----------------------------

_help() {
    echo "Usage: kcx.sh [ list-ctx | set-ctx | current-ctx | get-ctx | list-all | help ]..."
}

_get_ctx() {
    kubectl config get-contexts "$1"
}

_current_cxt() {
    kubectl config current-context
}

_list_cxt() {
    kubectl config get-contexts -o name
}

_set_cxt() {
    local current_ctx
    current_ctx=$(_current_cxt)
    if [ "$current_ctx" = "$1" ]; then
        echo "Already using context ${current_ctx}"
    else
        echo "Setting context to $1, previous context was ${current_ctx}"
        kubectl config use-context "$1"
    fi
}

_ls_all_ns_ctx() {
    local old_ctx
    old_ctx=$(_current_cxt)
    _list_cxt | while read -r cxt; do
        _set_cxt "$cxt"
        _ls_namespace
    done

    _set_cxt "$old_ctx"
}

case "$1" in
list-ctx | --list-ctx | -l)
    _list_cxt
    ;;
set-ctx | --set-ctx | -s)
    _set_cxt "$2"
    ;;
get-ctx | --get-ctx | -g)
    _get_ctx "$2"
    ;;
current-ctx | --current-ctx | -c)
    _current_cxt
    ;;
list-all)
    _ls_all_ns_ctx
    ;;
help | --help | -h)
    _help
    exit 0
    ;;
*)
    _help
    exit 1
    ;;
esac
