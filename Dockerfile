
FROM vidya/mongoport:latest

#RUN            echo 'export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> /etc/environment;

#RUN apt-get -y install --force-yes build-essential libxslt-dev libxml2-dev libpq5 libpq-dev git git-core wget curl g++ texinfo make vim;

#RUN wget http://nodejs.org/dist/v0.10.21/node-v0.10.21.tar.gz;\
 #            tar -xvf node-v0.10.21.tar.gz;\
  #               cd node-v0.10.21;\
   #                  ./configure && make && make install;
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 ;\
 #           echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list ;\
  #              apt-get update -y ;\
   #                  apt-get -y install --force-yes mongodb-10gen ;\
    #                     mkdir -p /data/db/ ;
ADD . /src

RUN cd /src; npm install


EXPOSE 3000

CMD ["/bin/sh","/src/script.sh"]

