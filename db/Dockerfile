FROM debian:7.7
MAINTAINER Ghislain Guiot

# From tutum-docker-mysql
# Available at: https://github.com/tutumcloud/tutum-docker-mysql

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -yq install mysql-server pwgen && \
  rm -rf /var/lib/apt/lists/*
RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL configuration
ADD my.master.cnf /etc/mysql/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

ADD update_dbdata.sh /

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

ADD sql-http-proxy /sql-http-proxy

ADD run.sh /run.sh
ADD launch.sh /launch.sh

RUN /launch.sh

# Add VOLUMEs to allow backup of config and databases
VOLUME ["/var/lib/mysql", "/data"]

EXPOSE 3306 6033

CMD ["/run.sh"]
