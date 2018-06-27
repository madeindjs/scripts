#!/bin/bash
# Search & describe given table



# Search Database & Table
QUERY_FROM="FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE '%$1%' LIMIT 1"
DATABASE='gr_veolia'
TABLE=$1

if [[ -z $TABLE ]] ; then
  # Try to find tables names corresponding to user query
  echo -e "Please enter a table name"
else
  # DESC
  docker exec -it mysql5.6 mysql "$DATABASE" -uroot -psecret -te "DESC $TABLE" #| less -SEX
fi
