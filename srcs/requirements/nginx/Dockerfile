FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-keyout /etc/nginx/ssl/cert.key \
	-out /etc/nginx/ssl/cert.crt \
	-subj "/C=SP/ST=Madrid/L=Madrid/O=42school/OU=Student/CN=jutrera/"

RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/
RUN chown -R www-data:www-data /var/www/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
