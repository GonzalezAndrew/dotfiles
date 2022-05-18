#!/usr/bin/env bash

ssol() {
    aws sso login --profile "$1"
    export AWS_PROFILE="$1"
}

ssot() {
    echo "Setting credentials for AWS_PROFILE=$AWS_PROFILE"
    export ACCESS_TOKEN=$(cat ~/.aws/sso/cache/9267db47bda609497aa24677865b725d98e64ea1.json|jq -r .accessToken)
    
    if [[ "$AWS_PROFILE" == "cdp-dev" ]]; then
        export AWS_ACCESS_KEY_ID=$(cat ~/.aws/cli/cache/be*.json |jq -r .Credentials.AccessKeyId)
        export AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/cli/cache/be*.json |jq -r .Credentials.SecretAccessKey)
        export AWS_SESSION_TOKEN=$(cat ~/.aws/cli/cache/be*.json |jq -r .Credentials.SessionToken)
    else
        export AWS_ACCESS_KEY_ID=$(cat ~/.aws/cli/cache/5*.json |jq -r .Credentials.AccessKeyId)
        export AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/cli/cache/5*.json |jq -r .Credentials.SecretAccessKey)
        export AWS_SESSION_TOKEN=$(cat ~/.aws/cli/cache/5*.json |jq -r .Credentials.SessionToken)
    fi
}
