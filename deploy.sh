#!/bin/bash

SCRIPTNAME=`basename $0`
SCRIPTDIR="$( cd "$(dirname "$0")" ; pwd -P )"
WORKDIR=`pwd`

DEPLOYDIR="$HOME"/test

echo "The script you are running is named: $SCRIPTNAME,
and is located in the directory: $SCRIPTDIR

The present working directory is $WORKDIR.
"

cd $DEPLOYDIR

DIRS="
.emacs.d/
.sbt/
.vim/"

for d in $DIRS
do
  echo "working in dir: $d"
  rsync -av --delete --exclude-from "$SCRIPTDIR/deploy-excludes.txt" $SCRIPTDIR/$d $DEPLOYDIR/$d
done

rsync -av --exclude "*/"  --exclude-from "$SCRIPTDIR/deploy-excludes.txt" $SCRIPTDIR $DEPLOYDIR
