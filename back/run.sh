#!/bin/bash


plat() {
	SERVER="$GOPATH/src/github.com/Softinnov/bearded-basket/server"

	[ "$PLATFORM" = test ] && \
		cd $SERVER         && \
		exec ${*:1}        && \
		exit $?

	[ -z "$PLATFORM" ] && \
		exec ${*:1}    && \
		exit $?
}

plat $@

exec /usr/bin/runsvdir /etc/service
