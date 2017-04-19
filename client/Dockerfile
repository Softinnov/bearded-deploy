FROM nginx:1.7
MAINTAINER Ghislain Guiot

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -yqq install curl runit unzip

ENV CT_URL https://releases.hashicorp.com/consul-template/0.5.1/consul-template_0.5.1_linux_amd64.zip
RUN curl -L $CT_URL -o /ct.zip && unzip /ct.zip -d /usr/local/bin

ADD nginx.service /etc/service/nginx/run
ADD consul-template.service /etc/service/consul-template/run

# Removes default conf files.
RUN rm /etc/nginx/conf.d/*

ADD nginx.conf /etc/consul-templates/nginx.conf

ADD client /client
ADD index.html /etc/nginx/html/index.html

VOLUME /var/log/nginx
VOLUME /etc/ssl/private

EXPOSE 80 443

CMD ["/usr/bin/runsvdir", "/etc/service"]
