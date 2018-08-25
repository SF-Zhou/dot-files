#!/bin/sh

TASK="setup zsh"
CURRENT="$( cd "$(dirname "$0")" ; pwd -P )"

OH_MY_ZSH=$HOME/.oh-my-zsh
FUNCTIONS=$OH_MY_ZSH/functions
PLUGINS=$OH_MY_ZSH/custom/plugins
HIGHLIGHT=$PLUGINS/zsh-syntax-highlighting
PURE=$PLUGINS/pure

echo $TASK start
if ! test -d $OH_MY_ZSH; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HIGHLIGHT --depth 1
  git clone https://github.com/sindresorhus/pure.git $PURE --depth 1
fi

mkdir -p $FUNCTIONS
rm -f $FUNCTIONS/pure  && ln -s $PURE/pure.zsh  $FUNCTIONS/pure
rm -f $FUNCTIONS/async && ln -s $PURE/async.zsh $FUNCTIONS/async

rm -f $HOME/.zshrc && ln -s $CURRENT/.zshrc $HOME/.zshrc
echo $TASK finish
