#!/usr/bin/bash

SALT_DIR=/path/to/salt/files

seasalt_start() {
    runit master 0 "-v ${SALT_DIR}:/srv/salt"
    runit minion 1 "--link salt-master-0 -e SALT_ID=host.id1"
    runit minion 2 "--link salt-master-0 -e SALT_ID=host.id1"
    runit minion 3 "--link salt-master-0 -e SALT_ID=host.id3"
}

seasalt_stop() {
    killit master 0
    killit minion 1
    killit minion 2
    killit minion 3
}
