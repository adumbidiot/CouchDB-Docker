FROM resin/rpi-raspbian

RUN apt-get -y update
RUN apt-get -y install wget apt-utils

RUN cd
RUN wget http://packages.erlang-solutions.com/debian/erlang_solutions.asc
RUN apt-key add erlang_solutions.asc

RUN apt-get -y update
RUN apt-get install -y erlang-nox erlang-dev erlang-reltool
RUN apt-get install -y build-essential
RUN apt-get install -y libmozjs185-1.0 libmozjs185-dev
RUN apt-get install -y libcurl4-openssl-dev libicu-dev

RUN useradd -d /home/couchdb couchdb
RUN mkdir /home/couchdb
RUN chown couchdb:couchdb /home/couchdb

RUN wget http://mirror.symnds.com/software/Apache/couchdb/source/2.0.0/apache-couchdb-2.0.0.tar.gz
RUN tar zxvf apache-couchdb-2.0.0.tar.gz
RUN cd ./apache-couchdb-2.0.0
RUN ls
RUN ./configure
RUN make release
