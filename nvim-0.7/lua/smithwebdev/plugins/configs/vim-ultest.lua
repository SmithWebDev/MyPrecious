local M = {}

M.plugin = {
  'rcarriga/vim-ultest',

  requires = {
    'vim-test/vim-test'
  },

  run = ':UpdateRemotePlugins',

  config = function()
    local u = require 'smithwebdev.core.utils'
    local noremap = u.noremap
    local nnoremap = u.nnoremap
    local inoremap = u.inoremap
    local vnoremap = u.vnoremap

    -- keybindings
    nnoremap('<leader>ua', '<cmd>UltestAttach<CR>', { desc = 'Attach Live Debugging' })
    nnoremap('<leader>uj', '<cmd>UltestNearest<CR>', { desc = 'Run Nearest Test Current' })
    nnoremap('<leader>ur', '<cmd>Ultest<CR>', { desc = 'Run All Test Current File' })
    nnoremap('<leader>us', '<cmd>UltestSummary<CR>', { desc = 'Toggle Summary Window' })
    nnoremap('<leader>ux', '<cmd>UltestStop<CR>', { desc = 'Stop Running Tests' })
  end
}

return M
