#!/bin/bash

source ./hooks/http/common.sh

ssh -i "$KEY" -p "$PORT" "$USER@$HOST" rm "$DEST/$CERTBOT_TOKEN"
rm ./$CERTBOT_TOKEN
