FROM ubuntu:14.04
MAINTAINER Quang-Nhat Hoang-Xuan <hxquangnhat@gmail.com>

# Install packages
RUN apt-get update && \
  apt-get -y install git apache2 libapache2-mod-php5 php5-mysql pwgen php5-dev php-apc php5-mcrypt php5-imap php5-ldap php5-curl php5-memcached vim wget && \
  echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Configure php5
RUN echo '' | pecl install memcache
RUN echo "extension=memcache.so" > /etc/php5/apache2/conf.d/20-memcache.ini
RUN echo "extension=mcrypt.so" > /etc/php5/apache2/conf.d/20-mcrypt.ini
RUN echo "extension=imap.so" > /etc/php5/apache2/conf.d/20-imap.ini
RUN echo "extension=ldap.so" > /etc/php5/apache2/conf.d/20-ldap.ini

# Confiure php.ini
COPY php.ini /etc/php5/apache2/

# Enable deflate mod
RUN a2enmod deflate

# Download and configure zurmo
RUN wget http://build.zurmo.com/downloads/zurmo-stable-3.1.5.a5a46793e4a5.tar.gz
RUN tar -xvf  zurmo-stable-3.1.5.a5a46793e4a5.tar.gz
RUN mv zurmo /var/www/html
RUN chmod -R 777 /var/www/html/zurmo

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
