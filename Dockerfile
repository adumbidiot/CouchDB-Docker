FROM resin/rpi-raspbian

RUN apt-get -y update
RUN apt-get -y install apt-utils

RUN apt-get -y install couchdb
RUN mkdir /var/run/couchdb
RUN touch /var/run/couchdb/couch.uri
EXPOSE 5984
CMD couchdb -h
