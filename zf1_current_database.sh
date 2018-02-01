#!/bin/bash

# Display the current database connected to Car-fleet
function gac_get_current_database()
{
    grep -e '^database.params.dbname' application/default/configs/application.ini 2> /dev/null | tail -1 | sed -e 's/database.params.dbname *= *//g'
}


if [ -z $1 ]; then
  # if no argument provided, just show current database
  echo "$(gac_get_current_database)"
else
  # if argument is provided, change the current database connected to argument passed
  CURRENT="$(gac_get_current_database)"
  FROM="database.params.dbname *= *${CURRENT}"
  TO="database.params.dbname = ${1}"
  sed -ie "s/${FROM}/${TO}/g" application/default/configs/application.ini
  # set default password for the support account
  echo "UPDATE user SET password = '02cd4e217924d29efdf84abb31ed211e' WHERE login = 'support@gac-technology.com'" | docker exec -i mysql5.6 mysql -uroot -psecret "$1"
fi
