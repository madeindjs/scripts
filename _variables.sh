#!/bin/bash

WWW='/usr/local/apache2/htdocs/gac-report'
WWW_TEST='/usr/local/apache2/htdocs/gac-report-test'
WWW_LOCAL_TEST='/home/arousseau/dev/docker/dockerlamp/www/gac-report-test'
PHPUNIT_XML="$WWW/build/phpunit.xml"
PHPUNIT_XML_TEST="$WWW_TEST/build/phpunit.xml"
PHPUNIT_BIN="$WWW/vendor/bin/phpunit"
PHPUNIT_BIN_TEST="$WWW_TEST/vendor/bin/phpunit"

GREEN='\033[0;32m'
RED='\033[0;31m'
DEFAULT='\033[0m'