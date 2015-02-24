FROM softinnov/cheyenne

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update -qq && \
    apt-get -y install curl runit && \
    rm -rf /var/lib/apt/lists/*

ENV CT_URL https://github.com/hashicorp/consul-template/releases/download/v0.5.1/consul-template_0.5.1_linux_amd64.tar.gz
RUN curl -L $CT_URL | tar -C /usr/local/bin --strip-components 1 -zxf -

ADD chey.service /etc/service/chey/run
ADD consul-template.service /etc/service/consul-template/run

RUN mkdir -p /etc/consul-templates

VOLUME /var/log

ENV PLATFORM=prod

EXPOSE 80

ADD httpd.adm.cfg /
ADD httpd.adm.cfg_dev /

ADD run.sh /

ADD esc-adm/src /esc-adm

CMD ["/run.sh"]
