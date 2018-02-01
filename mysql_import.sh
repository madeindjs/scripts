#!/bin/bash

DATABASE="$2"

if [ -z $DATABASE ]; then
  DATABASE="gac_report"
fi

docker exec -i mysql5.6 mysql -uroot -psecret -e "CREATE DATABASE IF NOT EXISTS $DATABASE"
cat "$1" | docker exec -i mysql5.6 mysql -uroot -psecret "$DATABASE"
notify-send "$1 imported into $DATABASE"