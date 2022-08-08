local M = {}

M.plugin = {
  'anuvyklack/fold-preview.nvim', -- https://github.com/anuvyklack/fold-preview.nvim

  requires = {"anuvyklack/keymap-amend.nvim"}, -- https://github.com/anuvyklack/keymap-amend.nvim

  config = function()
    require("fold-preview").setup()

  end
}

return M
