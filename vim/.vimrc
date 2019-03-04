noremap <silent> ;; :nohl<cr><esc>
set timeout timeoutlen=200 ttimeoutlen=0

map P "+p
map Y ggVG"+ygg
vmap Y "+y
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

let mapleader=','
map <leader>d :bd<cr>

set nocompatible
set backspace=indent,eol,start
set number
set numberwidth=1
set ruler
set showcmd
set history=1000
set nobackup
set noswapfile
set autochdir
set autoindent
set cindent
set t_Co=256
set incsearch
set scrolloff=3
set hls
set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
syntax on
syntax enable
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>


""" auto install plugin
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"""" plugin begin
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

Plug 'tpope/vim-commentary'
nmap <BS> gcc
vmap <BS> gc

Plug 'altercation/vim-colors-solarized'

call plug#end()
"""" plugin end


set background=dark
silent! colorscheme solarized
