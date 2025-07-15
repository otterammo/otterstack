# qBittorrent

qBittorrent is a cross-platform free and open-source BitTorrent client.

## Features

- Modern, easy-to-use UI
- Integrated search engine
- Bandwidth scheduling and queueing
- RSS feed support

## Setup

This container is configured using the [linuxserver/qbittorrent](https://hub.docker.com/r/linuxserver/qbittorrent) image.

### Default Web UI

- Default port (internal): `8080`
- Username: `admin`
- Password: `adminadmin` (change this immediately)

## Environment Variables

Configured via `.env` file:

```
QBITTORRENT_WEBUI_PORT=8080
QBITTORRENT_CONFIG_PATH=/path/to/config
QBITTORRENT_DOWNLOADS_PATH=/path/to/downloads
```

## Resource Limits

Memory and CPU limits are applied to prevent overutilization:

- Max RAM: 2GB
- Max CPU: 2 cores

## Notes

Ensure ports do not conflict with other services. This app shares the `homelab` network with other containers.

## Resources

- [Official Documentation](https://github.com/qbittorrent/qBittorrent)
- [LinuxServer Container Docs](https://docs.linuxserver.io/images/docker-qbittorrent/)
