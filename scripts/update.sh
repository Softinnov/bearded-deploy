#!/usr/bin/env bash

####
#  This script runs all the docker containers by doing the following steps:
#
#    1. Stops the actual running container
#    2. Removes it
#    3. Pulls the docker image
#    4. Runs the container
####

R="\x1b[31m"
G="\x1b[32m"
B="\x1b[34m"
W="\x1b[0m"

USAGE="Usage: $0 [-d] [-i CONTAINERS] [-e ESC-FOLDERS] [-c CLIENT_FOLDER] [-t TAG]\n
  -d :\tdeveloper mode (default prod)\n
  -i :\tprecise which containers to run (default all) (eg. \"back client\")\n
  -e :\tesc folders location (adm|caisse|pdv) (developer mode)\n
  -c :\tclient folder (developer mode)\n
  -t :\ttag image"

ESC=""
CLI=""
REGISTRY="preprod.softinnov.fr:5000"
TAG="latest"

while getopts "hdc:e:t:i:" opt; do
	case $opt in
		d)
			DEV=true
			;;
		e)
			ESC=$OPTARG
			;;
		c)
			CLI=$OPTARG
			;;
		t)
			TAG=$OPTARG
			;;
		i)
			NAMES+=" $OPTARG"
			;;
		[?]|h)
			echo -e $USAGE
			exit 1
			;;
	esac
done

# NEED bash >4.x
declare -A CNTS

CNTS["consul"]="docker run -d -p 8400:8400 -p 8500:8500 -p 172.17.42.1:53:53/udp -h consul --name consul progrium/consul -server -bootstrap -advertise 172.17.42.1"

CNTS["registrator"]="docker run -d --link consul:consul -v /var/run/docker.sock:/tmp/docker.sock --name registrator progrium/registrator consul://consul:8500"

if [ ! -z $DEV ]; then
	CNTS["db"]="docker run -d -e SERVICE_6033_NAME=httpdb -e SERVICE_3306_NAME=db --volumes-from dbdata -v $(pwd)/data:/data -P --name db $REGISTRY/db:$TAG"
else
	CNTS["db"]="docker run -d -e SERVICE_6033_NAME=httpdb -e SERVICE_3306_NAME=db --volumes-from dbdata -v $(pwd)/data:/data -p 6033:6033 -p 3306:3306 --name db $REGISTRY/db:$TAG"
fi

if [ ! -z $DEV ]; then
	CNTS["esc-pdv"]="docker run -d -e SERVICE_80_NAME=esc-pdv --link consul:consul -e PLATFORM=dev -v $ESC/esc-pdv/src:/esc-pdv -v $(pwd)/logs/pdv:/var/log -P --name esc-pdv $REGISTRY/esc-pdv:$TAG"
	CNTS["esc-caisse"]="docker run -d -e SERVICE_80_NAME=esc-caisse --link consul:consul -e PLATFORM=dev -v $ESC/esc-caisse/src:/esc-caisse -v $(pwd)/logs/caisse:/var/log -P --name esc-caisse $REGISTRY/esc-caisse:$TAG"
	CNTS["esc-adm"]="docker run -d -e SERVICE_80_NAME=esc-adm --link consul:consul -e PLATFORM=dev -v $ESC/esc-adm/src:/esc-adm -v $(pwd)/logs/adm:/var/log -P --name esc-adm $REGISTRY/esc-adm:$TAG"
else
	CNTS["esc-pdv"]="docker run -d -e SERVICE_80_NAME=esc-pdv --link consul:consul -v $(pwd)/logs/pdv:/var/log -P --name esc-pdv $REGISTRY/esc-pdv:$TAG"
	CNTS["esc-caisse"]="docker run -d -e SERVICE_80_NAME=esc-caisse --link consul:consul -v $(pwd)/logs/caisse:/var/log -P --name esc-caisse $REGISTRY/esc-caisse:$TAG"
	CNTS["esc-adm"]="docker run -d -e SERVICE_80_NAME=esc-adm --link consul:consul -v $(pwd)/logs/adm:/var/log -P --name esc-adm $REGISTRY/esc-adm:$TAG"
fi

CNTS["smtp"]="docker run -d -e SERVICE_NAME=smtp --link consul:consul -P --name back $REGISTRY/smtp:$TAG"

CNTS["back"]="docker run -d -e PLATFORM=prod/dev -e SERVICE_NAME=back --link consul:consul -v $(pwd)/logs:/logs -P --name back $REGISTRY/back:$TAG"

if [ ! -z $DEV ]; then
	CNTS["client"]="docker run -d -e SERVICE_80_NAME=client --link consul:consul -v $CLI:/client -v $(pwd)/logs:/var/log/nginx -v $(pwd)/ssl/:/etc/ssl/private -p 8000:80 --name client $REGISTRY/client:$TAG"
else
	CNTS["client"]="docker run -d -e SERVICE_80_NAME=client --link consul:consul -v $(pwd)/logs:/var/log/nginx -v /etc/ssl/private:/etc/ssl/private -p 80:80 -p 443:443 --name client $REGISTRY/client:$TAG"
fi

[ -z "$NAMES" ] && \
	NAMES="consul registrator db esc-pdv esc-caisse esc-adm back client"

for i in $NAMES; do

	echo -e "$B >> stopping and removing $i $W"
	docker stop $i > /dev/null 2>&1
	docker rm $i > /dev/null 2>&1

	if [ -z $DEV ]; then
		if [ "$i" != "registrator" ] && [ "$i" != "consul" ]; then
			echo -e "$B >> pulling $REGISTRY/$i $W"
			docker pull $REGISTRY/$CNT:$TAG || exit $?
		fi
	fi

	echo -e "$B >> ${CNTS[$i]} $W"
	${CNTS[$i]} || exit $?
done
