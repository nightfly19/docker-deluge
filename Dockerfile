FROM ubuntu:precise
MAINTAINER sage@sagenite.net

RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-software-properties

RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:deluge-team/ppa && \
  apt-get update && \
  apt-get install -y deluge-web deluged && \
  apt-get clean

ADD assets/config /config

RUN chmod 777 /config

RUN mkdir /torrents && chmod 777 /torrents

ADD assets/start_deluge /usr/local/bin/start_deluge

CMD /usr/local/bin/start_deluge
