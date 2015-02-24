#!/bin/bash

DBNAME=prod
DBTABLES="adresse atelier budget client commande_d commande famille fournisseur generique individu libelle livraison_d livraison_f livraison mvt nutrition panier parametre pdv personne produit_silo produit projet ressources role stats stock tarif utilisateur vente_d vente"

MYSQL_USER=admin
MYSQL_PASS=admin

for ARG in $DBTABLES
do
	echo "  -> importing $ARG"
	gunzip /data/"$ARG".txt.gz
	cat /data/"$ARG".sql | mysql -u$MYSQL_USER -p$MYSQL_PASS $DBNAME || exit $?
	mysqlimport --local -u$MYSQL_USER -p$MYSQL_PASS $DBNAME /data/"$ARG".txt || exit $?
	gzip /data/"$ARG".txt  
done
