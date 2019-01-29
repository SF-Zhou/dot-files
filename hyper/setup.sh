#!/bin/sh

TASK="setup hyper"
CURRENT="$( cd "$(dirname "$0")" && pwd -P )"

echo "$TASK" start
rm -f "$HOME"/.hyper.js && ln -s "$CURRENT"/.hyper.js "$HOME"/.hyper.js
echo "$TASK" finish
