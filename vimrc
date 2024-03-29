" _/_/_/_/ Initialization  _/_/_/_/
filetype off " Disable filetype temporary; re-enable it at the end

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
set expandtab " Put white-spaces when type tab
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
set breakindent
set breakindentopt=shift:4
set nofoldenable " Disable text folding (Note: can be enabled by `zi`)
set foldmethod=indent " Create folds based on indent
set clipboard=unnamed,unnamedplus " Copy it to clipboard on yanking text
set spell " Enable spell check
set spelllang+=cjk " Exclude Japanese on spell check
set complete-=i " Do not scan included filesin completion
set completeopt=menuone,noinsert " Prevent automatic selection in completion
set mouse=a " Enable mouse
set laststatus=2 " Display status line always
set iskeyword+=- " Treat a hyphenated word as a single word
set vb t_vb= " Disable beep sound
set t_BE= " Prevent entering bracketed paste mode
set t_Co=256 " Use 256 color mode

" Copy yanked text to the clipboard on exit (for Linux)
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Open QuickFix on running vimgrep
autocmd QuickFixCmdPost *grep* cwindow

" Change background color on 81-100 characters of lines
execute "set colorcolumn=" . join(range(81,100), ',')

" Indent width by language
augroup languageSpecific
autocmd! FileType cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 breakindentopt=shift:8
autocmd! FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4 breakindentopt=shift:8
autocmd! FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 breakindentopt=shift:8
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

" Enable matchit (enable to jump to matching keyword by '%')
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" Run keyword completion on inputting characters
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "inoremap " . k . " " . k . "<C-N><C-P>"
endfor


" **************************************
" * Key mappings                       *
" **************************************

" Cancel search highlighting by typing ESC key twice
nnoremap <silent> <Esc><Esc> :nohlsearch<LF>
" Show a list when there are multiple targets of tag jumping
nnoremap <C-]> g<c-]>
" Enable omni completion by Ctrl+F
inoremap <C-F> <C-X><C-O>

" Keep the cursor at the current word when * is pressed
" ref: https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
nnoremap * :keepjumps normal! mi*`i<CR>

" Resize panes simply
nnoremap < <C-w><
nnoremap > <C-w>>
nnoremap + <C-w>+
nnoremap - <C-w>-

" Disable Ex mode
map Q <Nop>


" **************************************
" * Configuration for tab feature      *
" **************************************

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

" Visual @
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" _/_/_/_/ Vim Plug _/_/_/_/
call plug#begin()

" >>>> Plug-ins >>>>

" General
Plug 'joshdick/onedark.vim'
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'junegunn/fzf', { 'merged': 0 }
Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
Plug 'tpope/vim-surround'
Plug 'thinca/vim-qfreplace'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun'
Plug 'mileszs/ack.vim'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'cohama/lexima.vim'
Plug 'w0rp/ale'

" Language specific
Plug 'dag/vim2hs'
Plug 'slim-template/vim-slim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'keith/swift.vim'
" <<<< Plug-ins <<<<

call plug#end()

" >>>> Settings for plug-ins >>>>

" **************************************
" *  fzf.vim                           *
" **************************************

let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit'
\}

let g:fzf_history_dir = '~/.vim/fzf-history'

let g:fzf_layout = { 'down': '~35%' }
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment']
\}

" Run fzf.vim by Ctrl+P
noremap <C-p> :FZF<CR>

" Run fzf.vim when opening Vim without specifying any files
function FzfIfEmpty()
  if @% == ""
    " ref: https://github.com/junegunn/fzf.vim/issues/368#issuecomment-302150831
    call feedkeys(":FZF!\<CR>", 'n')
  endif
endfunction

augroup AutoFzf
  autocmd!
  autocmd VimEnter * call FzfIfEmpty()
augroup END


" **************************************
" *  NERDTree                          *
" **************************************

let NERDTreeShowHidden = 1 " Show hidden files


" **************************************
" * vim-indent-guides                  *
" **************************************

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=236


" **************************************
" * lightline                          *
" **************************************

let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
\   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ],
\ },
\ 'inactive': {
\   'left': [ [ 'relativepath' ] ],
\ },
\}

" " Copied from lightline#tab#filename(n) in lightline.vim/autoload/lightline/tab.vim
" " except that it adds a relative path from the root (the same as relativepath above)
" function! CustomTabname(n) abort
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
"   let _ = expand('#'.buflist[winnr - 1].'%:t') " % is added here
"   return _ !=# '' ? _ : '[No Name]'
" endfunction
" 
" " Copied from the default except for filename
" let g:lightline.tab_component_function = {
" \ 'filename': 'CustomTabname',
" \ 'modified': 'lightline#tab#modified',
" \ 'readonly': 'lightline#tab#readonly',
" \ 'tabnum': 'lightline#tab#tabnum'
" \}


" **************************************
" * vim-quickrun                       *
" **************************************

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


" **************************************
" * ack.vim                            *
" **************************************

let g:ackprg = 'rg --vimgrep --no-heading --hidden --glob "!.git/*"'

" <C-f> triggers ":Ack! " which doesn't open the first match
nnoremap <C-f> :Ack! 


" **************************************
" * Ale                                *
" **************************************

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
nnoremap H :ALEHover<CR>
nnoremap gd :ALEGoToDefinition<CR>


" **************************************
" * vim2hs                             *
" **************************************

let g:haskell_conceal = 0

" <<<< Settings for plug-ins <<<<

" _/_/_/_/ Enable per-project .vimrc _/_/_/_/
set exrc
set secure

" _/_/_/_/ Finalization _/_/_/_/
colorscheme onedark " Installed via the plugin
filetype plugin indent on " Re-enable filetype
