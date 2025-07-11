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

## Flushing the DNS Cache

If you still see stale records:

1. **Restart the resolver**
  ```bash
  sudo systemctl restart systemd-resolved
  ```

2. **Flush its cache**
  ```bash
  sudo resolvectl flush-caches
  ```

You can verify that the DNS cache has been cleared by checking the status of `systemd-resolved`:

```bash
sudo systemctl status systemd-resolved
```

Look for output indicating the cache size to confirm it has been reset.
