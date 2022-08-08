local M = {}

M.plugin = {
  'tpope/vim-dispatch', -- https://github.com/tpope/vim-dispatch

  config = function()
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader>rt',  ':Dispatch rspec %', { desc = 'Runs Rspec on current file'})
  end
}

return M
