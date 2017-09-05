#!/bin/bash

# Display the current branch connected to Car-fleet
function gac_get_current_database()
{
    grep -e '^database.params.dbname' application/default/configs/application.ini 2> /dev/null | tail -1 | sed -e 's/database.params.dbname *= *//g'
}

echo "$(gac_get_current_database)"