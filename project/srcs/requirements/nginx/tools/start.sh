#!bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=ES/ST=Spain/L=Spain/O=wordpress/CN=jutrera.42.fr";
	echo " Set up SSL done!";
fi

nginx -g 'daemon off;';