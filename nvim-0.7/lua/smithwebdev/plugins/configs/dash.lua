local M = {}

M.plugin = {
  'mrjones2014/dash.nvim',
  run = 'make install',

  requires = { 'nvim-telescope/telescope.nvim' },

  disable = not vim.fn.has('macunix'),

  config = function()
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap
    local vnoremap = u.vnoremap

    -- keybindings
    nnoremap('<leader>d',':Dash<Space>', { desc = 'Open Dash Query' })
    nnoremap('<leader>dw','<cmd>DashWord<CR>', { desc = 'Open Dash Query Under Cursor' })
  end,
}

return M
