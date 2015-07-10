#!/usr/bin/bash

killit() {
    kind="$1"
    postfix="-$2"

    name="salt-${kind}${postfix}"

    echo -n "├─ [${name}]» Killing:  "
    docker kill "$name" 2>/dev/null || echo "n/a"

    echo -n "├─ [${name}]» Removing: "
    docker rm "$name" 2>/dev/null || echo "n/a"
}

source seasalt.sh || (echo "Fatal: No seasalt.sh found!" && exit 1)

echo .
seasalt_stop
echo "└─ Done"
