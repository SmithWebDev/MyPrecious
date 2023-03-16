local ror = require('ror')
ror.setup({
})

local rails_commands = require('ror.commands')

vim.keymap.set('n', '<leader><leader>R', rails_commands.list_commands, { desc = 'List of Rails Commands'})
