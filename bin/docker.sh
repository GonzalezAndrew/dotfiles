#!/usr/bin/env bash

# Enter a running Docker container.
function denter() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a container ID or name."
     return 0
 fi

 docker exec -it "$1" /bin/sh -c "[-e /bin/bash ] && /bin/bash || /bin/sh"
 return 0
}

function dclear() {
    echo "Clearing all docker resources..."
    docker system prune -a -f --volumes
}

function dils() {
    docker image ls -a --no-trunc
}

function dcls() {
    docker container ls -a --no-trunc
}

function da() {
    docker start -ai "$1"
}

function workspace() {
    docker run --detach --name workspace -v "$PWD:/tmp" --privileged --env-file <(env | grep GIT_TOKEN) $1
    denter workspace
}

case "$1" in
    clean | rm | clear | -c)
        dclear
        ;;
    list | ls | -ls)
        dils
        dcls
        ;;
    work | workspace | -w )
        workspace $2
        ;;
    *)
        echo "Usage: docker.sh [clean|list|work]"
        ;;
esac
