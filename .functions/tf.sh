#!/usr/bin/env bash

tf() {
  case $1 in
    cdp-dev)
        export PROJECT=tools-dev-us
        export AWS_REGION=us-west-2
        ;;
    cdp-su)
        export PROJECT=tools-staging-us
        export AWS_REGION=us-east-2
        ;;
    cdp-se)
        export PROJECT=tools-staging-eu
        export AWS_REGION=eu-west-1
        ;;
    cdp-pu)
        export PROJECT=tools-production-us
        export AWS_REGION=us-east-2
        ;;
    cdp-pe)
        export PROJECT=tools-production-eu
        export AWS_REGION=eu-west-1
        ;;
    cdp-gw)
        export PROJECT=tools-govcloud-west
        export AWS_REGION=us-gov-west-1
        ;;
    *)
        echo "usage: $0 { cdp-du | cdp-su | cdp-se | cdp-pu | cdp-pe} "
  esac
}
