#!/bin/bash

source ./hooks/common.sh

ssh -i "$KEY" -p "$PORT" "$USER@$HOST" rm "$DEST/$CERTBOT_TOKEN"
rm ./$CERTBOT_TOKEN
