#!/bin/env bash

#Simple bash script to retrieve a time-sorted list of a git repositories tags
#provide the git dir you want to extract data from as the first argument to this script

#set -e

GIT_DIR=$1
REPO_NAME=`basename $GIT_DIR`
DB_FILE="${REPO_NAME}.sqlite"

if test -f "$DB_FILE"; then
    echo "$DB_FILE exists, keep copy of existing file as .bak"
    mv $DB_FILE "${DB_FILE}.bak"
fi

pushd $GIT_DIR
TAGS=$(git tag -l --sort=-creatordate --format='%(refname:short)' |grep "^v" |grep  -v "\(rc\|99\)" |sort)


only_first_item=''
for t in $TAGS
    do
        echo "processing tag ${t}"

        if ! [ "$only_first_item" ]; then
            cloc -not-match-f="Kconfig" --git $t --sql 1 --sql-project $t | sqlite3 /tmp/$DB_FILE

            only_first_item="done"
            continue
        fi
        cloc -not-match-f="Kconfig" --git $t --sql 1 --sql-append --sql-project $t | sqlite3 /tmp/$DB_FILE
    done

popd
mv /tmp/$DB_FILE .
