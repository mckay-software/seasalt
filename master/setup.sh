#!/bin/bash

if [[ -z "$SALT_OPTS" ]]; then
    SALT_OPTS="--log-level=info"
fi

salt-master "$SALT_OPTS"
