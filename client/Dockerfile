
FROM nginx:1.7
MAINTAINER Ghislain Guiot

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update && \
    apt-get -y install curl runit

ENV CT_URL https://github.com/hashicorp/consul-template/releases/download/v0.5.1/consul-template_0.5.1_linux_amd64.tar.gz
RUN curl -L $CT_URL | tar -C /usr/local/bin --strip-components 1 -zxf -

ADD nginx.service /etc/service/nginx/run
ADD consul-template.service /etc/service/consul-template/run

ADD nginx.conf /etc/consul-templates/nginx.conf

ADD client /client
ADD index.html /etc/nginx/html/index.html

VOLUME /var/log/nginx
VOLUME /etc/ssl/private

EXPOSE 80 443

CMD ["/usr/bin/runsvdir", "/etc/service"]
