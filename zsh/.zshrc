################################################################################
# 1. Path
#   1. store original path in first time
#   2. restore path in second time or later
#   3. CUDA and other software path
if [ -z "$ORIGINAL_PATH" ]; then
  export ORIGINAL_PATH=$PATH
else
  export PATH=$ORIGINAL_PATH
fi

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  export CUDA_HOME=/usr/local/cuda-9.0
  export PATH=$CUDA_HOME/bin:$PATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
  export PYTHONPATH=$HOME/Code/VPU/caffe/python:$PYTHONPATH

  # SRILM
  export PATH=$HOME/Code/Productivity/SRILM/bin:$PATH
  export PATH=$HOME/Code/Productivity/SRILM/bin/i686-m64:$PATH
fi


################################################################################
# 2. ZSH & antigen
#   1. load oh-my-zsh
#   2. load bundle
#   3. load theme

ANTIGEN=$HOME/.antigen.zsh
if [ ! -f $ANTIGEN ]; then
  curl -L git.io/antigen > $ANTIGEN
fi
source $HOME/.antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle clvv/fasd fasd
antigen bundle SF-Zhou/upload_to_seafile
antigen bundle packruler/zsh-git-scripts
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply


################################################################################
# 3. Fasd
FASD_CACHE="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$FASD_CACHE" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$FASD_CACHE"
fi
source "$FASD_CACHE"
unset FASD_CACHE


################################################################################
# 4. Platform Specific
#   1. RamDisk (Mac)
#   2. Xcape (Ubuntu)
if [ "$(uname 2> /dev/null)" = "Darwin" ] && [ ! -d /t ]; then
  diskutil erasevolume HFS+ 'RamDisk' `hdiutil attach -nomount ram://2097152`
  mkdir -p /t/Temp/Blog/public
  mkdir -p /t/Temp/Thesis
  mkdir -p /t/Temp/TMI
  mkdir -p /t/Temp/Quina
  mkdir -p /t/Temp/FPGA/RDAS/cache

fi

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  pgrep xcape > /dev/null || xcape -e "Caps_Lock=Escape;Control_L=Escape;Control_R=Escape"
fi


################################################################################
# 5. Alias
alias q="exit"
alias c="cd ~"
alias d="cd .. && ll"
alias rd="rm -rf"
alias copy="xclip -sel clip"
alias paste="xclip -sel clip -o"

if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  alias copy="pbcopy"
  alias paste="pbpaste"
fi


################################################################################

# 6. Others
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  # MiniConda3
  export PATH=/usr/local/miniconda3/bin:"$PATH"
  # HomeBrew Bottle
  export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
  # JEnv
  export JENV_ROOT="/usr/local/opt/jenv"
  if which jenv > /dev/null; then eval "$(jenv init -)"; fi
fi
