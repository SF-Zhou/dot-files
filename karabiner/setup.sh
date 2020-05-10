#!/bin/sh

TASK="setup karabiner"
CURRENT="$( cd "$(dirname "$0")" && pwd -P )"

echo "$TASK" start
rm -f "$HOME"/.config/karabiner/karabiner.json && mkdir -p "$HOME"/.config/karabiner && ln -s "$CURRENT"/karabiner.json "$HOME"/.config/karabiner/karabiner.json
echo "$TASK" finish
