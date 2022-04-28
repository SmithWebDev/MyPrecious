local M = {}

M.plugin = {
  'xiyaowong/nvim-transparent', -- https://github.com/xiyaowong/nvim-transparent

  config = function()
    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader>nt', '<cmd>TransparentToggle<CR>', { desc = 'Toggle Transparent Background in Nvim'})
  end
}

return M
