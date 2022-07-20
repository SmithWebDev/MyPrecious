local M = {}

M.plugin = {
  'ThePrimeagen/harpoon',

  after = {
    'telescope.nvim',
  },

  config = function()
    require('telescope').load_extension('harpoon')

    --keybindings
    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader>fj', ':Telescope harpoon marks<CR>', { desc = 'Show harpoon marks'})
    nnoremap('<leader>jf', ':lua require("harpoon.mark").add_file()<CR>', { desc = 'Mark Files to revisit later'})
    nnoremap('<leader>jj', ':lua require("harpoon.ui").nav_next()<CR>', { desc = 'Navigates to next mark'})
    nnoremap('<leader>jk', ':lua require("harpoon.ui").nav_prev()<CR>', { desc = 'Navigates to previous mark'})
    nnoremap('<leader>jm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = 'View all project marks'})
  end
}

return M
