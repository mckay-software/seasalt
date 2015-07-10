#!/usr/bin/bash

while true; do
    clear
    docker logs -f "$1"
    if [[ "$?" -gt 0 ]]; then
        d=$(date)
        echo -en "\033[2J$d\n$1 not available, retrying in xx"
        for (( i = 5; i > 0; i-- )); do
            echo -en "\b\b${i}s"
            sleep 1
        done
    fi
done
