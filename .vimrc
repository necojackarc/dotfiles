syntax enable
set background=dark
colorscheme solarized

set encoding=utf-8 "デフォルト文字コード
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis "自動判別用文字コード
set fileformats=unix,dos,mac "自動判別用改行コード

set nobackup "バックアップファイルを作らない
set number "行番号を表示
set incsearch "インクリメンタルサーチ
set ignorecase "検索時に大文字小文字を無視
set showmatch "対応する括弧のハイライト表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーを表示
set expandtab "タブ入力を複数の空白入力に置き換え
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減
set clipboard+=unnamed "ヤンク時にクリップボードにコピー

"不可視文字の表示
set list
set listchars=tab:»-,trail:-,eol:¬,extends:»,precedes:«,nbsp:%

"全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"undofileの設定
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

"ESC連打でサーチハイライトを解除
nmap <Esc><Esc> :nohlsearch<LF>

"カーソルを自動的に()の中へ
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
imap // //<left>
