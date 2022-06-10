local M = {}

M.plugin = {
  'andythigpen/nvim-coverage', --https://github.com/andythigpen/nvim-coverage

  config = function()
    require("coverage").setup()
  end
}

return M
