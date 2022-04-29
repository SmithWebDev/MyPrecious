local M = {}

M.plugin = {
  'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

  requires = {
    'williamboman/nvim-lsp-installer'
  },

  config = function()
    local lspconfig = require('lspconfig')
    local lspinstaller = require('nvim-lsp-installer').setup()
    local on_attach = require('smithwebdev.lsp').on_attach
    local capabilities = require('smithwebdev.lsp').get_capabilities()

    --lspinstaller.on_server_ready(function(server)
    --  local opts = {
    --    on_attach = on_attach,
    --    capabilities = capabilities,
    --  }

    --  if server.name == 'sumneko_lua' then
    --    local runtime_path = vim.split(package.path, ';')
    --    table.insert(runtime_path, 'lua/?.lua')
    --    table.insert(runtime_path, 'lua/?/init.lua')

    --    opts.settings = {
    --      Lua = {
    --        runtime = {
    --          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
    --          version = 'LuaJIT',
    --          -- Setup your lua path
    --          path = runtime_path,
    --        },
    --        diagnostics = {
    --          -- Get the language server to recognize the `vim` global
    --          globals = {'vim'},
    --        },
    --        workspace = {
    --          -- Make the server aware of Neovim runtime files
    --          library = vim.api.nvim_get_runtime_file("", true),
    --        },
    --        -- Do not send telemetry data containing a randomized but unique identifier
    --        telemetry = {
    --          enable = false,
    --        },
    --      },
    --    }
    --  end
    --  if server.name == 'solargraph' then
    --    opts.settings = {
    --      solargraph = {
    --        formatting = true
    --      }
    --    }
    --  end

    --  server:setup(opts)
    --end)

    local server = {'solargraph'}
    for _, lsp in ipairs(server) do
      require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function() return vim.loop.cwd() end
      }
    end


    require('lspconfig').sumneko_lua.setup({
      on_attach = on_attach,
      capabilities = capabilities
    })
  end
}

return M
