include srcs/.env

all: up

up:
	@mkdir -p ./volumes/mariadb ./volumnes/wordpress ./volumes/certs
	@docker compose -f srcs/docker-compose.yml up -d --build

down:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans

re:	down up

logs:
	@docker compose -f srcs/docker-compose.yml logs -f

clean:
	@docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	@rm -rf ./volumes/mariadb ./volumes/wordpress

fclean: clean
		@rm -rf ./volumes
