#!/bin/bash
# Search & describe given table

# Search Database & Table 
QUERY_FROM="FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE '$1' LIMIT 1"
DATABASE=`mysql -sB -e "SELECT DISTINCT TABLE_SCHEMA $QUERY_FROM"`
TABLE=`mysql -sB -e "SELECT DISTINCT TABLE_NAME $QUERY_FROM"`
DB_TABLE="$DATABASE.$TABLE"

if [ -z $TABLE ] ; then
  echo "Table not found"
else
  # DESC
  mysql --auto-vertical-output -e "DESC $DB_TABLE"
  echo "Describe $DB_TABLE"
fi
