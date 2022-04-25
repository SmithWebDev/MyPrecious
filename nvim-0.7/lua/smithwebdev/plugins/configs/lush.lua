local M = {}

M.plugin = {
  'rktjmp/lush.nvim',

  config = function()
    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader><leader>cs', ':LushRunQuickstart<CR>', { desc = 'Overview of Lush creation features' })
  end
}

return M
