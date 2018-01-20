#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Usage: rust-analyze.sh config-file.json tree_name"
    exit 1
fi

set -e # Errors are fatal
set -x # Show commands

CONFIG_FILE=$(realpath $1)
TREE_NAME=$2

find $OBJDIR -type d -name save-analysis |
while read ANALYSIS_DIR; do
  $MOZSEARCH_PATH/tools/target/release/rust-indexer \
    "$FILES_ROOT" \
    "$ANALYSIS_DIR" \
    "$INDEX_ROOT/analysis"
done
