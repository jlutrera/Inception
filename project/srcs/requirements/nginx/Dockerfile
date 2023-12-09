FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/start.sh /var/www

RUN chmod +x /var/www/start.sh
CMD ["/var/www/start.sh"]