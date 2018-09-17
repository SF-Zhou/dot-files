#!/bin/sh

TASK="setup vim"
CURRENT="$( cd "$(dirname "$0")" ; pwd -P )"

echo $TASK start
if ! test -d $HOME/.vim/bundle/Vundle.vim; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
rm -f $HOME/.vimrc && ln -s $CURRENT/.vimrc $HOME/.vimrc
echo $TASK finish
