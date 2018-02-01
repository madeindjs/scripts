#!/bin/bash

docker exec -it php5.6_1 bash -c "cd /usr/local/apache2/htdocs/www/gac-report/scripts && ./generate_models.sh"
