"key mapping
nnoremap <silent><C-e> :NERDTreeToggle<CR>
inoremap <silent> jj <ESC>
nnoremap Y y$

set noundofile  "undoファイルを作らない
"Encode
"下記の指定は環境によって文字化けする可能性があるので適宜変更する
set encoding=UTF-8 "文字コードをUTF-8にする
set fileencoding=UTF-8 "文字コードをUTF-8にする
set termencoding=UTF-8 "文字コードをUTF-8にする
  
"File
set hidden    "ファイル変更中でも他のファイルを開けるようにする
set autoread    "ファイル内容が変更されると自動読み込みする
  
  
"Backup
set backupdir=$HOME/.vim/backup    "バックアップディレクトリを指定する
set browsedir=buffer    "ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set directory=$HOME/.vim/backup   "スワップファイルディレクトリを指定する
set history=1000    "履歴保存数
  
  
"Search
set incsearch    "インクリメンタルサーチを行う
set hlsearch    "検索結果をハイライトする
set ignorecase    "検索時に文字の大小を区別しない
set smartcase    "検索時に大文字を含んでいたら大小を区別する
set wrapscan    "検索をファイルの先頭へループする
  
  
"Input
set cindent "C言語のインデントに従って自動インデントを行う
set shiftwidth=4    "行頭での<Tab>の幅
set tabstop=4   "行頭以外での<Tab>の幅
set expandtab   "<Tab>の代わりに<Space>を挿入する
set softtabstop=4   "expandtabで<Tab>が対応する<Space>の数
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed "クリップボードを利用する

"general
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
let loaded_matchparen=1 
" ESC
"set timeout
"set timeoutlen=1000
"set ttimeout
"set ttimeoutlen=10
set foldmethod=syntax "折りたたみをさせない
set fdm=manual

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.vim/.')
" Required:
if dein#load_state('$HOME/.vim/.')
  call dein#begin('$HOME/.vim/.')

  " Add or remove your plugins here:
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/neocomplete.vim')
call dein#add('violetyk/neocomplete-php.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('w0ng/vim-hybrid')
call dein#add('pangloss/vim-javascript')
call dein#add('mattn/jscomplete-vim')
call dein#add('Konfekt/FastFold')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/unite.vim')
"call dein#add('Shougo/context_filetype.vim')
"call dein#add('osyo-manga/vim-precious')
call dein#add('posva/vim-vue')
"for C++
call dein#add('vim-jp/vim-cpp')
call dein#add('thinca/vim-quickrun')
call dein#add('justmao945/vim-clang')

call dein#end()
call dein#save_state()

endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"Completion ----------------------------------------------


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" 起動時に有効化
let g:neocomplete#enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplete#sources#syntax#min_keyword_length = 3
" 補完を表示する最小文字数
let g:neocomplete#auto_completion_start_length = 4 
" preview window を閉じない
let g:neocomplete#enable_auto_close_preview = 0

let g:neocomplete#max_keyword_width = 10000


" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Gvim 
let g:neocomplete#lock_iminsert = 1

"for php
let g:neocomplete_php_locale = 'ja'
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1



" Code snippets --------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif




"for vue 
"autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd FileType vue syntax sync fromstart
let g:jscomplete_use=['dom', 'moz', 'es6th']
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"for C++
augroup cpp-path
    autocmd!
    autocmd FileType cpp setlocal path=.,/usr/include/c++,/usr/local/include,/usr/lib/c++/v1
augroup END

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

let g:quickrun_config = get(g:, 'quickrun_config', {})
" vimproc を使って非同期に実行し，結果を quickfix に出力する
let g:quickrun_config._ = {
            \ 'runner' : 'vimproc',
            \ "hook/cd/enable" : 1,
            \ "hook/cd/directory" : "$HOME/Production/hobby/coding",
            \ 'outputter' : 'error',
            \ 'outputter/error/success' : 'buffer',
            \ 'outputter/error/error'   : 'quickfix',
            \ 'outputter/buffer/split'  : ':rightbelow 8sp',
            \ 'outputter/buffer/close_on_empty' : 1,
            \ 'runner/vimproc/updatetime' : 10,
            \ }

let g:quickrun_config.cpp = {
            \ 'command' : 'clang++',
            \ 'cmdopt'  : '-std=c++11 -Wall -Wextra',
            \ }


let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

let g:clang_exec = 'clang'
let g:clang_format_exec = 'clang-format'
" set clang options for vim-clang
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++ --pedantic-errors'


autocmd vimenter * NERDTree
