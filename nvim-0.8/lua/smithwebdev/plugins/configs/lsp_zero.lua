local M = {}

M.plugin = {
  'VonHeikemen/lsp-zero.nvim',           -- https://github.com/VonHeikemen/lsp-zero.nvim

  requires = {
    'neovim/nvim-lspconfig',             -- https://github.com/neovim/nvim-lspconfig
    'williamboman/mason.nvim',           -- https://github.com/williamboman/mason.nvim
    'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim
    'hrsh7th/nvim-cmp',                  -- https://github.com/hrsh7th/nvim-cmp
    'hrsh7th/cmp-buffer',                -- https://github.com/hrsh7th/cmp-buffer
    'hrsh7th/cmp-path',                  -- https://github.com/hrsh7th/cmp-path
    'saadparwaiz1/cmp_luasnip',          -- https://github.com/saadparwaiz1/cmp_luasnip
    'hrsh7th/cmp-nvim-lsp',              -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lua',              -- https://github.com/hrsh7th/cmp-nvim-lua
  },

  config = function()
    local lsp = require("lsp-zero")
    lsp.preset('recommended')
    lsp.setup()

  end
}

return M
