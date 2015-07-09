FROM salt-common
RUN apt-get install -y salt-minion
CMD /setup.sh

ADD ./salt /etc/salt
ADD ./setup.sh /
