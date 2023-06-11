#!/bin/bash

source ./hooks/dns/common.sh

RESPONSE=$(curl --silent \
    --request POST \
    --url "$LIMA_URL/domains/$LIMA_DOMAIN_ID/records.json" \
    --user "$LIMA_USER:$LIMA_TOKEN" \
    --header "Content-Type: application/json" \
    --data "{
  \"nameserver_record\": {
    \"name\": \"_acme-challenge.$CERTBOT_DOMAIN\",
    \"type\": \"TXT\",
    \"content\": \"$CERTBOT_VALIDATION\",
    \"ttl\": 3600,
    \"priority\": \"10\"
  }
}")

echo $RESPONSE | jq .object.id
