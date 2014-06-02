FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs make git-core
ONBUILD ADD . /var/service
ONBUILD RUN (cd /var/service && make deps)

EXPOSE 34000
ENTRYPOINT ["/var/service/server/bin/virgo-update-service"]
