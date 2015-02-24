#!/bin/sh

DBTABLES="adresse atelier budget client commande_d commande famille fournisseur generique individu libelle livraison_d livraison_f livraison mvt nutrition panier parametre pdv personne produit_silo produit projet ressources role stats stock tarif utilisateur vente_d vente"

if [ $# -lt 2 ]; then
	echo "Usage: $0 <db data name> <db container name> [db tables]"
	exit 1
fi

DBNAME=prod
DBUSER=admin
DBPASS=admin
DBDATA=$1
DBCON=$2

shift
shift
if [ $# -gt 0 ]; then
	DBTABLES=$*
fi

DBDATAIMPORT=$(pwd)/../data

echo ">> Building mysql image <<$DBCON>>"
docker build -t $DBCON . || exit $?

echo ">> Initializing the volume container <<$DBDATA>>"
docker rm -v $DBDATA
docker run -d -v /var/lib/mysql --name $DBDATA $DBCON echo data-only || exit $?

echo ">> Initializing the mysql container <<$DBCON>> linked to volume <<$DBDATA>>"
docker run --rm --volumes-from $DBDATA -e MYSQL_USER=$DBUSER -e MYSQL_PASS=$DBPASS $DBCON || exit $?

echo ">> Creating database <<$DBNAME>> for dev environment"
docker run --rm --volumes-from $DBDATA $DBCON bash -c "/create_db.sh $DBNAME" || exit $?

echo ">> Importing tables"

for table in $DBTABLES
do
	gunzip -f $DBDATAIMPORT/$table.txt.gz > /dev/null 2>&1
done

docker run --rm -v $DBDATAIMPORT:/data --volumes-from $DBDATA $DBCON \
       /bin/bash -c "/import_sql.sh $DBUSER $DBPASS $DBNAME $DBTABLES" || exit $?

for table in $DBTABLES
do
	gzip -f $DBDATAIMPORT/$table.txt > /dev/null 2>&1
done

exit 0
