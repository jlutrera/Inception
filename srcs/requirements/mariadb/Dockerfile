
FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools /var/www/
RUN chmod +x /var/www/start.sh
CMD ["/var/www/start.sh"]