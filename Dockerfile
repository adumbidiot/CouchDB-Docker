FROM resin/rpi-raspbian

RUN apt-get -y update
RUN apt-get -y install apt-utils

RUN apt-get -y install couchdb
RUN couchdb
EXPOSE 5984
