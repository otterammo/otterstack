# Organizr

Organizr is a self-hosted portal to help manage and access your other services from a single web interface. It supports multiple user roles and can be used to create a personalized landing page for your homelab.

## Features

- Dashboard with tiles for each of your services
- Support for guest view and admin login
- Optional authentication for protected access
- Customizable layout and appearance
- Integration with services like Plex, Sonarr, Radarr, Jellyfin, and more

## Setup Notes

- First-time setup will prompt you for a Hash Key and Registration Password.
- Generate a strong Hash Key manually (e.g., with a password manager or using `openssl rand -base64 32`).
- Set a Registration Password to restrict who can create admin accounts.
- The API Key is auto-generated during setup.

## Resources

- [Official Docs](https://docs.organizr.app/)
- [GitHub Repository](https://github.com/causefx/Organizr)
- [Docker Image](https://hub.docker.com/r/organizr/organizr)
- [Community Support (Discord)](https://discord.gg/3YzQ2st)
