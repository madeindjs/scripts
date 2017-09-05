#!/bin/bash
#
# Connect on server on given directory 
# (or directory corresponding to my local branch)
source ~/.local/bin/_git_current_branch.sh


if [ -z $1 ] ; then
  BRANCH=$(_git_current_branch)
else
  BRANCH="feature/$1"
fi

DIRECTORY=`echo $BRANCH | sed -e 's/[/]/-/'`
ssh -t dev "cd /var/www/gac-report-$DIRECTORY; bash"
