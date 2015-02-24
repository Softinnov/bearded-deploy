#!/bin/sh

[ $# -eq 0 ] && echo "Usage: $0 PROJECT_FOLDER" && exit 1

cd $1/server || exit $?

go get github.com/tools/godep
GOOS=linux GOARCH=amd64 godep go build -o bearded-basket || exit $?

cd -

mv $1/server/bearded-basket . || exit $?
