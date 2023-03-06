local M = {}

M.plugin = {
  'danymat/neogen', -- https://github.com/danymat/neogen
  requires = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('neogen').setup {
      snippet_engine = 'luasnip'
    }
  end
}

return M
