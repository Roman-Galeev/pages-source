#!/bin/bash -e
URL=$1
[ -z "$URL" ] && echo "Usage: $0 url" && exit 1

BITLY=$(./bitly.sh $URL)

function get () {
	echo $BITLY | jq -r $1
}

SHORT=$(get .link)
ORIGIN=$(get .long_url)
TITLE=$(get .title)
DATE=$(get .created_at)

NAME=$(echo "${TITLE}" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

cat <<EOT > content/post/$NAME.md
---
title: "$TITLE"
tags: []
date: $DATE
short: "$SHORT"
origin: "$ORIGIN"
---

[$ORIGIN]($SHORT)

TL;DR:

EOT
