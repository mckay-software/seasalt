# Seasalt

_Docker-powered salt testing environment._

![Demo gif]()


## Init

```bash
$ git clone git://github.com/mckay-software/seasalt.git
$ cd seasalt
$ ./build.sh

$ cp seasalt.example.sh seasalt.sh
$ $EDITOR seasalt.sh
```


## seasalt.sh

```bash
#!/usr/bin/bash

SALT_DIR=/path/to/salt/files

seasalt_start() {
    # Start a container with the for the salt master
    runit master 0 "-v ${SALT_DIR}:/srv/salt"

    # Start a minion (or three)
    runit minion 1 "--link salt-master-0 -e SALT_ID=minion.id"
}

seasalt_stop() {
    # Stop everything
    killit master 0
    killit minion 1
}
```


## Usage

Start the environment:

```bash
$ ./start.sh
```

Connect to the master:

```bash
$ docker exec -it salt-master-0 /bin/bash
```

In another window / tmux pane, tail the minion logs:

```bash
$ ./logs salt-minion-1
```

You're good to go!


## Lifecycle

At any point, you can reset the entire setup by just running `./start.sh`. The
logs will wait until your minions are back up. _/!\ All state will be lost /!\_

You can stop/clean the environment using `./stop.sh`.


## Can I...?

This is just a few helpers on top of Docker, so anything you can do with Docker,
you can do with this. A few ideas:

- `docker commit` your changes to minions to save state
- Watch what happens when you kill and restart the salt master
- Kill some of your minions to test failovers
- Spin up minions after the initial `salt '*' state.highstate` to test partials


## Etc

- [MIT License](http://mckay.mit-license.org)
- We are [McKay Software](//github.com/mckay-software)
- Have a good day!
