FROM debian:buster

RUN apt-get update && \
	apt-get install -y curl php7.3 php7.3-fpm php7.3-mysql php7.3-common mariadb-client sendmail && \
	rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/ && \
	mkdir -p /var/www/wordpress/ && \
    chown -R www-data:www-data /var/www/wordpress/ && \
	chmod -R 755 /var/www/wordpress/

WORKDIR /var/www/wordpress/

EXPOSE 9000

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/init_wp.sh /tmp/
RUN chmod +x /tmp/init_wp.sh
CMD ["/tmp/init_wp.sh"]
