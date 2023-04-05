# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbeylot <sbeylot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/04 17:32:03 by sbeylot           #+#    #+#              #
#    Updated: 2023/04/04 18:55:40 by sbeylot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

ARG PHP_VERSION=8 \
	DB_NAME \
	DB_USER \
	DB_PASS 

RUN apk update && apk upgrade && apk add --no-cache \
	php${PHP_VERSION} \
	php${PHP_VERSION}-fpm \
	php${PHP_VERSION}-mysqli \
	wget

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz
RUN chown -R root:root /var/www/wordpress

COPY requirements/wordpress/conf/php.conf /etc/php8/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY requirements/wordpress/tools/auto_config.sh auto_config.sh 
RUN sh auto_config.sh

ENTRYPOINT [ "/usr/sbin/php-fpm8", "-F" ]



