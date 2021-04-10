FROM wordpress:apache

RUN apt-get update && apt-get dist-upgrade -y

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY ports.conf /etc/apache2/ports.conf

EXPOSE 8091
