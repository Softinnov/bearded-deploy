#!/bin/bash

TEST=false
if [ $1 == "--test" ]; then
	TEST=true
	shift
fi

if [[ $# -lt 4 ]]; then
	echo "Usage: $0 [--test] <username> <password> <database> <sql_file1> <...>"
	echo "sql_file: file names without .sql or .txt.gz"
	exit 1
fi

echo "=> Starting MySQL Server"
/usr/bin/mysqld_safe --sql-mode="NO_AUTO_VALUE_ON_ZERO" > /dev/null 2>&1 &
PID=$!

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> returned ${RET}"
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -u"$1" -p"$2" -e "status" > /dev/null 2>&1
RET=$?
done

echo "   Started with PID ${PID}"

DATA="/data/"
echo "=> importing files inside $DATA"
for ARG in ${*:4}
do
	if [ $TEST = true ]; then
		NARG="$ARG"_test

		echo "  -> importing $ARG.sql"
		cat "$DATA""$ARG".sql | mysql -u"$1" -p"$2" "$3"
		echo "  -> importing $ARG.txt"
		mysqlimport --local -u"$1" -p"$2" "$3" "$DATA"/db_tests/"$ARG".txt
	else
		echo "  -> importing $ARG"
		cat "$DATA""$ARG".sql | mysql -u"$1" -p"$2" "$3"
		mysqlimport --local -u"$1" -p"$2" "$3" "$DATA""$ARG".txt
	fi
done

echo "=> Stopping MySQL Server"
mysqladmin -u"$1" -p"$2" shutdown

echo "=> Done!"
