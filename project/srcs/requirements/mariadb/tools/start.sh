#!/bin/bash

MYSQL_INIT_FILE="/createdb.sql"

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db >/dev/null 2>&1

if [ ! -d "/var/lib/mysql/$DB_DATABASE" ]; then
	rm -f "$MYSQL_INIT_FILE"
	echo "CREATE DATABASE $DB_DATABASE;" >> "$MYSQL_INIT_FILE"
	echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';" >> "$MYSQL_INIT_FILE"
	echo "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%';" >> "$MYSQL_INIT_FILE"
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';" >> "$MYSQL_INIT_FILE"
	echo "FLUSH PRIVILEGES;" >> "$MYSQL_INIT_FILE"
	echo "Starting MariDB server..."
	mysqld_safe --init-file=$MYSQL_INIT_FILE >/dev/null 2>&1
else
	echo "Starting MariDB server..."
	mysqld_safe >/dev/null 2>&1
fi