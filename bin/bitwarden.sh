#!/bin/bash

function bwl() {
    local password="$1"
    local code="$2"
    export BW_SESSION=$(bw login andrewgonzo23@gmail.com "$password" --method 0 --code "$code" --raw)
}

function bwls() {
    bw list items | jq '.[].name'
}

function bwg() {
    bw get item "$1" | jq '.login'
}

function git_token(){
    if [[ "$1" == 'work' ]]; then
        export GIT_TOKEN=$(bw get item GIT_TOKEN_WORK | jq -r '.login.password')
    else
        export GIT_TOKEN=$(bw get item GIT_TOKEN | jq -r '.login.password')
    fi
    green "Setting env var: GIT_TOKEN."
}

function vault_env() {
    export VAULT_ADDR='https://vault.cicd.cloud.fpdev.io'
    export VAULT_TOKEN=$(vault login -method=github token="$GIT_TOKEN" -format=json | jq -r .auth.client_token)
    green "Setting the env var: VAULT_TOKEN"
}


function paper() {
    data=$(bw get item 'Alpaca Paper credentials' | jq '.fields')

    export APCA_API_KEY_ID=$(echo "$data" | jq -r '.[0].value')
    export APCA_API_SECRET_KEY=$(echo "$data" | jq -r '.[1].value')
    export APCA_API_BASE_URL=$(echo "$data" | jq -r '.[2].value')
    echo "Paper account env variables was set."
}
