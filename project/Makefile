all:
		@sudo rm -rf /home/jutrera/data
		@sudo mkdir /home/jutrera/data
		@sudo mkdir /home/jutrera/data/mariadb
		@sudo mkdir /home/jutrera/data/wordpress
		@docker-compose -f srcs/docker-compose.yml up -d

up:
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
		@sudo rm -rf /home/jutrera/data

.PHONY:	all up down start stop logs list clean
