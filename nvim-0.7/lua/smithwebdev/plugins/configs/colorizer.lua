local M = {}

M.plugin = {
  'norcalli/nvim-colorizer.lua',

  config = function()
    require("colorizer").setup(nil, { css = true;})
  end
}

return M
