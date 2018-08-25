"  VIM基本配置==========================================================

noremap <silent> ;; :nohl<cr><esc>

set timeout timeoutlen=200 ttimeoutlen=0

map Y ggVG"+ygg
vmap Y "+y
map P "+p

noremap <cr> o<esc>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" vp doesn't replace paste buffer
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

" =============================================

" 关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
" 配置backspace键工作方式
set backspace=indent,eol,start

" 显示行号
set number
set numberwidth=1
" 设置在编辑过程中右下角显示光标的行列信息
set ruler
" 当一行文字很长时取消换行
" set nowrap

" 在状态栏显示正在输入的命令
set showcmd

" 设置历史记录条数
set history=1000

" 设置取消备份 禁止临时文件生成
set nobackup
set noswapfile
set autochdir

" 设置C/C++方式自动对齐
set autoindent
set cindent

" 开启语法高亮功能
syntax enable
syntax on

" 指定配色方案为256色
set t_Co=256

" 设置搜索时忽略大小写
" set ignorecase
" 增长式高亮
set incsearch
" 滚动时保留三行
set scrolloff=3
" 高亮
set hls

" 设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a

" 设置Tab宽度
set tabstop=2
" 设置自动对齐空格数
set shiftwidth=2
" 设置按退格键时可以一次删除2个空格
set softtabstop=2
" 设置按退格键时可以一次删除2个空格
set smarttab

" 将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab
%retab!

" 设置编码方式
set encoding=utf-8
" 自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 检测文件类型
filetype on
" 针对不同的文件采用不同的缩进方式
filetype indent on
" 允许插件
filetype plugin on
" 启动智能补全
filetype plugin indent on

" turn next file
map <C-n> :bn<CR>

" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"  vundle配置===============================================================
set nocompatible
filetype off
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
nnoremap <leader>gd :Gdiff<cr>

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = 's'

Plugin 'ctrlp.vim'           " Find File Fast
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/_site/*

Plugin 'bufexplorer.zip'
Plugin 'rizzatti/dash.vim'

Plugin 'skywind3000/asyncrun.vim'

Plugin 'wildfire.vim'        " Space to Select
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

Plugin 'commentary.vim'      " Add Comment
nmap <BS> gcc
vmap <BS> gc

Plugin 'https://github.com/Lokaltog/vim-powerline.git'
set laststatus=2
" let g:Powerline_symbols = 'fancy'

Plugin 'The-NERD-tree'
nmap <leader>nt :NERDTree<cr>
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1

Plugin 'wting/rust.vim' 
Plugin 'indentpython.vim'
Plugin 'posva/vim-vue'

" code complete
Bundle 'Shougo/neocomplcache'
" Bundle 'Shougo/neosnippet'
" Bundle 'Shougo/neosnippet-snippets'
" Bundle 'honza/vim-snippets'

" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

set completeopt-=preview

call vundle#end()
filetype plugin indent on

" =============================================

" Plugin 'Solarized'
Plugin 'SF-Zhou/vim-colors-solarized'
set background=dark
colorscheme solarized

nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" Change cursor shape between insert and normal mode in iTerm2.app
" if $TERM_PROGRAM =~ "iTerm"
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
" endif

set showcmd
if has('gui_running')
    set gcr=a:block-blinkon0
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guioptions-=T
    set guifont=Microsoft_Yahei_Mono:h16
    set background=dark

    set background=dark
    colorscheme solarized
endif
