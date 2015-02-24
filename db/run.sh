#!/bin/sh

exec mysqld_safe &

/sql-http-proxy > /var/log/mysql/sql-http-proxy.log 2>&1
