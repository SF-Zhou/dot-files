# Git
echo Set Git
rm -f ~/.gitconfig
ln -s `pwd`/Git/git.config ~/.gitconfig

# Hammerspoon
echo Set Hammerspoon 
mkdir -p ~/.hammerspoon
rm -f ~/.hammerspoon/init.lua
ln -s `pwd`/Hammerspoon/init.lua ~/.hammerspoon/init.lua

# ZSH + oh-my-zsh
echo Set ZSH
rm -f ~/.zshrc
ln -s `pwd`/ZSH/zshrc ~/.zshrc
