" _/_/_/_/ Initialization  _/_/_/_/
filetype off " 一時的にファイルタイプ関連を無効化

" _/_/_/_/ Common settings _/_/_/_/
syntax enable
set background=dark
colorscheme solarized

set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

set nobackup " バックアップファイルを作らない
set number " 行番号を表示
set incsearch " インクリメンタルサーチ
set ignorecase " 検索時に大文字小文字を無視
set showmatch " 対応する括弧のハイライト表示
set showmode " モード表示
set title " 編集中のファイル名を表示
set ruler " ルーラーを表示
set expandtab " タブ入力を複数の空白入力に置き換え
set tabstop=2 " 画面上でタブ文字が占める幅
set shiftwidth=2 " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減
set whichwrap+=hl<>[] " 行頭行末から次の行へ移動
set backspace=indent,eol,start "バックスペース有効化
set clipboard=unnamed " ヤンク時にクリップボードにコピー
set mouse=a " マウス有効化
set vb t_vb= "ビープ音無効化

" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,eol:¬,extends:»,precedes:«,nbsp:%

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" undofileの設定
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" ESC連打でサーチハイライトを解除
nmap <Esc><Esc> :nohlsearch<LF>

" _/_/_/_/ Neo Bundle _/_/_/_/
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" >>>> My Bundles >>>>
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim'
" <<<< My Bundles <<<<

call neobundle#end()

" >>>> Settings for my Bundles >>>>
" # nerdtree
let NERDTreeShowHidden = 1 " 隠しファイルの表示

" # vim-smartimput
" 括弧内のスペース処理を快適化
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')

" "()"へのスペース挿入と除去の快適化
call smartinput#define_rule({ 'at'    : '(\%#)',
                            \ 'char'  : '<Space>',
                            \ 'input' : '<Space><Space><Left>' })
call smartinput#define_rule({ 'at'    : '{\%#}',
                            \ 'char'  : '<Space>',
                            \ 'input' : '<Space><Space><Left>' })

" "{}"へのスペース挿入と除去の快適化
call smartinput#define_rule({ 'at'    : '( \%# )',
                            \ 'char'  : '<BS>',
                            \ 'input' : '<Del><BS>' })
call smartinput#define_rule({ 'at'    : '{ \%# }',
                            \ 'char'  : '<BS>',
                            \ 'input' : '<Del><BS>' })

" 改行時に行末スペースを除去
call smartinput#define_rule({ 'at'    : '\s\+\%#',
                            \ 'char'  : '<CR>',
                            \ 'input' : "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>" })

" # vim-smartinput-endwise
call smartinput_endwise#define_default_rules()

" # syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers = ['rubocop']

" # neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions' }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" <<<< Settings for my Bundles <<<<

NeoBundleCheck

" _/_/_/_/ Finalization _/_/_/_/
filetype plugin indent on " ファイルタイプ関連を再度有効化
