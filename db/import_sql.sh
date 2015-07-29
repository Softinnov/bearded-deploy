#!/bin/bash

if [[ $# -lt 4 ]]; then
	echo "Usage: $0 <username> <password> <database> <sql_file1> <...>"
	echo "sql_file: file names without .sql or .txt.gz"
	exit 1
fi

DATA="/data/"
echo "=> importing files inside $DATA"
for ARG in ${*:4}
do
		echo "  -> importing $ARG"
		gunzip "$DATA""$ARG".txt.gz
		mysql -u"$1" -p"$2" "$3" < "$DATA""$ARG".sql
		mysqlimport --local -u"$1" -p"$2" "$3" "$DATA""$ARG".txt
done

echo "=> Done!"
