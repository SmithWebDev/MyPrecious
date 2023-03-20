local spread = require('spread')

vim.keymap.set('n', '<leader>ssj', spread.out, { desc = 'Split to multiple lines', silent = true })
vim.keymap.set('n', '<leader>ssk', spread.combine, { desc = 'Combine to single line', silent = true })
