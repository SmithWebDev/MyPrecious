local M = {}

M.plugin = {
  'akinsho/toggleterm.nvim', -- https://github.com/akinsho/toggleterm.nvim

  tag = "v2.*",

  config = function()
    require("toggleterm").setup()

  end
}

return M
