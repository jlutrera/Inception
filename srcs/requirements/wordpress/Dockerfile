FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y wget php7.3-fpm php7.3-mysql && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 9000

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/autoconfig.sh /var/www
RUN chmod +x /var/www/autoconfig.sh

CMD ["/var/www/autoconfig.sh"]
