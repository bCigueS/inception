# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbeylot <sbeylot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/04 15:37:05 by sbeylot           #+#    #+#              #
#    Updated: 2023/04/04 15:38:38 by sbeylot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache nginx
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]