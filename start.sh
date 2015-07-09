#!/usr/bin/bash

runit() {
    kind="$1"
    postfix="-$2"
    opts="$3"

    image="salt-${kind}"
    name="salt-${kind}${postfix}"

    echo -n "├─ Starting: "
    echo -n "[${name}]» "
    docker run --privileged -d --name "$name" "$opts" "$image"
}

master() {
    cmd="$1"
    name="salt-master-0"

    echo "[master]» ${cmd}"
    docker exec -it "$name" "$cmd"
}

minion() {
    minion="$1"
    cmd="$2"

    name="salt-minion-${minion}"

    echo "[${minion}]» ${cmd}"
    docker exec -it "$name" "$cmd"
}

here=$(pwd)
cd ../salt
salt=$(pwd)
cd "$here"

./stop.sh

echo .
runit master 0 "-v ${salt}:/srv/salt"
runit minion 1 "--link salt-master-0 -e SALT_ID=scadafarm.one"
runit minion 2 "--link salt-master-0 -e SALT_ID=scadafarm.two"
runit minion 3 "--link salt-master-0 -e SALT_ID=scadafarm.three"
echo "└─ Done"

echo
docker ps
