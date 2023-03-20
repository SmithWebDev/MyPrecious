vim.keymap.set('n', '<leader>sc', ':SnipClose<CR>',      { desc = 'Remove SnipRun code comments', silent = true })
vim.keymap.set('n', '<leader>si', ':SnipInfo<CR>',      { desc = 'SnipRun Info', silent = true })
vim.keymap.set('n', '<leader>sr', ':SnipRun<CR>',      { desc = 'Runs code block in editor', silent = true })
vim.keymap.set('v', '<leader>sr', ":'<,'>SnipRun<CR>", { desc = 'Runs code block in editor', silent = true })
