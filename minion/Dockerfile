FROM salt-common
MAINTAINER McKay Software <opensource@mckaysoftware.co.nz>
RUN apt-get install -y salt-minion
CMD /setup.sh

ADD ./salt /etc/salt
ADD ./setup.sh /
