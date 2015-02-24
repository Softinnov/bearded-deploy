#!/bin/bash

####
#  This script is used to run a script from a remote PC to the server.
####

R="\x1b[31m"
G="\x1b[32m"
B="\x1b[34m"
W="\x1b[0m"

if [ $# -lt 2 ]; then
	echo -e "$R Usage: $0 <ip> <script.sh> $W"
	exit 1
fi
IP=$1
SCRIPT=$2
shift
shift

rsync --progress -aRz $SCRIPT root@"$IP":/home/bearded-basket/ || exit $?

ssh root@"$IP" /home/bearded-basket/"$SCRIPT" $* || exit $?
