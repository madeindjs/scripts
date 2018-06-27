#!/bin/bash

. _variables.sh

files=`git diff --name-only | grep -E '.php$' `
for file in $files; do
  echo -e "${GREEN}- Check $file${RED}"
  php -l $file > /dev/null
done

echo -e "${GREEN}\nScan completed${DEFAULT}\n"

