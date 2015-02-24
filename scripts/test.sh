#!/bin/bash

# tests example: ./test.sh godep go test ./...

R="\x1b[31m"
G="\x1b[32m"
B="\x1b[34m"
W="\x1b[0m"

DBCONTEST=db-test
BCONTEST=back-test
REGISTRY=preprod.softinnov.fr:5000
WORKDIR=/go/src/github.com/Softinnov/bearded-basket/server

echo -e "$B >> Removing old container (stop it if running) $W"
docker stop $DBCONTEST 2> /dev/null
docker rm -v $DBCONTEST 2> /dev/null

echo -e "$B >> Running the $BCONTEST container $W"
docker run -d --name $DBCONTEST $REGISTRY/db

echo -e "$B >> Running the $BCONTEST container $W"
docker run --rm -v $GOPATH/src:/go/src -e PLATFORM=test --link $DBCONTEST:$DBCONTEST $REGISTRY/back ${*:1}

echo -e "$B >> Removing old container (stop it if running) $W"
docker stop $DBCONTEST 2> /dev/null
docker rm -v $DBCONTEST 2> /dev/null

echo -e "$G >> Done. $W"
