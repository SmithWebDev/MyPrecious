local M = {}

M.plugin = {
  'folke/which-key.nvim', -- https://github.com/folke/which-key.nvim

  config = function()
    require('which-key').setup({
      plugins = {
        marks = false,
        registers = false,
        spelling = {
          enabled = true,
          suggestions = 20,
          },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true
          },
      },
    })
  end
}

return M
