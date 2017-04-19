#!/bin/sh
[ $# -eq 0 ] && echo "Usage: $0 PROJECT_FOLDER" && exit 1
cd $1 || exit $?
##### compile bearded-sync et le recopie ici
CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -a -installsuffix cgo -o bearded-sync || exit $?
cd -
mv $1/bearded-sync . || exit $?
##### recupere consul-template et le recopie ici
CT_URL="https://releases.hashicorp.com/consul-template/0.5.1/consul-template_0.5.1_linux_amd64.zip"
curl -s -L $CT_URL -o ct.zip && unzip -qo ct.zip && rm ct.zip
##### build l'image
docker build -t esc-sync .


