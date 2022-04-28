local M = {}

M.plugin = {
  'tjdevries/colorbuddy.nvim', -- https://github.com/tjdevries/colorbuddy.nvim

  config = function()
    require("colorbuddy").setup()
  end
}

return M
