#!/bin/sh

TASK="setup git"
CURRENT="$( cd "$(dirname "$0")" ; pwd -P )"

echo $TASK start
rm -f $HOME/.gitconfig
ln -s $CURRENT/mac/.gitconfig $HOME/.gitconfig
rm -f $HOME/.gitignore
ln -s $CURRENT/.gitignore $HOME/.gitignore
echo $TASK finish
