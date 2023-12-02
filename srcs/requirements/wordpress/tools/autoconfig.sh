#!/bin/bash


mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/wordpress/wp-config.php ]; then
echo "Wordpress: configurando..."

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;

chmod +x wp-cli.phar;

mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/wordpress;

wp core download --allow-root;

chmod -R 775 /var/www/wordpress;
chown -R www-data /var/www/wordpress;
chown -R www-data:www-data /var/www/wordpress;
chmod -R 755 /var/www/wordpress;


wp config create --allow-root --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbprefix=wp_ --dbuser=$USER --dbpass=$DB_USER_PASSWORD

echo "Wordpress: creando usuarios..."

wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${WORDPRESS_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL};

wp user create ${WORDPRESS_LOGIN} ${WORDPRESS_USER_EMAIL} --user_pass=${WORDPRESS_PASSWORD} --role=author --allow-root;

wp theme install inspiro --activate --allow-root

wp option update comment_moderation 0 --allow-root
wp option update comment_whitelist 1 --allow-root
wp option update comment_registration 1 --allow-root

echo "Wordpress: ¡configurado!"
else
echo "Wordpress: ¡ya está configurado!"
fi

echo "Wordpress iniciado en :9000"
/usr/sbin/php-fpm7.3 --nodaemonize --allow-to-run-as-root