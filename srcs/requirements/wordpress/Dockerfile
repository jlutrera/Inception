FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	php-fpm \
	php-mysql && \
	rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/sbin/php-fpm8 /usr/sbin/php-fpm

COPY conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/usr/local/bin/docker-entrypoint.sh"]

CMD ["php-fpm", "-F"]
