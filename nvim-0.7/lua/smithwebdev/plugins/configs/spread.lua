local M = {}

M.plugin = {
  'aarondiel/spread.nvim', -- https://github.com/aarondiel/spread.nvim

  after = 'nvim-treesitter',

  config = function()
    local spread = require("spread")
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

  end
}

return M
