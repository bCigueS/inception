#!/bin/sh

wp core install --url=$DOMAIN_NAME \
	--title=$SITE_TITLE \
	--admin_user=$ADMIN_USER \
	--admin_password=$ADMIN_PASSWORD \
	--admin_email=$ADMIN_EMAIL \
	--path='/var/www/'
wp user create \
	--allow-root \
	--role=author $USER1_LOGIN $USER1_MAIL \
	--user_pass=$USER1_PASS \
	--path='/var/www/' 

/usr/sbin/php-fpm8 -F