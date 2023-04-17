# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbeylot <sbeylot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/04 17:32:03 by sbeylot           #+#    #+#              #
#    Updated: 2023/04/17 13:02:41 by sbeylot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ARG PHP_VERSION=7.3

RUN apt update && apt upgrade -y && \
	apt install -y php${PHP_VERSION} \
	php-fpm \
	php-mysql \
	mariadb-client \
	wget

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
	cd /var/www && \
	tar -xzf wordpress-6.0-fr_FR.tar.gz && \
	rm wordpress-6.0-fr_FR.tar.gz && \
	chown -R root:root /var/www/wordpress

COPY ./conf/php.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf 
RUN mkdir /run/php


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh auto_config.sh
RUN chmod +x ./auto_config.sh

EXPOSE 9000

ENTRYPOINT [ "bash", "auto_config.sh" ]

