#!/bin/bash

source ./hooks/dns/common.sh

RESPONSE=$(curl --silent \
    --request DELETE \
    --url "$LIMA_URL/domains/$LIMA_DOMAIN_ID/records/$CERTBOT_AUTH_OUTPUT" \
    --user "$LIMA_USER:$LIMA_TOKEN" \
    --header "Content-Type: application/json"
)

echo $RESPONSE | jq .status
