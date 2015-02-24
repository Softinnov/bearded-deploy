#!/bin/bash

[ $PLATFORM == "prod" ] && \
	cp /httpd.adm.cfg /etc/consul-templates/httpd.cfg

[ $PLATFORM == "dev" ] && \
	cp /httpd.adm.cfg_dev /etc/consul-templates/httpd.cfg

exec /usr/bin/runsvdir /etc/service
