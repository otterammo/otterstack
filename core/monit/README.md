# Monit

Monit is used to monitor the disk usage of your media directory and automatically pause or unpause services like Jellyseerr and qBittorrent based on space thresholds.

## Features

- Monitors disk space on the mounted media volume.
- Pauses downloads when space exceeds a defined threshold.
- Unpauses downloads when space usage drops below a safe threshold.
- Provides a basic HTTP interface for monitoring.

## Scripts

Monit uses scripts in `/config/actions/` to pause or unpause services:

- `pause-downloads.sh`
- `unpause-downloads.sh`

These rely on Docker being available in the container or use Docker socket if necessary.

## Notes

- Thresholds and script paths are configurable via `monitrc`.
- Adjust resource monitoring to fit your hardware and media storage size.

## Resources

- [Monit Documentation](https://mmonit.com/monit/documentation/)
- [Docker Monit GitHub](https://github.com/linuxserver-labs/docker-monit)
