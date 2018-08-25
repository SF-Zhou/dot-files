#!/bin/sh

TASK="setup git"
CURRENT="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  PLATFORM=mac
else
  PLATFORM=linux
fi

echo $TASK start
rm -f $HOME/.gitconfig && ln -s $CURRENT/$PLATFORM/.gitconfig $HOME/.gitconfig
rm -f $HOME/.gitignore && ln -s $CURRENT/.gitignore $HOME/.gitignore
echo $TASK finish
