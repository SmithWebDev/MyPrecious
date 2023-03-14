--local M = {}
--
--M.plugin = {
--  'folke/tokyonight.nvim',  --https://github.com/folke/tokyonight.nvim
--}
--
--return M
require('tokyonight').setup({
  dim_inactive = true,
  style = {
    comments = { italic = true },
    keywords = { italic = true },
    floats = 'dark',
    functions = {},
    sidebars = 'dark',
    variables = {},
  },
  sidebars = {},
  terminal_colors = true,
  transparent = true,
})

