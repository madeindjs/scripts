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

if [ -n $2 ]; then
  QUERY="$QUERY AND TABLE_NAME LIKE '%$2%'"
fi


mysql -e "$QUERY"