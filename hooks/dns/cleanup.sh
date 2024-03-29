#!/bin/bash

# shellcheck source=/dev/null
source ./hooks/dns/common.sh

RESPONSE=$(curl --silent \
    --request DELETE \
    --url "$LIMA_URL/domains/$LIMA_DOMAIN_ID/records/$CERTBOT_AUTH_OUTPUT" \
    --user "$LIMA_USER:$LIMA_TOKEN"
)

echo "$RESPONSE" | jq .status
