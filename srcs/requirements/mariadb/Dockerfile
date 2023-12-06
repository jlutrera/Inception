FROM debian:buster

RUN apt-get update -y && \
	apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/init_db.sh /tmp/
RUN chmod +x /tmp/init_db.sh
CMD ["/tmp/init_db.sh"]
