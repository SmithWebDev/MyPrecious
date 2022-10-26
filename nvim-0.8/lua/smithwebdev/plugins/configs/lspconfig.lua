local M = {}

M.plugin = {
  'neovim/nvim-lspconfig',


  config = function()

    -- import lspconfig plugin safely
    local lspconfig_status, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status then
      return
    end

    -- import cmp-nvim-lsp plugin safely
    local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not cmp_nvim_lsp_status then
      return
    end

    -- import typescript plugin safely
    local typescript_setup, typescript = pcall(require, "typescript")
    if not typescript_setup then
      return
    end

    -- enable keybinds only for when lsp server available
    local on_attach = function(client, bufnr)

      -- set keybinds
      keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
      nnoremap('', '', { desc = ''})
      keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation

      -- typescript specific keymaps (e.g. rename file and update imports)
      if client.name == "tsserver" then
        keymap.set('n', '<leader><leader>Trf', ':TypescriptRenameFile<CR>') -- rename file and update imports
        keymap.set('n', '<leader><leader>Toi', ':TypescriptOrganizeImports<CR>') -- organize imports (not in youtube nvim video)
        keymap.set('n', '<leader><leader>Tru', ':TypescriptRemoveUnused<CR>') -- remove unused variables (not in youtube nvim video)
      end
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    --typescript.setup({
    --  server = {
    --    capabilities = capabilities,
    --    on_attach = on_attach,
    --  },
    --})

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["sumneko_lua"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end
}

return M


