set t_Co=256
set encoding =UTF-8
set number
set autoindent
set tabstop=2
set shiftwidth=4
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
syntax enable
set pumblend=5
set termguicolors
colorscheme molokai
hi Normal guibg=NONE
hi LineNr guibg=NONE
hi VertSplit guibg=NONE
hi Special guibg=NONE
hi Identifier guibg=NONE

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap <C-]> <Space><Space>:%s/<C-r>///g<Left><Left>
inoremap <silent> jj <ESC>:<C-u>w<CR>:" 保存

map <C-t> :NERDTreeToggle<CR>

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

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0}) " ここエラー
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" For conceal markers.

filetype plugin indent on
set statusline=%F%r%h%=
" powerline enable

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme = 'violet'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" goの設定
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" 表示に関する設定
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

let g:ale_fix_on_save = 1
let b:ale_fixers = ['prettier', 'eslint']
let b:ale_linter_aliases = ['javascript', 'vue']
let b:ale_linter_aliases = ['css', 'javascript']
let b:ale_linters = ['eslint', 'vls']
let b:ale_linters = ['stylelint', 'eslint']

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint', 'vls'],
\   'jsx': ['stylelint', 'eslint'],
\   'json': ['jsonlint'],
\}
let g:ale_linter_aliases = {
\   'vue': ['vue', 'javascript'],
\   'jsx': ['css', 'javascript'],
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_completion_tsserver_autoimport = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEWarning ctermbg=DarkMagenta

" javascript
augroup MyVimrc
  autocmd!
augroup END
function! EnableJavascript()
  " Setup used libraries
  let g:used_javascript_libs = 'jquery,underscore,react,flux,jasmine,d3'
  let b:javascript_lib_use_jquery = 1
  let b:javascript_lib_use_underscore = 1
  let b:javascript_lib_use_react = 1
  let b:javascript_lib_use_flux = 1
  let b:javascript_lib_use_jasmine = 1
  let b:javascript_lib_use_d3 = 1
endfunction
autocmd MyVimrc FileType javascript,javascript.jsx call EnableJavascript()
autocmd BufEnter *.tsx,*.jsx set filetype=typescript.tsx
let g:javascript_plugin_jsdoc = 1

" dark red
hi tsxTagName guifg=#E06C75

hi MatchParen ctermbg=1
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap " ""<Left>

let g:WebDevIconsUnicodeDecorateFolderNodes = 1 

"json
set conceallevel=0
autocmd Filetype json setl conceallevel=0
let g:vim_json_syntax_conceal = 0
autocmd BufNewFile,BufRead *.json set filetype=json
let g:syntastic_json_checkers=['jsonlint']
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

au BufNewFile,BufRead *.vugu setf html
au BufNewFile,BufRead *.v setf golang

