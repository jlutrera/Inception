#!/bin/bash

#Check if the database exists
if [ -d "/var/lib/mysql/'${SQL_NAME}'" ]; then
	echo "Database already exists"
else
	service mysql start
	# Wait for mysql to start
	sleep 5
	mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_NAME};"
	mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_USERPWD}';"
	mysql -e "GRANT ALL PRIVILEGES ON ${SQL_NAME}.*  TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_USERPWD}';"
	mysql -e "ALTER USER '${SQL_ROOT}'@'localhost' IDENTIFIED BY '${SQL_ROOTPWD}';"
	mysql -e "FLUSH PRIVILEGES;"
	mysqladmin -u $SQL_ROOT -p$SQL_ROOTPWD shutdown
fi
exec mysqld_safe