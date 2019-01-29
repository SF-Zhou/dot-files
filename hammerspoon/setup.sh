#!/bin/sh

TASK="setup hammerspoon"
CURRENT="$( cd "$(dirname "$0")" && pwd -P )"

echo "$TASK" start
rm -f "$HOME"/.hammerspoon/init.lua && mkdir -p "$HOME"/.hammerspoon && ln -s "$CURRENT"/init.lua "$HOME"/.hammerspoon/init.lua
echo "$TASK" finish
