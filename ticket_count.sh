#!/bin/bash
#
# count number of minutes passed on a specific ticket
# to count them automatiquelly add this in crontab
#
#     * 7,8,9,10,11,14,15,16,17,18,19 * * * cd ~/www && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' >> ~/.tickets_count.log
#
# add branch name of your project


if [[ -z $1 ]]; then
	echo "please enter a branch name"
	exit 1
fi

LOG_FILE='~/.tickets_count.log'

# display number of lines
grep 7639 "$LOG_FILE" | wc -l
# remove
sed -i "/$1/d" "$LOG_FILE"
