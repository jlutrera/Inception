#!/bin/bash

# Check MySQL service status
if ! service mysql status > /dev/null; then
  service mysql start
fi

sleep 5;
# Create SQL script
cat > db1.sql <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Run SQL script
mysql < db1.sql
kill $(cat /var/run/mysqld/mysqld.pid)
mysqld_safe