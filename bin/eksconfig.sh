#!/bin/bash

# ------------------------- utility functions ------------------------

_list_profiles() {
    aws configure list-profiles
}

_get_kubeconfig() {
    aws eks update-kubeconfig --name $1 --alias $1 --profile $2
}

# ----------------------------- commands -----------------------------
_help() {
    echo "Usage: eksconfig.sh [ all-clusters | profile-clusters | single-cluster | help ]..."
    echo "  all-clusters     | --all-clusters | -a:         update kubeconfig for all clusters in all AWS profiles from the local machine."
    echo "  profile-clusters | --profile-clusters | -p: update kubeconfig for all clusters in single AWS profiles from the local machine."
    echo "  single-cluster   | --single-cluster | -s:     update kubeconfig for a single clusters in a given AWS profiles from the local machine."
    echo "  help: print this message."
    echo ""
    echo "  Examples:"
    echo "    eksconfig.sh all-clusters"
    echo "    eksconfig.sh -p my-profile-name"

}

_list_eks_clusters() {
    aws eks list-clusters --profile $1 | jq -r '.clusters[]'
}

_all_clusters() {
    _list_profiles | while read -r profile; do 
        _list_eks_clusters $profile | while read -r cluster; do
            _get_kubeconfig $cluster $profile
        done
    done
}

_single_profile_clusters() {
    _list_eks_clusters $1 | while read -r cluster; do
        _get_kubeconfig $cluster $1
    done
    
}

case "$1" in
all-clusters | --all-clusters | -a)
    _all_clusters
    ;;
profile-clusters | --profile-clusters | -p)
    _single_profile_clusters $2
    ;;
single-cluster | --single-cluster | -s)
    _get_kubeconfig $2 $3
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
