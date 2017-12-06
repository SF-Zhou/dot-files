#!/bin/zsh

# Vim
echo Set Vim
if ! test -d $HOME/.vim/bundle/Vundle.vim; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
rm -f $HOME/.vimrc
ln -s `pwd`/Vim/vimrc.vim $HOME/.vimrc
vim

# ZSH + oh-my-zsh
echo Set ZSH
rm -f $HOME/.zshrc
ln -s `pwd`/ZSH/zshrc_ubuntu $HOME/.zshrc
rm -rf $HOME/.sf_bin/
mkdir $HOME/.sf_bin/
ln -s `pwd`/ZSH/src/copy.py $HOME/.sf_bin/copy.py
ln -s `pwd`/ZSH/src/paste.py $HOME/.sf_bin/paste.py
ln -s `pwd`/ZSH/src/show.py $HOME/.sf_bin/show.py
source $HOME/.zshrc

# Python
pip3 install -r Python/requirements.txt
