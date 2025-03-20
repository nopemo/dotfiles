-- =======================================
-- General Settings
-- =======================================

-- UTF-8設定
vim.o.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileformats = "unix,dos,mac"
vim.o.ambiwidth = "single"
vim.o.belloff = "all"
vim.o.mouse = "a"

-- バックアップ、スワップ、アンドゥディレクトリ設定
local cache_dir = vim.fn.expand("~/.cache/nvim")
local backupdir = cache_dir .. "/backup"
local swapdir = cache_dir .. "/swap"
local undodir = cache_dir .. "/undo"

for _, dir in ipairs({backupdir, swapdir, undodir}) do
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

vim.o.backupdir = backupdir
vim.o.directory = swapdir
vim.o.undodir = undodir

vim.o.backup = true
vim.o.undofile = true
vim.o.swapfile = true

-- =======================================
-- UI Settings
-- =======================================

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.ruler = true
vim.o.showcmd = true
vim.o.laststatus = 2
vim.o.list = true
vim.o.listchars = "tab:»-,space:･,trail:･,nbsp:%,eol:↲,extends:»,precedes:«"
vim.o.termguicolors = true

-- colorscheme desert
vim.cmd("colorscheme desert")

-- showbreak 設定
vim.o.showbreak = "↪"

-- =======================================
-- Clipboard
-- =======================================

vim.o.clipboard = "unnamedplus"

-- =======================================
-- Indentation
-- =======================================

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.api.nvim_create_autocmd("FileType", {
    pattern = "html,css",
    command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4"
})

-- =======================================
-- Search
-- =======================================

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true

-- ESC連打でハイライト解除
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- =======================================
-- History
-- =======================================

vim.o.history = 5000

-- =======================================
-- Diff settings
-- =======================================

vim.o.diffopt = vim.o.diffopt .. ",vertical,algorithm:histogram,indent-heuristic"

-- =======================================
-- Folding
-- =======================================

vim.o.foldmethod = "marker"
vim.o.foldlevel = 0

-- =======================================
-- Key mappings
-- =======================================

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 矢印キーでなら行内を動けるように
keymap("n", "<Down>", "gj", { noremap = true })
keymap("n", "<Up>", "gk", { noremap = true })

-- 日本語入力がオンのままでも使えるコマンド
keymap("n", "あ", "a", opts)
keymap("n", "い", "i", opts)
keymap("n", "う", "u", opts)
keymap("n", "お", "o", opts)
keymap("n", "っd", "dd", opts)
keymap("n", "っy", "yy", opts)
keymap("n", "し”", 'ci"', opts)
keymap("n", "し’", "ci'", opts)

-- jjでエスケープ
keymap("i", "jj", "<ESC>", opts)
-- jkで保存してエスケープ
keymap("i", "jk", "<ESC>:w<CR>", opts)
-- 日本語入力で「っj」と入力してもエスケープ
keymap("i", "っj", "<ESC>", opts)

-- ウィンドウ操作
keymap("n", "<C-w>h", "<C-w>h", opts)
keymap("n", "<C-w>j", "<C-w>j", opts)
keymap("n", "<C-w>k", "<C-w>k", opts)
keymap("n", "<C-w>l", "<C-w>l", opts)

-- ウィンドウ分割
keymap("n", "<leader>s", ":split<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- タブ操作
keymap("n", "[t", ":tabprevious<CR>", opts)
keymap("n", "]t", ":tabnext<CR>", opts)
keymap("n", "[T", ":tabfirst<CR>", opts)
keymap("n", "]T", ":tablast<CR>", opts)
keymap("n", "<leader>tn", ":tabnew<CR>", opts)

-- バッファ操作
keymap("n", "[b", ":bprevious<CR>", opts)
keymap("n", "]b", ":bnext<CR>", opts)
keymap("n", "[B", ":bfirst<CR>", opts)
keymap("n", "]B", ":blast<CR>", opts)

-- Beep 無効化
vim.o.belloff = "all"

-- gf → gF
keymap("n", "gf", "gF", opts)
-- x, X → "_x, "_X
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)

-- =======================================
-- VSCode-Specific Keybindings
-- =======================================
if vim.g.vscode then
    local function vscode_notify(command)
        return function()
            vim.fn.VSCodeNotify(command)
        end
    end

    vim.keymap.set("i", "jj", vscode_notify("vscode-neovim.escape"), opts)
    vim.keymap.set("i", "jk", function()
        vim.fn.VSCodeNotify("vscode-neovim.escape")
        vim.fn.VSCodeNotify("workbench.action.files.save")
    end, opts)
    
    vim.keymap.set("n", "<C-o>", vscode_notify("workbench.action.navigateBack"), opts)
    vim.keymap.set("n", "<C-i>", vscode_notify("workbench.action.navigateForward"), opts)
    vim.keymap.set("x", "ma", vscode_notify("editor.action.addSelectionToNextFindMatch"), opts)
    vim.keymap.set("n", "<leader>f", vscode_notify("editor.action.formatDocument"), opts)
end
