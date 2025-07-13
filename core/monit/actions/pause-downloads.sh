#!/usr/bin/env bash

# Pause jellyseerr container via Docker Engine API
curl -s --unix-socket /var/run/docker.sock -X POST http://localhost/containers/jellyseerr/pause || true

# Pause qbittorrent container via Docker Engine API
curl -s --unix-socket /var/run/docker.sock -X POST http://localhost/containers/qbittorrent/pause || true
