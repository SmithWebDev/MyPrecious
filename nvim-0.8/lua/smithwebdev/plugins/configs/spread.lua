local M = {}

M.plugin = {
  'aarondiel/spread.nvim', -- https://github.com/aarondiel/spread.nvim

  after = { 'nvim-treesitter'},

  config = function()
    local u = require 'smithwebdev.core.utils'
    local spread = require('spread')
    local nnoremap = u.nnoremap

    nnoremap('<leader>ss', spread.out, { desc = 'Split to multiple lines' })
    nnoremap('<leader>ssc', spread.combine, { desc = 'Combine to single line'})
  end
}

return M
