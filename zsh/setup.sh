#!/bin/sh

TASK="setup zsh"
CURRENT="$( cd "$(dirname "$0")" ; pwd -P )"

echo $TASK start
if ! test -d $HOME/.oh-my-zsh; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
rm -f $HOME/.zshrc && ln -s $CURRENT/.zshrc $HOME/.zshrc
echo $TASK finish
