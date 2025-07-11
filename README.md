# Homelab

## Registering a New Subdomain

To expose a new service under your Cloudflare Tunnel, follow these steps:

1. **Edit the ingress rules**
   Open `core/cloudflared/conf/config.yml` and add an entry under `ingress:`:
   ```yaml
   - hostname: <subdomain>.otterammo.xyz
     service: http://<service_container_name>:<port>
   ```
   Replace `<subdomain>`, `<service_container_name>`, and `<port>` with your values.

2. **Create the DNS record**
   Run:
   ```bash
   docker run --rm \
     -v ~/homelab/core/cloudflared/conf:/etc/cloudflared:ro \
     cloudflare/cloudflared:latest \
     tunnel route dns homelab <subdomain>.otterammo.xyz
   ```

3. **Restart the tunnel**
   ```bash
   cd ~/homelab/core/cloudflared
   docker compose restart cloudflared
   ```

4. **Verify**
   ```bash
   curl -I https://<subdomain>.otterammo.xyz
   ```
