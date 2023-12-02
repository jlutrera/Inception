include srcs/.env

all: up

up:
	@mkdir -p ./volumes/mariadb ./volumes/wordpress
	@docker compose -f srcs/docker-compose.yml up -d --build

down:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans

stop:
	@docker compose -f srcs/docker-compose.yml stop
	
re:	down up

logs:
	@docker compose -f srcs/docker-compose.yml logs -f

clean:
	@docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	@rm -rf ./volumes/mariadb ./volumes/wordpress

fclean: clean
		@rm -rf ./volumes
