# Dozzle

Dozzle is a lightweight real-time log viewer for Docker containers.

## Features

- Live tail logs from running containers
- Clean and intuitive web UI
- No dependencies outside Docker

## Usage

This setup runs Dozzle on port `8085`.

### Access

Visit [http://localhost:8085](http://localhost:8085) in your browser.

### Configuration

Environment variables can be set in the `.env` file.

### Docker Compose

To run:

```bash
docker compose up -d
```

To stop:

```bash
docker compose down
```

## Volume

Dozzle uses the Docker socket for access to container logs:

```
/var/run/docker.sock:/var/run/docker.sock
```

## Network

Dozzle is attached to the shared `homelab` network.
