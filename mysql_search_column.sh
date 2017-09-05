#!/bin/bash
#
# Search given columns between all MySQL tables 

mysql -e "SELECT DISTINCT TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME LIKE '%${1}%'"