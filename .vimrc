" Enable movement within a line with arrow keys
nnoremap <Down> gj
nnoremap <Up>   gk

" Show breaks in long lines
"set showbreak=↪

" Escape insert mode with 'jj'
inoremap jj <ESC>
" Save and escape with 'jk'
inoremap jk <ESC>:w<CR>

" Display the command being typed in the status line
set showcmd

" Search settings
" Ignore case when searching if the search string is lowercase
set ignorecase
" Respect case when searching if the search string contains uppercase letters
set smartcase
" Incremental search - highlight matches as you type
set incsearch
" Wrap around the search when reaching the end of the file
set wrapscan
" Highlight search matches
set hlsearch
" Cancel search highlighting with double ESC
nmap <Esc><Esc> :nohlsearch<CR><Esc>
