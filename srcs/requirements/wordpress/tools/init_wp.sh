#!/bin/bash

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp core download --allow-root;
	
	echo "Wordpress: configurando..."
	wp config create --allow-root \
		--dbname="mysql" \
		--dbhost="localhost" \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );
PHP

	echo "Wordpress: creando usuarios..."
	wp core install --allow-root \
		--url=$SITE_URL \
		--title=${SITE_TITLE} \
		--admin_user=${ROOT_LOGIN} \
		--admin_password=${ROOT_PASSWORD} \
		--admin_email=${ROOT_EMAIL};
	wp user create --role=author --allow-root ${USER_LOGIN} ${USER_EMAIL} --user_pass=${USER_PASSWORD} ;
	wp theme install inspiro --activate --allow-root

	echo "Wordpress: ¡configurado!"
else
	echo "Wordpress: ¡ya está configurado!"
fi

echo "Wordpress iniciado en :9000"
/usr/sbin/php-fpm7.3 -F -R