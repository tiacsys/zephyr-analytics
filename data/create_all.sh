#!/bin/env bash

if (( $# != 1 )); then
    echo "$(basename "$0") PATH_TO_GIT_DIR"
    exit -1
fi

GIT_DIR=$1

CURRENT_FOLDER=$(basename "$PWD")
SCRIPT_DIR="data"

if [[ "$CURRENT_FOLDER" != "$SCRIPT_DIR" ]]; then
    echo "Changing directory to $SCRIPT_DIR ..."
    cd "$SCRIPT_DIR" || { echo "Failed to change directory"; exit 1; }
fi

echo "Analyzing git repo in: $GIT_DIR"

if git -C "$GIT_DIR" rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Current commit:"
    git -C "$GIT_DIR" log --oneline -n1
else
    echo "$GIT_DIR is NOT a Git repository."
    exit -1
fi

echo "Creating cloc db ..."
./create_cloc_db.sh $GIT_DIR

echo "Creating tags data ..."
./create_tags_data.sh $GIT_DIR

echo "Create commit times ..."
./create_commit_times.sh $GIT_DIR