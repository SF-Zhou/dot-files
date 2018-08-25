#!/bin/sh

./curl/setup.sh
./git/setup.sh

# curl
echo Set curl
rm -f $HOME/.curlrc
ln -s `pwd`/curl/curlrc $HOME/.curlrc

# Vim
echo Set Vim
if ! test -d $HOME/.vim/bundle/Vundle.vim; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
rm -f $HOME/.vimrc
ln -s `pwd`/Vim/vimrc.vim $HOME/.vimrc

# ZSH + oh-my-zsh
echo Set ZSH
rm -f $HOME/.zshrc
ln -s `pwd`/ZSH/zshrc $HOME/.zshrc
source $HOME/.zshrc
