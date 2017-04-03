FROM resin/rpi-raspbian

RUN apt-get -y update
RUN apt-get -y install apt-utils

RUN apt-get -y install couchdb
RUN mkdir /var/run/couchdb
EXPOSE 5984
RUN update-rc.d couchdb defaults
RUN dir /usr/local/etc/couchdb
CMD couchdb
