#!/usr/bin/env bash

_help() {
    echo "Usage: $0 { login | list | help }"
    echo "  login  | --login | -l:  log into aws account using by passing profile name."
    echo "  list   | --list  | -ls: list all aws profiles configured on the local machine."
    echo "  help   | --help  | -h:  output the help definition."
}


_login() {
    echo "Logging into aws account using profile: $1"
    aws sso login --profile "$1" 
    if [ -n "$AWS_PROFILE" ]; then
    fi
    echo "Please validated your credentials by checking for the environment variable 'AWS_PROFILE' to be set."
}

_list() {
    aws configure list-profiles
}

case "$1" in
list | --list | -ls )
    _list
    ;;
login | --login | -l)
    _login "$2"
    ;;
help | --help | -h)
    _help
    ;;
*)
    _help
    ;;
esac
