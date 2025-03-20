-- Escape with "jj"
vim.keymap.set('i', 'jj', function()
    vim.fn.VSCodeNotify('vscode-neovim.escape')
end, { noremap = true, silent = true })

-- Escape and save with "jk"
vim.keymap.set('i', 'jk', function()
    vim.fn.VSCodeNotify('vscode-neovim.escape')
    vim.fn.VSCodeNotify('workbench.action.files.save')
end, { noremap = true, silent = true })

-- Jump list integration
vim.keymap.set('n', '<C-o>', function()
    vim.fn.VSCodeNotify('workbench.action.navigateBack')
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-i>', function()
    vim.fn.VSCodeNotify('workbench.action.navigateForward')
end, { noremap = true, silent = true })

-- Multicursor support
vim.keymap.set('x', 'ma', function()
    vim.fn.VSCodeNotify('editor.action.addSelectionToNextFindMatch')
end, { noremap = true, silent = true })

-- Additional custom commands (e.g., file formatting)
vim.keymap.set('n', '<leader>f', function()
    vim.fn.VSCodeNotify('editor.action.formatDocument')
end, { noremap = true, silent = true })
