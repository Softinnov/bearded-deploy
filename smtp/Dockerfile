FROM debian:7.7

RUN echo Europe/Paris > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -yqq install postfix net-tools

RUN echo "postfix postfix/mailname string gmail.com" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

ADD run-smtp.sh /run-smtp.sh

EXPOSE 25

CMD /run-smtp.sh
