#!/bin/bash

####
#  This script runs the new mysql slave server by doing the following steps:
#
#    1. Stops the actual running container
#    2. Removes it
#    3. Removes the docker image
#    4. Loads the tarball image
#    5. Runs the mysql container
#    6. Waits until mysql is launched and change to behave as slave.
####

R="\x1b[31m"
G="\x1b[32m"
B="\x1b[34m"
I="\x1b[35m"
W="\x1b[0m"

USAGE="$R Usage: $0 <ip master> $W"

if [ $# -ne 1 ]; then
	echo -e $*
	echo -e $USAGE
	exit 1
fi

IP=$1

cd /home/bearded-basket

CNT="prod-db-slave"
ARG="docker run -d --volumes-from dbdata -v /root/.ssh:/root/.ssh --name $CNT softinnov/$CNT /run.sh $IP"

echo -e "$B >> stopping and removing $CNT $W"
docker stop $CNT > /dev/null 2>&1
docker rm $CNT > /dev/null 2>&1

echo -e "$B >> removing softinnov/$CNT $W"
docker rmi softinnov/$CNT > /dev/null 2>&1

echo -e "$B >> loading "$CNT".tar $W"
docker load -i "$CNT".tar || exit $?

echo -e "$B >> $ARG $W"
$ARG || exit $?

RET=1
while [[ RET -ne 0 ]]; do
    echo -e "$I => returned ${RET} $W"
    echo -e "$I => Waiting for confirmation of MySQL service startup $W"
    sleep 5
    docker exec $CNT mysql -h127.0.0.1 -e "status" > /dev/null 2>&1
RET=$?
done

# add information to connect to master via ssh vpn
# 127.0.0.1:3307 is forwarded by ssh to master:3306
docker exec $CNT mysql -h127.0.0.1 -e "STOP SLAVE; CHANGE MASTER TO \
	MASTER_HOST='127.0.0.1', \
	MASTER_PORT=3307, \
	MASTER_USER='admin', \
	MASTER_PASSWORD='admin'; START SLAVE;"
