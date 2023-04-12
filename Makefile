# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbeylot <sbeylot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/05 10:41:29 by sbeylot           #+#    #+#              #
#    Updated: 2023/04/12 11:34:01 by sbeylot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	:=	Inception

all:
	@echo "Launching $(NAME) Project !"
	@bash srcs/requirements/tools/make_dir.sh
	@docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@echo "Building $(NAME) Project !"
	@bash srcs/requirements/tools/make_dir.sh
	@docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@echo "Shutdown $(NAME) Project !"
	@docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down

re: fclean
	@echo "ReBuil $(NAME) Project !"
	@docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@echo "Clean $(NAME) Project !"
	@docker system prune -af
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@echo "FClean $(NAME) Project !"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*



.PHONY: all down build re clean fclean