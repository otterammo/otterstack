# Servarr

This folder contains configuration for the following "*arr" apps:

- **Sonarr**: TV show management and automation
- **Radarr**: Movie management and automation
- **Prowlarr**: Indexer manager for Sonarr, Radarr, and other *arr apps
- **Bazarr**: Subtitle management and syncing

## Setup

These services are included in the Docker Compose stack and run on the `homelab` network.

### Environment Variables

Ensure your `.env` file includes:

```
MEDIA_PATH=/path/to/media
```

Sonarr, Radarr, and Bazarr will use this path to access your media files.

## Notes

- Sonarr and Radarr automatically clean up download folders after moving files.
- Prowlarr must be linked to indexers and configured in Sonarr/Radarr for best results.
- Bazarr requires linking to Sonarr and Radarr to monitor subtitle availability.

## Resources

- [Sonarr Docs](https://wiki.servarr.com/sonarr)
- [Radarr Docs](https://wiki.servarr.com/radarr)
- [Prowlarr Docs](https://wiki.servarr.com/prowlarr)
- [Bazarr Docs](https://wiki.bazarr.media/)
- [Linuxserver.io](https://docs.linuxserver.io/)
