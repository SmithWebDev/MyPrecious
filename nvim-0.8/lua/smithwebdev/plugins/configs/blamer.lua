local M = {}

vim.g.blamer_enabled = 1
vim.g.blamer_prefix = ' > '

M.plugin = {
  'APZelos/blamer.nvim', -- https://github.com/APZelos/blamer.nvim

  config = function()

    -- keybinds --
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader><leader>b',  ':BlamerToggle<CR>', { desc = 'Toggle git blame messages'})
  end
}

return M
