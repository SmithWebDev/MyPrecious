local M = {}

M.plugin = {
  'ThePrimeagen/harpoon',

  after = {
    'telescope.nvim',
  },

  config = function()
    require('telescope').load_extension('harpoon')
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    --keybindings
    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader>fj', ':Telescope harpoon marks<CR>',                       { desc = 'Show harpoon marks'})
    --nnoremap('<leader>jf', ':lua require("harpoon.mark").add_file()<CR>',        { desc = 'Mark Files to harpoon later'})
    --nnoremap('<leader>jj', ':lua require("harpoon.ui").nav_next()<CR>',          { desc = 'Navigates to next harpoon mark'})
    --nnoremap('<leader>jk', ':lua require("harpoon.ui").nav_prev()<CR>',          { desc = 'Navigates to previous harpoon mark'})
    --nnoremap('<leader>jm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = 'View all harpoon project marks'})

    nnoremap('<leader>jf', mark.add_file, { desc = 'Mark Files to harpoon later'})
    nnoremap('<leader>jm', ui.toggle_quick_menu, { desc = 'View all harpoon project marks'})
    nnoremap('<leader>jj', ui.nav_next,          { desc = 'Navigates to next harpoon mark'})
    nnoremap('<leader>jk', ui.nav_prev,          { desc = 'Navigates to previous harpoon mark'})
    nnoremap('<leader>j1', function() ui.nav_file(1) end, { desc = 'Go to 1st file in project list'})
    nnoremap('<leader>j2', function() ui.nav_file(2) end, { desc = 'Go to 2nd file in project list'})
    nnoremap('<leader>j3', function() ui.nav_file(3) end, { desc = 'Go to 3rd file in project list'})
    nnoremap('<leader>j4', function() ui.nav_file(4) end, { desc = 'Go to 4th file in project list'})
  end
}

return M
