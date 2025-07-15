# Homelab

A simple, modular homelab repository to run media, download, and networking services together.

## Repository Layout

```
homelab/
├── apps/    # Application services (e.g., media servers, downloaders)
├── core/    # Core infrastructure (e.g., VPN, proxy)
└── README.md
```

### Applications

Applications (in `apps/`) include media servers, automation tools, and download clients. Each app is self-contained with its own `docker-compose.yml`, `.env`, and optional `README.md`.

### Core Services

Core services (in `core/`) include networking, VPN, monitoring, proxying, and other infrastructure components. Each service has its own compose and configuration files.

## Getting Started

1. **Prerequisites**
   - Docker & Docker Compose installed on the host
   - Membership of the Docker group (or use `sudo`)

2. **Bring up all services**
   At the repo root:
   ```bash
   docker compose up -d
   ```

3. **Stopping services**
   ```bash
   docker compose down
   ```

4. **Logs & Healthchecks**
   - View logs: `docker compose logs -f`
   - Check status: `docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"`

## Adding New Apps or Subdomains

To add a new service:

1. Create a folder under `apps/` or `core/`.
2. Add a `docker-compose.yml` and `.env` (if needed).
3. Connect the service to the `homelab` Docker network.
4. Configure proxy access (e.g., Cloudflared).
5. Document in the service’s own `README.md`.
