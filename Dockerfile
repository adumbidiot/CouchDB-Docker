FROM resin/rpi-raspbian

RUN apt-get -y update
RUN apt-get -y install wget apt-utils curl

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
RUN cd ./apache-couchdb-2.0.0 \
./configure --prefix=/usr/local --with-js-lib=/usr/lib --with-js-include=/usr/include/js --enable-init \
make 
RUN cd ./apache-couchdb-2.0.0 \
make install

RUN ln -s /usr/local/etc/init.d/couchdb /etc/init.d/couchdb
RUN cd /etc/init.d \
ls
#RUN service couchdb start
#RUN /etc/init.d/couchdb start
#RUN update-rc.d couchdb defaults
RUN cd /usr/local/etc/couchdb \
ls
EXPOSE 5984
