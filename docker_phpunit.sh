#!/bin/bash

# Run PHP Unit into Docker container
#
# $1 = file
# $2 = filter

. _variables.sh


if [ -z $1 ]; then
	# no params provided, launch all tests
	docker exec php5.6 "$PHPUNIT_BIN" --no-coverage --verbose -c "$PHPUNIT_XML"
else
	if [ -z $2 ]; then
		# file provided, launch this file
		docker exec php5.6 "$PHPUNIT_BIN" --no-coverage --verbose -c "$PHPUNIT_XML" "$WWW/$1"
	else
		# file & filter provided, launch filter on file provided
		docker exec php5.6 "$PHPUNIT_BIN" --no-coverage --verbose -c "$PHPUNIT_XML" --filter "$2" "$WWW/$1"
	fi
fi
