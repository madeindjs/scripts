#!/bin/bash

display_usage() { 
  echo "Connect & lauch query to localhost environnement." 
  echo -e "\nUsage:" 
  echo -e '\t $1 as path'
  echo -e '\t $2 as data'
}

if [ -z $1 ]; then
  display_usage
  exit 1
fi

echo ''

COOKIE_FILE="cookie.txt"
TARGET="http://lvh.me${1}"

# if cookie file does not exist, we connect user to create it
if [ ! -e $COOKIE_FILE ]; then
	# connect user & store cookie
	curl --cookie-jar $COOKIE_FILE http://lvh.me/auth/process --data "login=support%40gac-technology.com&password=Q%3C%2F%3ABAqqO1%5D%7Dag" > /dev/null
fi


# send wuery with AJAX contect
curl -s -X POST -H "X-Requested-With: XMLHttpRequest" --cookie $COOKIE_FILE "$TARGET" --data "$2" 

echo ''