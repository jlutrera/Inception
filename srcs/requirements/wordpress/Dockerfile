FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y wget
RUN apt-get install -y php-fpm php-mysql && \
	rm -rf /var/lib/apt/lists/*

RUN wget https://en.wordpress.org/wordpress-6.0-en_GB.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.0-en_GB.tar.gz && rm wordpress-6.0-en_GB.tar.gz
RUN	chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

EXPOSE 9000

COPY ./tools/autoconfig.sh /tmp/autoconfig.sh
RUN chmod +x /tmp/autoconfig.sh
ENTRYPOINT ["bash", "/tmp/autoconfig.sh"]
