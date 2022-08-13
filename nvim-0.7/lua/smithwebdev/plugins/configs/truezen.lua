local M = {}

M.plugin = {
  'Pocco81/true-zen.nvim', -- https://github.com/Pocco81/true-zen.nvim


  config = function()
    require("true-zen").setup()
  end
}

return M
