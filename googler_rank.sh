#!/bin/bash
# need to install https://github.com/jarun/googler
display_usage() { 
  echo "Search website google rank from keywords." 
  echo -e "\nUsage:" 
  echo -e '\t $1 as website url'
  echo -e '\t $2 as keywords'
}

if [ -z $2 ]; then
  display_usage
  exit 1
fi

googler "$2" -n 200 --noprompt | grep "$1" --color -B 1 -A 1 