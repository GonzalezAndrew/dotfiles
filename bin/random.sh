#!/bin/bash

function speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}

function ansible_facts() {
    if command -v ansible &>/dev/null; then
        if [[ ! "$1" ]]; then
            echo "No hostname was specified, using localhost"
            ansible -m setup localhost
        fi 
        ansible -m setup "$1"
    fi
}