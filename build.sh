#!/usr/bin/bash

dockit() {
    docker build -t "salt-$1" "$1"
}

dockit common
dockit master
dockit minion
