# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbeylot <sbeylot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/04 15:37:05 by sbeylot           #+#    #+#              #
#    Updated: 2023/04/17 12:06:10 by sbeylot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install nginx -y \
	vim \
	curl \
	openssl -y

RUN mkdir -p /etc/nginx/ssl 

RUN openssl req -newkey rsa:4096 -days 42 -x509 -nodes \
	-out /etc/ssl/certs/sbeylot.42.fr.crt \
	-keyout /etc/ssl/private/sbeylot.42.fr.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=sbeylot.42.fr/UID=login"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html
	
CMD [ "nginx", "-g", "daemon off;" ]

