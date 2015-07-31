#!/bin/sh

DBTABLES="adresse atelier budget client commande_d commande famille fournisseur generique individu libelle livraison_d livraison_f livraison mvt nutrition panier parametre pdv personne produit_silo produit projet ressources role stats stock tarif utilisateur vente_d vente"

if [ $# -lt 2 ]; then
	echo "Usage: $0 <data path> <db data name> [db tables]"
	exit 1
fi

DBNAME=prod
DBUSER=admin
DBPASS=admin
DBDATAIMPORT=$1
DBDATA=$2
DBCON=preprod.softinnov.fr:5000/db
CONTNAME=db

shift
shift
if [ $# -gt 0 ]; then
	DBTABLES=$*
fi

docker rm -fv $DBDATA $CONTNAME

echo ">> Initializing the volume container <<$DBDATA>>"
docker run -d --name $DBDATA $DBCON echo data-only || exit $?

echo ">> Initializing the mysql container <<$DBCON>> linked to volume <<$DBDATA>>"
docker run -d -v $DBDATAIMPORT:/data --name $CONTNAME --volumes-from $DBDATA -e REPLICATION_MASTER=true -e REPLICATION_PASS=mypass -e MYSQL_USER=$DBUSER -e MYSQL_PASS=$DBPASS $DBCON || exit $?

RET=1
while [[ RET -ne 0 ]]; do
	echo "=> Waiting for confirmation of MySQL service startup"
	sleep 5
	docker exec $CONTNAME mysql -e "status" > /dev/null 2>&1
	RET=$?
done
echo "=> Mysql is working"

echo ">> Creating database <<$DBNAME>> for dev environment"
docker exec $CONTNAME mysql -u"$DBUSER" -p"$DBPASS" -e "CREATE DATABASE $DBNAME" || exit $?

echo ">> Importing tables"

for table in $DBTABLES
do
	gunzip -f $DBDATAIMPORT/$table.txt.gz > /dev/null 2>&1
done

docker exec $CONTNAME bash -c "/import_sql.sh $DBUSER $DBPASS $DBNAME $DBTABLES" || exit $?

for table in $DBTABLES
do
	gzip -f $DBDATAIMPORT/$table.txt > /dev/null 2>&1
done

docker rm -f $CONTNAME

exit 0
