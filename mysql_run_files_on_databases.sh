#!/bin/bash
#
# Run given SQL on migration on all databases corresponding to a specific patern

# Usage:
#    $1 as path of SQL file
#    $2 as patern of databases to run migration

. _variables.sh

display_usage() {
  echo "Run given SQL on migration on all databases corresponding to a specific patern"
  echo -e "\nUsage:"
  echo -e '\t $1 as path of SQL file'
  echo -e '\t $2 as patern of databases to run migration'
}

# check parameters
if [[ -z $1 ]]; then
  display_usage
  exit 1
fi

if [[ -z $2 ]]; then
  patern="gr_"
else
  patern=$2
fi

# check if file exists
if [[ ! -f $1 ]]; then
  echo 'File does not exist'
  exit 1
fi

# list all database
databases=`docker exec -it mysql5.7 mysql -uroot -psecret -te "SHOW DATABASES"`

for database in $databases; do
  # run migration only for database beginning by `gr_`
  if [[ $database == *"${patern}"* ]]; then

    # check status
    if ( cat "$1" | docker exec -i mysql5.7 mysql -uroot -psecret "$database" ); then
 	    echo -e "${GREEN}[x] migrated @ ${database}${DEFAULT}\n"
    else
      echo -e "${RED}[ ] failed @ ${database}${DEFAULT}\n"
    fi
  fi
done
