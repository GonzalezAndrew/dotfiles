#!/usr/bin/env bash

s2al() {
    saml2aws login -a "$1"
}

s2a() {
  saml2aws exec -a "$1" /bin/zsh
}


