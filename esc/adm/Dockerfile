FROM softinnov/cheyenneconsultemplate

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -yqq install runit && \
    rm -rf /var/lib/apt/lists/*

ADD chey.service /etc/service/chey/run
ADD consul-template.service /etc/service/consul-template/run

RUN mv /cheyenne /chey_adm

RUN mkdir -p /etc/consul-templates

VOLUME /var/log

ENV PLATFORM=prod

EXPOSE 80

ADD httpd.adm.cfg /
ADD httpd.adm.cfg_dev /

ADD run.sh /

ADD esc-adm/src /esc-adm

CMD ["/run.sh"]
