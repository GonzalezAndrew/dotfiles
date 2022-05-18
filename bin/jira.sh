#!/bin/bash

function get_issues() {
    local default="Andrew.Gonzalez"
    local username=${1:-$default}
    curl -s \
        -u $JIRA_USERNAME:$JIRA_API_TOKEN \
        -X GET \
        -H "Content-Type: application/json" \
        "https://jira.cloud.fpdev.io/rest/api/2/search?jql=assignee=$username+and+status!=Closed&fields=key,status,summary" | jq '.issues | [. | map(.) | .[] | {key: .key, summary: .fields.summary, status: .fields.status.name } ]'
}

function jira() {
    case $1 in
        issues)
            get_issues "$2"
            ;;
        *)
            echo "usage: $0 { issues | NA | NA } "
            ;;
    esac
}