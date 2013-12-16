#!/bin/bash

VERSION=$1

#Adding link
CBO_BASE="/Users/venkat/vvenkatraman/code_base/cbo"
ACTUAL_FILE="$CBO_BASE/CBO_$VERSION/work/webapps/bsimple"
SYMBOLIC_PATH="./webapps/bsimple"

#Removing any existing links
rm -f $SYMBOLIC_PATH

#Adding link
echo executing ${ACTUAL_FILE} to ${SYMBOLIC_PATH}
ln -s $ACTUAL_FILE $SYMBOLIC_PATH 