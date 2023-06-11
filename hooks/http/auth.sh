#!/bin/bash

source ./hooks/http/common.sh

echo $CERTBOT_VALIDATION > ./$CERTBOT_TOKEN

scp -i "$KEY" ./$CERTBOT_TOKEN "$USER@$HOST:$DEST"
ssh -i "$KEY" -p "$PORT" "$USER@$HOST" chmod 640 "$DEST/$CERTBOT_TOKEN"
