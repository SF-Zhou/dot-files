#!/bin/sh

TASK="setup curl"
CURRENT="$( cd "$(dirname "$0")" ; pwd -P )"

echo $TASK start
rm -f $HOME/.curlrc && ln -s $CURRENT/.curlrc $HOME/.curlrc
echo $TASK finish
