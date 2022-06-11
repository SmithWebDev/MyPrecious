local M = {}

M.plugin = {
  'rcarriga/neotest', --https://github.com/rcarriga/neotest

  requires = {
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim', -- https://github.com/antoinemadec/FixCursorHold.nvim
  },
  config = function()

  end
}

return M
