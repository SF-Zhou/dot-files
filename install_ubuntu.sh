#!/bin/zsh

sudo apt install git vim-gtk xcape proxychains xclip tsocks
sudo apt install libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
sudo apt install supervisor polipo

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
source $HOME/.zshrc

# Python
pip3 install -r Python/requirements.txt
