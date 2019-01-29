#!/bin/sh

TASK="setup zsh"
CURRENT="$( cd "$(dirname "$0")" && pwd -P )"

echo "$TASK" start
rm -f "$HOME"/.zshrc && ln -s "$CURRENT"/.zshrc "$HOME"/.zshrc
echo "$TASK" finish
