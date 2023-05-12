#!/bin/bash

set -ex

# renew certificates
$HOME/certbot/venv/bin/certbot renew \
    --manual \
    --preferred-challenges http \
    --non-interactive \
    --manual-auth-hook ./hooks/auth.sh \
    --manual-cleanup-hook ./hooks/cleanup.sh

# deploy for download
if [ -f "deploy.sh" ]; then
    ./deploy.sh
fi
