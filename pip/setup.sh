#!/bin/sh

TASK="setup pip"
CURRENT="$( cd "$(dirname "$0")" ; pwd -P )"

echo $TASK start
mkdir -p $HOME/.pip
rm -f $HOME/.pip/pip.conf && ln -s $CURRENT/pip.conf $HOME/.pip/pip.conf
echo $TASK finish
