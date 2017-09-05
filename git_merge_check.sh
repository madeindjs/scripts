#!/bin/bash
#
# Chech conflicts between current branch & develop
git merge --no-commit --no-ff develop | grep CONFLIT ; git merge --abort