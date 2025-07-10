#!/bin/bash
set -e

# Create the homelab network if it doesn't exist
if ! docker network ls | grep -q 'homelab'; then
  echo "Creating 'homelab' network..."
  docker network create homelab
else
  echo "'homelab' network already exists."
fi
