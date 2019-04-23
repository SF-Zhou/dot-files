#!/bin/sh

TASK="setup tmux"
CURRENT="$( cd "$(dirname "$0")" && pwd -P )"

echo "$TASK" start
rm -f "$HOME"/.tmux.conf && ln -s "$CURRENT"/.tmux.conf "$HOME"/.tmux.conf
echo "$TASK" finish
