#!/usr/bin/bash

killit() {
    kind="$1"
    postfix="-$2"

    name="salt-${kind}${postfix}"

    echo .
    echo -n "├─ Killing:  "
    docker kill "$name"

    echo -n "└─ Removing: "
    docker rm "$name"
}

killit master 0
killit minion 1
killit minion 2
killit minion 3
