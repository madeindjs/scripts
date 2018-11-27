#!/bin/bash

# Run PHP Unit into Docker container
#
# $1 = file
# $2 = filter

. _variables.sh


if [ -z $1 ]; then
	# no params provided, launch all tests
	docker exec php5.6 bash -c "cd $WWW/scripts && ../vendor/bin/phinx migrate -vv"
else
	docker exec php5.6 bash -c "cd $WWW/scripts && ../vendor/bin/phinx $1 -vv"
fi
