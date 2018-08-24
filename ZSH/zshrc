################################################################################
# 1. Path
#   1. store original path in first time
#   2. restore path in second time or later
if [ -z "$ORIGINAL_PATH" ]; then
  export ORIGINAL_PATH=$PATH
else
  export PATH=$ORIGINAL_PATH
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH=/Users/sfzhou/.oh-my-zsh
ZSH_THEME=""

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Fasd
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# RamDisk
if ! test -d /t ; then
    diskutil erasevolume HFS+ 'RamDisk' `hdiutil attach -nomount ram://2097152`
    mkdir -p /t/Temp/Blog/public
    mkdir -p /t/Temp/Thesis
    mkdir -p /t/Temp/TMI
    mkdir -p /t/Temp/Quina
    mkdir -p /t/Temp/FPGA/RDAS/cache
fi

# Alias
alias q="exit"
alias c="cd ~"
alias d="cd .. && ll"
alias rd="rm -rf"

alias run="/usr/local/bin/python3 /Users/sfzhou/Code/07_Python/07_CppLab/run.py"

autoload -U promptinit
promptinit
prompt pure

alias copy="xclip -sel clip"
alias paste="xclip -sel clip -o"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
