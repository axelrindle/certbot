#!/bin/bash

set -ex

source ".env"

# renew certificates
$HOME/certbot/venv/bin/certbot renew \
    --manual \
    --preferred-challenges "$CHALLENGE" \
    --non-interactive \
    --manual-auth-hook "./hooks/$CHALLENGE/auth.sh" \
    --manual-cleanup-hook "./hooks/$CHALLENGE/cleanup.sh"

# deploy for download
if [ -f "deploy.sh" ]; then
    ./deploy.sh
fi
