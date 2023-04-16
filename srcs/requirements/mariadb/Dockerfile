# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbeylot <sbeylot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/04 15:48:04 by sbeylot           #+#    #+#              #
#    Updated: 2023/04/16 17:28:08 by sbeylot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY ./requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./requirements/mariadb/tools/create_db.sh .

EXPOSE 3306
ENTRYPOINT [ "sh", "create_db.sh"]

