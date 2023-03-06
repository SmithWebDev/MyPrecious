local M = {}

vim.opt.signcolumn = 'yes'

M.plugin = {
  'VonHeikemen/lsp-zero.nvim',           -- https://github.com/VonHeikemen/lsp-zero.nvim/
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

    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local lsp = require('lsp-zero').preset({
      name = 'minimal',
      set_lsp_keymaps = false,
      cmp_capabilities = true,
      confirgure_diagnostics = true,
      manage_luasnip = false,
      manage_nvim_cmp = false,
      suggest_lsp_servers = true,
      sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
      }
    })

    lsp.on_attach(function(client, bufnr)
      vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { desc = 'Format Code' })
      vim.keymap.set('n', '<leader>lgf', '<cmd>Lspsaga lsp_finder<CR>', { desc = 'LSP Finder' })
      vim.keymap.set('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration<CR>', { desc = 'Declaration' })
      vim.keymap.set('n', '<leader>lgd', '<cmd>Lspsaga peek_definition()<CR>', { desc = 'Peek Definition' })
      vim.keymap.set('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Implementation' })
      vim.keymap.set('n', '<leader>lca', '<cmd>Lspsaga code_action<CR>', { desc = 'Code Action' })
      vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'References' })
      vim.keymap.set('n', '<leader>lrn', '<cmd>Lspsaga rename<CR>', { desc = 'Rename' })
      vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_line_diagnostics<CR>', { desc = 'Show Line Diagnostics' })
      vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { desc = 'Show Line Diagnostics' })
      vim.keymap.set('n', '<leader>l[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>',
        { desc = 'Jump to Previous diagnostic error' })
      vim.keymap.set('n', '<leader>l]d', '<cmd>Lspsaga diagnostic_jump_next<CR>',
        { desc = 'Jump to Next diagnostic error' })
      vim.keymap.set('n', '<leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = 'Signature Help' })
      vim.keymap.set('n', '<leader>lK', '<cmd>Lspsaga hover-doc<CR>', { desc = 'Hover Doc' })
      vim.keymap.set('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = 'Type Definition' })
      print('Attached to ' .. client.name)
    end)
    lsp.setup()
  end
}

return M
