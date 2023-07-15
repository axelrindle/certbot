#!/bin/bash

set -e

#source ".env"

readarray -t CERTIFICATES < <(certbot certificates | grep "Certificate Name" | cut -d: -f2 2>/dev/null | awk '{$1=$1};1')

for cert in "${CERTIFICATES[@]}"; do
    echo "Renew $cert"
    CONFIG="/volume1/homes/axelrindle/opt/letsencrypt/config/renewal/$cert.conf"
    CHALLENGE=$(grep pref_challs "$CONFIG" | cut -d\  -f3 | sed 's/-01,//g')

    "$HOME/certbot/venv/bin/certbot" certonly \
        --manual \
        --non-interactive \
        --preferred-challenges "$CHALLENGE" \
        --manual-auth-hook "./hooks/$CHALLENGE/auth.sh" \
        --manual-cleanup-hook "./hooks/$CHALLENGE/cleanup.sh" \
        --cert-name "$cert"
done

# deploy for download
if [ -f "deploy.sh" ]; then
    ./deploy.sh
fi
