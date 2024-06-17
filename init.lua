-- 矢印キーでなら行内を動けるように
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })

-- showbreaks
vim.o.showbreak = '↪'

-- 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
vim.api.nvim_set_keymap('n', 'あ', 'a', { noremap = true })
vim.api.nvim_set_keymap('n', 'い', 'i', { noremap = true })
vim.api.nvim_set_keymap('n', 'う', 'u', { noremap = true })
vim.api.nvim_set_keymap('n', 'お', 'o', { noremap = true })
vim.api.nvim_set_keymap('n', 'っd', 'dd', { noremap = true })
vim.api.nvim_set_keymap('n', 'っy', 'yy', { noremap = true })
vim.api.nvim_set_keymap('n', 'し”', 'ci"', { noremap = true })
vim.api.nvim_set_keymap('n', 'し’', "ci'", { noremap = true })

-- jjでエスケープ
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })
-- jkで保存してエスケープ
vim.api.nvim_set_keymap('i', 'jk', '<ESC>:w<CR>', { noremap = true, silent = true })

-- 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
vim.api.nvim_set_keymap('i', 'っj', '<ESC>', { noremap = true, silent = true })

-- 入力中のコマンドをステータスに表示する
vim.o.showcmd = true

-- 検索系
-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する
vim.o.ignorecase = true
-- 検索文字列に大文字が含まれている場合は区別して検索する
vim.o.smartcase = true
-- 検索文字列入力時に順次対象文字列にヒットさせる
vim.o.incsearch = true
-- 検索時に最後まで行ったら最初に戻る
vim.o.wrapscan = true
-- 検索語をハイライト表示
vim.o.hlsearch = true
-- ESC連打でハイライト解除
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', { noremap = true })
