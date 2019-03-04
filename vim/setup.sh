#!/bin/sh

TASK="setup vim"
CURRENT="$( cd "$(dirname "$0")" && pwd -P )"

echo "$TASK" start
rm -f "$HOME"/.vimrc && ln -s "$CURRENT"/.vimrc "$HOME"/.vimrc
echo "$TASK" finish
