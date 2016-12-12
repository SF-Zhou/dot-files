# Git
echo Set Git
rm -f ~/.gitconfig
ln -s `pwd`/Git/git.config ~/.gitconfig

# Hammerspoon
echo Set Hammerspoon 
mkdir -p ~/.hammerspoon
rm -f ~/.hammerspoon/init.lua
ln -s `pwd`/Hammerspoon/init.lua ~/.hammerspoon/init.lua

# Vim
echo Set Vim
if ! test -d $HOME/.vim/bundle/Vundle.vim; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
rm -f $HOME/.vimrc
ln -s `pwd`/Vim/vimrc.vim $HOME/.vimrc

# ZSH + oh-my-zsh
echo Set ZSH
rm -f ~/.zshrc
ln -s `pwd`/ZSH/zshrc ~/.zshrc
