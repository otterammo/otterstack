.PHONY: newtork up down logs restart status health

network:
	docker network create homelab

up:
	docker compose -f docker-compose.yml up -d

down:
	docker compose -f docker-compose.yml down

logs:
	docker compose -f docker-compose.yml logs -f

restart:
	docker compose -f docker-compose.yml restart

status:
	docker compose -f docker-compose.yml ps

health:
	docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"
