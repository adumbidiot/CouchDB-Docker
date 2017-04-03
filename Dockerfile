FROM resin/rpi-raspbian

RUN apt-get -y update
RUN apt-get -y install apt-utils

RUN apt-get -y install couchdb
RUN mkdir /var/run/couchdb
EXPOSE 5984
RUN update-rc.d couchdb defaults
RUN sed -i '/bind_address = 127.0.0.1/c\bind_address = 0.0.0.0' /etc/couchdb/default.ini
CMD couchdb
