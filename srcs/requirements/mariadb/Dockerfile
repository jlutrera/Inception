FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chown -R root:root /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/create_db.sh /tmp/create_db.sh
RUN chmod +x /tmp/create_db.sh
ENTRYPOINT ["bash", "/tmp/create_db.sh"]
