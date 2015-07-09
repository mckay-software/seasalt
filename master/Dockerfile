FROM salt-common
RUN apt-get install -y salt-master
VOLUME /srv/salt
CMD /setup.sh

ADD ./salt /etc/salt
ADD ./setup.sh /
