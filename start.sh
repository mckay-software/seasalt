#!/usr/bin/bash

runit() {
    kind="$1"
    postfix="-$2"
    opts="$3"

    image="salt-${kind}"
    name="salt-${kind}${postfix}"

    echo -n "├─ [${name}]» Starting: "
    docker run --privileged -d --name "$name" "$opts" "$image"
}

master() {
    cmd="$1"
    name="salt-master-0"

    echo "├─ [${name}]» ${cmd}"
    docker exec -it "$name" "$cmd"
}

minion() {
    minion="$1"
    cmd="$2"

    name="salt-minion-${minion}"

    echo "├─ [${name}]» ${cmd}"
    docker exec -it "$name" "$cmd"
}

source seasalt.sh || (echo "Fatal: No seasalt.sh found!" && exit 1)

./stop.sh

echo .
seasalt_start
echo "└─ Done"
