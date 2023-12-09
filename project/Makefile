all:	up

build:
		@docker-compose -f srcs/docker-compose.yml build

up:
		rm -Rf ./data
		mkdir ./data
		mkdir ./data/mariadb
		mkdir ./data/wordpress
		@docker-compose -f srcs/docker-compose.yml up -d

down:
		@docker-compose -f srcs/docker-compose.yml down

start:
		@docker-compose -f srcs/docker-compose.yml start

stop:
		@docker-compose -f srcs/docker-compose.yml stop

list:
		@docker-compose -f srcs/docker-compose.yml ps

logs :
		@docker-compose -f srcs/docker-compose.yml logs

clean:	
		@docker compose -f srcs/docker-compose.yml down -v
		@docker image prune -a -f
		@rm -rf ./data

.PHONY:	all build up down start stop logs list clean
