FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/create_db.sh /var/www/
RUN chmod +x /tmp/create_db.sh
CMD ["/var/www/create_db.sh"]
