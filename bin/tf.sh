#!/usr/bin/env bash

tf() {
  case $1 in
    cdp-dev)
        export PROJECT=tools-dev-us
        export AWS_REGION=us-west-2
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-su)
        export PROJECT=tools-staging-us
        export AWS_REGION=us-east-2
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-se)
        export PROJECT=tools-staging-eu
        export AWS_REGION=eu-west-1
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-se5)
        export PROJECT=tools-staging-eu5
        export AWS_REGION=eu-central-1
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-pu)
        export PROJECT=tools-production-us
        export AWS_REGION=us-east-2
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-pu2)
        export PROJECT=tools-production-us2
        export AWS_REGION=us-east-1
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-pe)
        export PROJECT=tools-production-eu
        export AWS_REGION=eu-west-1
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-pe5)
        export PROJECT=tools-production-eu5
        export AWS_REGION=eu-central-1
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-pa2)
        export PROJECT=tools-production-ap2
        export AWS_REGION=ap-northeast-2
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-pme)
        export PROJECT=tools-production-me
        export AWS_REGION=me-south-1
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    cdp-gw)
        export PROJECT=tools-govcloud-west
        export AWS_REGION=us-gov-west-1
        export AWS_DEFAULT_REGION=$AWS_REGION
        green "Setting env vars: PROJECT=$PROJECT, AWS_REGION=$AWS_REGION, AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
        ;;
    *)
        gold "usage: $0 { cdp-du | cdp-su | cdp-se | cdp-se5 | cdp-pu | cdp-pu2 | cdp-pe | cdp-pe5 | cdp-pa2 | cdp-me | cdp-gw } "
  esac
}
