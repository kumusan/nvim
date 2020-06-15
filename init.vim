set t_Co=256
set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed "yank clipboard
set hls "search highlight
set ruler
set wildmenu
set showcmd
set wrap
set infercase "補完　大文字小文字
set ignorecase "search　大文字小文字
set showmatch
set textwidth=0

inoremap <C-h> <C-w>h
inoremap <C-j> <C-w>j
inoremap <C-k> <C-w>k
inoremap <C-l> <C-w>l

inoremap <silent> jj <ESC>:<C-u>w<CR>:" InsertMode抜けて保存

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Pluginディレクトリのパス    
let s:dein_dir = expand('~/.vim/dein')    
" dein.vimのパス    
let s:dein_repo_dir = s:dein_dir .  '/repos/github.com/Shougo/dein.vim'    
" tomlのディレクトリへのパス    
let s:toml_dir = expand('~/.config/nvim')

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

  call dein#add('posva/vim-vue')
  call dein#add('prettier/vim-prettier')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('mtscout6/syntastic-local-eslint.vim')
  call dein#add('digitaltoad/vim-pug')
  call dein#add('dNitro/vim-pug-vomplete')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

