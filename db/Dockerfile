FROM debian:7.7
MAINTAINER Ghislain Guiot

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -yq install mysql-server-5.5 pwgen wget && \
  rm -rf /var/lib/apt/lists/*
RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# Get version v0.1 of sql-http-proxy
ENV SHP_URL https://github.com/Softinnov/sql-http-proxy/releases/download/v0.1/sql-http-proxy_linux-x86_64
RUN wget -c -nv --no-check-certificate $SHP_URL && mv sql-http-proxy_linux-x86_64 /usr/local/bin/sql-http-proxy
RUN chmod +x /usr/local/bin/sql-http-proxy

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL configuration
ADD my.cnf /etc/mysql/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

ADD update_dbdata.sh /
ADD run.sh /
ADD launch.sh /

# Add tables for tests
ADD data/role.sql        /data/role.sql
ADD data/role.txt        /data/role.txt

ADD data/utilisateur.sql /data/utilisateur.sql
ADD data/utilisateur.txt /data/utilisateur.txt

ADD data/pdv.sql         /data/pdv.sql
ADD data/pdv.txt         /data/pdv.txt

# Exposed ENV
ENV MYSQL_USER admin
ENV MYSQL_PASS admin

# create database for the tests
RUN /launch.sh

ENV MYSQL_USER=admin \
    MYSQL_PASS=admin \
    ON_CREATE_DB=**False** \
    REPLICATION_MASTER=**False** \
    REPLICATION_SLAVE=**False** \
    REPLICATION_USER=replica \
    REPLICATION_PASS=replica

# Add VOLUMEs to allow backup of config and databases
VOLUME ["/var/lib/mysql", "/data"]

EXPOSE 3306 6033

CMD ["/run.sh"]
