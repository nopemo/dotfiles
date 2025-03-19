" General Settings
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac
set ambiwidth=single
set belloff=all
set mouse=a

" Backup, Swap, Undo
let s:cache_dir = expand('~/.cache/vim')
let s:backupdir = s:cache_dir . '/backup'
let s:swapdir = s:cache_dir . '/swap'
let s:undodir = s:cache_dir . '/undo'

for dir in [s:backupdir, s:swapdir, s:undodir]
  if !isdirectory(dir)
    call mkdir(dir, 'p')
  endif
endfor

execute 'set backupdir=' . s:backupdir
execute 'set directory=' . s:swapdir
execute 'set undodir=' . s:undodir

set backup
set undofile
set swapfile

" Display
set number
set relativenumber
set cursorline
set nowrap
set ruler
set showcmd
set laststatus=2
set list
set listchars=tab:»-,space:･,trail:･,nbsp:%,eol:↲,extends:»,precedes:«
colorscheme desert
set t_Co=256

" Clipboard
set clipboard=unnamedplus

" Indentation
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

autocmd FileType html,css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" History
set history=5000

" Diff settings
set diffopt+=vertical,algorithm:histogram,indent-heuristic

" Folding
set foldmethod=marker
set foldlevel=0

" Key mappings
nnoremap gf gF
nnoremap x "_x
nnoremap X "_X
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap <Down> gj
nnoremap <Up> gk

" Insert Mode Shortcut
inoremap <C-j> <Esc>
inoremap jj <ESC>
inoremap jk <ESC>:w<CR>

" Window Controls
nnoremap <C-w>h <C-w>h
nnoremap <C-w>j <C-w>j
nnoremap <C-w>k <C-w>k
nnoremap <C-w>l <C-w>l

" Window Split Shortcuts
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>

" Tab Controls
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap [T :tabfirst<CR>
nnoremap ]T :tablast<CR>
nnoremap <leader>tn :tabnew<CR>

" Disable beeps
set belloff=all

" Buffer Controls
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :bprevious<CR>
