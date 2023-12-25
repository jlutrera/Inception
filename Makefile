# COLOURS #
GREEN = \033[0;32m
RESET = \033[0m

# VARIABLES #
DC_PATH = ./srcs/docker-compose.yml
WP_VOLUME = /home/jutrera-/data/wordpress
DB_VOLUME = /home/jutrera-/data/mariadb
DATA_PATH = /home/jutrera-/data

# RULES #

all: build

$(WP_VOLUME):
	@sudo mkdir -p $(WP_VOLUME)
$(DB_VOLUME):
	@sudo mkdir -p $(DB_VOLUME)

build: $(WP_VOLUME) $(DB_VOLUME)
	@echo "$(GREEN)<+> BUILDING CONTAINERS <+> $(RESET)"
	@sudo docker-compose -f $(DC_PATH) up -d --build

up:
	@echo "$(GREEN)<+> STARTING CONTAINERS <+> $(RESET)"
	@sudo docker-compose -f $(DC_PATH) up -d

stop:
	@echo "$(GREEN)<+> STOPPING CONTAINERS <+> $(RESET)"
	@sudo docker-compose -f $(DC_PATH) stop

down:	stop
	@echo "$(GREEN)<+> DELETING BUILD <+> $(RESET)"
	@sudo docker-compose -f $(DC_PATH) down -v
		
list:
	@echo "$(GREEN)<+> LISTING CONTAINERS <+> $(RESET)"
	@sudo docker-compose -f $(DC_PATH) ps

logs :
	@echo "$(GREEN)<+> SHOWING LOGS <+> $(RESET)"
	@sudo docker-compose -f $(DC_PATH) logs -f

clean_data:
	@echo "$(GREEN)<+> DELETING DATA <+> $(RESET)"
	@sudo rm -rf $(DATA_PATH)

clean:	down clean_data
	@echo "$(GREEN)<+> DELETING IMAGES <+> $(RESET)"
	@sudo docker system prune -a -f

re:	clean all
.PHONY:	all build up stop down list logs clean_data clean re
