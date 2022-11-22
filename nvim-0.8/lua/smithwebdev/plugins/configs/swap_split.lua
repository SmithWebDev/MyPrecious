local M = {}

M.plugin = {
  'xorid/swap-split.nvim', -- https://github.com/xorid/swap-split.nvim

  config = function()
    require("swap-split").setup({
      ignore_filetypes = {}
    })


    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader><leader>w', '<cmd>SwapSplit<CR>', { desc = 'Swap Panes In Buffer'})
 end
}

return M
