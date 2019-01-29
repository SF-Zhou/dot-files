#!/bin/sh

TASK="setup vim"
CURRENT="$( cd "$(dirname "$0")" && pwd -P )"

echo "$TASK" start
if ! test -f "$HOME"/.vim/autoload/plug.vim; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

rm -f "$HOME"/.vimrc && ln -s "$CURRENT"/.vimrc "$HOME"/.vimrc
echo "$TASK" finish
