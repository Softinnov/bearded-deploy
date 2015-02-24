FROM softinnov/prod-db
MAINTAINER Ghislain Guiot

RUN apt-get update && apt-get install -y openssh-client

ADD run.sh /

# Add MySQL configuration
ADD my.slave.cnf /etc/mysql/conf.d/my.cnf

CMD ["/run.sh"]
