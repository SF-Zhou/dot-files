#!/bin/sh

TASK="setup pyenv"

echo "$TASK" start
if ! test -d "$HOME"/.pyenv; then
  git clone https://github.com/pyenv/pyenv.git "$HOME"/.pyenv
  git clone https://github.com/pyenv/pyenv-virtualenv.git "$HOME"/.pyenv/plugins/pyenv-virtualenv
fi
echo "$TASK" finish
