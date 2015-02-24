#!/bin/bash

####
#  This script installs docker via the script from his website (ubuntu).
#  Then test everything works. Finally install the new database from scratch.
####

G="\x1b[32m"
B="\x1b[34m"
W="\x1b[0m"

echo -e "$B >> installing docker $W"
curl -sSL https://get.docker.com/ubuntu/ | sh || exit $?
echo -e "$G >> done. $W"

echo -e "$B >> test of docker $W"
docker run --rm busybox echo -e "everything works" || exit $?
echo -e "$G >> done. $W"

cd /home/bearded-basket/docker-db

echo -e "$B >> build db-preprod $W"
./build-db-preprod.sh dbdata db-mysql || exit $?
echo -e "$G >> done. $W"
