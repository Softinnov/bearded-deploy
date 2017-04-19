FROM debian:jessie
MAINTAINER Softinnov
RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -yqq install runit && rm -rf /var/lib/apt/lists/*
ADD bearded-sync.service /etc/service/bearded-sync/run
ADD consul-template.service /etc/service/consul-template/run
ADD bearded-sync.conf /etc/consul-templates/
ADD run.sh /
ADD bearded-sync /
ADD consul-template /
VOLUME /tickets
ENTRYPOINT ["/run.sh"]
