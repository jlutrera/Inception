#!/bin/bash

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
	sed -i "s/database_name_here/$SQL_NAME/g" /var/www/wordpress/wp-config.php
	sed -i "s/username_here/$SQL_USER/g" /var/www/wordpress/wp-config.php
	sed -i "s/password_here/$SQL_USERPWD/g" /var/www/wordpress/wp-config.php
	sed -i "s/localhost/mariadb:3306/g" /var/www/wordpress/wp-config.php
fi

/usr/sbin/php-fpm7.3 -F