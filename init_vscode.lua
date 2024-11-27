-- init_vscode.lua

-- vscodeモジュールをロード
local vscode = require('vscode')

-- 複合エスケープキーの設定
-- "jj" でエスケープ
vscode.keymap.set('i', 'jj', function()
    vscode.action('vscode-neovim.escape')
end, { noremap = true, silent = true })

-- "jk" でエスケープ＆保存
vscode.keymap.set('i', 'jk', function()
    vscode.action('vscode-neovim.escape')
    vscode.action('workbench.action.files.save')
end, { noremap = true, silent = true })

-- ジャンプリストの統合
vim.keymap.set('n', '<C-o>', function()
    vscode.action('workbench.action.navigateBack')
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-i>', function()
    vscode.action('workbench.action.navigateForward')
end, { noremap = true, silent = true })

-- マルチカーソルのサポート
-- Visual Line モードで ma/mA を使用してマルチカーソルを開始
vim.keymap.set('x', 'ma', function()
    vscode.action('editor.action.addSelectionToNextFindMatch')
end, { noremap = true, silent = true })

vim.keymap.set('x', 'mA', function()
    vscode.action('editor.action.addSelectionToNextFindMatch')
    -- ここに追加の動作を記述可能
end, { noremap = true, silent = true })

-- Visual Block モードで mi/mI を使用してマルチカーソルを開始
vim.keymap.set('x', 'mi', function()
    vscode.action('editor.action.insertCursorAbove')
end, { noremap = true, silent = true })

vim.keymap.set('x', 'mI', function()
    vscode.action('editor.action.insertCursorBelow')
end, { noremap = true, silent = true })

-- その他のカスタムコマンドや設定
-- 例: ファイルのフォーマット
vim.keymap.set('n', '<leader>f', function()
    vscode.action('editor.action.formatDocument')
end, { noremap = true, silent = true })

-- 例: 定義へジャンプ
vim.keymap.set('n', 'gd', function()
    vscode.action('editor.action.revealDefinition')
end, { noremap = true, silent = true })

-- 例: コメントのトグル
vim.keymap.set('n', '<leader>c', function()
    vscode.action('editor.action.commentLine')
end, { noremap = true, silent = true })

-- NeovimのクリップボードをVSCodeのクリップボードと連携
vim.g.clipboard = {
    name = "vscode",
    copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
    },
    paste = {
        ["+"] = "powershell.exe Get-Clipboard",
        ["*"] = "powershell.exe Get-Clipboard",
    },
    cache_enabled = 0,
}

-- VSCodeの通知をNeovimの通知に設定
vim.notify = vscode.notify
