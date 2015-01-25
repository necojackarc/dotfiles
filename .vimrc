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

" 改行時にコメントしない
autocmd FileType * setlocal formatoptions-=ro

" _/_/_/_/ Neo Bundle _/_/_/_/
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()
NeoBundleCheck

" _/_/_/_/ Finalization _/_/_/_/
filetype plugin indent on " ファイルタイプ関連を再度有効化
