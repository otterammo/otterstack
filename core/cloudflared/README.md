# Cloudflared

This directory contains the configuration and setup for Cloudflare Tunnel (`cloudflared`), which securely exposes local services to the internet using Cloudflare's edge network.

## Files

- `config.yml` – Main configuration file for your tunnel.
- `cert.pem` – Cloudflare certificate used to authenticate the tunnel.
- `README.md` – This file.

## Configuration

Before running the tunnel, ensure you have the following:

1. **`cert.pem`** – Authenticate with Cloudflare:
   ```bash
   cloudflared login
   ```
   This opens a browser to authenticate and generate the cert.

2. **`config.yml`** – Define tunnel settings:
   ```yaml
   tunnel: <TUNNEL_ID>
   credentials-file: /etc/cloudflared/<TUNNEL_ID>.json

   ingress:
     - hostname: your-service.domain.com
       service: http://localhost:YOUR_PORT
     - service: http_status:404
   ```

3. **Start the tunnel**:
   ```bash
   docker run -d \
     --name cloudflared \
     --restart unless-stopped \
     -v path/to/cloudflared/conf:/etc/cloudflared \
     cloudflare/cloudflared:latest \
     tunnel run
   ```

Replace placeholders with your actual values.

## Registering a Subdomain

To register a new subdomain for your tunnel:

```bash
docker run --rm \
  -v ~/homelab/core/cloudflared/conf:/etc/cloudflared:ro \
  cloudflare/cloudflared:latest \
  tunnel route dns <TUNNEL_NAME> <SUBDOMAIN>
```

Replace `<TUNNEL_NAME>` with the name of your existing tunnel and `<SUBDOMAIN>` with the desired subdomain (e.g., `radarr.otterammo.xyz`).

## Clearing DNS Cache

If you’re not seeing updates immediately, flush your local DNS cache:

```bash
sudo resolvectl flush-caches
```

## Notes

- Ensure your tunnel is running and your services are reachable on their respective internal ports.
- Subdomains must be configured in your Cloudflare dashboard or via the `cloudflared` CLI as shown above.

## Resources

- [Cloudflare Tunnel Documentation](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/)
- [cloudflared GitHub Repository](https://github.com/cloudflare/cloudflared)
- [Cloudflare Dashboard](https://dash.cloudflare.com/)
