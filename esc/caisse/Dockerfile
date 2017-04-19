FROM softinnov/cheyenne

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -yqq install curl runit unzip && \
    rm -rf /var/lib/apt/lists/*

ENV CT_URL https://releases.hashicorp.com/consul-template/0.5.1/consul-template_0.5.1_linux_amd64.zip
RUN curl -L $CT_URL -o /ct.zip && unzip /ct.zip -d /usr/local/bin

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
VOLUME /esc-caisse/tickets

CMD ["/run.sh"]
