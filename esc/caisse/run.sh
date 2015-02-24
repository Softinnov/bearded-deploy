#!/bin/bash

[ $PLATFORM == "prod" ] && \
	cp /httpd.caisse.cfg /etc/consul-templates/httpd.cfg

[ $PLATFORM == "dev" ] && \
	cp /httpd.caisse.cfg_dev /etc/consul-templates/httpd.cfg

exec /usr/bin/runsvdir /etc/service
