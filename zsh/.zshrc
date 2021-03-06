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
ANTIGEN=$HOME/.antigen.git/bin/antigen.zsh
if [ ! -f $ANTIGEN ]; then
  git clone https://github.com/zsh-users/antigen.git --depth 1 $HOME/.antigen.git
fi
source $ANTIGEN
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

# If you prefer to RamDisk, you can create a mark file ~/.ramdisk,
# then the followed command will create a RamDisk with 1G RAM in default.
if [ "$(uname 2> /dev/null)" = "Darwin" ] && [ -f $HOME/.ramdisk ] && [ ! -d /Volumes/RamDisk ]; then
  diskutil erasevolume HFS+ 'RamDisk' `hdiutil attach -nomount ram://2097152`
  mkdir -p /Volumes/RamDisk/Temp/Blog/public
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

[ -f $HOME/.secret.sh ] && source $HOME/.secret.sh
