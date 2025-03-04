#!/bin/env bash

#Simple bash script to retrieve a time-sorted list of a git repositories tags
#provide the git dir you want to extract data from as the first argument to this script

GIT_DIR=$1
REPO_NAME=`basename $GIT_DIR`

TAGS_WITH_DATE_NAME="${REPO_NAME}_tags_with_date.csv"
TAGS_NAME="${REPO_NAME}_tags.csv"

echo $TAGS_WITH_DATE_NAME

git -C $GIT_DIR tag -l --sort=-creatordate --format='%(refname:short), %(creatordate:short)' |grep "^v" > $TAGS_WITH_DATE_NAME
git -C $GIT_DIR tag -l --sort=-creatordate --format='%(refname:short)' |grep "^v" > $TAGS_NAME
