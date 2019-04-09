#!/bin/bash -e
URL=$1
TITLE=$2
[ -z "$URL" ] && echo "Usage: $0 url [title]" && exit 1

BITLY=$(./bitly.sh $URL)

function get () {
	echo $BITLY | jq -r $1
}

SHORT=$(get .link)
ORIGIN=$(get .long_url)
DATE=$(get .created_at)

if [ -z "$TITLE" ]
then
	TITLE=$(get .title)
fi
[ "$TITLE" = "null" ] && echo "Can't determine title, please provide manually" && exit 1

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
