#!/bin/bash

DATABASE="$2"

if [ -z $DATABASE ]; then
  DATABASE="gac_report"
fi

cat "$1" | docker exec -i mysql5.6_1 mysql -uroot -psecret "$DATABASE" && notify-send "$1 imported into $DATABASE"