


# Jellyfin

[Jellyfin](https://jellyfin.org/) is a free and open-source media server that lets you manage and stream your personal media collection.

## Features

- Stream movies, TV shows, and music
- Multi-user support
- Web-based UI and apps for various platforms
- Active community and plugin support

## Media Paths

The following media directories are mapped into the container:

- `/movies` → Movies
- `/tv` → TV Shows
- `/music` → Music

These map to the host path defined in `.env`:

```
MEDIA_PATH=/path/to/media
```

## Resources

- [Official Docs](https://jellyfin.org/docs)
- [GitHub](https://github.com/jellyfin/jellyfin)
- [Linuxserver.io Docs](https://docs.linuxserver.io/images/docker-jellyfin/)
