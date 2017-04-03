FROM resin/rpi-raspbian

RUN apt-get -y update
RUN apt-get -y install apt-utils

RUN apt-get -y install couchdb
RUN mkdir /var/run/couchdb
EXPOSE 5984
RUN echo "#!/bin/bash" >> ./test.sh
RUN echo "couchdb" > ./test.sh
RUN echo "dir /var/run/couchdb" > ./test.sh
CMD sh ./test.sh
