#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	echo "Wordpress: configurando..."

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
	chmod -R 775 /var/www/html/wordpress;
	chown -R www-data:www-data /var/www/html/wordpress;
	cd /var/www/html/wordpress;

	wp core download --allow-root;
	wp config create --allow-root \
				--dbname=$DB_DATABASE \
				--dbhost=$DB_HOST \
				--dbprefix=wp_ \
				--dbuser=$USER \
				--dbpass=$DB_USER_PASSWORD;

	echo "Wordpress: creando usuarios..."
	wp core install --allow-root \
				--url=${DOMAIN_NAME} \
				--title=${WORDPRESS_NAME} \
				--admin_user=${WORDPRESS_ROOT_LOGIN} \
				--admin_password=${WORDPRESS_ROOT_PASSWORD} \
				--admin_email=${WORDPRESS_ROOT_EMAIL};

	wp user create ${WORDPRESS_LOGIN} ${WORDPRESS_USER_EMAIL} --user_pass=${WORDPRESS_PASSWORD} --role=author --allow-root;
	wp option update comment_previously_approved 0 --allow-root;
	wp option update comments_notify 0 --allow-root;
	wp option update moderation_notify 0 --allow-root;

	wp theme install twentytwentyone --activate --allow-root

	echo "Wordpress: ¡configurado!"
else
	echo "Wordpress: ¡ya está configurado!"
fi

echo "Wordpress iniciado en :9000"
/usr/sbin/php-fpm7.4 --nodaemonize
