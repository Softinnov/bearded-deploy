#!/usr/bin/env bash

####
#  This script pulls and then builds all images. It can also push them to the registry.
#    - esc-db
#
#    - esc-pdv
#    - esc-adm      (it makes a git archive to pull the projects)
#    - esc-caisse
#
#    - esc-smtp
#
#    - esc-back         (calls compile.sh to compile the last release of the server)
#
#    - esc-client       (copies the client project here [docker build doesn't support symbolic links])
####
####
#
#  Examples:
#
#    Development of esc-client and esc-pdv WITH pull but NOT push (be sure to get last version from registry and from actual dev):
#      $ ./scripts/build.sh -i "esc-client esc-pdv" -b `pwd`/../bearded-basket
#
#    Development of esc-back WITHOUT pull but WITH push (avoid fetching last version)
#      $ ./scripts/build.sh -l -p -i "esc-back" -b `pwd`/../bearded-basket
#
####

R="\x1b[31m"
G="\x1b[32m"
B="\x1b[34m"
W="\x1b[0m"

USAGE="Usage: $0 [-p] [-l] [-i IMAGES] [-d FOLDER] [-t TAG]\n
  -p :\tpush images (eg. esc-back esc-client)\n
  -l :\tdisable pull from regitry (default false)\n
  -i :\tspecifie which images to build\n
  -b :\tproject directory path (bearded-basket)\n
  -t :\ttag image (e.g 1.2)"

if [ -z "$1" ]; then
	echo -e $USAGE
	exit 1
fi

CNTS=""
DEV=false
PUSH=false
DIR=""
NEED=false
TAG="latest"
REGISTRY="hub.softinnov.com"

build_esc() {
	cd esc || exit $?

	ESC=esc-$1
	echo -e "$B >> Fetching "$ESC"... $W"

	cd $1
	rm -rf $ESC && mkdir $ESC

	git archive --remote=git@bitbucket.org:softinnov/"$ESC".git --format=tar preprod | tar -xf - -C $ESC || exit $?

	echo -e "$B >> Building $ESC image... $W"
	docker build -t $REGISTRY/$ESC:$TAG . || exit $?

	cd ../..

	echo -e "$G >> done. $W"
}

build() {
	case $1 in
		esc-db)
			echo -e "$B >> Building esc-db image... $W"
			cd db || exit $?

			docker build -t $REGISTRY/esc-db:$TAG . || exit $?
			cd ..

			echo -e "$G >> esc-db image done. $W"
			;;
		esc-pdv)
			build_esc pdv
			;;
		esc-adm)
			build_esc adm
			;;
		esc-caisse)
			build_esc caisse
			;;
		esc-back)
			echo -e "$B >> Building esc-back image... $W"
			cd back || exit $?

			./compile.sh $DIR || exit $?
			docker build -t $REGISTRY/esc-back:$TAG . || exit $?
			rm -rf bearded-basket

			cd ..
			echo -e "$G >> esc-back image done. $W"
			;;
		esc-smtp)
			echo -e "$B >> Building esc-smtp image... $W"
			cd smtp || exit $?

			docker build -t $REGISTRY/esc-smtp:$TAG . || exit $?

			cd ..
			echo -e "$G >> esc-smtp image done. $W"
			;;
		esc-client)
			echo -e "$B >> Building esc-client image... $W"
			cd client || exit $?

			RET=0
			cp -a $DIR/client . || exit $?

			docker build -t $REGISTRY/esc-client:$TAG . || RET=$?
			if [ $RET -ne 0 ]; then
				rm -rf client
				exit $RET
			fi
			rm -rf client
			cd ..

			echo -e "$G >> esc-client image done. $W"
			;;
		*)
			echo -e "$R /!\\ image $1 not found! $W"
			;;
	esac
}

push() {
	echo -e "$B >> Pushing $1 image... $W"
	docker push $REGISTRY/$1:$TAG || exit $?
	echo -e "$G >> $1 image done. $W"
}

pull() {
	echo -e "$B >> Pulling $1 image... $W"
	docker pull $REGISTRY/$1:$TAG || exit $?
	echo -e "$G >> $1 image done. $W"
}

while getopts "hlb:i:t:p" opt; do
	case $opt in
		i)
			CNTS+=" $OPTARG"
			;;
		l)
			PULL=true
			;;
		p)
			PUSH=true
			;;
		b)
			DIR="$OPTARG"
			;;
		t)
			TAG="$OPTARG"
			;;
		[?]|h)
			echo -e $USAGE
			exit 1
			;;
		:)
			exit 1
			;;
	esac
done

if [ -z "$CNTS" ]; then
	NEED=true
	CNTS="esc-db esc-pdv esc-adm esc-caisse esc-smtp esc-back esc-client"
fi

# Pull images
if [ -z $PULL ]; then
	for i in $CNTS
	do
		pull $i
	done
fi

# Build images
for i in $CNTS
do
	([ $i == "back" ] || [ $i == "client" ]) && [ -z $DIR ] && \
		echo -e "No project directory found, please provide '-d' flag." && \
		exit 1
	build $i
done

# Push images
if [ $PUSH == true ]; then

	echo -n "Are you sure to push changes (Y/n): "
	read -n1 c
	echo
	case $c in
		y|Y)
			;;
		*)
			exit 1
			;;
	esac

	for i in $CNTS
	do
		push $i
	done
fi
