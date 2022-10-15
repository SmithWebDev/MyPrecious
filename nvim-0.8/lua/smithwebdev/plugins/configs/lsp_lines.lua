ocal M = {}

M.plugin = {
  'Maan2003/lsp_lines.nvim', -- https://github.com/Maan2003/lsp_lines.nvim

  after = {
    'nvim-lspconfig'
  },

  config = function()
    require('lsp_lines').setup()
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = {
        prefix = '🔥'
      }
    })
  end
}

return M
