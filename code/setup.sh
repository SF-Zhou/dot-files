#!/bin/sh

TASK="setup [Visual Studio Code]"
CURRENT="$( cd "$(dirname "$0")" && pwd -P )"

TARGET_DIR=$HOME/.config/Code/User
TARGET_SETTING=$TARGET_DIR/settings.json
TARGET_KEYBIND=$TARGET_DIR/keybindings.json

echo "$TASK" start
rm -f "$TARGET_SETTING" && mkdir -p "$TARGET_DIR" && ln -s "$CURRENT"/settings.json "$TARGET_SETTING"
rm -f "$TARGET_KEYBIND" && mkdir -p "$TARGET_DIR" && ln -s "$CURRENT"/keybindings.json "$TARGET_KEYBIND"
echo "$TASK" finish
