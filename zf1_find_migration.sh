#!/bin/bash

if [ -z $1 ]; then
	echo "You must specifiy which field to search"
else
	grep -E "$1"  --color --files-with-matches --exclude=schema.sql -r scripts/sandbox/migrations/
fi

