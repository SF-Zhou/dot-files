################################################################################
# 1. Path
#   1. store original path in first time
#   2. restore path in second time or later
if [ -z "$ORIGINAL_PATH" ]; then
  export ORIGINAL_PATH=$PATH
else
  export PATH=$ORIGINAL_PATH
fi


################################################################################
# 2. ZSH & antigen
#   1. load oh-my-zsh
#   2. load bundle
#   3. load theme

export LC_ALL=en_US.UTF-8
ANTIGEN=$HOME/.antigen.zsh
if [ ! -f $ANTIGEN ]; then
  curl -L git.io/antigen > $ANTIGEN
fi
source $HOME/.antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle clvv/fasd fasd
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

# If you prefer to RamDisk, you can create a symbol-link [/t] to link [/Volumes/RamDisk]
# The followed command will create a RamDisk with 1G RAM in default.
if [ "$(uname 2> /dev/null)" = "Darwin" ] && [ -L /t ] && [ ! -d /t ]; then
  diskutil erasevolume HFS+ 'RamDisk' `hdiutil attach -nomount ram://2097152`
  mkdir -p /t/Temp/Blog/public
fi

if [ "$(uname 2> /dev/null)" = "Linux" ] && which xcape > /dev/null 2>&1; then
  pgrep xcape > /dev/null || xcape -e "Caps_Lock=Escape;Control_L=Escape;Control_R=Escape"
fi


################################################################################
# 5. Alias
alias c="cd ~"
alias d="cd .. && ll"
alias rd="rm -rf"

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  alias copy="xclip -sel clip"
  alias paste="xclip -sel clip -o"
fi

if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  alias copy="pbcopy"
  alias paste="pbpaste"
fi


################################################################################
# 6. Others
#   1. Mac homebrew-bottles, jenv
#   2. Private secret part
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  # HomeBrew Bottle
  export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
  # JEnv
  export JENV_ROOT="/usr/local/opt/jenv"
  if which jenv > /dev/null; then eval "$(jenv init -)"; fi
fi

[ -f $HOME/.secret.sh ] && source $HOME/.secret.sh
