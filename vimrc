" _/_/_/_/ Initialization  _/_/_/_/
filetype off " Disable filetype temporary

" _/_/_/_/ Common settings _/_/_/_/
syntax enable

set encoding=utf-8
set fileencodings=utf-8,sjis,euc
set fileformats=unix,dos,mac

set directory=~/.vim/swap " Directory for swap files
set backupdir=~/.vim/backup " Directory for backup files
set number " Show line numbers
set incsearch " Enable incremental search
set hlsearch " Highlight search targets
set ignorecase smartcase " Ignore case when searching only with small letters
set showmatch " Highlight matching brackets
set showmode " Show current mode of Vim
set title " Show editing file title
set ruler " Show ruler
set expandtab " Put whitespace when type tab
set tabstop=2 " Tab width
set shiftwidth=2 " Indent width
set softtabstop=2 " Moving width of cursor to consecutive spaces when type tab, backspace, etc.
set autoindent " Follow indent width of the previous line when starting a new line
set smartindent " Indent nicely for C-like programs when starting a new line
set scrolloff=10 " Show 10 lines below cursor when scrolling
set backspace=indent,eol,start " Enable backspace key
set virtualedit=block " Remove the cursor restriction on rectangular selection
set ambiwidth=single " Make ambiguous width single (Note: Coordinate settings of Vim and terminal)
set wrap " Wrap long lines
set nofoldenable " Disable text folding (Note: can be enabled by `zi`)
set foldmethod=indent " Create folds based on indent
set clipboard=unnamed,unnamedplus " Copy it to clipboard on yanking text
set spell " Enable spell check
set spelllang+=cjk " Exclude Japanese on spell check
set completeopt=menuone,noinsert " Prevent automatic selection in completion
set mouse=a " Enable mouse
set laststatus=2 " Display status line always
set iskeyword+=- " Treat a hyphenated word as a single word
set vb t_vb= " Disable beep sound
set t_BE= " Prevent entering bracketed paste mode

" Set color mode to 256
if !has('gui_running')
  set t_Co=256
endif

" Copy yanked text to the clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Open QuickFix on running vimgrep
autocmd QuickFixCmdPost *grep* cwindow

" Change background color on 81-100 characters of lines
execute "set colorcolumn=" . join(range(81,100), ',')

" Indent width by language
augroup vimrc
autocmd! FileType cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd! FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd! FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" Show invisible characters
set list
set listchars=tab:»-,trail:-,eol:¬,extends:»,precedes:«,nbsp:%

" Show zenkaku whitespace
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" Configure undo feature
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

" Enable matchit
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" Run keyword completion on inputting characters
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "inoremap " . k . " " . k . "<C-N><C-P>"
endfor

" # Key mappings
" Cancel search highlighting by typing ESC key twice
nnoremap <silent> <Esc><Esc> :nohlsearch<LF>
" Show a list when there are multiple targets of tag jumping
nnoremap <C-]> g<c-]>
" Enable omni completion by Ctrl+F
inoremap <C-F> <C-X><C-O>

" # Configure tab feature
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
nnoremap [Tab] <Nop>
nmap t [Tab]

" Tab jump: from [Tab]1 to [Tab]2
for n in range(1, 9)
  execute 'nnoremap <silent> [Tab]'.n ':<C-u>tabnext'.n.'<CR>'
endfor

set showtabline=2 " Show tab line
noremap <silent> [Tab]c :tablast <bar> tabnew<CR>
noremap <silent> [Tab]x :tabclose<CR>
noremap <silent> [Tab]n :tabnext<CR>
noremap <silent> [Tab]p :tabprevious<CR>

" _/_/_/_/ Dein _/_/_/_/
if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')

" >>>> Plug-ins >>>>
" General
call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
call dein#add('altercation/vim-colors-solarized')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('vim-scripts/sudo.vim')
call dein#add('tpope/vim-surround')
call dein#add('thinca/vim-qfreplace')
call dein#add('scrooloose/nerdtree')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('kana/vim-smartinput')
call dein#add('cohama/vim-smartinput-endwise')
call dein#add('itchyny/lightline.vim')
call dein#add('w0rp/ale')
call dein#add('thinca/vim-quickrun')
call dein#add('mileszs/ack.vim')
call dein#add('mbbill/undotree')

" Language specific
call dein#add('dag/vim2hs')
call dein#add('slim-template/vim-slim')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('moll/vim-node')
call dein#add('mustache/vim-mustache-handlebars')
" <<<< Plug-ins <<<<

call dein#end()

" >>>> Settings for plug-ins >>>>
" # vim-colors-solarized
let g:solarized_termtrans=1

set background=dark
colorscheme solarized

" # ctrlp.vim
let g:ctrlp_buffer_func = {
\ 'enter': 'CtrlPEnter',
\ 'exit': 'CtrlPLeave',
\}

" Hide status line on launching CtrlP
function! CtrlPEnter()
  set laststatus=0
endfunction

" Show status line on closing CtrlP
function! CtrlPLeave()
  set laststatus=2
endfunction

" Run CtrlP when opening Vim without specifying any files
function CtrlPIfEmpty()
  if @% == ""
    CtrlP ./
  endif
endfunction

augroup AutoCtrlP
  autocmd!
  autocmd VimEnter * call CtrlPIfEmpty()
augroup END

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp)|(\.(swp|ico|git|svn))$'

" # sudo.vim
command SudoE :e sudo:%
command SudoW :w sudo:%

" # nerdtree
let NERDTreeShowHidden = 1 " Show hidden files

" # vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=236

" # vim-smartimput
" Handel spaces inside parentheses nicely
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')

" Insert spaces inside parentheses nicely
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

" Delete spaces inside parentheses nicely
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

" Remove trailing spaces when starting a new line
call smartinput#define_rule({
\ 'at'    : '\s\+\%#',
\ 'char'  : '<CR>',
\ 'input' : "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>"
\})

" # vim-smartinput-endwise
call smartinput_endwise#define_default_rules()

" # lightline
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
\   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ],
\ },
\ 'inactive': {
\   'left': [ [ 'relativepath' ] ],
\ },
\}

" # ale
let g:ale_linters = {
\ 'javascript': ['eslint', 'tsserver'],
\ 'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop'],
\}

" Key mappings
nnoremap R :ALEFindReferences<CR>
nnoremap S :ALEHover<CR>
nnoremap gd :ALEGoToDefinition<CR>

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

" :r closes QuickFix then runs QuickVim
let g:quickrun_no_default_key_mappings = 1
nnoremap ,r :cclose<CR>:QuickRun -mode n<CR>
xnoremap ,r :<C-U>cclose<CR>gv:QuickRun -mode v<CR>

" <C-c> kills running QuickVim forcibly
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" # ack.vim
let g:ackprg = 'rg --vimgrep --no-heading'

" # vim2hs
let g:haskell_conceal = 0

" # vim-jsx
let g:jsx_ext_required = 0

" <<<< Settings for plug-ins <<<<

if dein#check_install()
  call dein#install()
endif

" _/_/_/_/ Finalization _/_/_/_/
filetype plugin indent on " Re-enable filetype
