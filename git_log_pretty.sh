#!/bin/bash

if [[ -z $1 ]]; then
    echo 'Please enter a number of commit to view'
    exit 1 
fi

# "- User @ Hash | Msg"
FORMAT='%Cblue%cn%Creset @ %Cblue%h%Creset %s'
FORMAT='%cn @ %h %s'

git log -n $1 --format="$FORMAT" --graph | grep --color -ie '$2\|$'