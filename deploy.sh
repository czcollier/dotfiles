#!/bin/bash

SCRIPTNAME=`basename $0`
SCRIPTDIR="$( cd "$(dirname "$0")" ; pwd -P )"
WORKDIR=`pwd`

DEPLOYDIR="$HOME"

echo "The script you are running is named: $SCRIPTNAME,
and is located in the directory: $SCRIPTDIR

The present working directory is $WORKDIR.
"

cd $DEPLOYDIR

rsync -av --exclude-from "$SCRIPTDIR/deploy-excludes.txt" $SCRIPTDIR/ $DEPLOYDIR
