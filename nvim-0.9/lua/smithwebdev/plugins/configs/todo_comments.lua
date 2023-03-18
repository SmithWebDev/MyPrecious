require('todo-comments').setup()

vim.keymap.set('n', ']t',          require('todo-comments').jump_next,          {desc = 'Next Todo Comment',                     silent = true })
vim.keymap.set('n', '[t',          require('todo-comments').jump_prev,          {desc = 'Previous Todo Comment',                 silent = true })


vim.keymap.set('n', '<leader>ft',  ':TodoTelescope<CR>',                        { desc = 'Todo Comments in Telescope',           silent = true })
vim.keymap.set('n', '<leader>fT',  ':TodoTrouble<CR>',                          { desc = 'Todo Trouble in Telescope',           silent = true })
vim.keymap.set('n', '<leader>fq',  ':TodoQuickFix<CR>',                         { desc = 'Todo Comments in QuickFixList',        silent = true })




-- keywords = [{'FIX', 'BUG', 'ISSUE'}, 'TODO', 'HACK', 'WARN', 'PERF', 'NOTE', 'TEST']
vim.keymap.set('n', '<leader>ftf', ':TodoTelescope keywords=FIX,BUG,ISSUE<CR>', { desc = 'Todo Fix/Bug/Issues in Telescope',     silent = true })
vim.keymap.set('n', '<leader>ftt', ':TodoTelescope keywords=TODO<CR>',          { desc = 'Todos only in Telescope',              silent = true })
vim.keymap.set('n', '<leader>fth', ':TodoTelescope keywords=HACK<CR>',          { desc = 'Todo Hacks in Telescope',              silent = true })
vim.keymap.set('n', '<leader>ftw', ':TodoTelescope keywords=WARN<CR>',          { desc = 'Todo Warnings in Telescope',           silent = true })
vim.keymap.set('n', '<leader>ftp', ':TodoTelescope keywords=PERF<CR>',          { desc = 'Todo Perf in Telescope',               silent = true })
vim.keymap.set('n', '<leader>ftn', ':TodoTelescope keywords=NOTE<CR>',          { desc = 'Todo Notes in Telescope',              silent = true })
vim.keymap.set('n', '<leader>ftT', ':TodoTelescope keywords=TEST<CR>',          { desc = 'Todo Tests in Telescope',              silent = true })

vim.keymap.set('n', '<leader>fqf', ':TodoQuickFix keywords=FIX,BUG,ISSUE<CR>',  { desc = 'Todo Fix/Bug/Issues in Quickfix List', silent = true })
vim.keymap.set('n', '<leader>fqt', ':TodoQuickFix keywords=TODO<CR>',           { desc = 'Todos only in Quickfix List',          silent = true })
vim.keymap.set('n', '<leader>fqh', ':TodoQuickFix keywords=HACK<CR>',           { desc = 'Todo Hacks in Quickfix List',          silent = true })
vim.keymap.set('n', '<leader>fqw', ':TodoQuickFix keywords=WARN<CR>',           { desc = 'Todo Warnings in Quickfix List',       silent = true })
vim.keymap.set('n', '<leader>fqp', ':TodoQuickFix keywords=PERF<CR>',           { desc = 'Todo Perf in Quickfix List',           silent = true })
vim.keymap.set('n', '<leader>fqn', ':TodoQuickFix keywords=NOTE<CR>',           { desc = 'Todo Notes in Quickfix List',          silent = true })
vim.keymap.set('n', '<leader>fqT', ':TodoQuickFix keywords=TEST<CR>',           { desc = 'Todo Tests in Quickfix List',          silent = true })
