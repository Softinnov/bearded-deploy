FROM golang:1.4
MAINTAINER Ghislain Guiot

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -yqq install net-tools curl runit && \
    rm -rf /var/lib/apt/lists/*

ENV CT_URL https://github.com/hashicorp/consul-template/releases/download/v0.5.1/consul-template_0.5.1_linux_amd64.tar.gz
RUN curl -L $CT_URL | tar -C /usr/local/bin --strip-components 1 -zxf -

ADD bearded-basket.service /etc/service/bearded-basket/run
ADD consul-template.service /etc/service/consul-template/run

ADD bearded-basket.json /etc/consul-templates/

###
#  TESTS PART
RUN go get golang.org/x/tools/cmd/cover
RUN go get github.com/tools/godep
#
# SHARE $GOPATH/src for tests
VOLUME /go/src
#
###

EXPOSE 8002

ADD run.sh /

ADD bearded-basket /exe/bearded-basket

ENTRYPOINT ["/run.sh"]
