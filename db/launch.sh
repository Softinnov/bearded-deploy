#!/bin/bash

CONF_FILE="/etc/mysql/conf.d/my.cnf"
DBNAME=prod_test
DBTABLES="utilisateur pdv role"

echo "=> Installing MySQL ..."
if [ ! -f /usr/share/mysql/my-default.cnf ] ; then
	cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf
fi
mysql_install_db > /dev/null 2>&1
echo "=> Done!"

/usr/bin/mysqld_safe > /dev/null 2>&1 &
RET=1
while [[ RET -ne 0 ]]; do
	echo "=> Waiting for confirmation of MySQL service startup"
	sleep 5
	mysql -uroot -e "status" > /dev/null 2>&1
	RET=$?
done
echo "=> Mysql is working"

echo "=> Creating admin user ..."
mysql -uroot -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION"

echo "=> Creating database ..."
mysql -uroot -e "CREATE DATABASE $DBNAME"

for ARG in $DBTABLES
do
	echo "  -> importing $ARG"
	cat /data/"$ARG".sql | mysql -u$MYSQL_USER -p$MYSQL_PASS $DBNAME || exit $?
	mysqlimport --local -u$MYSQL_USER -p$MYSQL_PASS $DBNAME /data/"$ARG".txt || exit $?
done

mysqladmin -uroot shutdown
