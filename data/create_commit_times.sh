#!/bin/env bash

#Simple bash script to retrieve a time-sorted list of a git repositories tags
#provide the git dir you want to extract data from as the first argument to this script

GIT_DIR=$1
REPO_NAME=`basename $GIT_DIR`

CSV_NAME="${REPO_NAME}_commit_times.csv"

echo $TAGS_WITH_DATE_NAME

git -C $GIT_DIR log --pretty="format:%H, %aI, %ae, %cI, %ce" > $CSV_NAME
