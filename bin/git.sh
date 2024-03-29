#!/bin/bash

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Git upstream branch syncer.
# Usage: gsync master (checks out master, pull upstream, push origin).
function gsync() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a branch."
     return 0
 fi

 BRANCHES=$(git branch --list $1)
 if [ ! "$BRANCHES" ] ; then
    echo "Branch $1 does not exist."
    return 0
 fi

 git checkout "$1" && \
 git pull upstream "$1" && \
 git push origin "$1"
}

function gstatus() {
  python3 -m git_status_checker "$1"
}

function gtag() {
  tag_version="$1"
  tag_message="$2"

  if [[ ! "$1" ]]; then
    tag_version="v.0.0.1"
    echo "Using the default tag version: $tag_version"
  fi

  if [[ ! "$2" ]]; then 
    tag_message="This is a tag."
    echo "Using the default tag message: $tag_message"
  fi

  git tag -a "$tag_version" "$tag_message" && git push origin main --tags
}
