" _/_/_/_/ Initialization  _/_/_/_/
filetype off " 一時的にファイルタイプ関連を無効化

" _/_/_/_/ Common settings _/_/_/_/
syntax enable
set background=dark
colorscheme solarized

set encoding=utf-8
set fileencodings=utf-8,sjis,euc
set fileformats=unix,dos,mac

set nobackup " バックアップを無効化
set number " 行番号を表示
set incsearch " インクリメンタルサーチ
set ignorecase smartcase " 小文字のみの検索時に大文字小文字を無視
set showmatch " 対応する括弧のハイライト表示
set showmode " モード表示
set title " 編集中のファイル名を表示
set ruler " ルーラーを表示
set expandtab " タブ入力を複数の空白入力に置き換え
set tabstop=2 " 画面上でタブ文字が占める幅
set shiftwidth=2 " 自動インデントの幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減
set scrolloff=10 " スクロール時に表示を10行確保
set whichwrap+=hl<>[] " 行頭行末から次の行へ移動
set backspace=indent,eol,start " バックスペース有効化
set ambiwidth=double " 曖昧幅の文字幅をダブルにする
set nofoldenable " 折りたたみ無効化
set clipboard=unnamed " ヤンク時にクリップボードにコピー
set mouse=a " マウス有効化
set vb t_vb= "ビープ音無効化

" 言語別インデント幅の設定
augroup vimrc
autocmd! FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd! FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

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
  set undolevels=1000
  set undoreload=10000
endif

" キーワード補完を常時起動
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

" # キーマッピング
" ESC連打でサーチハイライトを解除
nmap <silent> <Esc><Esc> :nohlsearch<LF>
" Ctrl+pで常にヤンクしたものを貼り付け
nmap <silent> <C-p> "0p 
" タグジャンプ先が複数ある場合は一覧を表示
nmap <C-]> g<c-]> 

" _/_/_/_/ Neo Bundle _/_/_/_/
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" >>>> My Bundles >>>>
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'dag/vim2hs'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'scrooloose/syntastic'
" <<<< My Bundles <<<<

call neobundle#end()

" >>>> Settings for my Bundles >>>>
" # nerdtree
let NERDTreeShowHidden = 1 " 隠しファイルの表示

" # vim-smartimput
" 括弧内のスペース処理を快適化
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')

" # vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=236

" 括弧内へのスペース挿入の快適化
call smartinput#define_rule({ 'at'    : '(\%#)',
                            \ 'char'  : '<Space>',
                            \ 'input' : '<Space><Space><Left>' })
call smartinput#define_rule({ 'at'    : '{\%#}',
                            \ 'char'  : '<Space>',
                            \ 'input' : '<Space><Space><Left>' })

" 括弧内のスペース除去の快適化
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

" # vim2hs
let g:haskell_conceal = 0

" # syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers = ['rubocop']
" <<<< Settings for my Bundles <<<<

NeoBundleCheck

" _/_/_/_/ Finalization _/_/_/_/
filetype plugin indent on " ファイルタイプ関連を再度有効化
