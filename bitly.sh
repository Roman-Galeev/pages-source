#!/bin/bash -e
URL=$1

HOST=https://api-ssl.bitly.com

[ -z "$BITLY_USER" ] && echo "env variable BITLY_USER must be set" && exit 1
[ -z "$BITLY_PASSWORD" ] && echo "env variable BITLY_PASSWORD must be set" && exit 1

[ -z "$URL" ] && echo "Usage: $0 url" && exit 1

TOKEN=$(curl -s -u "$BITLY_USER:$BITLY_PASSWORD" -X POST "$HOST/oauth/access_token")
PAYLOAD=$(printf '{"long_url": "%s"}' "$URL")

REPLY=$(curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d "$PAYLOAD" "$HOST/v4/bitlinks")
ID=$(echo $REPLY | jq -r .id)

curl -s -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" "$HOST/v4/bitlinks/$ID"

