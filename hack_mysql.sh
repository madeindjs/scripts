#!/bin/bash
display_usage() { 
  echo "Try to connect on mysql host." 
  echo -e "\nUsage:" 
  echo -e '\t $1 host'
}

if [ -z $1 ]; then
  display_usage
  exit 1
fi

STATUS=`nmap "$1" -p mysql | grep mysql | sed -e 's/3306\/tcp //' | sed -e 's/mysql//'`

if [[ "$STATUS" = *"open"* ]]; then
    mysql --host "$1" -u root -proot
else
    echo "Port $STATUS :'("
fi
