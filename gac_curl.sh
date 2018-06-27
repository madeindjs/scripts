#!/bin/bash

display_usage() {
  echo "Connect & lauch query to localhost environnement."
  echo -e "\nUsage:"
  echo -e '\t $1 as path'
  echo -e '\t $2 as data'
}

HOST="https://dev.gac-technology.com/gac-report-feature-8583/public"
# HOST="https://localhost/gac-report/public"

if [ -z $1 ]; then
  display_usage
  exit 1
fi

echo ''

COOKIE_FILE="cookie.txt"
TARGET="${HOST}${1}"

# if cookie file does not exist, we connect user to create it
if [ ! -e $COOKIE_FILE ]; then
	# connect user & store cookie
	# curl --cookie-jar $COOKIE_FILE "${HOST}/auth/process" --data "login=support%40gac-technology.com&password=Q%3C%2F%3ABAqqO1%5D%7Dag"
  curl  --cookie-jar $COOKIE_FILE "${HOST}/auth/process" --data "login=support%40gac-technology.com&password=L39%C2%B2%C3%A3%22Z%C3%A63ti%C3%81o%C2%BB+%C3%86%C3%B0%C2%B2%C2%B0%5B"


fi


# send wuery with AJAX contect
curl -s -X POST -H "X-Requested-With: XMLHttpRequest" --cookie $COOKIE_FILE "$TARGET" --data "$2"

echo ''