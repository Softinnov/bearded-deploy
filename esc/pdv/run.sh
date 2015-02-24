#!/bin/bash

[ $PLATFORM == "prod" ] && \
	cp /httpd.pdv.cfg /etc/consul-templates/httpd.cfg

[ $PLATFORM == "dev" ] && \
	cp /httpd.pdv.cfg_dev /etc/consul-templates/httpd.cfg

exec /usr/bin/runsvdir /etc/service
