################################################################################
# 1. Path (both)
#   1. store original path in first time
#   2. restore path in second time or later
if [ -z "$ORIGINAL_PATH" ]; then
  export ORIGINAL_PATH=$PATH
else
  export PATH=$ORIGINAL_PATH
fi


################################################################################
# 2. ZSH & oh-my-zsh (both)
#   1. load plugins
#   2. load pure theme
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-syntax-highlighting)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
source $ZSH/oh-my-zsh.sh

autoload -U promptinit
promptinit
prompt pure


################################################################################
# 3. Fasd (both)
FASD_CACHE="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$FASD_CACHE" -o ! -s "$fasd_cache" ]; then
  FASD_COMP="zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install"
  fasd --init posix-alias $FASD_COMP >| "$FASD_CACHE"
fi
source "$FASD_CACHE"
unset FASD_CACHE


################################################################################
# 4. RamDisk (Mac)
if ! test -d /t ; then
  diskutil erasevolume HFS+ 'RamDisk' `hdiutil attach -nomount ram://2097152`
  mkdir -p /t/Temp/Blog/public
  mkdir -p /t/Temp/Thesis
  mkdir -p /t/Temp/TMI
  mkdir -p /t/Temp/Quina
  mkdir -p /t/Temp/FPGA/RDAS/cache
fi


################################################################################
# 5. Alias (both)
alias q="exit"
alias c="cd ~"
alias d="cd .. && ll"
alias rd="rm -rf"
alias copy="xclip -sel clip"
alias paste="xclip -sel clip -o"


################################################################################
# 6. pyenv (both)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
