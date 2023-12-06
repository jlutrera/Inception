FROM debian:buster

RUN apt-get update -y && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-keyout /etc/ssl/nginx.key \
		-out /etc/ssl/nginx.crt \
		-subj "/C=ES/ST=Spain/L=Spain/O=wordpress/CN=jutrera.42.fr"

CMD ["nginx", "-g", "daemon off;"]