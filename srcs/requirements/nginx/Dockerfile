FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY ./tools/nginx_conf.sh /var/www
RUN chmod +x /var/www/nginx_conf.sh

EXPOSE 443

CMD ["/var/www/nginx_conf.sh"]
