local M = {}

M.plugin = {
  'folke/zen-mode.nvim',

  requires = {
  'folke/twilight.nvim', -- https://github.com/folke/twilight.nvim
  },

  config = function()
    require'zen-mode'.setup({
      window = {
        backdrop = 1,
        width = 120,
        height = 1,
        options = {
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
        },
        twilight = { enabled = true },
        tmux = { enabled = false },
      },
    })

    -- local u = require'smithwebdev.core.utils'
    -- local noremap = u.noremap
    -- local nnoremap = u.nnoremap
    -- local inoremap = u.inoremap
    -- local tnoremap = u.tnoremap
    -- local vnoremap = u.vnoremap

    -- nnoremap('<leader><leader>z', '<cmd>ZenMode<CR>', { desc = 'Enter The Zen' })
  end
}

return M
