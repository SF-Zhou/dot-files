#!/usr/local/bin/zsh

# Git
echo Set Git
rm -f $HOME/.gitconfig
ln -s `pwd`/Git/git.config $HOME/.gitconfig

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
rm -rf $HOME/.sf_bin/
mkdir $HOME/.sf_bin/
ln -s `pwd`/ZSH/src/copy.py $HOME/.sf_bin/copy
ln -s `pwd`/ZSH/src/paste.py $HOME/.sf_bin/paste
ln -s `pwd`/ZSH/src/show.py $HOME/.sf_bin/show
source $HOME/.zshrc
