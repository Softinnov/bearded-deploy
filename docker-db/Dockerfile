FROM debian:7.7
MAINTAINER Brahim Hamdouni

# Exposed ENV
ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**
ENV DEBIAN_FRONTEND noninteractive

# Install packages and remove pre-installed database
RUN apt-get update && \
  apt-get -yq install mysql-server pwgen && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/lib/mysql/*
RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# Add MySQL configuration
ADD cnf /etc/mysql/conf.d

# Add MySQL scripts
ADD sh /
RUN chmod 755 /*.sh

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/var/lib/mysql"]

EXPOSE 3306
CMD ["/run.sh"]
