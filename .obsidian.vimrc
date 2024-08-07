imap jj <Esc>
nmap <Down> gj
nmap <Up>   gk

" showbreaks
set showbreak=↪

" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nmap あ a
nmap い i
nmap う u
nmap お o
nmap っd dd
nmap っy yy
" ""の中身を変更する
nmap し” ci"
" ''の中身を変更する
nmap し’ ci'
" jjでエスケープ
imap <silent> jj <Esc>
" jkで保存してエスケープ
imap <silent> jk <Esc>:w<CR>

" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
imap <silent> っj <ESC>


" 入力中のコマンドをステータスに表示する
set showcmd


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set igcase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
