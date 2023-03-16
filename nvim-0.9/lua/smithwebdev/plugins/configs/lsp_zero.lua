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

lsp.setup()

