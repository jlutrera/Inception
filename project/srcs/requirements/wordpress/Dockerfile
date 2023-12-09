FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.4-fpm php7.4-mysql curl sendmail

EXPOSE 9000

COPY ./tools /var/www/
RUN chmod +x /var/www/start.sh
CMD ["/var/www/start.sh"]