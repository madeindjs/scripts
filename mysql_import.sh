#!/bin/bash

DATABASE="$2"

if [ -z $DATABASE ]; then
  DATABASE="gac_report"
fi

docker exec -i mysql5.7 mysql -uroot -psecret -e "CREATE DATABASE IF NOT EXISTS $DATABASE"
cat "$1" | docker exec -i mysql5.7 mysql -uroot -psecret "$DATABASE"
mysql "$2" -e "update user set password = '02cd4e217924d29efdf84abb31ed211e' where login = 'support@gac-technology.com'"
notify-send "$1 imported into $DATABASE"