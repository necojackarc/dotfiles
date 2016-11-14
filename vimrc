" _/_/_/_/ Initialization  _/_/_/_/
filetype off " 一時的にファイルタイプ関連を無効化

" _/_/_/_/ Common settings _/_/_/_/
set encoding=utf-8
set fileencodings=utf-8,sjis,euc
set fileformats=unix,dos,mac

set directory=~/.vim/swap " スワップファイルディレクトリ
set backupdir=~/.vim/backup " バックアップファイルディレクトリ
set number " 行番号を表示
set incsearch " インクリメンタルサーチ
set hlsearch " サーチ対象をハイライト表示
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
set virtualedit=block " 矩形選択でカーソル位置の制限を解除
set ambiwidth=single " 曖昧幅の文字幅をシングルにする (要: 端末設定と合わせる)
set nofoldenable " 折りたたみ無効化
set clipboard=unnamed " ヤンク時にクリップボードにコピー
set spelllang+=cjk " スペルチェックから日本語を除外
set mouse=a " マウス有効化
set vb t_vb= "ビープ音無効化

"81-100文字目の範囲の色を変更
execute "set colorcolumn=" . join(range(81,100), ',')

" 言語別インデント幅の設定
augroup vimrc
autocmd! FileType cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
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

" matchitの有効化
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" キーワード補完を常時起動
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "inoremap " . k . " " . k . "<C-N><C-P>"
endfor

" # キーマッピング
" ESC連打でサーチハイライトを解除
nnoremap <silent> <Esc><Esc> :nohlsearch<LF>
" Ctrl+pで常にヤンクしたものを貼り付け
nnoremap <silent> <C-p> "0p
" タグジャンプ先が複数ある場合は一覧を表示
nnoremap <C-]> g<c-]>
" ノーマルモードとヴィジュアルモードではセミコロンをコロンとして扱う
nnoremap ; :
vnoremap ; :

" # タブ関連を快適化
" Anywhere SID
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline
function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1] " first window, first appears
    let no = i " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]

" Tab jump: from [Tag]1 to [Tag]2
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor

set showtabline=2 " 常にタブラインを表示
noremap <silent> [Tag]c :tablast <bar> tabnew<CR>
noremap <silent> [Tag]x :tabclose<CR>
noremap <silent> [Tag]n :tabnext<CR>
noremap <silent> [Tag]p :tabprevious<CR>

" _/_/_/_/ Dein _/_/_/_/
if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')

" >>>> My plug-ins >>>>
call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
call dein#add('altercation/vim-colors-solarized')
call dein#add('vim-scripts/sudo.vim')
call dein#add('tpope/vim-surround')
call dein#add('scrooloose/nerdtree')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('kana/vim-smartinput')
call dein#add('cohama/vim-smartinput-endwise')
call dein#add('thinca/vim-quickrun')
call dein#add('dag/vim2hs')
call dein#add('derekwyatt/vim-scala')
call dein#add('kchmck/vim-coffee-script')
call dein#add('slim-template/vim-slim')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('scrooloose/syntastic')
" <<<< My plug-ins <<<<

call dein#end()

" >>>> Settings for my plug-ins >>>>
" # sudo.vim
command SudoE :e sudo:%
command SudoW :w sudo:%

" # nerdtree
let NERDTreeShowHidden = 1 " 隠しファイルの表示

" # vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=236

" # vim-smartimput
" 括弧内のスペース処理を快適化
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')

" 括弧内へのスペース挿入の快適化
call smartinput#define_rule({
\ 'at'    : '(\%#)',
\ 'char'  : '<Space>',
\ 'input' : '<Space><Space><Left>'
\})
call smartinput#define_rule({
\ 'at'    : '{\%#}',
\ 'char'  : '<Space>',
\ 'input' : '<Space><Space><Left>'
\})

" 括弧内のスペース除去の快適化
call smartinput#define_rule({
\ 'at'    : '( \%# )',
\ 'char'  : '<BS>',
\ 'input' : '<Del><BS>'
\})
call smartinput#define_rule({
\ 'at'    : '{ \%# }',
\ 'char'  : '<BS>',
\ 'input' : '<Del><BS>'
\})

" 改行時に行末スペースを除去
call smartinput#define_rule({
\ 'at'    : '\s\+\%#',
\ 'char'  : '<CR>',
\ 'input' : "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>"
\})

" # vim-smartinput-endwise
call smartinput_endwise#define_default_rules()

" # thinca/vim-quickrun
let g:quickrun_config = {
\ "_" : {
\   "runner" : "vimproc",
\   "runner/vimproc/updatetime" : 60,
\   "outputter" : "error",
\   "outputter/error/success" : "buffer",
\   "outputter/error/error"   : "quickfix",
\   "outputter/buffer/split" : ":botright 8sp",
\   "hook/time/enable" : 1
\ },
\ "cpp" : {
\   "type" : "cpp/g++"
\ },
\ "cpp/g++" : {
\   "cmdopt" : "-std=c++11 -Wall",
\ }
\}

" :r で QuickFix を閉じて QuickVim を実行
let g:quickrun_no_default_key_mappings = 1
nnoremap ,r :cclose<CR>:QuickRun -mode n<CR>
xnoremap ,r :<C-U>cclose<CR>gv:QuickRun -mode v<CR>

" QuickVim 実行時に <C-c> で強制終了
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" # vim2hs
let g:haskell_conceal = 0

" # vim-jsx
let g:jsx_ext_required = 0

" # syntastic
let g:syntastic_mode_map = { 'mode' : 'passive' }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
" <<<< Settings for my plug-ins <<<<

if dein#check_install()
  call dein#install()
endif

" _/_/_/_/ Finalization _/_/_/_/
syntax enable

set background=dark
colorscheme solarized

filetype plugin indent on " ファイルタイプ関連を再度有効化
