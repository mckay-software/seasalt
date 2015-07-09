#!/bin/bash

if [[ -z "$SALT_OPTS" ]]; then
    SALT_OPTS="--log-level=info"
fi

echo "id: $SALT_ID" >> /etc/salt/minion
salt-minion "$SALT_OPTS"
