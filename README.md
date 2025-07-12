# Homelab

A simple, modular homelab repository to run media, download, and networking services together.

## Repository Layout

```
homelab/
├── apps/               # Individual application stacks
│   ├── jellyfin/
│   ├── plex/
│   ├── servarr/
│   │   ├── sonarr/
│   │   ├── radarr/
│   │   ├── prowlarr/
│   │   └── bazarr/
│   ├── qbittorrent/
│   └── jackett/
├── core/               # Core infrastructure services
│   ├── cloudflared/
│   └── wireguard/
└── README.md           # This overview
```

## Applications

- **Jellyfin**: Self-hosted media server for movies, TV, music.
- **Plex**: Alternative media server with native app support.
- **Sonarr**: TV series download automation.
- **Radarr**: Movie download automation.
- **Prowlarr**: Indexer manager for Sonarr/Radarr.
- **Bazarr**: Subtitle management for media.
- **qBittorrent**: Torrent client for automated downloads.
- **Jackett**: Torznab indexer proxy.

Each app lives in its own folder under `apps/` with its own `docker-compose.yml` and `.env`. See `apps/<app>/README.md` for details.

## Core Services

- **Cloudflared**: Cloudflare Tunnel to expose services securely.
- **WireGuard**: VPN server for secure access to the homelab network.

Core folders under `core/` contain their own compose files and configuration.

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

1. Create a new folder under `apps/` with a `docker-compose.yml` and `.env`.
2. Connect it to the `homelab` network.
3. Add a proxy route (Cloudflared or Nginx) pointing to the service port.
4. Document the details in `apps/<new-app>/README.md`.

