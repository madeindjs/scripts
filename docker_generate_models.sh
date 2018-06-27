#!/bin/bash
. _variables.sh

docker exec -it php5.6 bash -c "cd ${WWW}/scripts && ./generate_models.sh"
