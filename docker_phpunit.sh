#!/bin/bash

# Run PHP Unit into Docker container
#
# $1 = file
# $2 = filter

WWW='/usr/local/apache2/htdocs/www/gac-report'



if [ -z $1 ]; then
	docker exec php5.6_1 "$WWW/vendor/bin/phpunit" -c "$WWW/tests/configs/phpunit/phpunit.xml"
else
	if [ -z $2 ]; then
		docker exec php5.6_1 "$WWW/vendor/bin/phpunit" -c "$WWW/tests/configs/phpunit/phpunit.xml" "$WWW/$1"
	else
		docker exec php5.6_1 "$WWW/vendor/bin/phpunit" -c "$WWW/tests/configs/phpunit/phpunit.xml" --filter "$2" "$WWW/$1"
	fi
fi