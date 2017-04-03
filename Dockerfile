FROM resin/rpi-raspbian

RUN apt-get -y update
RUN apt-get -y install apt-utils

RUN apt-get -y install couchdb
RUN mkdir /var/run/couchdb
EXPOSE 5984
RUN update-rc.d couchdb defaults
RUN cat /etc/couchdb/default.ini
RUN cat /etc/couchdb/local.ini
CMD couchdb
