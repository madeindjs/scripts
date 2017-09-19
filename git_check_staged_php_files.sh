#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
DEFAULT='\033[0m'

files=`git diff --name-only | grep -E '.php$' `
for file in $files; do
  echo -e "${GREEN}- Check $file${RED}"
  php -l $file > /dev/null
done

echo -e "${GREEN}\nScan completed${DEFAULT}\n"

