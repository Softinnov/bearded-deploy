#!/bin/bash

####
#  This script build the following image:
#
#    - softinnov/prod-db-slave
####

G="\x1b[32m"
B="\x1b[34m"
W="\x1b[0m"

echo -e "$B >> Building db-slave image... $W"
cd db-slave || exit $?
docker build -t softinnov/prod-db-slave . || exit $?
cd ..
echo -e "$G >> db-slave image done. $W"
