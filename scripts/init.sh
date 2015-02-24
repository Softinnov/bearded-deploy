#!/bin/bash

####
#  This script initialize the server with the ssh keys and installing dependencies such
#  as curl and rsync. Also create the HOME folder.
####

R="\x1b[31m"
G="\x1b[32m"
B="\x1b[34m"
W="\x1b[0m"

if [ $# -ne 2  ]; then
	echo -e "$R Usage: $0 <ip> <ssh_key.pub> $W"
	exit 1
fi

echo -e "$B >> copy of ssh key from $2 at $1 $W"
ssh-copy-id -i $2 root@"$1" || exit $?
echo -e "$G >> done. $W"

echo -e "$B >> directory (/home/bearded-basket) creation $W"
ssh root@"$1" mkdir -p /home/bearded-basket
echo -e "$G >> done. $W"

echo -e "$B >> curl and rsync installation $W"
ssh root@"$1" "apt-get update -y && apt-get install -y curl rsync"
echo -e "$G >> done. $W"
