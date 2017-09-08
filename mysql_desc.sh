#!/bin/bash
# Search & describe given table

# Search Database & Table 
QUERY_FROM="FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE '$1' LIMIT 1"
DATABASE=`mysql -sB -e "SELECT DISTINCT TABLE_SCHEMA $QUERY_FROM"`
TABLE=`mysql -sB -e "SELECT DISTINCT TABLE_NAME $QUERY_FROM"`
DB_TABLE="$DATABASE.$TABLE"

if [ -z $TABLE ] ; then
  # Try to find tables names corresponding to user query
  echo -e "Table not found.\n\nTry these:"
  mysql -sNe "SELECT DISTINCT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE '%$1%'"
else
  # DESC
  mysql -te "DESC $DB_TABLE" | less -SEX
  echo "Describe $DB_TABLE"
fi
