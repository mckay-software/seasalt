FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:saltstack/salt && apt-get -y update

RUN apt-get install -y git python salt-common
RUN apt-get install -y python-m2crypto python-msgpack python-zmq python-git \
    python-async python-crypto dctrl-tools debconf-utils dmidecode pciutils
