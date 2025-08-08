# This section sets the path to the Docker Compose file.
# - By default, COMPOSE_FILE is set to 'docker-compose.yml' unless overridden.
# - If the COMPOSE variable is not set, COMPOSE_PATH uses the default COMPOSE_FILE.
# - If COMPOSE is set, COMPOSE_PATH points to 'compose/<COMPOSE>.yml'.
COMPOSE_FILE ?= docker-compose.yml
ifeq ($(COMPOSE),)
  COMPOSE_PATH := $(COMPOSE_FILE)
else
  COMPOSE_PATH := compose/$(COMPOSE).yml
endif

# Automatically merge root .env and child .env for all docker compose commands
ENV_FILES := --env-file .env $(if $(wildcard .env),--env-file .env,)

.PHONY: network up down logs restart status health ports

network:
	docker network create homelab

up:
	docker compose $(ENV_FILES) -p homelab -f $(COMPOSE_PATH) up -d

down:
	docker compose $(ENV_FILES) -p homelab -f $(COMPOSE_PATH) down

logs:
	docker compose $(ENV_FILES) -p homelab -f $(COMPOSE_PATH) logs -f

restart:
	docker compose $(ENV_FILES) -p homelab -f $(COMPOSE_PATH) restart

status:
	docker compose $(ENV_FILES) -p homelab -f $(COMPOSE_PATH) ps

health:
	docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"

ports:
	docker ps --format "table {{.Image}}\t{{.Ports}}"
