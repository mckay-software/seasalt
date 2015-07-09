#!/usr/bin/bash

while true; do
    docker logs -f "$1"
done
