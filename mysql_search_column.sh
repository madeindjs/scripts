#!/bin/bash
# Search given columns between all MySQL tables 

display_usage() { 
  echo "Search given columns between all MySQL tables." 
  echo -e "\nUsage:" 
  echo -e '\t $1 as COLUMN_NAME'
  echo -e '\t $2 as TABLE_NAME'
}

if [ -z $1 ]; then
  display_usage
  exit 1
fi


QUERY="SELECT DISTINCT TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME LIKE '%${1}%'"

# If TABLE_NAME parameter is set, we add it to query
if [ -n $2 ]; then
  QUERY="$QUERY AND TABLE_NAME LIKE '%$2%'"
fi

# call the query and grep on this to colors matches
# - grep on TABLE_NAME
# - grep on COLUMN_NAME
# - grep on all begining to display all file (and mysql header) 
docker exec -it mysql5.6_1 mysql -uroot -psecret -te "$QUERY ORDER BY TABLE_NAME, COLUMN_NAME" | grep --color -aie "$1\|$2\|$"
