
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
