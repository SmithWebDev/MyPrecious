local M = {}

M.plugin = {
  'mhanberg/elixir.nvim', --https://github.com/mhanberg/elixir.nvim',

  config = function()
    require('elixir').setup({

    })
  end
}

return M
