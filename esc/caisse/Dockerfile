FROM softinnov/cheyenneconsultemplate

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -yqq install runit && \
    rm -rf /var/lib/apt/lists/*

ADD chey.service /etc/service/chey/run
ADD consul-template.service /etc/service/consul-template/run

RUN mv /cheyenne /chey_caisse

RUN mkdir -p /etc/consul-templates

VOLUME /var/log

ENV PLATFORM=prod

EXPOSE 80

ADD httpd.caisse.cfg /
ADD httpd.caisse.cfg_dev /

ADD run.sh /

ADD esc-caisse/src /esc-caisse

CMD ["/run.sh"]
