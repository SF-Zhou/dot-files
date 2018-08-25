#!/bin/sh

./curl/setup.sh
./git/setup.sh
./vim/setup.sh

# ZSH + oh-my-zsh
echo Set ZSH
rm -f $HOME/.zshrc
ln -s `pwd`/ZSH/zshrc $HOME/.zshrc
source $HOME/.zshrc
