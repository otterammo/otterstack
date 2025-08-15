# SearXNG

SearXNG is a privacy-respecting metasearch engine. This app runs the official container with Redis for caching.

## What you get

- searxng/searxng:latest + Redis 7 (alpine)
- Config in `conf/settings.yml` (env-aware)
- Shares the `homelab` Docker network

## Quick start

1. Copy `.env.example` to `.env` and set values.
2. Ensure the external Docker network `homelab` exists.
3. Start the stack with Docker Compose.

### Required environment

Defined in `.env`:

- `SEARXNG_SECRET` — 64-char random secret for Flask session/signing.
- `BASE_URL` — Public base URL, e.g. `https://search.example.com/`.
- `INSTANCE_NAME` — Display name (optional).
- `SEARXNG_BASE_URL` — Usually `${BASE_URL}`.
- `SEARXNG_REDIS_URL` — `redis://redis:6379/0`.

### Ports and networking

- No host port is published here; expose via your reverse proxy on the `homelab` network.
- Healthcheck probes `http://searxng:8080/` inside the network.

### Volumes

- `./conf -> /etc/searxng` — contains `settings.yml` and any overrides.

## Configuration notes

- `settings.yml` pulls `secret_key` and `base_url` from the environment.
- Image proxy is enabled, safe search defaults to "moderate" (1), and autocomplete uses DuckDuckGo.
- Redis is used for rate limiting/caching via `valkey.url`.

## Maintenance

- Update images: `docker compose pull && docker compose up -d`.
- Rotate `SEARXNG_SECRET` if leaked; doing so will invalidate sessions.
- Back up the `conf/` directory.

## Resources

- Docs: https://docs.searxng.org/
- GitHub: https://github.com/searxng/searxng
