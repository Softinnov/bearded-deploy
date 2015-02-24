#!/bin/sh

INIT=false
USAGE="Usage: $0 <master ip>"
IP=$1

if [ $# -ne 1 ]; then
	echo $USAGE
	exit 1
fi

# create a ssh vpn with master between 3307 local port to remote 3306
ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -fNgL 3307:127.0.0.1:3306 root@$IP

exec mysqld_safe
